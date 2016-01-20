
-- PikalaxALT's first attempt at lua to read battle state
-- AKA readbattlestate_clean.lua
-- Version 0.3.1
JSON = (loadfile "JSON.lua")()
dofile("battle_ram.lua")
local itemTable = {"NO ITEM", "MASTER BALL", "ULTRA BALL", "BRIGHTPOWDER", "GREAT BALL", "POKE BALL", "LAPTOP", "BICYCLE", "MOON STONE", "ANTIDOTE", "BURN HEAL", "ICE HEAL", "AWAKENING", "PARALYZE HEAL", "FULL RESTORE", "MAX POTION", "HYPER POTION", "SUPER POTION", "POTION", "ESCAPE ROPE", "REPEL", "MAX ELIXER", "FIRE STONE", "THUNDERSTONE", "WATER STONE", "POISON GUARD", "HP UP", "PROTEIN", "IRON", "CARBOS", "LUCKY PUNCH", "CALCIUM", "RARE CANDY", "X ACCURACY", "LEAF STONE", "METAL POWDER", "NUGGET", "POKE DOLL", "FULL HEAL", "REVIVE", "MAX REVIVE", "GUARD SPEC", "SUPER REPEL", "MAX REPEL", "DIRE HIT", "BURN GUARD", "FRESH WATER", "SODA POP", "LEMONADE", "X ATTACK", "FREEZE GUARD", "X DEFEND", "X SPEED", "X SPECIAL", "COIN CASE", "ITEMFINDER", "POKE FLUTE", "EXP SPARE", "OLD ROD", "GOOD ROD", "SILVER LEAF", "SUPER ROD", "PP UP", "ETHER", "MAX ETHER", "ELIXER", "RED SCALE", "SECRETPOTION", "S S TICKET", "MYSTERY EGG", "CLEAR BELL", "SILVER WING", "MOOMOO MILK", "QUICK CLAW", "PSNCUREBERRY", "GOLD LEAF", "SOFT SAND", "SHARP BEAK", "PRZCUREBERRY", "BURNT BERRY", "ICE BERRY", "POISON BARB", "KINGS ROCK", "BITTER BERRY", "MINT BERRY", "RED APRICORN", "TINYMUSHROOM", "BIG MUSHROOM", "SILVERPOWDER", "BLU APRICORN", "SLEEP GUARD", "AMULET COIN", "YLW APRICORN", "GRN APRICORN", "CLEANSE TAG", "MYSTIC WATER", "WHT APRICORN", "BLACKBELT", "BLK APRICORN", "PARLYZ GUARD", "PNK APRICORN", "BLACKGLASSES", "SLOWPOKETAIL", "PINK BOW", "STICK", "SMOKE BALL", "NEVERMELTICE", "MAGNET", "MIRACLEBERRY", "PEARL", "BIG PEARL", "EVERSTONE", "SPELL TAG", "RAGECANDYBAR", "GS BALL", "BLUE CARD", "MIRACLE SEED", "THICK CLUB", "FOCUS BAND", "CONFUSEGUARD", "ENERGYPOWDER", "ENERGY ROOT", "HEAL POWDER", "REVIVAL HERB", "HARD STONE", "LUCKY EGG", "CARD KEY", "MACHINE PART", "EGG TICKET", "LOST ITEM", "STARDUST", "STAR PIECE", "BASEMENT KEY", "PASS", "HELIX FOSSIL", "DOME FOSSIL", "OLD AMBER", "CHARCOAL", "BERRY JUICE", "SCOPE LENS", "OAKS PARCEL", "ITEM 8E", "METAL COAT", "DRAGON FANG", "ITEM 91", "LEFTOVERS", "ITEM 93", "ITEM 94", "ITEM 95", "MYSTERYBERRY", "DRAGON SCALE", "BERSERK GENE", "ITEM 99", "ITEM 9A", "ITEM 9B", "SACRED ASH", "HEAVY BALL", "FLOWER MAIL", "LEVEL BALL", "LURE BALL", "FAST BALL", "ITEM A2", "LIGHT BALL", "FRIEND BALL", "MOON BALL", "LOVE BALL", "NORMAL BOX", "GORGEOUS BOX", "SUN STONE", "POLKADOT BOW", "ITEM AB", "UP GRADE", "BERRY", "GOLD BERRY", "SQUIRTBOTTLE", "ITEM B0", "PARK BALL", "RAINBOW WING", "ITEM B3", "BRICK PIECE", "SURF MAIL", "LITEBLUEMAIL", "PORTRAITMAIL", "LOVELY MAIL", "EON MAIL", "MORPH MAIL", "BLUESKY MAIL", "MUSIC MAIL", "MIRAGE MAIL", "ITEM BE", "TM01", "TM02", "TM03", "TM04", "ITEM C3", "TM05", "TM06", "TM07", "TM08", "TM09", "TM10", "TM11", "TM12", "TM13", "TM14", "TM15", "TM16", "TM17", "TM18", "TM19", "TM20", "TM21", "TM22", "TM23", "TM24", "TM25", "TM26", "TM27", "TM28", "ITEM DC", "TM29", "TM30", "TM31", "TM32", "TM33", "TM34", "TM35", "TM36", "TM37", "TM38", "TM39", "TM40", "TM41", "TM42", "TM43", "TM44", "TM45", "TM46", "TM47", "TM48", "TM49", "TM50", "HM01", "HM02", "HM03", "HM04", "HM05", "HM06", "HM07", "HM08"}

