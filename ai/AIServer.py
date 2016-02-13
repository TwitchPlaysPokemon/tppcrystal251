import logging
import time
import threading
import random
import sys
import json
from flask import Flask, request

import AI

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
# read by ai_retrieve requests
ai_result = None
# global handle to actual AI
Artificial = AI.AI()
LastActions = []

def calculate_next_move(battle_state):
    global ai_result, Artificial, LastActions
    if not (battle_state["battleState"]["requested action"] & 0x04):
        LastActions = []
    # invoke AI.
    # catch exceptions and provide a fallback to not get the whole game stuck waiting on a move
    try:
        battle_state["battleState"]["history"] = LastActions
        next_move = Artificial.MainBattle(battle_state)
    except Exception as e:
        logger.exception("The AI threw an exception with the following input: %s" % battle_state)
        # uh-oh! better fall back to "default ai"
        if battle_state["battleState"]["requested action"] & 0x40:
            next_move = "switch{}".format(random.choice(range(6)) + 1)
        else:
            next_move = "move{}".format(random.choice(range(4)) + 1) # random.choice(("move1", "move2", "move3", "move4"))
    logger.info("calculated AI: %s" % next_move)
    LastActions.append(next_move)
    
    # set global ai result variable. do this always last to avoid race-conditions.
    ai_result = next_move

@app.route('/ai_invoke/', methods=["GET", "POST"])   
def ai_invoke():
    global ai_result
    
    # force the request body to be parsed as JSON
    # because the lua-side doesn't specify the content-type
    # (it's easier on the lua-side this way)
    battle_state = request.get_json(force=True)
    logger.info("invoking AI... submitted JSON: %s" % battle_state)

    if type(battle_state) == str:
        battle_state = json.loads(battle_state)
    
    # reset global ai result variable and asynchronously invoke the ai.
    # Doesn't have to be a thread, could also be a greenlet or something,
    # But a thread is easy, in the stdlib and works fine here.
    ai_result = None
    threading.Thread(target=calculate_next_move, args=(battle_state,)).start()
    return ""
    
@app.route('/ai_retrieve/')   
def ai_retrieve():
    # if the ai finished, return it's result.
    # otherwise return an empty string
    global ai_result
    return ai_result if ai_result else ""

def main():
    app.run(port=PORT)

if __name__ == '__main__':
    main()
