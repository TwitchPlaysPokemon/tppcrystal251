Route22RB_MapScriptHeader:
	; trigger count
	db 2
	dw .Trigger0, 0
	dw .Trigger1, 0

	; callback count
	db 0

.Trigger0
	end

.Trigger1
	end

Route22RBRivalBattleTriggerBottom:
	playmusic MUSIC_RIVAL_RB
	applymovement $2, Route22RB_RivalWalksIn_PlayerOnBottom
	scall Route22RBRivalBattle
	applymovement $2, Route22RB_RivalWalksOut_PlayerOnBottom
	disappear $2
	dotrigger $0
	special RestartMapMusic
	end

Route22RBRivalBattleTriggerTop:
	playmusic MUSIC_RIVAL_RB
	applymovement $2, Route22RB_RivalWalksIn_PlayerOnTop
	spriteface $0, DOWN
	scall Route22RBRivalBattle
	applymovement $2, Route22RB_RivalWalksOut_PlayerOnTop
	disappear $2
	dotrigger $0
	special RestartMapMusic
	end

Route22RBRivalBattle:
	loadfont
	writetext _Route22RivalBeforeBattleText1
	waitbutton
	closetext
	checkevent EVENT_GOT_CHARMANDER_FROM_OAK
	iftrue .charmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_OAK
	iftrue .squirtle
	loadtrainer BLUE_RB, BLUE_RB_2C
	jump .StartBattle

.charmander
	loadtrainer BLUE_RB, BLUE_RB_2A
	jump .StartBattle

.squirtle
	loadtrainer BLUE_RB, BLUE_RB_2B
.StartBattle
	winlosstext _Route22RivalDefeatedText1, _Route22RivalLossText
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmapmusic
	returnafterbattle
	playmapmusic
	loadfont
	writetext _Route22RivalAfterBattleText1
	waitbutton
	closetext
	playmusic MUSIC_RIVAL_AFTER_RB
	end

Route22RB_RivalWalksIn_PlayerOnTop:
	step_right
	step_right
	step_right
	step_right
	step_right
	turn_head_up
	step_end

Route22RB_RivalWalksIn_PlayerOnBottom:
	step_right
	step_right
	step_right
	step_right
	step_end

Route22RB_RivalWalksOut_PlayerOnBottom:
	step_up
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

Route22RB_RivalWalksOut_PlayerOnTop:
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_end

MapRoute22RBSignpost0Script:
	jumptext _Route22FrontGateText

_Route22RivalBeforeBattleText1::
	text "<GREEN>: Hey!"
	line "<PLAYER>!"

	para "You're going to"
	line "#MON LEAGUE?"

	para "Forget it! You"
	line "probably don't"
	cont "have any BADGEs!"

	para "The guard won't"
	line "let you through!"

	para "By the way, did"
	line "your #MON"
	cont "get any stronger?"
	done

_Route22RivalAfterBattleText1::
	text "I heard #MON"
	line "LEAGUE has many"
	cont "tough trainers!"

	para "I have to figure"
	line "out how to get"
	cont "past them!"

	para "You should quit"
	line "dawdling and get"
	cont "a move on!"
	done

_Route22RivalDefeatedText1::
	text "Awww!"
	line "You just lucked"
	cont "out!"
	done

_Route22RivalLossText:
	text "<GREEN>: Yeah! Am"
	line "I great or what?"
	done

_Route22FrontGateText::
	text "#MON LEAGUE"
	line "Front Gate"
	done

Route22RB_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $5, $8, 1, GROUP_VICTORY_ROAD_GATE_RB, MAP_VICTORY_ROAD_GATE_RB

	; xy triggers
	db 2
	xy_trigger 1, 4, 29, $0, Route22RBRivalBattleTriggerTop, 0, 0
	xy_trigger 1, 5, 29, $0, Route22RBRivalBattleTriggerBottom, 0, 0

	; signposts
	db 1
	signpost 11, 7, $0, MapRoute22RBSignpost0Script

	; people-events
	db 1
	person_event SPRITE_BLUE, 9, 28, $0, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_RIVAL_ROUTE_22_RB
; 0x7c038