local moveTable = {"NO MOVE", "POUND", "KARATE CHOP", "DOUBLESLAP", "GUNK SHOT", "ZEN HEADBUTT", "PAY DAY", "FIRE PUNCH", "ICE PUNCH", "THUNDERPUNCH", "SCRATCH", "FAIRY WIND", "FOCUS BLAST", "IRON DEFENSE", "SWORDS DANCE", "CUT", "GUST", "WING ATTACK", "WHIRLWIND", "FLY", "BUG BUZZ", "SLAM", "VINE WHIP", "STOMP", "DOUBLE KICK", "MEGA KICK", "FLARE BLITZ", "ROLLING KICK", "SAND ATTACK", "HEADBUTT", "HORN ATTACK", "FURY ATTACK", "HORN DRILL", "TACKLE", "BODY SLAM", "WRAP", "TAKE DOWN", "THRASH", "DOUBLE EDGE", "TAIL WHIP", "POISON STING", "TWINEEDLE", "PIN MISSILE", "LEER", "BITE", "GROWL", "ROAR", "SING", "SUPERSONIC", "SONICBOOM", "DISABLE", "ACID", "EMBER", "FLAMETHROWER", "MIST", "WATER GUN", "HYDRO PUMP", "SURF", "ICE BEAM", "BLIZZARD", "PSYBEAM", "BUBBLEBEAM", "AURORA BEAM", "HYPER BEAM", "PECK", "DRILL PECK", "SUBMISSION", "HEAT WAVE", "COUNTER", "SEISMIC TOSS", "STRENGTH", "ABSORB", "MEGA DRAIN", "LEECH SEED", "GROWTH", "RAZOR LEAF", "SOLARBEAM", "POISONPOWDER", "STUN SPORE", "SLEEP POWDER", "PETAL DANCE", "STRING SHOT", "DRAGON RAGE", "FIRE SPIN", "THUNDERSHOCK", "THUNDERBOLT", "THUNDER WAVE", "THUNDER", "ROCK THROW", "EARTHQUAKE", "FISSURE", "DIG", "TOXIC", "CONFUSION", "PSYCHIC M", "HYPNOSIS", "MEDITATE", "AGILITY", "QUICK ATTACK", "RAGE", "TELEPORT", "NIGHT SHADE", "MIMIC", "SCREECH", "DOUBLE TEAM", "RECOVER", "HARDEN", "MINIMIZE", "SMOKESCREEN", "CONFUSE RAY", "WITHDRAW", "DEFENSE CURL", "BARRIER", "LIGHT SCREEN", "HAZE", "REFLECT", "FOCUS ENERGY", "BIDE", "METRONOME", "MIRROR MOVE", "SELFDESTRUCT", "METAL SOUND", "LICK", "DRAGON PULSE", "SLUDGE", "BONE CLUB", "FIRE BLAST", "WATERFALL", "CLAMP", "SWIFT", "AQUA JET", "SPIKE CANNON", "FLASH CANNON", "AMNESIA", "WILLOWISP", "SOFTBOILED", "HI JUMP KICK", "GLARE", "DREAM EATER", "ROCK POLISH", "SEED BOMB", "LEECH LIFE", "LOVELY KISS", "SKY ATTACK", "TRANSFORM", "BUBBLE", "DIZZY PUNCH", "SPORE", "FLASH", "PSYWAVE", "SPLASH", "ACID ARMOR", "CRABHAMMER", "EXPLOSION", "POISON JAB", "BONEMERANG", "REST", "ROCK SLIDE", "HYPER FANG", "SHARPEN", "CONVERSION", "TRI ATTACK", "SUPER FANG", "SLASH", "SUBSTITUTE", "STRUGGLE", "SKETCH", "WILD CHARGE", "THIEF", "X SCISSOR", "MIND READER", "NIGHTMARE", "FLAME WHEEL", "IRON HEAD", "CURSE", "FLAIL", "CONVERSION2", "AEROBLAST", "COTTON SPORE", "REVERSAL", "SPITE", "POWDER SNOW", "PROTECT", "MACH PUNCH", "SCARY FACE", "FAINT ATTACK", "SWEET KISS", "BELLY DRUM", "SLUDGE BOMB", "MUD SLAP", "OCTAZOOKA", "SPIKES", "ZAP CANNON", "FORESIGHT", "DESTINY BOND", "PERISH SONG", "ICY WIND", "AIR SLASH", "DARK PULSE", "EARTH POWER", "OUTRAGE", "SANDSTORM", "GIGA DRAIN", "ENDURE", "CHARM", "ROLLOUT", "FALSE SWIPE", "SWAGGER", "MILK DRINK", "SPARK", "FURY CUTTER", "STEEL WING", "MEAN LOOK", "ATTRACT", "SLEEP TALK", "HEAL BELL", "RETURN", "PRESENT", "DAZZLINGLEAM", "SAFEGUARD", "PAIN SPLIT", "SACRED FIRE", "MAGNITUDE", "DYNAMICPUNCH", "MEGAHORN", "DRAGONBREATH", "BATON PASS", "ENCORE", "PURSUIT", "RAPID SPIN", "NASTY PLOT", "IRON TAIL", "METAL CLAW", "VITAL THROW", "MORNING SUN", "SYNTHESIS", "MOONLIGHT", "HIDDEN POWER", "CROSS CHOP", "TWISTER", "RAIN DANCE", "SUNNY DAY", "CRUNCH", "MIRROR COAT", "SHADOW CLAW", "EXTREMESPEED", "ANCIENTPOWER", "SHADOW BALL", "FUTURE SIGHT", "ROCK SMASH", "WHIRLPOOL", "DRILL RUN", "MOONBLAST", "PLAY ROUGH", "SHEER COLD"}

