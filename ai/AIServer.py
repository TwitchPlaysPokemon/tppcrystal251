import logging
import time
import threading
import random
import sys
import json
from flask import Flask, request
import urllib.request
import traceback

import AI
from werkzeug.exceptions import BadRequest

app = Flask(__name__)
PORT = 5001
# setup a logger that logs to stdout and file
logging.basicConfig(format='%(levelname)s %(asctime)s: %(message)s',
                    filename='ai_server.log',
                    datefmt='%Y/%m/%d %H:%M:%S',
                    level=logging.INFO)
logging.getLogger().addHandler(logging.StreamHandler())
logger = logging.getLogger("AIServer")

# global ai result variable.
# set by worker thread "calculate_next_move",
# read by ai_retrieve requests.
# initialize to something that is a valid backup input in most cases,
# so eventual ai-retrieve-deadlocks can be resolved with a restart of this server. 
ai_result = "move1"
# global handle to actual AI
Artificial = AI.AI()
LastActions = []

slack_oauth = "xoxp-19319780978-19729075300-22424417394-bf36625f85"

def post_slack_errormsg(battle_state):
    #post the AI exception to slack
    message = "The AI threw an exception: ```{}``` with the following input: ```{}```".format(battle_state,''.join(traceback.format_stack()))
    arguments = {"token":slack_oauth,
                "channel":"#aireview", #change this if need be
                "text":message,
                "as_user":"false",
                "username":"@1hlixedbot"}

    #send the request using urllib
    fullurl = "https://slack.com/api/chat.postMessage" + "?" + urllib.parse.urlencode(arguments)
    request = urllib.request.Request(fullurl)
    response = urllib.request.urlopen(request)
    return response.read().decode("utf-8")

def get_backup_move(battle_state):
    try:
        if battle_state["battleState"]["requested action"] & 0x40:
            try:
                return "switch%d" % random.randint(1, len(battle_state["battleState"]["enemyParty"]["party"]))
            except KeyError:
                return "switch%d" % random.randint(1, 6)
        else:
            try:
                return "move%d" % random.randint(1, len(battle_state["battleState"]["enemypokemon"]["moves"]))
            except KeyError:
                return "move%d" % random.randint(1, 4)
    except KeyError:
        # the whole battle_state is fucked
        return "move%d" % random.randint(1, 4)

def calculate_next_move(battle_state):
    global ai_result, Artificial, LastActions
    # invoke AI.
    # catch exceptions and provide a fallback to not get the whole game stuck waiting on a move
    try:
        if not (battle_state["battleState"]["requested action"] & 0x04):
            LastActions = []
        battle_state["battleState"]["history"] = LastActions
        next_move = Artificial.MainBattle(battle_state)
    except Exception as e:
        logger.exception("The AI threw an exception with the following input: %s" % battle_state)
        # uh-oh! better fall back to "default ai"
        next_move = get_backup_move(battle_state)
        
        post_slack_errormsg(battle_state, e)

    logger.info("next move: %s" % next_move)
    LastActions.append(next_move)
    
    # set global ai result variable. do this always last to avoid race-conditions.
    ai_result = next_move

@app.route('/ai_invoke', methods=["GET", "POST"])   
def ai_invoke():
    global ai_result
    
    # force the request body to be parsed as JSON
    # because the lua-side doesn't specify the content-type
    # (it's easier on the lua-side this way)
    try:
        battle_state = request.get_json(force=True)
    except BadRequest:
        logger.exception("ai_invoke got called with nothing, or something not json-decodable: %s" % request)
        battle_state = {}
    logger.info("invoking AI... submitted JSON: %s" % battle_state)

    if type(battle_state) == str:
        battle_state = json.loads(battle_state)
    
    # reset global ai result variable and asynchronously invoke the ai.
    # Doesn't have to be a thread, could also be a greenlet or something,
    # But a thread is easy, in the stdlib and works fine here.
    ai_result = None
    threading.Thread(target=calculate_next_move, args=(battle_state,)).start()
    return ""
    
@app.route('/ai_retrieve')   
def ai_retrieve():
    # if the ai finished, return it's result.
    # otherwise return an empty string
    global ai_result
    return ai_result if ai_result else ""

def main():
    app.run(port=PORT)

if __name__ == '__main__':
    main()
