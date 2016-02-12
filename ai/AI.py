# TPP Crystal 251 AI v0.99 by Beesafree

from __future__ import division
import math
import random
import json
import os
import sys

# the program will give a response when called to from 0 to 11
# 0-3 relate to move commands, 1 means use second move on json list (1 being it's index)
# 4-9 relate to a change pokemon command, a 6 will mean switch to third pokemon (third pokemon's index = 6 - 4)
# 10 and 11 relate to using an item, 10 is first item, 11 is second item

# Wild Battles should produce a result in about 5 seconds,
# Trainer Battles should be less than 9 seconds,
# Trainer Battles where the opponent has an item are around 40 seconds

if sys.version_info[0] == 2:
		raise ValueError("""You are using Python 2 instead of Python 3.
This program only works in Python 3.""")

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
JSON_FILE_PATH = os.path.join(SCRIPT_DIR, "battlestate.json")
MOVES_FILE_PATH = os.path.join(SCRIPT_DIR, "AiMoves.txt")

mondata = {}
Debug_Code = 1

class Combogenerator:
    def __init__(self,turnsToLookAhead=4, numMoves=4):
        self.arrlen = turnsToLookAhead
        self.numMoves = numMoves
        self.currplace = [0 for x in range(self.arrlen)]
    def __iter__(self):
        return self
    def __next__(self):
        return self.next(self.arrlen-1)
    def next(self, placevalue):
        self.currplace[placevalue] += 1
        if self.currplace[placevalue] >= self.numMoves:
            if placevalue == 0:
                raise StopIteration()
            else:
                self.currplace[placevalue] = 0
                self.next(placevalue-1)
        return self.currplace[:]