local speciesTable = {"BULBASAUR", "IVYSAUR", "VENUSAUR", "CHARMANDER", "CHARMELEON", "CHARIZARD", "SQUIRTLE", "WARTORTLE", "BLASTOISE", "CATERPIE", "METAPOD", "BUTTERFREE", "WEEDLE", "KAKUNA", "BEEDRILL", "PIDGEY", "PIDGEOTTO", "PIDGEOT", "RATTATA", "RATICATE", "SPEAROW", "FEAROW", "EKANS", "ARBOK", "PIKACHU", "RAICHU", "SANDSHREW", "SANDSLASH", "NIDORAN♀", "NIDORINA", "NIDOQUEEN", "NIDORAN♂", "NIDORINO", "NIDOKING", "CLEFAIRY", "CLEFABLE", "VULPIX", "NINETALES", "JIGGLYPUFF", "WIGGLYTUFF", "ZUBAT", "GOLBAT", "ODDISH", "GLOOM", "VILEPLUME", "PARAS", "PARASECT", "VENONAT", "VENOMOTH", "DIGLETT", "DUGTRIO", "MEOWTH", "PERSIAN", "PSYDUCK", "GOLDUCK", "MANKEY", "PRIMEAPE", "GROWLITHE", "ARCANINE", "POLIWAG", "POLIWHIRL", "POLIWRATH", "ABRA", "KADABRA", "ALAKAZAM", "MACHOP", "MACHOKE", "MACHAMP", "BELLSPROUT", "WEEPINBELL", "VICTREEBEL", "TENTACOOL", "TENTACRUEL", "GEODUDE", "GRAVELER", "GOLEM", "PONYTA", "RAPIDASH", "SLOWPOKE", "SLOWBRO", "MAGNEMITE", "MAGNETON", "FARFETCH'D", "DODUO", "DODRIO", "SEEL", "DEWGONG", "GRIMER", "MUK", "SHELLDER", "CLOYSTER", "GASTLY", "HAUNTER", "GENGAR", "ONIX", "DROWZEE", "HYPNO", "KRABBY", "KINGLER", "VOLTORB", "ELECTRODE", "EXEGGCUTE", "EXEGGUTOR", "CUBONE", "MAROWAK", "HITMONLEE", "HITMONCHAN", "LICKITUNG", "KOFFING", "WEEZING", "RHYHORN", "RHYDON", "CHANSEY", "TANGELA", "KANGASKHAN", "HORSEA", "SEADRA", "GOLDEEN", "SEAKING", "STARYU", "STARMIE", "MR.MIME", "SCYTHER", "JYNX", "ELECTABUZZ", "MAGMAR", "PINSIR", "TAUROS", "MAGIKARP", "GYARADOS", "LAPRAS", "DITTO", "EEVEE", "VAPOREON", "JOLTEON", "FLAREON", "PORYGON", "OMANYTE", "OMASTAR", "KABUTO", "KABUTOPS", "AERODACTYL", "SNORLAX", "ARTICUNO", "ZAPDOS", "MOLTRES", "DRATINI", "DRAGONAIR", "DRAGONITE", "MEWTWO", "MEW", "CHIKORITA", "BAYLEEF", "MEGANIUM", "CYNDAQUIL", "QUILAVA", "TYPHLOSION", "TOTODILE", "CROCONAW", "FERALIGATR", "SENTRET", "FURRET", "HOOTHOOT", "NOCTOWL", "LEDYBA", "LEDIAN", "SPINARAK", "ARIADOS", "CROBAT", "CHINCHOU", "LANTURN", "PICHU", "CLEFFA", "IGGLYBUFF", "TOGEPI", "TOGETIC", "NATU", "XATU", "MAREEP", "FLAAFFY", "AMPHAROS", "BELLOSSOM", "MARILL", "AZUMARILL", "SUDOWOODO", "POLITOED", "HOPPIP", "SKIPLOOM", "JUMPLUFF", "AIPOM", "SUNKERN", "SUNFLORA", "YANMA", "WOOPER", "QUAGSIRE", "ESPEON", "UMBREON", "MURKROW", "SLOWKING", "MISDREAVUS", "UNOWN", "WOBBUFFET", "GIRAFARIG", "PINECO", "FORRETRESS", "DUNSPARCE", "GLIGAR", "STEELIX", "SNUBBULL", "GRANBULL", "QWILFISH", "SCIZOR", "SHUCKLE", "HERACROSS", "SNEASEL", "TEDDIURSA", "URSARING", "SLUGMA", "MAGCARGO", "SWINUB", "PILOSWINE", "CORSOLA", "REMORAID", "OCTILLERY", "DELIBIRD", "MANTINE", "SKARMORY", "HOUNDOUR", "HOUNDOOM", "KINGDRA", "PHANPY", "DONPHAN", "PORYGON2", "STANTLER", "SMEARGLE", "TYROGUE", "HITMONTOP", "SMOOCHUM", "ELEKID", "MAGBY", "MILTANK", "BLISSEY", "RAIKOU", "ENTEI", "SUICUNE", "LARVITAR", "PUPITAR", "TYRANITAR", "LUGIA", "HO-OH", "CELEBI", "?????", "EGG", "?????", "?????", "?????"}

local typeTable = {"NORMAL", "FIGHTING", "FLYING", "POISON", "GROUND", "ROCK", "BIRD", "BUG", "GHOST", "STEEL", "---", "---", "---", "---", "---", "---", "---", "---", "---", "???", "FIRE", "WATER", "GRASS", "ELECTRIC", "PSYCHIC", "ICE", "DRAGON", "DARK", "FAIRY"}
local GRVal = { 31, 31, 31, 31, 31, 31, 31, 31, 31, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 254, 254, 254, 0, 0, 0, 191, 191, 191, 191, 191, 191, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 63, 63, 127, 127, 127, 63, 63, 63, 63, 63, 63, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 255, 255, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 255, 255, 127, 127, 127, 127, 0, 0, 127, 127, 127, 127, 127, 254, 127, 254, 127, 127, 127, 127, 255, 255, 127, 127, 254, 63, 63, 127, 0, 127, 127, 127, 255, 31, 31, 31, 31, 255, 31, 31, 31, 31, 31, 31, 255, 255, 255, 127, 127, 127, 255, 255, 31, 31, 31, 31, 31, 31, 31, 31, 31, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 191, 191, 31, 31, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 31, 31, 127, 127, 127, 255, 127, 127, 127, 127, 127, 127, 127, 191, 191, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 191, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 255, 127, 127, 0, 0, 254, 63, 63, 254, 254, 255, 255, 255, 127, 127, 127, 255, 255, 255 };
local PPVal = { 35, 25, 10, 15, 20, 20, 15, 15, 15, 35, 30, 5, 10, 30, 30, 35, 35, 20, 15, 20, 20, 10, 20, 30, 5, 25, 15, 15, 15, 25, 20, 5, 35, 15, 20, 20, 20, 15, 30, 35, 20, 20, 30, 25, 40, 20, 15, 20, 20, 20, 30, 25, 15, 30, 25, 5, 15, 10, 5, 20, 20, 20, 5, 35, 20, 25, 20, 20, 20, 15, 20, 10, 10, 40, 25, 10, 35, 30, 15, 20, 40, 10, 15, 30, 15, 20, 10, 15, 10, 5, 10, 10, 25, 10, 20, 40, 30, 30, 20, 20, 15, 10, 40, 15, 20, 30, 20, 20, 10, 40, 40, 30, 30, 30, 20, 30, 10, 10, 20, 5, 10, 30, 20, 20, 20, 5, 15, 10, 20, 15, 15, 35, 20, 15, 10, 20, 30, 15, 40, 20, 15, 10, 5, 10, 30, 10, 15, 20, 15, 40, 40, 10, 5, 15, 10, 10, 10, 15, 30, 30, 10, 10, 20, 10, 1, 1, 10 ,10 ,10, 5, 15, 25, 15, 10, 15, 30, 5, 40, 15, 10, 25, 10, 30, 10, 20, 10, 10, 10, 10, 10, 20, 5, 40, 5, 5, 15, 5, 10, 5, 15, 10, 5, 10, 20, 20, 40, 15, 10, 20, 20, 25, 5, 15, 10, 5, 20, 15, 20, 25, 20, 5, 30, 5, 10, 20, 40, 5, 20, 40, 20, 15, 35, 10, 5, 5, 5, 15, 5, 20, 5, 5, 15, 20, 10, 5, 5, 15, 15, 15, 15, 10 }