class AI(object):
    def __init__(self):
        self._Types = {"normal":  0, "fire":  1, "water":  2, "electric":  3, "grass":  4,
                       "ice":  5, "fighting":  6, "poison":  7, "ground":  8, "flying":  9,
                       "psychic": 10, "bug": 11, "rock": 12, "ghost": 13, "dragon": 14,
                       "dark": 15, "steel": 16, "fairy": 17, "none": 18}

        self._tableTypeEffs = [                            # Fe1k's Design
                        #                                     Defenders
                        #NOR  FIR  WAT  ELE  GRA  ICE  FIG  POI  GRO  FLY  PSY  BUG  ROC  GHO  DRA  DAR  STE  FAR
                        [1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1, 0.5,   0,   1,   1, 0.5,   1],  # NOR
                        [1, 0.5, 0.5,   1,   2,   2,   1,   1,   1,   1,   1,   2, 0.5,   1, 0.5,   1,   2,   1],  # FIR
                        [1,   2, 0.5,   1, 0.5,   1,   1,   1,   2,   1,   1,   1,   2,   1, 0.5,   1,   1,   1],  # WAT
                        [1,   1,   2, 0.5, 0.5,   1,   1,   1,   0,   2,   1,   1,   1,   1, 0.5,   1,   1,   1],  # ELE
                        [1, 0.5,   2,   1, 0.5,   1,   1, 0.5,   2, 0.5,   1, 0.5,   2,   1, 0.5,   1, 0.5,   1],  # GRA
                        [1, 0.5, 0.5,   1,   2, 0.5,   1,   1,   2,   2,   1,   1,   1,   1,   2,   1, 0.5,   1],  # ICE
                        [2,   1,   1,   1,   1,   2,   1, 0.5,   1, 0.5, 0.5, 0.5,   2,   0,   1,   2,   2, 0.5],  # FIG
                        [1,   1,   1,   1,   2,   1,   1, 0.5, 0.5,   1,   1,   1, 0.5, 0.5,   1,   1,   0,   2],  # POI
                        [1,   2,   1,   2, 0.5,   1,   1,   2,   1,   0,   1, 0.5,   2,   1,   1,   1,   2,   1],  # GRO   Attackers
                        [1,   1,   1, 0.5,   2,   1,   2,   1,   1,   1,   1,   2, 0.5,   1,   1,   1, 0.5,   1],  # FLY
                        [1,   1,   1,   1,   1,   1,   2,   2,   1,   1, 0.5,   1,   1,   1,   1,   0, 0.5,   1],  # PSY
                        [1, 0.5,   1,   1,   2,   1, 0.5, 0.5,   1, 0.5,   2,   1,   1, 0.5,   1,   2, 0.5, 0.5],  # BUG
                        [1,   2,   1,   1,   1,   2, 0.5,   1, 0.5,   2,   1,   2,   1,   1,   1,   1, 0.5,   1],  # ROC
                        [0,   1,   1,   1,   1,   1,   1,   1,   1,   1,   2,   1,   1,   2,   1, 0.5,   1,   1],  # GHO
                        [1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   2,   1, 0.5,   0],  # DRA
                        [1,   1,   1,   1,   1,   1, 0.5,   1,   1,   1,   2,   1,   1,   2,   1, 0.5,   1, 0.5],  # DAR
                        [1, 0.5, 0.5, 0.5,   1,   2,   1,   1,   1,   1,   1,   1,   2,   1,   1,   1, 0.5,   2],  # STE
                        [1, 0.5,   1,   1,   1,   1,   2, 0.5,   1,   1,   1,   1,   1,   1,   2,   2, 0.5,   1],  # FAR
                        [1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1],  # U
                        ]

        self._PokemonTypes = {"bulbasaur": ("grass", "poison"), "ivysaur": ("grass", "poison"), "venusaur": ("grass", "poison"), "charmander": ("fire", "none"), "charmeleon": ("fire", "none"), "charizard": ("fire", "flying"), "squirtle": ("water", "none"), "wartortle": ("water", "none"), "blastoise": ("water", "none"), "caterpie": ("bug", "none"), "metapod": ("bug", "none"), "butterfree": ("bug", "flying"), "weedle": ("bug", "poison"), "kakuna": ("bug", "poison"), "beedrill": ("bug", "poison"), "pidgey": ("normal", "flying"), "pidgeotto": ("normal", "flying"), "pidgeot": ("normal", "flying"), "rattata": ("normal", "none"), "raticate": ("normal", "none"), "spearow": ("normal", "flying"), "fearow": ("normal", "flying"), "ekans": ("poison", "none"), "arbok": ("poison", "none"), "pikachu": ("electric", "none"), "raichu": ("electric", "none"), "sandshrew": ("ground", "none"), "sandslash": ("ground", "none"), "nidoranf": ("poison", "none"), "nidorina": ("poison", "none"), "nidoqueen": ("poison", "ground"), "nidoranm": ("poison", "none"), "nidorino": ("poison", "none"), "nidoking": ("poison", "ground"), "clefairy": ("fairy", "none"), "clefable": ("fairy", "none"), "vulpix": ("fire", "none"), "ninetales": ("fire", "none"), "jigglypuff": ("normal", "fairy"), "wigglytuff": ("normal", "fairy"), "zubat": ("poison", "flying"), "golbat": ("poison", "flying"), "oddish": ("grass", "poison"), "gloom": ("grass", "poison"), "vileplume": ("grass", "poison"), "paras": ("bug", "grass"), "parasect": ("bug", "grass"), "venonat": ("bug", "poison"), "venomoth": ("bug", "poison"), "diglett": ("ground", "none"), "dugtrio": ("ground", "none"), "meowth": ("normal", "none"), "persian": ("normal", "none"), "psyduck": ("water", "none"), "golduck": ("water", "none"), "mankey": ("fighting", "none"), "primeape": ("fighting", "none"), "growlithe": ("fire", "none"), "arcanine": ("fire", "none"), "poliwag": ("water", "none"), "poliwhirl": ("water", "none"), "poliwrath": ("water", "fighting"), "abra": ("psychic", "none"), "kadabra": ("psychic", "none"), "alakazam": ("psychic", "none"), "machop": ("fighting", "none"), "machoke": ("fighting", "none"), "machamp": ("fighting", "none"), "bellsprout": ("grass", "poison"), "weepinbell": ("grass", "poison"), "victreebel": ("grass", "poison"), "tentacool": ("water", "poison"), "tentacruel": ("water", "poison"), "geodude": ("rock", "ground"), "graveler": ("rock", "ground"), "golem": ("rock", "ground"), "ponyta": ("fire", "none"), "rapidash": ("fire", "none"), "slowpoke": ("water", "psychic"), "slowbro": ("water", "psychic"), "magnemite": ("electric", "steel"), "magneton": ("electric", "steel"), "farfetch'd": ("normal", "flying"), "doduo": ("normal", "flying"), "dodrio": ("normal", "flying"), "seel": ("water", "none"), "dewgong": ("water", "ice"), "grimer": ("poison", "none"), "muk": ("poison", "none"), "shellder": ("water", "none"), "cloyster": ("water", "ice"), "gastly": ("ghost", "poison"), "haunter": ("ghost", "poison"), "gengar": ("ghost", "poison"), "onix": ("rock", "ground"), "drowzee": ("psychic", "none"), "hypno": ("psychic", "none"), "krabby": ("water", "none"), "kingler": ("water", "none"), "voltorb": ("electric", "none"), "electrode": ("electric", "none"), "exeggcute": ("grass", "psychic"), "exeggutor": ("grass", "psychic"), "cubone": ("ground", "none"), "marowak": ("ground", "none"), "hitmonlee": ("fighting", "none"), "hitmonchan": ("fighting", "none"), "lickitung": ("normal", "none"), "koffing": ("poison", "none"), "weezing": ("poison", "none"), "rhyhorn": ("ground", "rock"), "rhydon": ("ground", "rock"), "chansey": ("normal", "none"), "tangela": ("grass", "none"), "kangaskhan": ("normal", "none"), "horsea": ("water", "none"), "seadra": ("water", "none"), "goldeen": ("water", "none"), "seaking": ("water", "none"), "staryu": ("water", "none"), "starmie": ("water", "psychic"), "mr.mime": ("psychic", "fairy"), "scyther": ("bug", "flying"), "jynx": ("ice", "psychic"), "electabuzz": ("electric", "none"), "magmar": ("fire", "none"), "pinsir": ("bug", "none"), "tauros": ("normal", "none"), "magikarp": ("water", "none"), "gyarados": ("water", "flying"), "lapras": ("water", "ice"), "ditto": ("normal", "none"), "eevee": ("normal", "none"), "vaporeon": ("water", "none"), "jolteon": ("electric", "none"), "flareon": ("fire", "none"), "porygon": ("normal", "none"), "omanyte": ("rock", "water"), "omastar": ("rock", "water"), "kabuto": ("rock", "water"), "kabutops": ("rock", "water"), "aerodactyl": ("rock", "flying"), "snorlax": ("normal", "none"), "articuno": ("ice", "flying"), "zapdos": ("electric", "flying"), "moltres": ("fire", "flying"), "dratini": ("dragon", "none"), "dragonair": ("dragon", "none"), "dragonite": ("dragon", "flying"), "mewtwo": ("psychic", "none"), "mew": ("psychic", "none"), "chikorita": ("grass", "none"), "bayleef": ("grass", "none"), "meganium": ("grass", "none"), "cyndaquil": ("fire", "none"), "quilava": ("fire", "none"), "typhlosion": ("fire", "none"), "totodile": ("water", "none"), "croconaw": ("water", "none"), "feraligatr": ("water", "none"), "sentret": ("normal", "none"), "furret": ("normal", "none"), "hoothoot": ("normal", "flying"), "noctowl": ("normal", "flying"), "ledyba": ("bug", "flying"), "ledian": ("bug", "flying"), "spinarak": ("bug", "poison"), "ariados": ("bug", "poison"), "crobat": ("poison", "flying"), "chinchou": ("water", "electric"), "lanturn": ("water", "electric"), "pichu": ("electric", "none"), "cleffa": ("fairy", "none"), "igglybuff": ("normal", "fairy"), "togepi": ("fairy", "none"), "togetic": ("fairy", "flying"), "natu": ("psychic", "flying"), "xatu": ("psychic", "flying"), "mareep": ("electric", "none"), "flaaffy": ("electric", "none"), "ampharos": ("electric", "none"), "bellossom": ("grass", "none"), "marill": ("water", "fairy"), "azumarill": ("water", "fairy"), "sudowoodo": ("rock", "none"), "politoed": ("water", "none"), "hoppip": ("grass", "flying"), "skiploom": ("grass", "flying"), "jumpluff": ("grass", "flying"), "aipom": ("normal", "none"), "sunkern": ("grass", "none"), "sunflora": ("grass", "none"), "yanma": ("bug", "flying"), "wooper": ("water", "ground"), "quagsire": ("water", "ground"), "espeon": ("psychic", "none"), "umbreon": ("dark", "none"), "murkrow": ("dark", "flying"), "slowking": ("water", "psychic"), "misdreavus": ("ghost", "none"), "unown": ("psychic", "none"), "wobbuffet": ("psychic", "none"), "girafarig": ("normal", "psychic"), "pineco": ("bug", "none"), "forretress": ("bug", "steel"), "dunsparce": ("normal", "none"), "gligar": ("ground", "flying"), "steelix": ("steel", "ground"), "snubbull": ("fairy", "none"), "granbull": ("fairy", "none"), "qwilfish": ("water", "poison"), "scizor": ("bug", "steel"), "shuckle": ("bug", "rock"), "heracross": ("bug", "fighting"), "sneasel": ("dark", "ice"), "teddiursa": ("normal", "none"), "ursaring": ("normal", "none"), "slugma": ("fire", "none"), "magcargo": ("fire", "rock"), "swinub": ("ice", "ground"), "piloswine": ("ice", "ground"), "corsola": ("water", "rock"), "remoraid": ("water", "none"), "octillery": ("water", "none"), "delibird": ("ice", "flying"), "mantine": ("water", "flying"), "skarmory": ("steel", "flying"), "houndour": ("dark", "fire"), "houndoom": ("dark", "fire"), "kingdra": ("water", "dragon"), "phanpy": ("ground", "none"), "donphan": ("ground", "none"), "porygon2": ("normal", "none"), "stantler": ("normal", "none"), "smeargle": ("normal", "none"), "tyrogue": ("fighting", "none"), "hitmontop": ("fighting", "none"), "smoochum": ("ice", "psychic"), "elekid": ("electric", "none"), "magby": ("fire", "none"), "miltank": ("normal", "none"), "blissey": ("normal", "none"), "raikou": ("electric", "none"), "entei": ("fire", "none"), "suicune": ("water", "none"), "larvitar": ("rock", "ground"), "pupitar": ("rock", "ground"), "tyranitar": ("rock", "dark"), "lugia": ("psychic", "flying"), "ho-oh": ("fire", "flying"), "celebi": ("psychic", "grass") }
        self._statsmultipliers =  [25, 28, 33, 40, 50, 66, 100, 150, 200, 250, 300, 350, 400]
        self._accuracymultipliers = [33, 36, 43, 50, 60, 75, 100, 133, 166, 200, 233, 266, 300]
        self._critmultipliers = [0.0625, 0.125, 0.5, 1, 1, 1, 1]
        self._actualAction= {'0':  'move1', '1':  'move2', '2':  'move3', '3':  'move4', '4': 'switch1', '5': 'switch2', '6': 'switch3', '7':  'switch4', '8':  'switch5', '9':  'switch6', '10':  'useitem1', '11': 'useitem2'}

        with open(MOVES_FILE_PATH, 'r') as tempX:
            self._moves = tempX.read().split(' ')

        self.statNames = ["atk","def","satk","sdef","spd","eva","acc"]
    def getStatNameWithSpeed(self, statName):
        #converts between statNames that use "spd" and those that use "speed"
        #this function shouldn't need to exist but it does
        if statName == "spd":
            return "speed"
        return statName

    def parseMondataFromJsonlist (self):
        mondata['weather'] = self.jsonlist['battleState']['weather'].lower().replace(' ', '')
        mondata['enemypokemon'] = {}
        mondata['playerpokemon'] = {}
        mondata['myitems'] = {}
        mondata['enemypokemon']['substatus'] = self.jsonlist['battleState']['enemypokemon']['subStatus']
        mondata['playerpokemon']['substatus'] = self.jsonlist['battleState']['playerpokemon']['subStatus']
        mondata['enemypokemon']['screens'] = self.jsonlist['battleState']['enemypokemon']['screens']
        mondata['playerpokemon']['screens'] = self.jsonlist['battleState']['playerpokemon']['screens']
        mondata['enemypokemon']['bound'] = int(self.jsonlist['battleState']['enemypokemon']['wrap count'])
        mondata['playerpokemon']['bound'] = int(self.jsonlist['battleState']['playerpokemon']['wrap count'])

        if self.jsonlist['battleState']['enemy type'] == 'TRAINER':
            mondata['myitems'][1] = self.jsonlist['battleState']['trainer items']['item1'].lower().replace(' ', '').replace('-', '')
            mondata['myitems'][2] = self.jsonlist['battleState']['trainer items']['item2'].lower().replace(' ', '').replace('-', '')

        for allmons in range(0, 12):
            if (allmons <= 5):
                templocation = 'enemyParty'
                tempx = allmons
            if (allmons >= 6):
                templocation = 'playerParty'
                tempx = allmons - 6
            if (allmons+1 <= self.myparty) or ((allmons-5 <= self.trainparty) and (allmons > 5)):
                mondata[allmons] = {}
                mondata[allmons]['type'] = {}
                mondata[allmons]['stats'] = {}
                mondata[allmons]['stats']['happy'] = int(self.jsonlist[templocation]['party'][tempx]['happiness'])
                mondata[allmons]['stats']['curhp'] = int(self.jsonlist[templocation]['party'][tempx]['hp'])
                mondata[allmons]['stats']['hp'] = int(self.jsonlist[templocation]['party'][tempx]['stats']['maxhp'])
                mondata[allmons]['stats']['atk'] = int(self.jsonlist[templocation]['party'][tempx]['stats']['attack'])
                mondata[allmons]['stats']['def'] = int(self.jsonlist[templocation]['party'][tempx]['stats']['defense'])
                mondata[allmons]['stats']['satk'] = int(self.jsonlist[templocation]['party'][tempx]['stats']['spatk'])
                mondata[allmons]['stats']['sdef'] = int(self.jsonlist[templocation]['party'][tempx]['stats']['spdef'])
                mondata[allmons]['stats']['speed'] = int(self.jsonlist[templocation]['party'][tempx]['stats']['speed'])
                mondata[allmons]['status'] = self.jsonlist[templocation]['party'][tempx]['status'].lower()
                mondata[allmons]['level'] = int(self.jsonlist[templocation]['party'][tempx]['level'])
                mondata[allmons]['item'] = self.jsonlist[templocation]['party'][tempx]['item'].lower().replace(' ', '').replace('-', '')
                mondata[allmons]['gender'] = self.jsonlist[templocation]['party'][tempx]['gender'].lower()
                mondata[allmons]['species'] = self.jsonlist[templocation]['party'][tempx]['species'].lower().replace(u"\2642", "m").replace(u"\2640", "f").replace(' ', '')
                mondata[allmons]['type'][1] = self._PokemonTypes[mondata[allmons]['species']][0]
                mondata[allmons]['type'][2] = self._PokemonTypes[mondata[allmons]['species']][1]
                mondata[allmons]['moves'] = {}
                for moveset in range(0, len(self.jsonlist[templocation]['party'][tempx]['moves'])):
                    mondata[allmons]['moves'][moveset] = {}
                    temptext1 = self.jsonlist[templocation]['party'][tempx]['moves'][moveset]['name'].replace(' ', '').lower().replace('-', '')
                    for movelist in range(0, len(self._moves)):
                        templist = self._moves[movelist].split(',')
                        temptext2 = templist[0]
                        if temptext2 == temptext1:
                            mondata[allmons]['moves'][moveset]['name'] = templist[0]
                            mondata[allmons]['moves'][moveset]['effect'] = templist[1]
                            mondata[allmons]['moves'][moveset]['bp'] = int(templist[2])
                            mondata[allmons]['moves'][moveset]['category'] = templist[3]
                            mondata[allmons]['moves'][moveset]['type'] = templist[4]
                            mondata[allmons]['moves'][moveset]['acc'] = int(templist[5])
                            mondata[allmons]['moves'][moveset]['curpp'] = int(self.jsonlist[templocation]['party'][tempx]['moves'][moveset]['curpp'])
                            mondata[allmons]['moves'][moveset]['pp'] = int(templist[6])
                            mondata[allmons]['moves'][moveset]['effectchance'] = int(templist[7])
                            break
        self.permmondata = mondata
        for tempx in range(6, self.trainparty+6):
            self.opponenthp[tempx] = self.permmondata[tempx]['stats']['curhp']
        if self.jsonlist['battleState']['enemy type'] == 'TRAINER':
            for tempx in range(0, self.myparty):
                self.hp[tempx] = self.permmondata[tempx]['stats']['curhp']
        if self.jsonlist['battleState']['enemy type'] == 'WILD':
            self.hp[0] = int(self.jsonlist['battleState']['enemypokemon']['hp'])
            mondata[0] = {}
            mondata[0]['type'] = {}
            mondata[0]['stats'] = {}
            mondata[0]['stats']['happy'] = int(self.jsonlist['battleState']['enemypokemon']['happiness'])
            mondata[0]['stats']['curhp'] = int(self.jsonlist['battleState']['enemypokemon']['hp'])
            mondata[0]['stats']['hp'] = int(self.jsonlist['battleState']['enemypokemon']['stats']['maxhp'])
            mondata[0]['stats']['atk'] = int(self.jsonlist['battleState']['enemypokemon']['stats']['attack'])
            mondata[0]['stats']['def'] = int(self.jsonlist['battleState']['enemypokemon']['stats']['defense'])
            mondata[0]['stats']['satk'] = int(self.jsonlist['battleState']['enemypokemon']['stats']['spatk'])
            mondata[0]['stats']['sdef'] = int(self.jsonlist['battleState']['enemypokemon']['stats']['spdef'])
            mondata[0]['stats']['speed'] = int(self.jsonlist['battleState']['enemypokemon']['stats']['speed'])
            mondata[0]['status'] = self.jsonlist['battleState']['enemypokemon']['status'].lower()
            mondata[0]['level'] = int(self.jsonlist['battleState']['enemypokemon']['level'])
            mondata[0]['item'] = self.jsonlist['battleState']['enemypokemon']['item'].lower().replace(' ', '').replace('-', '')
            mondata[0]['gender'] = self.jsonlist['battleState']['enemypokemon']['gender'].lower()
            mondata[0]['species'] = self.jsonlist['battleState']['enemypokemon']['species'].lower().replace(u"\2642", "m").replace(u"\2640", "f").replace(' ', '')
            mondata[0]['type'][1] = self._PokemonTypes[mondata[0]['species']][0]
            mondata[0]['type'][2] = self._PokemonTypes[mondata[0]['species']][1]
            mondata[0]['moves'] = {}
            for moveset in range(0, len(self.jsonlist['battleState']['enemypokemon']['moves'])):
                mondata[0]['moves'][moveset] = {}
                temptext1 = self.jsonlist['battleState']['enemypokemon']['moves'][moveset]['name'].replace(' ', '').lower().replace('-', '')
                for movelist in range(0, len(self._moves)):
                    templist = self._moves[movelist].split(',')
                    temptext2 = templist[0]
                    if temptext2 == temptext1:
                        mondata[0]['moves'][moveset]['name'] = templist[0]
                        mondata[0]['moves'][moveset]['effect'] = templist[1]
                        mondata[0]['moves'][moveset]['bp'] = int(templist[2])
                        mondata[0]['moves'][moveset]['category'] = templist[3]
                        mondata[0]['moves'][moveset]['type'] = templist[4]
                        mondata[0]['moves'][moveset]['acc'] = int(templist[5])
                        mondata[0]['moves'][moveset]['curpp'] = int(self.jsonlist['battleState']['enemypokemon']['moves'][moveset]['curpp'])
                        mondata[0]['moves'][moveset]['pp'] = int(templist[6])
                        mondata[0]['moves'][moveset]['effectchance'] = int(templist[7])
                        break
        return mondata

    #type1name = attacker, type2name = defender
    def getEff(self, type1name, type2name, defenderindex):
        if (type2name == 'none') or (type1name == 'u') or (type1name == 'none') or (type1name == ''):
            return 1

        type1 = self._Types[type1name]
        type2 = self._Types[type2name]
        tempx = self._tableTypeEffs[type1][type2]
        identified = False
        for tempx in range(0, len(mondata[defenderindex]['substatus'])):
            if 'identified' == mondata[defenderindex]['substatus'][tempx]:
                identified = True
        if 'identified' in mondata[defenderindex]['substatus']:
            identified = True
        if mondata['identified'] == True and defenderindex == 'playerpokemon':
            identified = True
        if type2name == 'ghost' and (type1name == 'fighting' or type1name == 'normal') and identified == True:
            tempx = 1
        return tempx

    def DamageDealt(self, mondata, attacker, defender, moveused):
        temp2 = 0
        temp1 = 0
        critmodifier = 0
        #attacker is temptext2
        if attacker >= 6:
            temptext = 'enemypokemon'
            temptext2 = 'playerpokemon'
        if attacker <= 5:
            temptext2 = 'enemypokemon'
            temptext = 'playerpokemon'
        
        move_used = mondata[attacker]['moves'][moveused]
        move_used_effect = move_used['effect']
        
        if Debug_Code == 1 and attacker < 6:
            print(move_used['name'])

        #sleeptalk workaround
        if move_used_effect == 'sleeptalk' and mondata[attacker]['status'] in ('slp', 'slp1', 'slp2', 'slp3'):
            tempx = 0
            for tempmove in range (0, len(mondata[attacker]['moves'])):
                if mondata[attacker]['moves'][tempmove]['bp'] > tempx:
                    tempy = tempmove
                    tempx = mondata[attacker]['moves'][tempmove]['bp']
            for dataPoint in ["effect","bp","effectchance","category","type"]:
                move_used[dataPoint] = mondata[attacker]['moves'][tempmove][dataPoint]

        #Multihit
        multiplier = 1
        if move_used_effect == 'multihit':
            multiplier = 3
        if move_used_effect in ('doublehit', 'twineedle'):
            multiplier = 2

        #Raw Damage modifiers
        atkmodifier = 1
        satkmodifier = 1
        if mondata[attacker]['item'] == 'lightball' and  mondata[attacker]['species'] == 'pikachu':
            atkmodifier = atkmodifier * 2
            satkmodifier = satkmodifier * 2
        if mondata[attacker]['item'] == 'thickclub' and (mondata[attacker]['species'] == 'cubone' or mondata[attacker]['species'] == 'marowak'):
            atkmodifier = atkmodifier * 2

        #Raw damage
        basebp = move_used['bp']
        if move_used_effect == 'return':
            basebp = mondata[allmons]['stats']['happy'] / 2.5
        if move_used_effect == 'reversal':
            if mondata[attacker]['stats']['curhp'] / mondata[attacker]['stats']['hp'] > 0.71:
                basebp = 20
            elif mondata[attacker]['stats']['curhp'] / mondata[attacker]['stats']['hp'] < 0.71:
                basebp = 40
            elif mondata[attacker]['stats']['curhp'] / mondata[attacker]['stats']['hp'] < 0.35:
                basebp = 80
            elif mondata[attacker]['stats']['curhp'] / mondata[attacker]['stats']['hp'] < 0.20:
                basebp = 100
            elif mondata[attacker]['stats']['curhp'] / mondata[attacker]['stats']['hp'] < 0.10:
                basebp = 150
            elif mondata[attacker]['stats']['curhp'] / mondata[attacker]['stats']['hp'] < 0.04:
                basebp = 200
        if mondata[attacker]['type'][1].lower() == move_used['type'].lower():
            basebp = basebp*1.5
        elif mondata[attacker]['type'][2].lower() == move_used['type'].lower():
            basebp = basebp*1.5
        if move_used['category'] == 'status':
            basebp = 0
        elif move_used['category'] == "special":
            tempx = self._statsmultipliers[mondata[attacker]['boosts']['satk']+6]/100
            tempy = self._statsmultipliers[mondata[defender]['boosts']['sdef']+6]/100
            temp1 = ((((((2 * mondata[attacker]['level'] + 10) / 250) * (((mondata[attacker]['stats']['satk'] * satkmodifier) * tempx) / (mondata[defender]['stats']['sdef'] * tempy))  * basebp)+2) * 0.85)) * multiplier
            if 'lightscreen' in mondata[temptext]['screens']:
                temp1 = temp1 / 2
        elif move_used['category'] == "physical":
            tempx = self._statsmultipliers[mondata[attacker]['boosts']['atk']+6]/100
            tempy = self._statsmultipliers[mondata[defender]['boosts']['def']+6]/100
            temp1 = ((((((2 * mondata[attacker]['level'] + 10) / 250) * (((mondata[attacker]['stats']['atk'] * atkmodifier) * tempx) / (mondata[defender]['stats']['def'] * tempy))  * basebp)+2) * 0.85)) * multiplier
            if 'reflect' in mondata[temptext]['screens']:
                temp1 = temp1 / 2
            if mondata[attacker]['status'] == 'brn':
                temp1 = temp1 / 2
        effmulti = 1
        effmulti = self.getEff(move_used['type'].lower(), mondata[defender]['type'][1].lower(), temptext) * self.getEff(move_used['type'].lower(), mondata[defender]['type'][2].lower(), temptext)
        temp2 = effmulti*temp1
        if Debug_Code == 1 and attacker < 6:
            print('Damage after calc '+str(temp2))
        #compute 1.2x move-boosting items
        type_boost_item_dict = {'blackbelt':'fighting','blackglasses':'dark','charcoal':'fire','dragonfang':'dragon','hardstone':'rock','dragonfang':'dragon','hardstone':'rock','magnet':'electric','metalcoat':'steel','miracleseed':'grass','mysticwater':'water','nevermeltice':'ice','poisonbarb':'poison','sharpbeak':'flying','silkscarf':'normal','silverpowder':'bug','softsand':'ground','spelltag':'ghost'}

        if mondata[attacker]['item'] in type_boost_item_dict:
            if move_used['type'] == type_boost_item_dict[mondata[attacker]['item']]:
                temp2 = temp2 * 1.20

        elif mondata[attacker]['item'] == 'pinkbow' and move_used['type'] == 'normal':
            #special case: 1.1x instead of 1.2x (is this a typo?)
            temp2 = temp2 * 1.10
        elif mondata[attacker]['item'] == 'twistedspoon' and move_used['type'] == 'psychic' and move_used_effect != "futuresight":
            #special case: doesn't affect futuresight
            temp2 = temp2 * 1.20

        if move_used_effect != "futuresight":
            if int(self.jsonlist['battleState'][temptext2]['future sight']['damage']) != 0:
                temp2 = 0

        #weather
        if move_used['type'].lower() == 'fire' and mondata['weather'] == 'sun':
            temp2 = temp2 * 1.5
        elif move_used['type'].lower() == 'water' and mondata['weather'] == 'sun':
            temp2 = temp2 * 0.5
        elif move_used['type'].lower() == 'water' and mondata['weather'] == 'rain':
            temp2 = temp2 * 1.5
        elif move_used['type'].lower() == 'fire' and mondata['weather'] == 'rain':
            temp2 = temp2 * 0.5

        if move_used['name'].lower() == 'solarbeam' and mondata['weather'] == 'sun':
            temp2 = temp2 * 2

        tempaccuracy = 0
        if move_used['name'].lower() == 'thunder' and mondata['weather'] == 'rain':
            tempaccuracy  = 100
        if move_used['name'].lower() == 'thunder' and mondata['weather'] == 'sun':
            tempaccuracy  = 50

        #Static Damage
        if (move_used['name'] == 'seismictoss') or (move_used['name'] == 'nightshade'):
            temp2 = mondata[attacker]['level']
        if move_used['name'] == 'dragonrage':
            temp2 = 40
        if move_used['name'] == 'sonicboom':
            temp2 = 20
        if move_used['name'] == 'superfang':
            temp2 =  mondata[defender]['stats']['curhp'] / 2

        #Special cases
        if move_used_effect == 'falseswipe':
            if temp2 > mondata[defender]['stats']['curhp']:
                temp2 = mondata[defender]['stats']['curhp'] - 1

        curled = False
        if move_used_effect == 'rollout':
            for tempx in range(0, len(mondata[temptext2]['substatus'])):
                if 'curled' == mondata[temptext2]['substatus'][tempx]:
                    curled = True
            if 'curled' in mondata[temptext2]['substatus']:
                curled = True
            if (mondata['defensecurlused'] == True) and (attacker < 6):
                curled = True
            if curled == True:
                temp2 = temp2 * 2

        #special considerations for the ai's pokemon only
        if attacker < 7:
            if (move_used_effect == 'thief') and (mondata[defender]['item'] != 'noitem') and (mondata[attacker]['item'] == 'noitem'):
                temp2 = temp2 * 2
                mondata[attacker]['item'] = mondata[defender]['item']
                mondata[defender]['item'] = 'noitem'
            if (move_used_effect == 'pursuit'):
                temp2 = temp2 * (2 - mondata[defender]['stats']['curhp'] / mondata[defender]['stats']['hp'])
            if move_used['name'] == 'destinybond':
                temp2 = mondata[defender]['stats']['curhp'] * (mondata[attacker]['stats']['curhp'] / mondata[attacker]['stats']['hp'])
            if (move_used_effect == 'recoilhit'):
                self.Damage[attacker][defender][moveused]['selfdamage'] = temp2 * 0.25
            if (move_used_effect == 'leechhit'):
                self.Damage[attacker][defender][moveused]['selfdamage'] = temp2 * -0.5

        if Debug_Code == 1 and attacker < 6:
            print('Damage before accuracy and after special cases '+str(temp2))
        #Accuracy checks
        totalacc = 1
        accmodifier = 1
        if move_used_effect != 'alwayshit':
            if mondata[defender]['item'] == 'brightpowder':
                accmodifier = accmodifier * 90.9090
            tempx = self._accuracymultipliers[mondata[attacker]['boosts']['acc']+6]/100
            tempy = mondata[defender]['boosts']['eva'] * -1
            tempy = self._accuracymultipliers[tempy+6]/100
            if tempaccuracy == 0:
                totalacc = tempx * accmodifier * (move_used['acc']/100) * tempy
            if tempaccuracy > 0:
                totalacc = tempx * accmodifier * (tempaccuracy/100) * tempy

        if move_used_effect == 'ohko':
            totalacc = ((mondata[attacker]['level'] - mondata[defender]['level']) + 30)/100
            temp2 = mondata[defender]['stats']['curhp']

        locked = False
        for tempx in range(0, len(mondata[temptext]['substatus'])):
            if 'lock on' == mondata[temptext]['substatus'][tempx]:
                locked = True
        if 'lock on' in mondata[temptext]['substatus']:
            locked = True
        if mondata['lockon'] == True or locked == True:
            totalacc = 1

        accmodifier = 1
        if mondata[attacker]['status'] == 'par':
            accmodifier = accmodifier * 0.75
        if 'confused' in mondata[temptext2]['substatus'] :
            accmodifier = accmodifier * 0.5
            if temptext2 == 'playerpokemon':
                mondata1['confused'] = False
        if 'attract' in mondata[temptext2]['substatus'] :
            accmodifier = accmodifier * 0.5
            if temptext2 == 'playerpokemon':
                mondata1['attract'] = False
        temp2 = temp2 * accmodifier * totalacc

        #0% chance of hitting
        # print mondata[attacker]['boosts']
        # print mondata[defender]['boosts']
        tempx = self._statsmultipliers[mondata[attacker]['boosts']['spd']+6]/100
        tempy = self._statsmultipliers[mondata[defender]['boosts']['spd']+6]/100
        if mondata[attacker]['stats']['speed'] * tempx > mondata[defender]['stats']['speed'] * tempy:
            for tempx in range(0, len(mondata['enemypokemon']['substatus'])):
                if 'underground' == mondata['enemypokemon']['substatus'][tempx]:
                    if move_used['name'].lower() not in ('earthquake', 'magnitude', 'fissure'):
                        temp2 = 0
                    if move_used['name'].lower() in ('earthquake', 'magnitude', 'fissure'):
                        temp2 = temp2 * 2
            for tempx in range(0, len(mondata['enemypokemon']['substatus'])):
                if 'flying' == mondata['enemypokemon']['substatus'][tempx]:
                    if move_used['name'].lower() not in ('thunder', 'twister', 'gust'):
                        temp2 = 0
                    if move_used['name'].lower() in ('thunder', 'twister', 'gust'):
                        temp2 = temp2 * 2
        if mondata[attacker]['stats']['speed'] * tempx < mondata[defender]['stats']['speed'] * tempy:
            if self.enemybest in ('dig', 'fly'):
                for tempx in range(0, len(mondata['enemypokemon']['substatus'])):
                    if 'underground' == mondata['enemypokemon']['substatus'][tempx]:
                        if move_used['name'].lower() not in ('earthquake', 'magnitude', 'fissure'):
                            temp2 = 0
                        if move_used['name'].lower() in ('earthquake', 'magnitude', 'fissure'):
                            temp2 = temp2 * 2
                for tempx in range(0, len(mondata['enemypokemon']['substatus'])):
                    if 'flying' == mondata['enemypokemon']['substatus'][tempx]:
                        if move_used['name'].lower() not in ('thunder', 'twister', 'gust'):
                            temp2 = 0
                        if move_used['name'].lower() in ('thunder', 'twister', 'gust'):
                            temp2 = temp2 * 2
        if (mondata[attacker]['status'] == 'frz') and (move_used['name'].lower() not in ('flamewheel', 'sacredfire', 'flareblitz')):
            temp2 = temp2 * 0.2
        if (mondata[attacker]['status'] in ('slp')) and (move_used['name'].lower() not in ('snore')):
            temp2 = temp2 * 0.4
        if (mondata[attacker]['status'] in ('slp2', 'slp1')) and (move_used['name'].lower() not in ('snore')):
            temp2 = 0
        if (move_used_effect in ('dreameater', 'snore')) and (mondata[defender]['status'] != 'slp'):
            temp2 = 0

        templist = {}
        #Dig and Fly aversion
        for tempx in range (0, len(mondata[defender]['moves'])):
            templist[tempx] = mondata[defender]['moves'][tempx]['name'].lower()
        if move_used['name'].lower() == 'dig' and ('earthquake', 'magnitude', 'fissure') in (templist):
            temp2 = temp2 / 4
        if move_used['name'].lower() == 'fly' and ('thunder') in (templist):
            temp2 = temp2 / 4
        elif move_used['name'].lower() == 'fly' and ('twister', 'gust') in (templist):
            temp2 = temp2 / 2

        if Debug_Code == 1 and attacker < 6:
            print('Damage before crit and after accuracy '+str(temp2))
            
        #Crit modifiers
        critmodifier = 0
        pumped = False
        if mondata[attacker]['item'] == 'luckypunch' and mondata[attacker]['species'] == 'chansey':
            critmodifier = 2
        if mondata[attacker]['item'] == 'stick' and mondata[attacker]['species'] == "farfetch'd":
            critmodifier = 2
        if mondata[attacker]['item'] == 'scopelens':
            critmodifier = 1
        for tempx in range(0, len(mondata[temptext2]['substatus'])):
            if 'pumped' == mondata[temptext2]['substatus'][tempx]:
                pumped = True
        if 'pumped' in mondata[temptext2]['substatus']:
            pumped = True
        if (mondata['focusenergyused'] == True) and (attacker < 6):
            pumped = True
        if pumped == True:
            critmodifier = critmodifier + 2
        if move_used['name'].lower() in ('aeroblast', 'crabhammer', 'crosschop', 'drillrun', 'karatechop', 'razorleaf', 'shadowclaw', 'slash', 'skyattack'):
            critmodifier = critmodifier + 2
        temp2 = (temp2 * ( 1 - self._critmultipliers[critmodifier])) + (temp2 * 1.5 * self._critmultipliers[critmodifier])
        temp2 = (temp2 * ( 1 - self._critmultipliers[critmodifier])) + (temp2 * 1.5 * self._critmultipliers[critmodifier])
        
        if Debug_Code == 1 and attacker < 6:
            print('Damage after crit'+str(temp2))
        if effmulti < 0.125:
            temp2 = 0
        self.Damage[attacker][defender][moveused]['selfdamage'] = 0
        if move_used_effect == 'jumpkick':
            self.Damage[attacker][defender][moveused]['selfdamage'] = temp2 / 2
        if move_used_effect == 'explosion':
            self.Damage[attacker][defender][moveused]['selfdamage'] = 100000
        if move_used_effect == 'dreameater':
            self.Damage[attacker][defender][moveused]['selfdamage'] = temp2 / -2
        self.Damage[attacker][defender][moveused]['damage'] = temp2
        return 1

    #enemy's highest damage
    def TrainerDamage(self, mondata, traincurrent, mycurrent):
        for moveset in range (0, len(self.jsonlist['playerParty']['party'][traincurrent-6]['moves'])):
            self.DamageDealt(mondata, traincurrent, mycurrent, moveset)
        tempx = 0
        self.enemybest = ''
        self.enemynumber = -1
        for moveset in range (0, len(mondata[traincurrent]['moves'])):
            if self.Damage[traincurrent][mycurrent][moveset]['damage'] > tempx:
                tempx = self.Damage[traincurrent][mycurrent][moveset]['damage']
                self.enemybest = mondata[traincurrent]['moves'][moveset]['name'].lower()
                self.enemynumber = moveset
        return(tempx)

    def Mychoice (self, mondata, traincurrent, mycurrent, moveused):
        if mondata[mycurrent]['moves'][moveused]['curpp'] > 0:
            if mondata[mycurrent]['moves'][moveused]['effect'] in ('normalhit', 'sleeptalk', 'metronome', 'bind', 'rollout', 'falseswipe', 'rampage', 'rapidspin', 'destinybond', 'hiddenpower', 'rage', 'return', 'superfang', 'triattack', 'pursuit', 'twister', 'thief', 'reversal', 'dreameater', 'extremespeed', 'furycutter', 'explosion' 'jumpkick', 'present', 'ohko', 'thunder', 'metalclaw', 'earthquake', 'hyperbeam', 'solarbeam', 'magnitude', 'fly', 'multihit', 'gust' 'doublehit', 'poisonhit', 'freezehit', 'skyattack', 'parlyzehit', 'payday', 'stomp', 'flinchhit', 'burnhit',  'recoilhit', 'twinneedle', 'spdefdownhit', 'confusehit', 'speeddownhit', 'attackdownhit', 'leechhit', 'alwayshit', 'accuracydownhit', 'steelwing', 'flamewheel', 'sacredfire', 'defensedownhit', 'ancientpower'):
                self.DamageDealt(mondata, mycurrent, traincurrent, moveused)
            else:
                self.Damage[mycurrent][traincurrent][moveused]['damage'] = -1
                self.Damage[mycurrent][traincurrent][moveused]['selfdamage'] = 0

            #Counter coat (otherwise known as a move that has way too much code and probably be never used anyways)
            if mondata[mycurrent]['moves'][moveused]['effect'] == 'counter' or mondata[mycurrent]['moves'][moveused]['effect'] == 'mirrorcoat':
                tempx = 0
                tempdamage = 0.00
                for x1 in range (0, len(self.jsonlist['playerParty']['party'][traincurrent-6]['moves'])):
                    if mondata[traincurrent]['moves'][x1]['category'] == 'physical':
                        tempx = tempx + 1
                        tempdamage = tempdamage + self.Damage[traincurrent][mycurrent][x1]['damage']
                self.countercoat['physical']['number of'] = tempx
                self.countercoat['physical']['damage'] = tempdamage
                tempx = 0
                tempdamage = 0.00
                for x1 in range (0, len(self.jsonlist['playerParty']['party'][traincurrent-6]['moves'])):
                    if mondata[traincurrent]['moves'][x1]['category'] == 'special':
                        tempx = tempx + 1
                        tempdamage = tempdamage + self.Damage[traincurrent][mycurrent][x1]['damage']
                self.countercoat['special']['number of'] = tempx
                self.countercoat['special']['damage'] = tempdamage
                if mondata[mycurrent]['moves'][moveused]['effect'] == 'counter':
                    self.Damage[mycurrent][traincurrent][moveused]['damage'] = 2 * (self.countercoat['physical']['damage'] * (self.countercoat['physical']['number of']/(self.countercoat['physical']['number of']+self.countercoat['special']['number of'])))
                if mondata[mycurrent]['moves'][moveused]['effect'] == 'mirrorcoat':
                    self.Damage[mycurrent][traincurrent][moveused]['damage'] = 2 * (self.countercoat['special']['damage'] * (self.countercoat['special']['number of']/(self.countercoat['physical']['number of']+self.countercoat['special']['number of'])))

            #stats up
            if mondata[mycurrent]['moves'][moveused]['effect'] == 'defenseup2':
                mondata[mycurrent]['boosts']['def'] = mondata[mycurrent]['boosts']['def'] + 2
            if mondata[mycurrent]['moves'][moveused]['effect'] == 'attackup2':
                mondata[mycurrent]['boosts']['atk'] = mondata[mycurrent]['boosts']['atk'] + 2
            if mondata[mycurrent]['moves'][moveused]['effect'] == 'evasionup2':
                mondata[mycurrent]['boosts']['eva'] = mondata[mycurrent]['boosts']['eva'] + 2
            if mondata[mycurrent]['moves'][moveused]['effect'] == 'speedup2':
                mondata[mycurrent]['boosts']['spd'] = mondata[mycurrent]['boosts']['spd'] + 2
            if mondata[mycurrent]['moves'][moveused]['effect'] == 'spatkup2':
                mondata[mycurrent]['boosts']['satk'] = mondata[mycurrent]['boosts']['satk'] + 2
            if mondata[mycurrent]['moves'][moveused]['effect'] == 'spdefup2':
                mondata[mycurrent]['boosts']['sdef'] = mondata[mycurrent]['boosts']['sdef'] + 2

            if mondata[mycurrent]['moves'][moveused]['effect'] == 'spatkup':
                mondata[mycurrent]['boosts']['satk'] = mondata[mycurrent]['boosts']['satk'] + 1
            if mondata[mycurrent]['moves'][moveused]['effect'] in ('attackup', 'rage'):
                mondata[mycurrent]['boosts']['atk'] = mondata[mycurrent]['boosts']['atk'] + 1
            if mondata[mycurrent]['moves'][moveused]['effect'] == 'evasionup':
                mondata[mycurrent]['boosts']['eva'] = mondata[mycurrent]['boosts']['eva'] + 1

            # stats down
            misted = False
            for tempx in range(0, len(mondata['playerpokemon']['substatus'])):
                if 'mist' == mondata['playerpokemon']['substatus'][tempx]:
                    misted = True
            if 'mist' in mondata['playerpokemon']['substatus']:
                misted = True
            if misted == False:
                if (mondata[mycurrent]['moves'][moveused]['effect'] == 'accuracydown'):
                    mondata[traincurrent]['boosts']['acc'] = mondata[traincurrent]['boosts']['acc'] - 1
                if (mondata[mycurrent]['moves'][moveused]['effect'] == 'defensedown'):
                    mondata[traincurrent]['boosts']['def'] = mondata[traincurrent]['boosts']['def'] - 1
                if (mondata[mycurrent]['moves'][moveused]['effect'] == 'attackdown'):
                    mondata[traincurrent]['boosts']['atk'] = mondata[traincurrent]['boosts']['atk'] - 1

                if (mondata[mycurrent]['moves'][moveused]['effect'] == 'speeddown2'):
                    mondata[traincurrent]['boosts']['spd'] = mondata[traincurrent]['boosts']['spd'] - 2
                if (mondata[mycurrent]['moves'][moveused]['effect'] == 'defensedown2'):
                    mondata[traincurrent]['boosts']['def'] = mondata[traincurrent]['boosts']['def'] - 2
                if (mondata[mycurrent]['moves'][moveused]['effect'] == 'spdefdown2'):
                    mondata[traincurrent]['boosts']['sdef'] = mondata[traincurrent]['boosts']['sdef'] - 2

            #healing
            if (mondata[mycurrent]['moves'][moveused]['effect'] == 'heal') and (mondata[mycurrent]['moves'][moveused]['name'] != 'rest'):
                self.Damage[mycurrent][traincurrent][moveused]['selfdamage'] = mondata[mycurrent]['stats']['hp'] / -2
            if (mondata[mycurrent]['moves'][moveused]['effect'] == 'heal') and (mondata[mycurrent]['moves'][moveused]['name'] == 'rest'):
                self.Damage[mycurrent][traincurrent][moveused]['selfdamage'] = mondata[mycurrent]['stats']['hp'] * -1
                mondata[mycurrent]['status'] = 'slp3'
            if (mondata[mycurrent]['moves'][moveused]['effect'] in ('moonlight', 'synthesis', 'morningsun')) and (mondata['weather'] == 'sun'):
                self.Damage[mycurrent][traincurrent][moveused]['selfdamage'] = mondata[mycurrent]['stats']['hp'] / -2
            if (mondata[mycurrent]['moves'][moveused]['effect'] in ('moonlight', 'synthesis', 'morningsun')) and (mondata['weather'] in ('rain', 'sanstorm')):
                self.Damage[mycurrent][traincurrent][moveused]['selfdamage'] = mondata[mycurrent]['stats']['hp'] / -8
            if (mondata[mycurrent]['moves'][moveused]['effect'] in ('moonlight', 'synthesis', 'morningsun')) and (mondata['weather'] == 'clear'):
                self.Damage[mycurrent][traincurrent][moveused]['selfdamage'] = mondata[mycurrent]['stats']['hp'] / -4
            if mondata[mycurrent]['moves'][moveused]['effect'] == 'painsplit':
                mondata['painsplit'] = True
                mondata[mycurrent]['stats']['curhp'] = (mondata[mycurrent]['stats']['curhp'] + mondata[traincurrent]['stats']['curhp'])/2
                mondata[traincurrent]['stats']['curhp'] = mondata[mycurrent]['stats']['curhp']

            #Guard
            if (mondata[mycurrent]['moves'][moveused]['effect'] in ('protect', 'endure')) and ('protect' not in mondata['enemypokemon']['substatus']):
                self.Damage[mycurrent][traincurrent][moveused]['selfdamage'] = self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] * -1

            #curse
            if mondata[mycurrent]['moves'][moveused]['effect'] == 'curse' and ((mondata[mycurrent]['type'][1] != 'ghost') and (mondata[mycurrent]['type'][2] != 'ghost')):
                mondata[mycurrent]['boosts']['atk'] = mondata[mycurrent]['boosts']['atk'] + 1
                mondata[mycurrent]['boosts']['def'] = mondata[mycurrent]['boosts']['def'] + 1
                mondata[mycurrent]['boosts']['spd'] = mondata[mycurrent]['boosts']['spd'] - 1
            if mondata[mycurrent]['moves'][moveused]['effect'] == 'curse' and ((mondata[mycurrent]['type'][1] == 'ghost') or (mondata[mycurrent]['type'][2] == 'ghost')):
                self.Damage[mycurrent][traincurrent][moveused]['selfdamage'] =  mondata[mycurrent]['stats']['hp'] / 2
                mondata['cursed'] = True

            #foresight
            if mondata[mycurrent]['moves'][moveused]['effect'] == 'foresight':
                mondata['identified'] = True


            #Place Weather
            if mondata[mycurrent]['moves'][moveused]['effect'] == 'sunnyday':
                mondata['weather'] = 'sun'
            if mondata[mycurrent]['moves'][moveused]['effect'] == 'raindance':
                mondata['weather'] = 'rain'
            if mondata[mycurrent]['moves'][moveused]['effect'] == 'sandstorm':
                mondata['weather'] = 'sandstorm'

            #Screens
            if 'spikes' != mondata['enemypokemon']['screens']:
                if mondata[mycurrent]['moves'][moveused]['effect'] == 'spikes':
                    tempy = 0
                    for tempx in range (6, self.trainparty):
                        if (mondata[tempx]['type'][1] != 'flying') and (mondata[tempx]['type'][2] != 'flying'):
                            tempy = tempy + (mondata[tempx]['stats']['hp'] * 0.125)
                    self.Damage[mycurrent][traincurrent][moveused]['damage'] = tempy
                    mondata['enemypokemon']['screens'] += ['spikes']
            if  mondata[mycurrent]['moves'][moveused]['effect'] == 'reflect' and 'reflect' not in mondata['enemypokemon']['screens']:
                mondata['enemypokemon']['screens'] += ['reflect']
            if mondata[mycurrent]['moves'][moveused]['effect'] == 'lightscreen' and 'lightscreen' not in mondata['enemypokemon']['screens']:
                mondata['enemypokemon']['screens'] = ['lightscreen']


            #sub status
            if (mondata[mycurrent]['moves'][moveused]['name'] == 'confuseray') and mondata[traincurrent]['item'] != 'confuseguard':
                mondata['confused'] = True
            if (mondata[mycurrent]['moves'][moveused]['name'] == 'swagger') and mondata[traincurrent]['item'] != 'confuseguard':
                mondata['confused'] = True
                mondata[traincurrent]['boosts']['atk'] = mondata[traincurrent]['boosts']['atk'] + 2
            if (mondata[mycurrent]['moves'][moveused]['effect'] == 'attract') and (mondata[mycurrent]['gender'] != mondata[traincurrent]['gender']) and mondata[traincurrent]['gender'] != '':
                mondata['attract'] = True
            if (mondata[mycurrent]['moves'][moveused]['name'] == 'lockon'):
                mondata['lockon'] = True

            #end of turn shit
            if mondata[mycurrent]['moves'][moveused]['effect'] == 'bind':
                mondata['playerpokemon']['bound'] = 5
            if (mondata[mycurrent]['moves'][moveused]['effect'] == 'nightmare') and (mondata[traincurrent]['status'] == 'slp'):
                mondata['nightmare'] = True
            if mondata[mycurrent]['moves'][moveused]['effect'] == 'perishsong':
                if mondata['myperishsong'] == 0:
                    mondata['myperishsong'] = 4
                if mondata['trainperishsong'] == 0:
                    mondata['trainperishsong'] = 4
            if mondata[mycurrent]['moves'][moveused]['effect'] == 'leechseed':
                if (mondata[traincurrent]['type'][1] != 'grass') and (mondata[traincurrent]['type'][2] != 'grass'):
                    mondata['leechseedused'] = True

            #other special effects
            if mondata[mycurrent]['moves'][moveused]['effect'] == 'bide':
                if self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] * 3 < mondata[mycurrent]['stats']['curhp']:
                    self.Damage[attacker][defender][moveused]['damage'] = self.Damage[traincurrent][mycurrent][self.enemynumber]['damage']
            if mondata[mycurrent]['moves'][moveused]['effect'] == 'bellydrum':
                self.Damage[mycurrent][traincurrent][moveused]['selfdamage'] = mondata[mycurrent]['stats']['hp'] / 2
                mondata[mycurrent]['boosts']['atk'] = 6
            if (mondata[mycurrent]['moves'][moveused]['effect'] == 'healbell'):
                for pkmNo in range(6):
                    mondata[pkmNo]['status'] = 'none'
            if mondata[mycurrent]['moves'][moveused]['effect'] == 'focusenergy':
                mondata['focusenergyused'] = True
            if mondata[mycurrent]['moves'][moveused]['effect'] == 'defensecurl':
                mondata['defensecurlused'] = True
                mondata[mycurrent]['boosts']['def'] = mondata[mycurrent]['boosts']['def'] + 1
            if mondata[mycurrent]['moves'][moveused]['effect'] == 'haze':
                for stat in self.statNames:
                    mondata[mycurrent]['boosts'][stat] = 0
                    mondata[traincurrent]['boosts'][stat] = 0
                mondata[leechseedused] = False
                mondata[focusenergyused] = False

            #stats limiter
            for stat in self.statNames:
                statName = stat
                #constrain each stat to +- 6
                if mondata[mycurrent]['boosts'][statName] > 6:
                    mondata[mycurrent]['boosts'][statName] = 6
                if mondata[mycurrent]['boosts'][statName] < -6:
                    mondata[mycurrent]['boosts'][statName] = -6
                if mondata[traincurrent]['boosts'][statName] > 6:
                    mondata[traincurrent]['boosts'][statName] = 6
                if mondata[traincurrent]['boosts'][statName] < -6:
                    mondata[traincurrent]['boosts'][statName] = -6
        else:
            self.Damage[mycurrent][traincurrent][moveused]['damage'] = -1
            self.Damage[mycurrent][traincurrent][moveused]['selfdamage'] = 0
        return mondata

    def specialeffect(self, mondata, traincurrent, mycurrent, moveused):
        #apply a status
        if mondata[mycurrent]['moves'][moveused]['curpp'] > 0:
            if 'safeguard' not in mondata['playerpokemon']['screens']:
                if self.Damage[mycurrent][traincurrent][moveused]['damage'] > 0:
                    if mondata[traincurrent]['status'] == 'none':
                        if (mondata[mycurrent]['moves'][moveused]['effect'] in ('paralyze', 'paralyzehit')) and mondata[traincurrent]['item'] != 'parlyzguard':
                            mondata[traincurrent]['status'] = 'par'
                            if mondata[traincurrent]['item'] == 'miracleberry' or mondata[traincurrent]['item'] != 'przcureberry':
                                mondata[traincurrent]['status'] = 'none'
                                mondata[traincurrent]['item'] = 'noitem'
                        if (mondata[mycurrent]['moves'][moveused]['effect'] in ('burn', 'burnhit')) and mondata[traincurrent]['item'] != 'burnguard':
                            mondata[traincurrent]['status'] = 'brn'
                            if mondata[traincurrent]['item'] == 'miracleberry' or mondata[traincurrent]['item'] != 'iceberry':
                                mondata[traincurrent]['status'] = 'none'
                                mondata[traincurrent]['item'] = 'noitem'
                        if (mondata[mycurrent]['moves'][moveused]['effect'] in ('poison', 'toxic', 'poisonhit', 'twineedle')) and mondata[traincurrent]['item'] != 'poisonguard':
                            mondata[traincurrent]['status'] = 'psn'
                            if mondata[traincurrent]['item'] == 'miracleberry' or mondata[traincurrent]['item'] != 'psncureberry':
                                mondata[traincurrent]['status'] = 'none'
                                mondata[traincurrent]['item'] = 'noitem'
                        if (mondata[mycurrent]['moves'][moveused]['effect'] in ('sleep')) and mondata[traincurrent]['item'] != 'sleepguard':
                            mondata[traincurrent]['status'] = 'slp'
                            if mondata[traincurrent]['item'] == 'miracleberry' or mondata[traincurrent]['item'] != 'mintberry':
                                mondata[traincurrent]['status'] = 'none'
                                mondata[traincurrent]['item'] = 'noitem'
                        if (mondata[mycurrent]['moves'][moveused]['effect'] in ('freezehit')) and mondata[traincurrent]['item'] != 'freezeguard' and  mondata['weather'] != 'sun':
                            mondata[traincurrent]['status'] = 'frz'
                            if mondata[traincurrent]['item'] == 'miracleberry' or mondata[traincurrent]['item'] != 'burntberry':
                                mondata[traincurrent]['status'] = 'none'
                                mondata[traincurrent]['item'] = 'noitem'
                        if (mondata[mycurrent]['moves'][moveused]['effect'] == 'triattack'):
                            mondata[traincurrent]['status'] = 'par'

            #lower enemy stats
            misted = False
            for tempx in range(0, len(mondata['playerpokemon']['substatus'])):
                if 'mist' == mondata['playerpokemon']['substatus'][tempx]:
                    misted = True
            if 'mist' in mondata['playerpokemon']['substatus']:
                misted = True
            if misted == False:
                if (mondata[mycurrent]['moves'][moveused]['effect'] == 'spdefdownhit'):
                    mondata[traincurrent]['boosts']['sdef'] = mondata[traincurrent]['boosts']['sdef'] - 1
                if (mondata[mycurrent]['moves'][moveused]['effect'] == 'speeddownhit'):
                    mondata[traincurrent]['boosts']['spd'] = mondata[traincurrent]['boosts']['spd'] - 1
                if (mondata[mycurrent]['moves'][moveused]['effect'] == 'attackdownhit'):
                    mondata[traincurrent]['boosts']['atk'] = mondata[traincurrent]['boosts']['atk'] - 1
                if (mondata[mycurrent]['moves'][moveused]['effect'] == 'defensedownhit'):
                    mondata[traincurrent]['boosts']['def'] = mondata[traincurrent]['boosts']['def'] - 1
                if (mondata[mycurrent]['moves'][moveused]['effect'] == 'accuracydownhit'):
                    mondata[traincurrent]['boosts']['acc'] = mondata[traincurrent]['boosts']['acc'] - 1

            #raise own stats
            if (mondata[mycurrent]['moves'][moveused]['effect'] == 'steelwing'):
                mondata[mycurrent]['boosts']['def'] = mondata[mycurrent]['boosts']['def'] + 1
            if (mondata[mycurrent]['moves'][moveused]['effect'] == 'ancientpower'):
                for stat in ["atk","def","satk","sdef","speed"]:
                    mondata[mycurrent]['boosts']['spd'] += 1
            if (mondata[mycurrent]['moves'][moveused]['effect'] == 'metalclaw'):
                mondata[mycurrent]['boosts']['atk'] = mondata[mycurrent]['boosts']['atk'] + 1

            #apply substatus
            if (mondata[mycurrent]['moves'][moveused]['name'] in ('confusehit', 'confuse')) and mondata[traincurrent]['item'] != 'confuseguard':
                mondata['confused'] = True

            #stats limiter
            for stat in self.statNames:
                statName = stat
                #constrain each stat to +- 6
                if mondata[mycurrent]['boosts'][statName] > 6:
                    mondata[mycurrent]['boosts'][statName] = 6
                if mondata[mycurrent]['boosts'][statName] < -6:
                    mondata[mycurrent]['boosts'][statName] = -6
                if mondata[traincurrent]['boosts'][statName] > 6:
                    mondata[traincurrent]['boosts'][statName] = 6
                if mondata[traincurrent]['boosts'][statName] < -6:
                    mondata[traincurrent]['boosts'][statName] = -6
        else:
            self.Damage[mycurrent][traincurrent][moveused]['damage'] = -1
            self.Damage[mycurrent][traincurrent][moveused]['selfdamage'] = 0
        return (mondata)

    def endofturn(self, mondata, traincurrent, mycurrent):

        #status Damage
        if mondata[traincurrent]['status'] in ('brn', 'psn'):
            mondata[traincurrent]['stats']['curhp'] = mondata[traincurrent]['stats']['curhp'] - (mondata[traincurrent]['stats']['hp'] * 0.125)
        if mondata[mycurrent]['status'] in ('brn', 'psn'):
            mondata[mycurrent]['stats']['curhp'] = mondata[mycurrent]['stats']['curhp'] - (mondata[mycurrent]['stats']['hp'] * 0.125)

        #held healing
        if (mondata[traincurrent]['item'] == 'berry') and (mondata[traincurrent]['stats']['curhp'] < mondata[traincurrent]['stats']['hp'] * 0.33):
            mondata[traincurrent]['stats']['curhp'] = mondata[defender]['stats']['curhp'] + 10
            mondata[traincurrent]['item'] = 'noitem'
        if (mondata[traincurrent]['item'] == 'goldberry') and (mondata[traincurrent]['stats']['curhp'] < mondata[traincurrent]['stats']['hp'] * 0.33):
            mondata[traincurrent]['stats']['curhp'] = mondata[defender]['stats']['curhp'] + (mondata[traincurrent]['stats']['hp'] * 0.25)
            mondata[traincurrent]['item'] = 'noitem'
        if (mondata[mycurrent]['item'] == 'berry') and (mondata[mycurrent]['stats']['curhp'] < mondata[mycurrent]['stats']['hp'] * 0.33):
            mondata[mycurrent]['stats']['curhp'] = mondata[defender]['stats']['curhp'] + 10
            mondata[mycurrent]['item'] = 'noitem'
        if (mondata[mycurrent]['item'] == 'goldberry') and (mondata[mycurrent]['stats']['curhp'] < mondata[mycurrent]['stats']['hp'] * 0.33):
            mondata[mycurrent]['stats']['curhp'] = mondata[defender]['stats']['curhp'] + (mondata[mycurrent]['stats']['hp'] * 0.25)
            mondata[mycurrent]['item'] = 'noitem'

        #leftovers
        if mondata[traincurrent]['item'] == 'leftovers':
            mondata[traincurrent]['stats']['curhp'] = mondata[traincurrent]['stats']['curhp'] + (mondata[traincurrent]['stats']['hp'] * 0.0625)
        if mondata[mycurrent]['item'] =='leftovers':
            mondata[mycurrent]['stats']['curhp'] = mondata[mycurrent]['stats']['curhp'] + (mondata[mycurrent]['stats']['hp'] * 0.0625)

        #rest counter
        if mondata[mycurrent]['status'] == 'slp1':
            mondata[mycurrent]['status'] = 'none'
        if mondata[mycurrent]['status'] == 'slp2':
            mondata[mycurrent]['status'] = 'slp1'
        if mondata[mycurrent]['status'] == 'slp3':
            mondata[mycurrent]['status'] = 'slp2'

        #perish song
        if mondata['myperishsong'] == 1:
            mondata[mycurrent]['stats']['curhp'] = 0
        if mondata['trainperishsong'] == 1:
            mondata[traincurrent]['stats']['curhp'] = 0

        mondata['myperishsong'] = mondata['myperishsong'] - 1
        mondata['trainperishsong'] = mondata['trainperishsong'] - 1

        if mondata['myperishsong'] < 0:
            mondata['myperishsong'] = 0
        if mondata['trainperishsong'] < 0:
            mondata['trainperishsong'] = 0

        #nightmare
        if mondata[traincurrent]['status'] == 'slp':
            nightmared = False
            for tempx in range(0, len(mondata['playerpokemon']['substatus'])):
                if 'nightmare' == mondata['playerpokemon']['substatus'][tempx]:
                    nightmared = True
            if 'nightmare' in mondata['playerpokemon']['substatus']:
                nightmared = True
            if mondata['nightmare'] == True:
                nightmared = True
            if nightmared == True:
                mondata[traincurrent]['stats']['curhp'] = mondata[traincurrent]['stats']['curhp'] - (mondata[traincurrent]['stats']['curhp'] * 0.25)

        if mondata[mycurrent]['status'] == 'slp':
            nightmared = False
            for tempx in range(0, len(mondata['enemypokemon']['substatus'])):
                if 'nightmare' == mondata['enemypokemon']['substatus'][tempx]:
                    nightmared = True
            if 'nightmare' in mondata['enemypokemon']['substatus']:
                nightmared = True
            if nightmared == True:
                mondata[mycurrent]['stats']['curhp'] = mondata[mycurrent]['stats']['curhp'] - (mondata[mycurrent]['stats']['curhp'] * 0.25)

        #curse (damaging)
        cursed = False
        for tempx in range(0, len(mondata['playerpokemon']['substatus'])):
            if 'curse' == mondata['playerpokemon']['substatus'][tempx]:
                cursed = True
        if 'curse' in mondata['playerpokemon']['substatus']:
            cursed = True
        if mondata['cursed'] == True:
            cursed = True
        if cursed == True:
            mondata[traincurrent]['stats']['curhp'] = mondata[traincurrent]['stats']['curhp'] - (mondata[traincurrent]['stats']['curhp'] * 0.25)

        cursed = False
        for tempx in range(0, len(mondata['enemypokemon']['substatus'])):
            if 'curse' == mondata['enemypokemon']['substatus'][tempx]:
                cursed = True
        if 'curse' in mondata['enemypokemon']['substatus']:
            cursed = True
        if cursed == True:
            mondata[mycurrent]['stats']['curhp'] = mondata[mycurrent]['stats']['curhp'] - (mondata[mycurrent]['stats']['curhp'] * 0.25)

        #bound
        if mondata['playerpokemon']['bound'] > 0:
            mondata[traincurrent]['stats']['curhp'] = mondata[traincurrent]['stats']['curhp'] - (mondata[traincurrent]['stats']['hp'] * 0.125)
            mondata['playerpokemon']['bound'] = mondata['playerpokemon']['bound'] - 1
        if mondata['enemypokemon']['bound'] > 0:
            mondata[mycurrent]['stats']['curhp'] = mondata[mycurrent]['stats']['curhp'] - (mondata[mycurrent]['stats']['hp'] * 0.125)
            mondata['enemypokemon']['bound'] = mondata['enemypokemon']['bound'] - 1

        #leechseed
        seeded = False
        for tempx in range(0, len(mondata['playerpokemon']['substatus'])):
            if 'seeded' == mondata['playerpokemon']['substatus'][tempx]:
                seeded = True
        if 'seeded' in mondata['playerpokemon']['substatus']:
            seeded = True
        if mondata['leechseedused'] == True:
            seeded = True
        if seeded == True:
            mondata[traincurrent]['stats']['curhp'] = mondata[traincurrent]['stats']['curhp'] - (mondata[traincurrent]['stats']['hp'] * 0.125)
            mondata[mycurrent]['stats']['curhp'] = mondata[mycurrent]['stats']['curhp'] + (mondata[traincurrent]['stats']['hp'] * 0.125)

        seeded = False
        for tempx in range(0, len(mondata['enemypokemon']['substatus'])):
            if 'seeded' == mondata['enemypokemon']['substatus'][tempx]:
                seeded = True
        if 'seeded' in mondata['enemypokemon']['substatus']:
            seeded = True
        if seeded == True:
            mondata[traincurrent]['stats']['curhp'] = mondata[traincurrent]['stats']['curhp'] + (mondata[mycurrent]['stats']['hp'] * 0.125)
            mondata[mycurrent]['stats']['curhp'] = mondata[mycurrent]['stats']['curhp'] - (mondata[mycurrent]['stats']['hp'] * 0.125)

        mondata['painsplit'] = False
        mondata['lockon'] = False
        return(mondata)

    def Fight(self, mondata, traincurrent, mycurrent, numberofturns):

        #all possible move combos

        self.mycurhp = self.hp[mycurrent]
        self.traincurhp = self.opponenthp[traincurrent]

        #len(mondata[mycurrent]['moves']) = the number of moves the mon has
        for x2, tempcombo in enumerate(Combogenerator(numberofturns, len(mondata[mycurrent]['moves']))):
            mondata1 = mondata
            myhp = self.mycurhp
            trainhp = self.traincurhp

            mondata1['painsplit'] = False
            mondata1['lockon'] = False

            mondata1['focusenergyused'] = False
            mondata1['defensecurlused'] = False
            mondata1['leechseedused'] = False
            mondata1['confused'] = False
            mondata1['attract'] = False
            mondata1['cursed'] = False
            mondata1['identified'] = False
            mondata1['myperishsong'] = 0
            mondata1['trainperishsong'] = 0
            if 'perishsong' in mondata1['enemypokemon']['substatus']:
                mondata1['myperishsong'] = mondata1['enemypokemon']['substatus']['perishsong']
            if 'perishsong' in mondata1['playerpokemon']['substatus']:
                mondata1['trainperishsong'] = mondata1['playerpokemon']['substatus']['perishsong']

            #boosts
            mondata1['weather'] = self.jsonlist['battleState']['weather'].lower().replace(' ', '')
            mondata1['enemypokemon'] = {}
            mondata1['playerpokemon'] = {}
            mondata1['enemypokemon']['substatus'] = self.jsonlist['battleState']['enemypokemon']['subStatus']
            mondata1['playerpokemon']['substatus'] = self.jsonlist['battleState']['playerpokemon']['subStatus']
            mondata1['enemypokemon']['screens'] = self.jsonlist['battleState']['enemypokemon']['screens']
            mondata1['playerpokemon']['screens'] = self.jsonlist['battleState']['playerpokemon']['screens']
            mondata1['enemypokemon']['bound'] = int(self.jsonlist['battleState']['enemypokemon']['wrap count'])
            mondata1['playerpokemon']['bound'] = int(self.jsonlist['battleState']['playerpokemon']['wrap count'])
            if self.jsonlist['battleState']['enemy type'] == 'TRAINER':
                mondata1[mycurrent]['status'] = self.jsonlist['enemyParty']['party'][mycurrent]['status'].lower()
            else:
                mondata1[mycurrent]['status'] = self.jsonlist['battleState']['enemypokemon']['status'].lower()
            if self.triggered == 0:
                mondata1[mycurrent]['boosts'] = {}
                for stat in self.statNames:
                    mondata1[mycurrent]['boosts'][stat] = int(self.jsonlist['battleState']['enemypokemon']['stat levels'][stat])
            if self.triggered > 0:
                mondata1[mycurrent]['boosts'] = {}
                for stat in self.statNames:
                    mondata1[mycurrent]['boosts'][stat] = 0
                mondata['enemypokemon']['substatus'] = {}
                mondata['enemypokemon']['bound'] = 0
            mondata1[traincurrent]['status'] = self.jsonlist['playerParty']['party'][traincurrent-6]['status'].lower()
            mondata1[traincurrent]['boosts'] = {}
            mondata1[traincurrent]['boosts']['atk'] = int(self.jsonlist['battleState']['playerpokemon']['stat levels']['atk'])
            mondata1[traincurrent]['boosts']['def'] = int(self.jsonlist['battleState']['playerpokemon']['stat levels']['def'])
            mondata1[traincurrent]['boosts']['satk'] = int(self.jsonlist['battleState']['playerpokemon']['stat levels']['satk'])
            mondata1[traincurrent]['boosts']['sdef'] = int(self.jsonlist['battleState']['playerpokemon']['stat levels']['sdef'])
            mondata1[traincurrent]['boosts']['spd'] = int(self.jsonlist['battleState']['playerpokemon']['stat levels']['spd'])
            mondata1[traincurrent]['boosts']['eva'] = int(self.jsonlist['battleState']['playerpokemon']['stat levels']['eva'])
            mondata1[traincurrent]['boosts']['acc'] = int(self.jsonlist['battleState']['playerpokemon']['stat levels']['acc'])
            self.TrainerDamage(mondata1, traincurrent, mycurrent)

            if self.triggered > 0:
                self.DamageDealt(mondata, traincurrent, mycurrent, self.enemybestvcurrent)
                myhp = myhp - self.Damage[traincurrent][self.jsonlist['battleState']['enemypokemon']['party idx']][self.enemybestvcurrent]['damage']
            #am i using an item?
            if self.useitem > 0:
                myhp = myhp - self.Damage[traincurrent][mycurrent][self.enemynumber]['damage']
                if mondata['myitems'][x2] == 'xspeed':
                    mondata1[mycurrent]['boosts']['spd'] = mondata1[mycurrent]['boosts']['spd'] + 1
                if mondata['myitems'][x2] == 'xattack':
                    mondata1[mycurrent]['boosts']['atk'] = mondata1[mycurrent]['boosts']['atk'] + 1
                if mondata['myitems'][x2] == 'xdefense':
                    mondata1[mycurrent]['boosts']['def'] = mondata1[mycurrent]['boosts']['def'] + 1
                if mondata['myitems'][x2] == 'xspecial':
                    mondata1[mycurrent]['boosts']['satk'] = mondata1[mycurrent]['boosts']['satk'] + 1
                if mondata['myitems'][x2] == 'direhit':
                    mondata1['focusenergyused'] = True

                #stats limiter
                for stat in self.statNames:
                    statName = stat
                    #constrain each stat to +- 6
                    if mondata[mycurrent]['boosts'][statName] > 6:
                        mondata[mycurrent]['boosts'][statName] = 6
                    if mondata[mycurrent]['boosts'][statName] < -6:
                        mondata[mycurrent]['boosts'][statName] = -6
                    if mondata[traincurrent]['boosts'][statName] > 6:
                        mondata[traincurrent]['boosts'][statName] = 6
                    if mondata[traincurrent]['boosts'][statName] < -6:
                        mondata[traincurrent]['boosts'][statName] = -6
                self.TrainerDamage(mondata1, traincurrent, mycurrent)
                myhp = myhp - self.Damage[traincurrent][mycurrent][self.enemynumber]['damage']

            #figure out what happens if special effect doesnt work
            for x1 in range(0, numberofturns):
                if self.jsonlist['battleState']['enemy type'] == 'WILD':
                    if 'disabled' in mondata['enemypokemon']['substatus'] :
                        mondata[0]['moves'][int(mondata['enemypokemon']['substatus']['disabled']['move idx'])]['curpp'] = 0
                if self.jsonlist['battleState']['enemy type'] == 'TRAINER':
                    if 'disabled' in mondata['enemypokemon']['substatus'] :
                        mondata[self.jsonlist['battleState']['enemypokemon']['party idx']]['moves'][int(mondata['enemypokemon']['substatus']['disabled']['move idx'])]['curpp'] = 0
                if 'disabled' in mondata['playerpokemon']['substatus'] :
                    mondata[self.jsonlist['battleState']['playerpokemon']['party idx']+6]['moves'][int(mondata['playerpokemon']['substatus']['disabled']['move idx'])]['curpp'] = 0
                mondata1['painsplit'] = False
                mondata1['lockon'] = False
                tempx = self._statsmultipliers[mondata1[mycurrent]['boosts']['spd']+6]/100
                tempy = self._statsmultipliers[mondata1[traincurrent]['boosts']['spd']+6]/100
                if (mondata1[mycurrent]['stats']['speed'] * tempx > mondata1[traincurrent]['stats']['speed'] * tempy) or (mondata1[mycurrent]['moves'][int(tempcombo[x1])]['effect'] in ('extremespeed', 'priorityhit', 'endure', 'protect')):

                    if myhp > 0:
                        mondata1 = self.Mychoice(mondata1, traincurrent, mycurrent, int(tempcombo[x1]))
                        if mondata1['painsplit'] == True:
                            mondata1[mycurrent]['stats']['curhp'] = (mondata1[mycurrent]['stats']['curhp'] + mondata1[traincurrent]['stats']['curhp'])/2
                            mondata1[traincurrent]['stats']['curhp'] = mondata1[mycurrent]['stats']['curhp']
                            trainhp = mondata1[traincurrent]['stats']['curhp']
                            myhp = mondata1[traincurrent]['stats']['curhp']
                        trainhp = trainhp - self.Damage[mycurrent][traincurrent][int(tempcombo[x1])]['damage']
                        myhp = myhp - self.Damage[mycurrent][traincurrent][int(tempcombo[x1])]['selfdamage']
                        if myhp > mondata1[mycurrent]['stats']['hp']:
                            myhp = mondata1[mycurrent]['stats']['hp']
                    if trainhp > 0:
                        self.TrainerDamage(mondata1, traincurrent, mycurrent)
                        if mondata1['confused'] == True:
                            self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] = self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] / 2
                        if mondata1['attract'] == True:
                            self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] = self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] / 2
                        myhp = myhp - self.Damage[traincurrent][mycurrent][self.enemynumber]['damage']

                if mondata1[mycurrent]['stats']['speed'] * tempx < mondata1[traincurrent]['stats']['speed'] * tempy:
                    if trainhp > 0:
                        self.TrainerDamage(mondata1, traincurrent, mycurrent)
                        if mondata1['confused'] == True:
                            self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] = self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] / 2
                        if mondata1['attract'] == True:
                            self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] = self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] / 2
                        myhp = myhp - self.Damage[traincurrent][mycurrent][self.enemynumber]['damage']
                    if  myhp > 0:
                        mondata1 = self.Mychoice(mondata1, traincurrent, mycurrent, int(tempcombo[x1]))
                        if mondata1['painsplit'] == True:
                            mondata1[mycurrent]['stats']['curhp'] = (mondata1[mycurrent]['stats']['curhp'] + mondata1[traincurrent]['stats']['curhp'])/2
                            mondata1[traincurrent]['stats']['curhp'] = mondata1[mycurrent]['stats']['curhp']
                            trainhp = mondata1[traincurrent]['stats']['curhp']
                            myhp = mondata1[traincurrent]['stats']['curhp']
                        trainhp = trainhp - self.Damage[mycurrent][traincurrent][int(tempcombo[x1])]['damage']
                        myhp = myhp - self.Damage[mycurrent][traincurrent][int(tempcombo[x1])]['selfdamage']
                        if myhp > mondata1[mycurrent]['stats']['hp']:
                            myhp = mondata1[mycurrent]['stats']['hp']

                if mondata1[mycurrent]['stats']['speed'] * tempx == mondata1[traincurrent]['stats']['speed'] * tempy:
                    speedtie = 0
                    if myhp > 0:
                        speedtie = 1
                        mondata1 = self.Mychoice(mondata1, traincurrent, mycurrent, int(tempcombo[x1]))
                        if mondata1['painsplit'] == True:
                            mondata1[mycurrent]['stats']['curhp'] = (mondata1[mycurrent]['stats']['curhp'] + mondata1[traincurrent]['stats']['curhp'])/2
                            mondata1[traincurrent]['stats']['curhp'] = mondata1[mycurrent]['stats']['curhp']
                            trainhp = mondata1[traincurrent]['stats']['curhp']
                            myhp = mondata1[traincurrent]['stats']['curhp']
                        myhp = myhp - self.Damage[mycurrent][traincurrent][int(tempcombo[x1])]['selfdamage']
                        if myhp > mondata1[mycurrent]['stats']['hp']:
                            myhp = mondata1[mycurrent]['stats']['hp']
                    if trainhp > 0:
                        self.TrainerDamage(mondata1, traincurrent, mycurrent)
                        if mondata1['confused'] == True:
                            self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] = self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] / 2
                        if mondata1['attract'] == True:
                            self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] = self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] / 2
                        myhp = myhp - self.Damage[traincurrent][mycurrent][self.enemynumber]['damage']
                    if speedtie == 1:
                        trainhp = trainhp - self.Damage[mycurrent][traincurrent][int(tempcombo[x1])]['damage']
                mondata1[mycurrent]['stats']['curhp'] = myhp
                mondata1[traincurrent]['stats']['curhp'] = trainhp
                mondata1 = self.endofturn(mondata1, traincurrent, mycurrent)
                myhp = mondata1[mycurrent]['stats']['curhp']
                trainhp = mondata1[traincurrent]['stats']['curhp']

                if trainhp < 0:
                    trainhp = 0
                if myhp < 0:
                    myhp = 0
                mondata1[mycurrent]['stats']['curhp'] = myhp
                mondata1[traincurrent]['stats']['curhp'] = trainhp

            #do extra effect on first move

            myhp1 = self.mycurhp
            trainhp1 = self.traincurhp
            if self.triggered > 0:
                myhp1 = myhp1 - self.Damage[traincurrent][self.jsonlist['battleState']['enemypokemon']['party idx']][self.enemybestvcurrent]['damage']
            if mondata1[mycurrent]['moves'][int(tempcombo[0])]['effectchance'] > 0 or mondata1[mycurrent]['moves'][int(tempcombo[0])]['effectchance']:
                if self.jsonlist['battleState']['enemy type'] == 'WILD':
                    if 'disabled' in mondata['enemypokemon']['substatus'] :
                        mondata[0]['moves'][int(mondata['enemypokemon']['substatus']['disabled']['move idx'])]['curpp'] = 0
                if self.jsonlist['battleState']['enemy type'] == 'TRAINER':
                    if 'disabled' in mondata['enemypokemon']['substatus'] :
                        mondata[self.jsonlist['battleState']['enemypokemon']['party idx']]['moves'][int(mondata['enemypokemon']['substatus']['disabled']['move idx'])]['curpp'] = 0
                if 'disabled' in mondata['playerpokemon']['substatus'] :
                    mondata[self.jsonlist['battleState']['playerpokemon']['party idx']+6]['moves'][int(mondata['playerpokemon']['substatus']['disabled']['move idx'])]['curpp'] = 0
                mondata1 = mondata
                mondata1['focusenergyused'] = False
                mondata1['defensecurlused'] = False
                mondata1['leechseedused'] = False
                mondata1['confused'] = False
                mondata1['attract'] = False
                mondata1['cursed'] = False
                mondata1['identified'] = False
                if 'perishsong' in mondata1['enemypokemon']['substatus']:
                    mondata1['myperishsong'] = mondata1['enemypokemon']['substatus']['perishsong']
                if 'perishsong' in mondata1['playerpokemon']['substatus']:
                    mondata1['trainperishsong'] = mondata1['playerpokemon']['substatus']['perishsong']

                #boosts
                mondata1['weather'] = self.jsonlist['battleState']['weather'].lower().replace(' ', '')
                mondata1['enemypokemon'] = {}
                mondata1['playerpokemon'] = {}
                mondata1['enemypokemon']['substatus'] = self.jsonlist['battleState']['enemypokemon']['subStatus']
                mondata1['playerpokemon']['substatus'] = self.jsonlist['battleState']['playerpokemon']['subStatus']
                mondata1['enemypokemon']['screens'] = self.jsonlist['battleState']['enemypokemon']['screens']
                mondata1['playerpokemon']['screens'] = self.jsonlist['battleState']['playerpokemon']['screens']
                mondata1['enemypokemon']['bound'] = int(self.jsonlist['battleState']['enemypokemon']['wrap count'])
                mondata1['playerpokemon']['bound'] = int(self.jsonlist['battleState']['playerpokemon']['wrap count'])
                if self.jsonlist['battleState']['enemy type'] == 'TRAINER':
                    mondata1[mycurrent]['status'] = self.jsonlist['enemyParty']['party'][mycurrent]['status'].lower()
                else:
                    mondata1[mycurrent]['status'] = self.jsonlist['battleState']['enemypokemon']['status'].lower()

                if self.triggered == 0:
                    mondata1[mycurrent]['boosts'] = {}
                    mondata1[mycurrent]['boosts']['atk'] = int(self.jsonlist['battleState']['enemypokemon']['stat levels']['atk'])
                    mondata1[mycurrent]['boosts']['def'] = int(self.jsonlist['battleState']['enemypokemon']['stat levels']['def'])
                    mondata1[mycurrent]['boosts']['satk'] = int(self.jsonlist['battleState']['enemypokemon']['stat levels']['satk'])
                    mondata1[mycurrent]['boosts']['sdef'] = int(self.jsonlist['battleState']['enemypokemon']['stat levels']['sdef'])
                    mondata1[mycurrent]['boosts']['spd'] = int(self.jsonlist['battleState']['enemypokemon']['stat levels']['spd'])
                    mondata1[mycurrent]['boosts']['eva'] = int(self.jsonlist['battleState']['enemypokemon']['stat levels']['eva'])
                    mondata1[mycurrent]['boosts']['acc'] = int(self.jsonlist['battleState']['enemypokemon']['stat levels']['acc'])
                if self.triggered > 0:
                    mondata1[mycurrent]['boosts'] = {}
                    for stat in self.statNames:
                        mondata1[mycurrent]['boosts'][stat] = 0
                    mondata['enemypokemon']['substatus'] = {}
                    mondata['enemypokemon']['bound'] = 0
                mondata[traincurrent]['item'] = self.jsonlist['playerParty']['party'][traincurrent-6]['item'].lower().replace(' ', '').replace('-', '')
                mondata1[traincurrent]['status'] = self.jsonlist['playerParty']['party'][traincurrent-6]['status'].lower()
                mondata1[traincurrent]['boosts'] = {}
                mondata1[traincurrent]['boosts']['atk'] = int(self.jsonlist['battleState']['playerpokemon']['stat levels']['atk'])
                mondata1[traincurrent]['boosts']['def'] = int(self.jsonlist['battleState']['playerpokemon']['stat levels']['def'])
                mondata1[traincurrent]['boosts']['satk'] = int(self.jsonlist['battleState']['playerpokemon']['stat levels']['satk'])
                mondata1[traincurrent]['boosts']['sdef'] = int(self.jsonlist['battleState']['playerpokemon']['stat levels']['sdef'])
                mondata1[traincurrent]['boosts']['spd'] = int(self.jsonlist['battleState']['playerpokemon']['stat levels']['spd'])
                mondata1[traincurrent]['boosts']['eva'] = int(self.jsonlist['battleState']['playerpokemon']['stat levels']['eva'])
                mondata1[traincurrent]['boosts']['acc'] = int(self.jsonlist['battleState']['playerpokemon']['stat levels']['acc'])
                self.TrainerDamage(mondata1, traincurrent, mycurrent)

                if self.triggered > 0:
                    self.DamageDealt(mondata, traincurrent, mycurrent, self.enemybestvcurrent)
                    myhp = myhp - self.Damage[traincurrent][self.jsonlist['battleState']['enemypokemon']['party idx']][self.enemybestvcurrent]['damage']
                #am i using an item?
                if self.useitem > 0:
                    if mondata['myitems'][x2] == 'xspeed':
                        mondata1[mycurrent]['boosts']['spd'] = mondata1[mycurrent]['boosts']['spd'] + 1
                    if mondata['myitems'][x2] == 'xattack':
                        mondata1[mycurrent]['boosts']['atk'] = mondata1[mycurrent]['boosts']['atk'] + 1
                    if mondata['myitems'][x2] == 'xdefense':
                        mondata1[mycurrent]['boosts']['def'] = mondata1[mycurrent]['boosts']['def'] + 1
                    if mondata['myitems'][x2] == 'xspecial':
                        mondata1[mycurrent]['boosts']['satk'] = mondata1[mycurrent]['boosts']['satk'] + 1
                    if mondata['myitems'][x2] == 'direhit':
                        mondata1['focusenergyused'] = True
                    #stats limiter
                    for stat in self.statNames:
                        statName = stat
                        #constrain each stat to +- 6
                        if mondata[mycurrent]['boosts'][statName] > 6:
                            mondata[mycurrent]['boosts'][statName] = 6
                        if mondata[mycurrent]['boosts'][statName] < -6:
                            mondata[mycurrent]['boosts'][statName] = -6
                        if mondata[traincurrent]['boosts'][statName] > 6:
                            mondata[traincurrent]['boosts'][statName] = 6
                        if mondata[traincurrent]['boosts'][statName] < -6:
                            mondata[traincurrent]['boosts'][statName] = -6
                    self.TrainerDamage(mondata1, traincurrent, mycurrent)
                    myhp = myhp - self.Damage[traincurrent][mycurrent][self.enemynumber]['damage']

                for x1 in range(0, numberofturns):
                    mondata1['painsplit'] = False
                    mondata1['lockon'] = False
                    tempx = self._statsmultipliers[mondata1[mycurrent]['boosts']['spd']+6]/100
                    tempy = self._statsmultipliers[mondata1[traincurrent]['boosts']['spd']+6]/100
                    if (mondata1[mycurrent]['stats']['speed'] * tempx > mondata1[traincurrent]['stats']['speed'] * tempy) or (mondata1[mycurrent]['moves'][int(tempcombo[x1])]['effect'] in ('extremespeed', 'priorityhit', 'endure', 'protect')):
                        if myhp1 > 0:
                            mondata1 = self.Mychoice(mondata1, traincurrent, mycurrent, int(tempcombo[x1]))
                            if x1 == 0:
                                mondata1 = self.specialeffect(mondata1, traincurrent, mycurrent, int(tempcombo[x1]))
                            if mondata1['painsplit'] == True:
                                mondata1[mycurrent]['stats']['curhp'] = (mondata1[mycurrent]['stats']['curhp'] + mondata1[traincurrent]['stats']['curhp'])/2
                                mondata1[traincurrent]['stats']['curhp'] = mondata1[mycurrent]['stats']['curhp']
                                trainhp1 = mondata1[traincurrent]['stats']['curhp']
                                myhp1 = mondata1[traincurrent]['stats']['curhp']
                            trainhp1 = trainhp1 - self.Damage[mycurrent][traincurrent][int(tempcombo[x1])]['damage']
                            myhp1 = myhp1 - self.Damage[mycurrent][traincurrent][int(tempcombo[x1])]['selfdamage']
                            if myhp1 > mondata1[mycurrent]['stats']['hp']:
                                myhp1 = mondata1[mycurrent]['stats']['hp']
                        if trainhp1 > 0:
                            self.TrainerDamage(mondata1, traincurrent, mycurrent)
                            if mondata1['confused'] == True:
                                self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] = self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] / 2
                            if mondata1['attract'] == True:
                                self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] = self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] / 2
                            if x1 == 0 and mondata1[mycurrent]['moves'][int(tempcombo[0])]['effect'] == 'flinchhit' :
                                self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] = 0
                            myhp1 = myhp1 - self.Damage[traincurrent][mycurrent][self.enemynumber]['damage']

                    if mondata1[mycurrent]['stats']['speed'] * tempx < mondata1[traincurrent]['stats']['speed'] * tempy:
                        if trainhp1 > 0:
                            self.TrainerDamage(mondata1, traincurrent, mycurrent)
                            if mondata1['confused'] == True:
                                self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] = self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] / 2
                            if mondata1['attract'] == True:
                                self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] = self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] / 2
                            myhp1 = myhp1 - self.Damage[traincurrent][mycurrent][self.enemynumber]['damage']
                        if myhp1 > 0:
                            mondata1 = self.Mychoice(mondata1, traincurrent, mycurrent, int(tempcombo[x1]))
                            if x1 == 0:
                                mondata1 = self.specialeffect(mondata1, traincurrent, mycurrent, int(tempcombo[x1]))
                            if mondata1['painsplit'] == True:
                                mondata1[mycurrent]['stats']['curhp'] = (mondata1[mycurrent]['stats']['curhp'] + mondata1[traincurrent]['stats']['curhp'])/2
                                mondata1[traincurrent]['stats']['curhp'] = mondata1[mycurrent]['stats']['curhp']
                                trainhp1 = mondata1[traincurrent]['stats']['curhp']
                                myhp1 = mondata1[traincurrent]['stats']['curhp']
                            trainhp1 = trainhp1 - self.Damage[mycurrent][traincurrent][int(tempcombo[x1])]['damage']
                            myhp1 = myhp1 - self.Damage[mycurrent][traincurrent][int(tempcombo[x1])]['selfdamage']
                            if myhp1 > mondata1[mycurrent]['stats']['hp']:
                                myhp1 = mondata1[mycurrent]['stats']['hp']

                    if mondata1[mycurrent]['stats']['speed'] * tempx == mondata1[traincurrent]['stats']['speed'] * tempy:
                        speedtie = 0
                        if myhp1 > 0:
                            speedtie = 1
                            mondata1 = self.Mychoice(mondata1, traincurrent, mycurrent, int(tempcombo[x1]))
                            if x1 == 0:
                                mondata1 = self.specialeffect(mondata1, traincurrent, mycurrent, int(tempcombo[x1]))
                            if mondata1['painsplit'] == True:
                                mondata1[mycurrent]['stats']['curhp'] = (mondata1[mycurrent]['stats']['curhp'] + mondata1[traincurrent]['stats']['curhp'])/2
                                mondata1[traincurrent]['stats']['curhp'] = mondata1[mycurrent]['stats']['curhp']
                                trainhp1 = mondata1[traincurrent]['stats']['curhp']
                                myhp1 = mondata1[traincurrent]['stats']['curhp']
                            myhp1 = myhp1 - self.Damage[mycurrent][traincurrent][int(tempcombo[x1])]['selfdamage']
                            if myhp1 > mondata1[mycurrent]['stats']['hp']:
                                myhp1 = mondata1[mycurrent]['stats']['hp']
                        if trainhp1 > 0:
                            self.TrainerDamage(mondata1, traincurrent, mycurrent)
                            if mondata1['confused'] == True:
                                self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] = self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] / 2
                            if mondata1['attract'] == True:
                                self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] = self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] / 2
                            if x1 == 0 and mondata1[mycurrent]['moves'][int(tempcombo[0])]['effect'] == 'flinchhit' :
                                self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] = self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] / 2
                            myhp1 = myhp1 - self.Damage[traincurrent][mycurrent][self.enemynumber]['damage']
                        if speedtie == 1:
                            trainhp1 = trainhp1 - self.Damage[mycurrent][traincurrent][int(tempcombo[x1])]['damage']
                    mondata1[mycurrent]['stats']['curhp'] = myhp1
                    mondata1[traincurrent]['stats']['curhp'] = trainhp1
                    mondata1 = self.endofturn(mondata1, traincurrent, mycurrent)
                    myhp1 = mondata1[mycurrent]['stats']['curhp']
                    trainhp1 = mondata1[traincurrent]['stats']['curhp']

                    if trainhp1 < 0:
                        trainhp1 = 0
                    if myhp1 < 0:
                        myhp1 = 0
                    mondata1[mycurrent]['stats']['curhp'] = myhp1
                    mondata1[traincurrent]['stats']['curhp'] = trainhp1
            tempy = (mondata[mycurrent]['moves'][int(tempcombo[0])]['acc'] / 100) * (mondata[mycurrent]['moves'][int(tempcombo[0])]['effectchance'] / 100)

            #print('Enemy current: '+str(mycurrent))
            tempx = (((myhp / self.mycurhp) - (trainhp / self.traincurhp)) * (1 - tempy)) + (((myhp1 / self.mycurhp) - (trainhp1 / self.traincurhp)) * tempy)
            tempx = tempx + 1
            '''
            if myhp/mondata1[mycurrent]['stats']['hp']  > 0.5 :
                tempx = tempx * (1 + 0.1 * (mondata1[mycurrent]['boosts']['atk'] + mondata1[mycurrent]['boosts']['def'] + mondata1[mycurrent]['boosts']['satk'] + mondata1[mycurrent]['boosts']['sdef'] + mondata1[mycurrent]['boosts']['spd'] + mondata1[mycurrent]['boosts']['eva'] + mondata1[mycurrent]['boosts']['acc']))
            if trainhp/mondata1[traincurrent]['stats']['hp'] > 0.5:
                tempx = tempx * (1 + -0.05 * (mondata1[traincurrent]['boosts']['atk'] + mondata1[mycurrent]['boosts']['def'] + mondata1[traincurrent]['boosts']['satk'] + mondata1[traincurrent]['boosts']['sdef'] + mondata1[traincurrent]['boosts']['spd'] + mondata1[traincurrent]['boosts']['eva'] + mondata1[traincurrent]['boosts']['acc']))
            '''
            if Debug_Code == 1:
                print("_".join([str(x) for x in tempcombo]))
                print('Enemy Boosts: '+str(mondata[mycurrent]['boosts']))
                print(self.Damage[mycurrent][traincurrent][0]['damage'])
                print('Player Boosts: '+str(mondata[traincurrent]['boosts']))
                print(self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'])
                print('enemy hp '+str(myhp)+' enemy starting hp '+str(self.mycurhp)+' player hp '+str(trainhp)+' player starting hp '+str(self.traincurhp))
                print(tempx)
            if self.useitem == 0:
                if tempx >= self.difference[mycurrent][traincurrent] :
                    self.difference[mycurrent][traincurrent] = tempx
                    self.mybestmove['bestleaf'] = "_".join([str(x) for x in tempcombo])
                    self.mybestmove[mycurrent] = int(tempcombo[0])
                if self.difference[mycurrent][traincurrent] == -10:
                    if self.jsonlist['battleState']['enemy type'] == 'TRAINER':
                        self.mybestmove[mycurrent] = random.randint(0, (len(self.jsonlist['enemyParty']['party'][mycurrent]['moves'])))
                    else:
                        self.mybestmove[mycurrent] = random.randint(0, (len(self.jsonlist['battleState']['enemypokemon']['moves'])))
            if self.useitem > 0:
                if tempx >= self.differenceitems[mymons][self.itemused]:
                   self.differenceitems[mymons][self.itemused] = tempx
            if Debug_Code == 1:
                print('**********')
                print(self.mybestmove['bestleaf'])
                print(self.mybestmove[mycurrent])
                print(self.difference[mycurrent][traincurrent])
                print('**********')
        return(1)

    #compare all mons for best mon
    def checkIfUsingItem(self):
        if mondata['myitems'][1] != 'noitem' or mondata['myitems'][2] != 'noitem':
            for mymons in range(0, self.myparty):
                for trainmons in range (6, self.trainparty+6):
                    self.Fight(mondata, trainmons, mymons, 3)
            battlerating = {}
            for mymons in range(0, self.myparty):
                tempx = 0
                for trainmons in range (6, self.trainparty+6):
                    tempx = tempx + self.difference[mymons][trainmons]
                battlerating[mymons] = tempx
            numberofviable = int(math.ceil(self.myparty / 2))
            bestmonsindex = {}
            for x1 in range (0, numberofviable):
                tempy = 0
                for mymons in range(0, self.myparty):
                    if battlerating[mymons] > tempy:
                        tempy = battlerating[mymons]
                        tempx = mymons
                bestmonsindex[x1] = tempx
                battlerating[tempx] = 0

            mycurrent = self.jsonlist['battleState']['enemypokemon']['party idx']
            traincurrent = self.jsonlist['battleState']['playerpokemon']['party idx']+6
            self.TrainerDamage(mondata, traincurrent, mycurrent)
            self.triggered = 0
            for x1 in range (0, numberofviable):
                #if mon out is one of the best mons i have
                if self.jsonlist['battleState']['enemypokemon']['party idx'] ==  bestmonsindex[x1]:
                    for x2 in range(1, 3):
                        #and an item exists
                        if  mondata['myitems'][x2] != 'noitem':
                            self.useitem = x2
                            if mondata['myitems'][x2] in ['xspeed', 'xattack', 'xdefense', 'xspecial', 'direhit']:
                                self.Fight(mondata, traincurrent, mycurrent, 4)
                            if self.differenceitems[mymons][self.useitem] > self.difference[mycurrent][traincurrent]:
                                tempaction = x2 + 9
                                self.difference[mycurrent][traincurrent] = self.differenceitems[mymons][self.useitem]
                                return(tempaction)

                            #and you are about to die
                            if self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] > self.hp[bestmonsindex[x1]]:
                                #and healing would allow you to continue fighting
                                if self.Damage[traincurrent][mycurrent][self.enemynumber]['damage'] / self.hp[bestmonsindex[x1]] < 0.5:
                                    #and the item is a.....

                                    amt_healed = {"potion":20,"superpotion":50,"hyperpotion":200,"maxpotion":99999,"fullrestore":99999}
                                    item_name = mondata['myitems'][x2]
                                    if item_name in healing_items:
                                        #would the HP the item would heal be enough?
                                        if healing_items[item_name] > self.Damage[traincurrent][mycurrent][self.enemynumber]['damage']:
                                            return x2 + 9
        return 20

    def OptionalSwitch(self, mondata, traincurrent):
        mondata2 = self.permmondata
        self.triggered = 1
        self.enemybestvcurrent = self.enemynumber
        mondata2['enemypokemon']['substatus'] = {}
        mondata2['enemypokemon']['screens'] = {}
        trapped = False
        for tempx in range(0, len(mondata['enemypokemon']['substatus'])):
            if 'trapped' == mondata['enemypokemon']['substatus'][tempx]:
                trapped = True
        if 'trapped' in mondata['enemypokemon']['substatus']:
            trapped = True
        if int(self.jsonlist['battleState']['enemypokemon']['wrap count']) == 0 and trapped == False:
            for switchindex in range (0,  self.myparty):
                if switchindex != self.jsonlist['battleState']['enemypokemon']['party idx']:
                    mycurrent = switchindex
                    if mondata2[mycurrent]['stats']['curhp'] > 0:
                        mondata2[mycurrent]['boosts'] = {}
                        mondata2[traincurrent]['boosts'] = {}
                        for stat in self.statNames:
                            mondata2[mycurrent]['boosts'][stat] = 0
                            mondata2[traincurrent]['boosts'][stat] = int(self.jsonlist['battleState']['playerpokemon']['stat levels'][stat])
                        self.Fight(mondata2, traincurrent, mycurrent, 4)
                    else:
                        self.difference[mycurrent][traincurrent]  = -10
                        self.mybestmove['bestleaf'] = '0_0_0_0_0'
                        self.mybestmove[mycurrent][traincurrent] = -10
            tempy = -9
            for tempx in range (0, self.myparty) :
                if self.difference[tempx][traincurrent] > tempy:
                    tempy = self.difference[tempx][traincurrent]
                    if tempx != self.jsonlist['battleState']['enemypokemon']['party idx']:
                         self.theaction = tempx + 4
        return

    def ForcedSwitch(self, mondata, traincurrent):
        mondata2 = self.permmondata
        self.triggered = 0
        mondata2['enemypokemon']['substatus'] = {}
        mondata2['enemypokemon']['screens'] = {}
        for switchindex in range (0,  self.myparty):
            if switchindex != self.jsonlist['battleState']['enemypokemon']['party idx']:
                mycurrent = switchindex
                if mondata2[mycurrent]['stats']['curhp'] > 0:
                    mondata2[mycurrent]['boosts'] = {}
                    mondata2[traincurrent]['boosts'] = {}
                    for stat in self.statNames:
                        mondata2[mycurrent]['boosts'][stat] = 0
                        mondata2[traincurrent]['boosts'][stat] = int(self.jsonlist['battleState']['playerpokemon']['stat levels'][stat])
                    self.Fight(mondata2, traincurrent, mycurrent, 4)
                else:
                    self.difference[mycurrent][traincurrent]  = -10
                    self.mybestmove['bestleaf'] = '0_0_0_0_0'
                    self.mybestmove[mycurrent][traincurrent] = -10
        tempy = -9
        for tempx in range (0, self.myparty):
            if self.difference[tempx][traincurrent] > tempy:
                tempy = self.difference[tempx][traincurrent]
                if tempx != self.jsonlist['battleState']['enemypokemon']['party idx']:
                    theaction = tempx + 4
        return theaction 

    def WildBattle(self, mondata, mycurrent, traincurrent):
        movepriority = {}
        movepriority[0] = 20
        movepriority[1] = 20
        movepriority[2] = 20
        movepriority[3] = 20
        mondata['focusenergyused'] = False
        mondata['painsplit'] = False
        mondata['lockon'] = False
        mondata['defensecurlused'] = False
        mondata['leechseedused'] = False
        mondata['confused'] = False
        mondata['attract'] = False
        mondata['cursed'] = False
        mondata['identified'] = False
        mondata['myperishsong'] = 0
        mondata['trainperishsong'] = 0
        mondata[mycurrent]['boosts'] = {}
        mondata[traincurrent]['boosts'] = {}
        for stat in self.statNames:
                mondata[mycurrent]['boosts'][stat] = int(self.jsonlist['battleState']['enemypokemon']['stat levels'][stat])
                mondata[traincurrent]['boosts'][stat] = int(self.jsonlist['battleState']['playerpokemon']['stat levels'][stat])
        for tempmove in range (0, len(self.jsonlist['battleState']['enemypokemon']['moves'])):
            self.DamageDealt(mondata, mycurrent, traincurrent, tempmove)
            if self.Damage[mycurrent][traincurrent][tempmove]['damage'] / mondata[traincurrent]['stats']['curhp'] > 0.5:
                movepriority[tempmove] = 0
                continue
            if mondata[traincurrent]['status'] == 'none':
                if mondata[mycurrent]['moves'][tempmove]['effect'] == 'toxic':
                    movepriority[tempmove] = 1
                    continue
                if mondata[mycurrent]['moves'][tempmove]['effect'] == 'poison':
                    movepriority[tempmove] = 2
                    continue
                if mondata[mycurrent]['moves'][tempmove]['effect'] in ('poisonhit', 'twineedle'):
                    movepriority[tempmove] = 3
                    continue
                if mondata[mycurrent]['moves'][tempmove]['effect'] == 'burn':
                    movepriority[tempmove] = 4
                    continue
                if mondata[mycurrent]['moves'][tempmove]['effect'] == 'burnhit':
                    movepriority[tempmove] = 5
                    continue
                if mondata[mycurrent]['moves'][tempmove]['name'] == 'paralyze':
                    movepriority[tempmove] = 6
                    continue
                if mondata[mycurrent]['moves'][tempmove]['name'] == 'zapcannon':
                    movepriority[tempmove] = 7
                    continue
                if mondata[mycurrent]['moves'][tempmove]['effect'] in ('paralyzehit', 'thunder') and mondata[mycurrent]['moves'][tempmove]['effectchance'] == 30:
                    movepriority[tempmove] = 8
                    continue
                if mondata[mycurrent]['moves'][tempmove]['effect'] == 'paralyzehit' and mondata[mycurrent]['moves'][tempmove]['effectchance'] == 10:
                    movepriority[tempmove] = 9
                    continue
                if mondata[mycurrent]['moves'][tempmove]['effect'] == 'freezehit' and mondata['weather'] != 'sun':
                    movepriority[tempmove] = 10
                    continue
            if mondata[mycurrent]['moves'][tempmove]['effect'] in ('whirlwind', 'teleport'):
                movepriority[tempmove] = 11
                continue
        theaction = 20
        for tempx in range(0, len(self.jsonlist['battleState']['enemypokemon']['moves'])):
            tempy = 20
            if movepriority[tempx] < tempy:
                tempy = movepriority[tempx]
                theaction = tempx

        if theaction == 20:
            self.Fight(mondata, traincurrent, mycurrent, 4)
            theaction = self.mybestmove[mycurrent]
        return theaction 

    def ManualControl(self):
        tempx = -1
        for tempmove in range (0, len(self.jsonlist['battleState']['enemypokemon']['moves'])):
            if mondata[0]['moves'][tempmove]['effect'] in ('protect'):
                tempx = tempmove
        if tempx != -1 and ('protect' not in (mondata['battleState']['enemypokemon']['substatus'])):
            for x1 in range(0, len(mondata['playerpokemon']['substatus'])):
                if 'underground' == mondata['playerpokemon']['substatus'][x1]:
                    return tempx
                if 'flying' == mondata['playerpokemon']['substatus'][x1]:
                    return tempx
                if 'charged' == mondata['playerpokemon']['substatus'][x1]:
                    return tempx

        if self.theaction < 4 :
            if mondata[0]['moves'][self.theaction]['effect'] == 'counter':
                tempx = -1
                for tempmove in range (0, len(self.jsonlist['battleState']['enemypokemon']['moves'])):
                    if mondata[0]['moves'][tempmove]['effect'] in ('mirrormove'):
                        tempx = tempmove
                if tempx > -1:
                    x1 = math.ceil(self.Damage[0][6][self.theaction]['damage'] / (self.Damage[0][6][self.theaction]['damage'] + self.Damage[0][6][tempx]['damage']))
                    if random.randint(0, 100) > x1:
                        return tempx
            if mondata[0]['moves'][self.theaction]['effect'] == 'mirrorcoat':
                tempx = -1
                for tempmove in range (0, len(self.jsonlist['battleState']['enemypokemon']['moves'])):
                    if mondata[0]['moves'][tempmove]['effect'] in ('counter'):
                        tempx = tempmove
                if tempx > -1:
                    x1 = math.ceil(self.Damage[0][6][self.theaction]['damage'] / (self.Damage[0][6][self.theaction]['damage'] + self.Damage[0][6][tempx]['damage']))
                    if random.randint(0, 100) > x1:
                        return tempx
        for tempmove in range (0, len(self.jsonlist['battleState']['enemypokemon']['moves'])):
            if self.Damage[0][6][tempmove]['damage'] > self.opponenthp[6] :
                return tempmove
        return None

    #figure out best action to do in current battle
    def MainBattle(self, jsonlist):

        self.jsonlist = jsonlist

        #setup everything
        if self.jsonlist['battleState']['enemy type'] == 'TRAINER':
            self.myparty = len(self.jsonlist['enemyParty']['party']) #ai's pokemon
        else:
            self.myparty = 0
        self.trainparty = len(self.jsonlist['playerParty']['party'])
        self.triggered = 0
        self.enemybestvcurrent = 0
        self.difference = {}
        for mymons in range(0, 6):
            self.difference[mymons] = {}
            for trainmons in range (6, 12):
                self.difference[mymons][trainmons] = -10

        self.differenceitems = {}
        for mymons in range(0, 6):
            self.differenceitems[mymons] = {1:-1,2:-1}

        self.Damage = {}
        for x1 in range(0, 12):
            self.Damage[x1] = {}
            for x2 in range(0, 12):
                self.Damage[x1][x2] = {}
                for x3 in range(0, 4):
                    self.Damage[x1][x2][x3] = {}

        self.mybestmove = {}
        self.permmondata = {}
        self.enemybest = ''
        self.opponenthp = {}
        self.hp = {}
        self.useitem = 0
        self.theaction = 0
        self.countercoat = {}
        self.countercoat['physical'] = {}
        self.countercoat['special'] = {}

        #alright, start computing

        traincurrent = self.jsonlist['battleState']['playerpokemon']['party idx']+6
        mondata = self.parseMondataFromJsonlist()
        if self.jsonlist['battleState']['enemy type'] == 'TRAINER':
            mycurrent = self.jsonlist['battleState']['enemypokemon']['party idx']
            if ('requested action' not in self.jsonlist['battleState']) or (int(self.jsonlist['battleState']['requested action']) != 66):
                self.Fight(mondata, traincurrent, mycurrent, 4)
                self.theaction = self.mybestmove[mycurrent]
                self.OptionalSwitch(mondata, traincurrent)
                theaction2 = self.checkIfUsingItem()
                if theaction2 != 20:
                    self.theaction = theaction2
                potentialAction = self.ManualControl()
                if potentialAction is not None:
                    self.theaction = potentialAction
            else:
                self.theaction = self.ForcedSwitch(mondata, traincurrent)
        else:
            mycurrent = 0
            self.theaction = self.WildBattle(mondata, mycurrent, traincurrent)
        if self.theaction < 4:
            tempy = 0
            for tempx in range (0, len(mondata[0]['moves'])):
                if mondata[0]['moves'][tempx]['curpp'] == 0:
                    tempy = tempy + 1
            while True:
                if mondata[0]['moves'][self.theaction]['curpp'] > 0:
                    break
                self.mybestmove[mycurrent] = random.randint(0, (len(self.jsonlist['battleState']['enemypokemon']['moves'])))
                if tempy == len(mondata[0]['moves']):
                    break
        
        temptext = self._actualAction[str(self.theaction)]
        return temptext

def main():
    Artificial = AI()
    battle_state = json.loads(open(JSON_FILE_PATH).read(), encoding="utf-8")
    print(Artificial.MainBattle(battle_state))

    #    battle_state = Artificial.jsonlist
    #    #placeholder to prevent infinite looping
    #    input('Action Above is best move (0-3 = moves, 4-9 = mon switch, 10-11 = use bag items) --- Press enter to continue')


if __name__ == '__main__':
    main()