local trainerClassTable = {"FALKNER", "WHITNEY", "BUGSY", "MORTY", "PRYCE", "JASMINE", "CHUCK", "CLAIR", "RIVAL1", "POKEMON_PROF", "WILL", "CAL", "BRUNO", "KAREN", "KOGA", "CHAMPION", "BROCK", "MISTY", "LT_SURGE", "SCIENTIST", "ERIKA", "YOUNGSTER", "SCHOOLBOY", "BIRD_KEEPER", "LASS", "JANINE", "COOLTRAINERM", "COOLTRAINERF", "BEAUTY", "POKEMANIAC", "GRUNTM", "GENTLEMAN", "SKIER", "TEACHER", "SABRINA", "BUG_CATCHER", "FISHER", "SWIMMERM", "SWIMMERF", "SAILOR", "SUPER_NERD", "RIVAL2", "GUITARIST", "HIKER", "BIKER", "BLAINE", "BURGLAR", "FIREBREATHER", "JUGGLER", "BLACKBELT_T", "EXECUTIVEM", "PSYCHIC_T", "PICNICKER", "CAMPER", "EXECUTIVEF", "SAGE", "MEDIUM", "BOARDER", "POKEFANM", "KIMONO_GIRL", "TWINS", "POKEFANF", "RED", "BLUE", "OFFICER", "GRUNTF", "MYSTICALMAN", "BILL_TC", "PROF_ELM", "TPPPC", "ROCKETBOSS", "COOL_SIBLINGS", "BLUE_RB", "BLUE_RB_F"}

local weatherTable = {"None", "Rain", "Sun", "Sandstorm"}

local charmap = {" ", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "(", ")", ":", ";", "[", "]", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "Ä", "Ö", "Ü", "ä", "ö", "ü", "'d", "'l", "'m", "'r", "'s", "'t", "'v", "←", "'", "<PK>", "<MN>", "-", "?", "!", ".", "&", "é", "→", "▷", "▶", "▼", "♂", "¥", "×", "·", "/", ",", "♀", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"}

militaryMode = 0

function getBigDW(pointer)
	-- There is no built-in for big-endian DWs, which are used extensively in battle structs.
	return memory.readbyte(pointer) * 256 + memory.readbyte(pointer + 1)
end

function refreshinterval(seconds)
	-- Revo's function (liar, it's Timmy's function)
	local lastupdate = os.time()
	local now
	repeat
		now = os.time()
		emu.frameadvance()
	until now - lastupdate >= seconds
	lastupdate = now
	return true
end

function parseString(start_addr, length)
	outstr = ""
	for i = 0, length do
		curr_byte = memory.readbyte(start_addr + i)
		if curr_byte == 0x50 then return outstr end
		if curr_byte < 0x7f then return outstr end
		outstr = outstr .. charmap[curr_byte - 0x7f + 1]
	end
end

function getMove(movePointer, ppPointer)
	local move = {}
	move_idx = memory.readbyte(movePointer)
	if move_idx == 0 then return nil end
	move["move"] = moveTable[move_idx + 1]
	tempPP = memory.readbyte(ppPointer)
	move["curpp"] = AND(tempPP, 0x3f)
	move["ppUp"] = (AND(tempPP, 0xc0)) / 0x40
	move["maxpp"] = PPVal[move_idx] * (move["ppUp"] + 5) / 5
	return move
end

function getMoves(movePointer, ppPointer)
	local moves = {}
	for i = 0, 3 do
		moves[string.format("move%d",i+1)] = getMove(movePointer + i, ppPointer + i)
	end
	return moves
end

function getMonStatus(pointer)
	status = memory.readbyte(pointer)
	if (AND(status, 0x7) ~= 0) then
		return string.format("SLP (%d turns)", AND(status, 0x7))
	elseif (AND(status, 0x08) ~= 0) then
		return "PSN"
	elseif (AND(status, 0x10) ~= 0) then
		return "BRN"
	elseif (AND(status, 0x20) ~= 0) then
		return "FRZ"
	elseif (AND(status, 0x40) ~= 0) then
		return "PRZ"
	else return "NONE"
	end
end

function calcGender(dvs, species)
	-- Reproduce gender calculation from Pokemon Crystal
	if species == 0 then return "None" end
	baseGender = GRVal[species]
	if (baseGender == 255) then return "None" end
	if (baseGender == 0)   then return "Male" end
	if (baseGender == 254) then return "Female" end
	attPlusSpeed = dvs["atk"] * 16 + dvs["spd"]
	if (baseGender < attPlusSpeed) then return "Male" else return "Female" end
end

function getMonType(pointer)
	type1 = memory.readbyte(pointer)
	type2 = memory.readbyte(pointer + 1)
	if (type1 == type2) then
		return typeTable[type1+1]
	else
		return string.format("%s / %s", typeTable[type1+1], typeTable[type2+1])
	end
end

function getDVs(pointer)
	local dvs = {}
	dvs["atk"] = AND(memory.readbyte(pointer),0xf0) / 16
	dvs["def"] = memory.readbyte(pointer) % 16
	dvs["spd"] = AND(memory.readbyte(pointer + 1),0xf0) / 16
	dvs["spc"] = memory.readbyte(pointer + 1) % 16
	dvs["hp"] = AND(dvs["atk"], 1) * 8 + AND(dvs["def"], 1) * 4 + AND(dvs["spd"], 1) * 2 + AND(dvs["spc"], 1)
	return dvs
end

function getMonBattleState(pointer)
	-- init
	local mon = {}
	local stats = {}
	-- read
	species_idx = memory.readbyte(pointer + 0)
	if species_idx == 0 then return end
	mon["species"] = speciesTable[species_idx]
	mon["item"] = itemTable[memory.readbyte(pointer + 1) + 1]
	mon["moves"] = getMoves(pointer + 2, pointer + 8)
	mon["dvs"] = getDVs(pointer + 6)
	mon["happiness"] = memory.readbyte(pointer + 12)
	mon["level"] = memory.readbyte(pointer + 13)
	mon["status"] = getMonStatus(pointer + 14)
	mon["hp"] = getBigDW(pointer + 16)
	mon["gender"] = calcGender(mon["dvs"], species_idx)
	stats["maxhp"] = getBigDW(pointer + 18)
	stats["attack"] = getBigDW(pointer + 20)
	stats["defense"] = getBigDW(pointer + 22)
	stats["speed"] = getBigDW(pointer + 24)
	stats["spatk"] = getBigDW(pointer + 26)
	stats["spdef"] = getBigDW(pointer + 28)
	mon["stats"] = stats
	mon["type"] = getMonType(pointer + 30)
	return mon
end

function getSubstatus(flags, counts, subhp, lockedmove)
	local subStatus = {}
	substatus1 = memory.readbyte(flags + 0)
	substatus2 = memory.readbyte(flags + 1)
	substatus3 = memory.readbyte(flags + 2)
	substatus4 = memory.readbyte(flags + 3)
	substatus5 = memory.readbyte(flags + 4)

	-- substatus1
	if (AND(substatus1, 0x01) ~= 0) then table.insert(subStatus, "nightmare") end
	if (AND(substatus1, 0x02) ~= 0) then table.insert(subStatus, "curse") end
	if (AND(substatus1, 0x04) ~= 0) then subStatus["protect"] = memory.readbyte(counts + 7) end
	if (AND(substatus1, 0x08) ~= 0) then table.insert(subStatus, "identified") end
	if (AND(substatus1, 0x10) ~= 0) then subStatus["perish song"] = memory.readbyte(counts + 5) end
	if (AND(substatus1, 0x20) ~= 0) then table.insert(subStatus, "endure") end
	if (AND(substatus1, 0x40) ~= 0) then subStatus["rollout"] = memory.readbyte(counts + 0) end
	if (AND(substatus1, 0x80) ~= 0) then table.insert(subStatus, "attract") end

	-- substatus2
	if (AND(substatus2, 0x01) ~= 0) then table.insert(subStatus, "curled") end

	-- substatus3
	if (AND(substatus3, 0x01) ~= 0) then table.insert(subStatus, "bide") end
	if (AND(substatus3, 0x02) ~= 0) then table.insert(subStatus, "rampage") end
	if (AND(substatus3, 0x04) ~= 0) then table.insert(subStatus, "multihit") end
	if (AND(substatus3, 0x08) ~= 0) then table.insert(subStatus, "flinch") end
	if (AND(substatus3, 0x10) ~= 0) then table.insert(subStatus, "charged") end
	if (AND(substatus3, 0x20) ~= 0) then table.insert(subStatus, "underground") end
	if (AND(substatus3, 0x40) ~= 0) then table.insert(subStatus, "flying") end
	if (AND(substatus3, 0x80) ~= 0) then subStatus["confused"] = memory.readbyte(counts + 1) end

	-- substatus4
	if (AND(substatus4, 0x01) ~= 0) then table.insert(subStatus, "x accuracy") end
	if (AND(substatus4, 0x02) ~= 0) then table.insert(subStatus, "mist") end
	if (AND(substatus4, 0x04) ~= 0) then table.insert(subStatus, "pumped") end
	if (AND(substatus4, 0x10) ~= 0) then subStatus["substitute"] = memory.readbyte(subhp) end
	if (AND(substatus4, 0x20) ~= 0) then table.insert(subStatus, "recharge") end
	if (AND(substatus4, 0x40) ~= 0) then subStatus["raging"] = memory.readbyte(counts + 6) end
	if (AND(substatus4, 0x80) ~= 0) then table.insert(subStatus, "seeded") end

	-- substatus5
	if (AND(substatus5, 0x01) ~= 0) then substatus["toxic"] = memory.readbyte(counts + 2) end
	if (AND(substatus5, 0x04) ~= 0) then table.insert(subStatus, "transformed") end
	if (AND(substatus5, 0x10) ~= 0) then
		local encore = {}
		encore["count"] = memory.readbyte(counts + 4)
		encore["move idx"] = memory.readbyte(lockedmove)
		subStatus["encore"] = encore
	end
	if (AND(substatus5, 0x20) ~= 0) then table.insert(subStatus, "lock on") end
	if (AND(substatus5, 0x40) ~= 0) then table.insert(subStatus, "destiny bond") end
	if (AND(substatus5, 0x80) ~= 0) then table.insert(subStatus, "trapped") end
	return subStatus
end

function getWeather()
	weather = memory.readbyte(0xc70a)
	if weather >= 4 then return string.format("%s end", weatherTable[weather - 2]) end
	if weather == 0 then return "Clear" end
	return string.format("%s (%d turns left)", weatherTable[weather + 1], memory.readbyte(0xc70b))
end

function getScreens(flags, counts)
	local screens = {}
	screenflags = memory.readbyte(flags)
	if (AND(screenflags, 0x03) ~= 0) then
		screens["spikes"] = AND(screenflags, 0x03)
	end
	if (AND(screenflags, 0x04) ~= 0) then
		screens["safeguard"] = memory.readbyte(counts + 0)
	end
	if (AND(screenflags, 0x08) ~= 0) then
		screens["light screen"] = memory.readbyte(counts + 1)
	end
	if (AND(screenflags, 0x10) ~= 0) then
		screens["reflect"] = memory.readbyte(counts + 2)
	end
	return screens
end

function getStatLevels(pointer)
	local statLevels = {}
	statLevels["atk"] = memory.readbyte(pointer + 0) - 7
	statLevels["def"] = memory.readbyte(pointer + 1) - 7
	statLevels["spd"] = memory.readbyte(pointer + 2) - 7
	statLevels["satk"] = memory.readbyte(pointer + 3) - 7
	statLevels["sdef"] = memory.readbyte(pointer + 4) - 7
	statLevels["acc"] = memory.readbyte(pointer + 5) - 7
	statLevels["eva"] = memory.readbyte(pointer + 6) - 7
	return statLevels
end

function getPlayerPokemonData()
	playerMon = getMonBattleState(BattleMonSpecies)
	if playerMon == nil then return end
	playerMon["subStatus"] = getSubstatus(PlayerSubStatus1, PlayerRolloutCount, PlayerSubstituteHP, LastPlayerMon)
	playerMon["screens"] = getScreens(PlayerScreens, PlayerSafeguardCount)
	playerMon["turns"] = memory.readbyte(PlayerTurnsTaken)
	playerMon["stat levels"] = getStatLevels(PlayerAtkLevel)
	lastMove = memory.readbyte(LastPlayerMove)
	if lastMove == 0 then
		playerMon["last used"] = "None"
	else
		playerMon["last used"] = moveTable[lastMove + 1]
	end
	return playerMon
end

function getEnemyPokemonData()
	enemyMon = getMonBattleState(EnemyMonSpecies)
	if enemyMon == nil then return end
	enemyMon["subStatus"] = getSubstatus(EnemySubStatus1, EnemyRolloutCount, EnemySubstituteHP, LastPlayerMove)
	enemyMon["screens"] = getScreens(EnemyScreens, PlayerLightScreenCount)
	enemyMon["turns"] = memory.readbyte(EnemyTurnsTaken)
	enemyMon["stat levels"] = getStatLevels(EnemyAtkLevel)
	lastMove = memory.readbyte(LastEnemyMove)
	if lastMove == 0 then
		enemyMon["last used"] = "None"
	else
		enemyMon["last used"] = moveTable[lastMove + 1]
	end
	return enemyMon
end

function getTrainerClass()
	return trainerClassTable[memory.readbyte(OtherTrainerClass)]
end

function getTrainerItems()
	local trainerItems = {}
	trainerItems["item1"] = itemTable[memory.readbyte(wEnemyTrainerItem1)+1]
	trainerItems["item2"] = itemTable[memory.readbyte(wEnemyTrainerItem2)+1]
	return trainerItems
end

function getTrainerParty(partycount_addr)
	local trainerParty = {}
	trainerParty["length"] = memory.readbyte(partycount_addr)
	local mons = {}
	local party = {}
	for i = 1, trainerParty["length"] do
		table.insert(mons, speciesTable[memory.readbyte(partycount_addr + i)])
		local curr_mon = {}
		mon_pointer = partycount_addr + 8 + 48 * (i - 1)
		species_idx = memory.readbyte(mon_pointer + 0)
		curr_mon["species"] = speciesTable[species_idx]
		curr_mon["item"] = itemTable[memory.readbyte(mon_pointer + 1) + 1]
		curr_mon["moves"] = getMoves(mon_pointer + 2, mon_pointer + 23)
		curr_mon["id"] = getBigDW(mon_pointer + 6)
		curr_mon["exp"] = memory.readbyte(mon_pointer + 8) * 0x10000 + memory.readbyte(mon_pointer + 9) * 0x100 + memory.readbyte(mon_pointer + 10)
		local statexp = {}
		statexp["hp"] = getBigDW(mon_pointer + 11)
		statexp["atk"] = getBigDW(mon_pointer + 13)
		statexp["def"] = getBigDW(mon_pointer + 15)
		statexp["spd"] = getBigDW(mon_pointer + 17)
		statexp["spc"] = getBigDW(mon_pointer + 19)
		curr_mon["statexp"] = statexp
		curr_mon["dvs"] = getDVs(mon_pointer + 21)
		curr_mon["happiness"] = memory.readbyte(mon_pointer + 27)
		local pokerus = {}
		pkrs_byte = memory.readbyte(mon_pointer + 28)
		if pkrs_byte == 0 then
			pokerus["strain"] = "None"
			pokerus["count"] = "Uninfected"
		else
			pokerus["strain"] = AND(pkrs_byte, 0xf0) / 16
			if AND(pkrs_byte, 0xf) == 0 then
				pokerus["count"] = "Immune"
			else
				pokerus["count"] = AND(pkrs_byte, 0xf)
			end
		end
		curr_mon["pokerus"] = pokerus
		curr_mon["level"] = memory.readbyte(mon_pointer + 31)
		curr_mon["gender"] = calcGender(curr_mon["dvs"], species_idx)
		curr_mon["status"] = getMonStatus(mon_pointer + 32)
		curr_mon["hp"] = getBigDW(mon_pointer + 34)
		local stats = {}
		stats["maxhp"] = getBigDW(mon_pointer + 36)
		stats["attack"] = getBigDW(mon_pointer + 38)
		stats["defense"] = getBigDW(mon_pointer + 40)
		stats["speed"] = getBigDW(mon_pointer + 42)
		stats["spatk"] = getBigDW(mon_pointer + 44)
		stats["spdef"] = getBigDW(mon_pointer + 46)
		curr_mon["stats"] = stats
		curr_mon["nickname"] = parseString(partycount_addr + 8 + 48 * 6 + 11 * 6 + 11 * (i - 1), 11)
		table.insert(party, curr_mon)
	end
	trainerParty["mons"] = mons
	trainerParty["party"] = party
	return trainerParty
end

function readPlayerPack()
	local pack = {}
	local items = {}
	local balls = {}
	local key = {}
	local tmhm = {}
	numItems = memory.readbyte(NumItems)
	for i = 1, numItems do
		items[itemTable[memory.readbyte(Items + 2 * (i-1)) + 1]] = memory.readbyte(Items + 2 * (i-1) + 1)
	end
	numBalls = memory.readbyte(NumBalls)
	for i = 1, numBalls do
		balls[itemTable[memory.readbyte(Balls + 2 * (i-1)) + 1]] = memory.readbyte(Balls + 2 * (i-1) + 1)
	end
	numKeys = memory.readbyte(NumKeyItems)
	for i = 1, numKeys do
		table.insert(key, itemTable[memory.readbyte(KeyItems + (i-1)) + 1])
	end
	for i = 1, 50 do
		if memory.readbyte(TMsHMs + (i-1)) ~= 0 then
			table.insert(tmhm, string.format("TM%02d", i))
		end
	end
	for i = 1, 7 do
		if memory.readbyte(TMsHMs + (i+50-1)) ~= 0 then
			table.insert(tmhm, string.format("HM%02d", i))
		end
	end
	pack["items"] = items
	pack["balls"] = balls
	pack["key"] = key
	pack["tmhm"] = tmhm
	return pack
end

function readBattlestate() --read this ONLY when LUA Serial is called
    battleState = {}
    battlemode = memory.readbyte(wBattleMode)
    svbk = memory.readbyte(rSVBK)
    
    vba.print("WRAM bank: ", svbk)

	if svbk == 1 then
		--local output_table = {}
		--playerParty = getTrainerParty(0xdcd7)
		--vba.print("Player Party:")
		--vba.print(playerParty)
		--pack = readPlayerPack()
		--vba.print("Player Pack:")
		--vba.print(pack)
		--output_table["playerParty"] = playerParty
		--output_table["pack"] = pack
		if battlemode == 0 then
			vba.print("Not in battle")
			memory.writebyte(wMilitaryMode, militaryMode)
		else
			if battlemode == 2 then
				battleState["enemy type"] = "TRAINER"
				battleState["trainer class"] = getTrainerClass()
				battleState["trainer items"] = getTrainerItems()
				enemyParty = getTrainerParty(OTPartyCount)
				vba.print("Enemy Party:")
				vba.print(enemyParty)
				output_table["enemyParty"] = enemyParty
			elseif battlemode == 1 then 
				battleState["enemy type"] = "WILD"
			end
			battleState["weather"] = getWeather()
			battleState["playerpokemon"] = getPlayerPokemonData()
			battleState["enemypokemon"] = getEnemyPokemonData()
			vba.print("Battle State:")
			vba.print(battleState)
			output_table["battleState"] = battleState
		end
		local raw_json = JSON:encode(output_table)
		file = io.open("battlestate.json", "w+")
        -- call transferStateToAIAndWait() here and calculate the bytes to 
		io.output(file)
		io.write(raw_json)
		io.close(file)
    else
        vba.print("Waiting for bank switch...")
    end
end

function transferStateToAIAndWait()
	-- transfer to AI and get a response here
	-- check DFFA, if Military mode is on, then wait for the first valid player shortcut command, if not, ignore
	-- calculate the bytes to write to DFF8 and DFF9, write them, then end here and resume looping playerstate reading
end

function readPlayerstate() --loop read this for the overlay
    svbk = memory.readbyte(rSVBK)
    local output_table = {}
    vba.print("WRAM bank: ", svbk)
    playerParty = getTrainerParty(PartyCount)
    vba.print("Player Party:")
    vba.print(playerParty)
    pack = readPlayerPack()
    vba.print("Player Pack:")
    vba.print(pack)
    output_table["playerParty"] = playerParty
    output_table["pack"] = pack
    -- check if LUA serial, if yes, readBattlestate
end

repeat
    readPlayerstate()
until not refreshinterval(0.100)
