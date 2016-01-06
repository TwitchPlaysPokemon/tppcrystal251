OaksLabRB_MapScriptHeader: ; 0x19b3c5
	; trigger count
	db 5
	dw .Trigger0, $0000
	dw .Trigger1, $0000
	dw .Trigger2, $0000
	dw .Trigger3, $0000
	dw .Trigger4, $0000

	; callback count
	db 1
	dbw 1, .SetSprites
; 0x19b3c7
.Trigger0:
	end

.Trigger1:
	priorityjump WalkUpWithOak
	end

.Trigger2:
	end

.Trigger3:
	end

.Trigger4:
	end

.SetSprites:
	checkevent EVENT_GOT_POKEMON_FROM_OAK
	iftrue .skip
	moveperson $2, $5, $a
	spriteface $2, UP
.skip
	return

WalkUpWithOak:
	follow $2, $0
	applymovement $2, MovementData_OakWalksUp
	stopfollow
	faceperson $2, $0
	faceperson $6, $2
	loadfont
	writetext _OaksLabRivalWaitingText
	waitbutton
	closetext
	loadfont
	writetext _OaksLabChooseMonText
	waitbutton
	closetext
	loadfont
	writetext _OaksLabRivalInterjectionText
	waitbutton
	closetext
	loadfont
	writetext _OaksLabBePatientText
	waitbutton
	closetext
	dotrigger $2
	end

CharmanderPokeballScript:
	checkevent EVENT_GOT_POKEMON_FROM_OAK
	iftrue OaksLab_LastMonScript
	checkevent EVENT_OAKS_LAB_OAK
	iftrue OaksLab_LookAtPokeballScript
	spriteface $2, RIGHT
	refreshscreen $0
	pokepic CHARMANDER
	cry CHARMANDER
	waitbutton
	closepokepic
	loadfont
	writetext _OaksLabCharmanderText
	yesorno
	iffalse OaksLabRB_DidntChooseStarterScript
	disappear $7
	setevent EVENT_GOT_CHARMANDER_FROM_OAK
	setevent EVENT_GOT_POKEMON_FROM_OAK
	writetext _OaksLabMonEnergeticText
	buttonsound
	waitsfx
	pokenamemem CHARMANDER, $0
	writetext _OaksLabReceivedMonText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CHARMANDER, 5, BERRY
	closetext
	applymovement $6, Movement_RivalTakesTwoStepsDown
	applymovement $6, Movement_RivalTakesThreeStepsRight
	applymovement $6, Movement_RivalTakesOneStepUp
	loadfont
	writetext _OaksLabRivalPickingMonText
	buttonsound
	pokenamemem SQUIRTLE, $1
	disappear $8
	writetext _OaksLabRivalReceivedMonText
	playsound SFX_CAUGHT_MON
	waitsfx
	closetext
	dotrigger $3
	end

BulbasaurPokeballScript:
	checkevent EVENT_GOT_POKEMON_FROM_OAK
	iftrue OaksLab_LastMonScript
	checkevent EVENT_OAKS_LAB_OAK
	iftrue OaksLab_LookAtPokeballScript
	spriteface $2, RIGHT
	refreshscreen $0
	pokepic BULBASAUR
	cry BULBASAUR
	waitbutton
	closepokepic
	loadfont
	writetext _OaksLabBulbasaurText
	yesorno
	iffalse OaksLabRB_DidntChooseStarterScript
	disappear $9
	setevent EVENT_GOT_BULBASAUR_FROM_OAK
	setevent EVENT_GOT_POKEMON_FROM_OAK
	writetext _OaksLabMonEnergeticText
	buttonsound
	waitsfx
	pokenamemem BULBASAUR, $0
	writetext _OaksLabReceivedMonText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke BULBASAUR, 5, BERRY
	closetext
	applymovement $6, Movement_RivalTakesTwoStepsDown
	applymovement $6, Movement_RivalTakesTwoStepsRight
	applymovement $6, Movement_RivalTakesOneStepUp
	loadfont
	writetext _OaksLabRivalPickingMonText
	buttonsound
	pokenamemem CHARMANDER, $1
	disappear $7
	writetext _OaksLabRivalReceivedMonText
	playsound SFX_CAUGHT_MON
	waitsfx
	closetext
	dotrigger $3
	end

SquirtlePokeballScript:
	checkevent EVENT_GOT_POKEMON_FROM_OAK
	iftrue OaksLab_LastMonScript
	checkevent EVENT_OAKS_LAB_OAK
	iftrue OaksLab_LookAtPokeballScript
	spriteface $2, RIGHT
	refreshscreen $0
	pokepic SQUIRTLE
	cry SQUIRTLE
	waitbutton
	closepokepic
	loadfont
	writetext _OaksLabSquirtleText
	yesorno
	iffalse OaksLabRB_DidntChooseStarterScript
	disappear $8
	setevent EVENT_GOT_SQUIRTLE_FROM_OAK
	setevent EVENT_GOT_POKEMON_FROM_OAK
	writetext _OaksLabMonEnergeticText
	buttonsound
	waitsfx
	pokenamemem SQUIRTLE, $0
	writetext _OaksLabReceivedMonText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke SQUIRTLE, 5, BERRY
	closetext
	applymovement $6, Movement_RivalTakesTwoStepsDown
	applymovement $6, Movement_RivalTakesFourStepsRight
	applymovement $6, Movement_RivalTakesOneStepUp
	loadfont
	writetext _OaksLabRivalPickingMonText
	buttonsound
	pokenamemem BULBASAUR, $1
	disappear $9
	writetext _OaksLabRivalReceivedMonText
	playsound SFX_CAUGHT_MON
	waitsfx
	closetext
	dotrigger $3
	end

OaksLabRB_DidntChooseStarterScript:
	closetext
	end

OaksLab_LastMonScript:
	jumptext _OaksLabLastMonText

OaksLab_LookAtPokeballScript:
	jumptext _OaksLabText39

OaksLab_RivalBattleTriggerLeft:
	scall OaksLab_RivalBattleIntroScript
	checkevent EVENT_GOT_CHARMANDER_FROM_OAK
	iftrue .charmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_OAK
	iftrue .squirtle
	applymovement $6, Movement_RivalTakesTwoStepsLeftOneStepDown
	loadtrainer BLUE_RB, BLUE_RB_1C
	jump .startbattle
.squirtle
	applymovement $6, Movement_RivalTakesFourStepsLeftOneStepDown
	loadtrainer BLUE_RB, BLUE_RB_1B
	jump .startbattle
.charmander
	applymovement $6, Movement_RivalTakesThreeStepsLeftOneStepDown
	loadtrainer BLUE_RB, BLUE_RB_1A
.startbattle
	scall OaksLab_DoRivalBattle
	applymovement $6, Movement_RivalTakesOneStepRight
	spriteface $0, RIGHT
	jump OaksLab_RivalFinishesLeaving

OaksLab_RivalBattleTriggerRight:
	scall OaksLab_RivalBattleIntroScript
	checkevent EVENT_GOT_CHARMANDER_FROM_OAK
	iftrue .charmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_OAK
	iftrue .squirtle
	applymovement $6, Movement_RivalTakesOneStepLeftOneStepDown
	loadtrainer BLUE_RB, BLUE_RB_1C
	jump .startbattle
.squirtle
	applymovement $6, Movement_RivalTakesThreeStepsLeftOneStepDown
	loadtrainer BLUE_RB, BLUE_RB_1B
	jump .startbattle
.charmander
	applymovement $6, Movement_RivalTakesTwoStepsLeftOneStepDown
	loadtrainer BLUE_RB, BLUE_RB_1A
.startbattle
	scall OaksLab_DoRivalBattle
	applymovement $6, Movement_RivalTakesOneStepLeft
	spriteface $0, LEFT
	jump OaksLab_RivalFinishesLeaving
	
OaksLab_RivalBattleIntroScript:
	playmusic MUSIC_RIVAL_RB
	spriteface $6, DOWN
	spriteface $0, UP
	loadfont
	writetext _OaksLabRivalChallengeText
	waitbutton
	closetext
	end

OaksLab_DoRivalBattle:
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	winlosstext _OaksLabText_1d3be, _OaksLabText_1d3c3
	startbattle
	special DeleteSavedMusic
	reloadmapmusic
	reloadmap
	playmapmusic
	loadfont
	writetext _OaksLabRivalToughenUpText
	waitbutton
	closetext
	playmusic MUSIC_RIVAL_AFTER_RB
	end

OaksLab_RivalFinishesLeaving:
	applymovement $6, Movement_RivalTakesTwoStepsDown
	spriteface $0, DOWN
	applymovement $6, Movement_RivalTakesThreeStepsDown
	disappear $6
	special RestartMapMusic
	dotrigger $4
	end

OakScript_OaksLabRB:
	checkflag ENGINE_POKEDEX
	iftrue .RatePokedex
	checkevent EVENT_GOT_PARCEL
	iftrue .GivePokedex
	checkevent EVENT_RB_BEAT_RIVAL_IN_LAB
	iftrue .AfterRivalBattle
	checkevent EVENT_GOT_POKEMON_FROM_OAK
	iftrue .BeforeRivalBattle
	jumptextfaceplayer _OaksLabText_1d2f0
.BeforeRivalBattle
	jumptextfaceplayer _OaksLabText_1d2f5
.AfterRivalBattle
	jumptextfaceplayer _OaksLabText_1d2fa
.RatePokedex
	faceplayer
	loadfont
	checkevent EVENT_001_STD
	iftrue .AroundTheWorld
	writetext _OaksLabText_1d31d
	waitbutton
	special ProfOaksPCBoot
	closetext
	end

.AroundTheWorld
	writetext _OaksLabAroundWorldText
	waitbutton
	closetext
	end

.GivePokedex
	setevent EVENT_001_STD
	faceplayer
	loadfont
	writetext _OaksLabDeliverParcelText1
	playsound SFX_KEY_ITEM
	waitsfx
	buttonsound
	takeitem OAKS_PARCEL, 1
	writetext _OaksLabDeliverParcelText2
	waitbutton
	closetext
	playmusic MUSIC_RIVAL_RB
	loadfont
	writetext _OaksLabText21
	waitbutton
	closetext
	spriteface $2, DOWN
	checkcode VAR_FACING
	if_equal UP, .rivalwalksfivesteps
	if_equal DOWN, .rivalwalksthreesteps
	moveperson $6, 6, 7
	appear $6
	applymovement $6, Movement_RivalTakesFourStepsUp
	jump .continuewithdex
.rivalwalksthreesteps
	moveperson $6, 6, 6
	appear $6
	applymovement $6, Movement_RivalTakesThreeStepsUp
	jump .continuewithdex
.rivalwalksfivesteps
	moveperson $6, 6, 8
	appear $6
	applymovement $6, Movement_RivalTakesFiveStepsUp
.continuewithdex
	special RestartMapMusic
	loadfont
	writetext _OaksLabText22
	waitbutton
	closetext
	loadfont
	writetext _OaksLabText23
	buttonsound
	writetext _OaksLabText24
	buttonsound
	writetext _OaksLabText25
	disappear $a
	disappear $b
	setflag ENGINE_POKEDEX
	setevent EVENT_VIRIDIAN_CITY_RB_OLD_MAN_LYING_DOWN
	clearevent EVENT_VIRIDIAN_CITY_RB_OLD_MAN_WALKING_ABOUT
	domaptrigger GROUP_ROUTE_22_RB, MAP_ROUTE_22_RB, $1
	domaptrigger GROUP_VIRIDIAN_CITY_RB, MAP_VIRIDIAN_CITY_RB, $1
	playsound SFX_KEY_ITEM
	waitsfx
	writetext _OaksLabText26
	waitbutton
	closetext
	faceperson $0, $6
	faceperson $6, $0
	loadfont
	writetext _OaksLabText27
	waitbutton
	closetext
	spriteface $0, DOWN
	playmusic MUSIC_RIVAL_AFTER_RB
	checkcode VAR_FACING
	if_equal DOWN, .finishaboveoak
	spriteface $6, RIGHT
	if_equal UP, .finishbelowoak
	applymovement $6, Movement_RivalTakesFourStepsDown
	disappear $6
	special RestartMapMusic
	end

.finishaboveoak
	applymovement $6, Movement_RivalTakesThreeStepsDown
	disappear $6
	special RestartMapMusic
	end

.finishbelowoak
	applymovement $6, Movement_RivalTakesFiveStepsDown
	disappear $6
	special RestartMapMusic
	end

BlueScript_OaksLabRB:
	checkevent EVENT_GOT_POKEMON_FROM_OAK
	iftrue .MyMonIsTheBest
	checkevent EVENT_OAKS_LAB_OAK
	iffalse .HurryUpAndChoose
	jumptextfaceplayer _OaksLabGaryText1

.HurryUpAndChoose
	jumptextfaceplayer _OaksLabText40

.MyMonIsTheBest
	jumptextfaceplayer _OaksLabText41

OaksLabRB_WaitComeBack:
	spriteface $0, UP
	loadfont
	writetext _OaksLabLeavingText
	waitbutton
	closetext
	applymovement $0, Movement_RivalTakesOneStepUp
	end

BlankEncyclopoediaScript:
	jumptext _OaksLabText_1d32c

Scientist1Script_OaksLabRB:
Scientist2Script_OaksLabRB:
	jumptextfaceplayer _OaksLabText_1d405

LassScript_OaksLabRB:
	jumptextfaceplayer _OaksLabText_1d340

MapOaksLabRBSignpost11Script:
	jumpstd difficultbookshelf

MapOaksLabRBSignpost15Script:
	jumptext _OakLabEmailText

MapOaksLabRBSignpost12Script:
	jumptext _PushStartText

MapOaksLabRBSignpost13Script:
	jumptext _SaveOptionText

MapOaksLabRBSignpost14Script
	jumpstd trashcan

MovementData_OakWalksUp:
	step_up
	step_up
	step_up
Movement_RivalTakesFiveStepsUp:
	step_up
Movement_RivalTakesFourStepsUp:
	step_up
Movement_RivalTakesThreeStepsUp:
	step_up
Movement_RivalTakesTwoStepsUp:
	step_up
Movement_RivalTakesOneStepUp:
	step_up
	step_end

Movement_RivalTakesFourStepsLeft:
	step_left
Movement_RivalTakesThreeStepsLeft:
	step_left
Movement_RivalTakesTwoStepsLeft:
	step_left
Movement_RivalTakesOneStepLeft:
	step_left
	step_end

Movement_RivalTakesFourStepsLeftOneStepDown:
	step_left
Movement_RivalTakesThreeStepsLeftOneStepDown:
	step_left
Movement_RivalTakesTwoStepsLeftOneStepDown:
	step_left
Movement_RivalTakesOneStepLeftOneStepDown:
	step_left
	step_down
	step_end

Movement_RivalTakesFiveStepsDown:
	step_down
Movement_RivalTakesFourStepsDown:
	step_down
Movement_RivalTakesThreeStepsDown:
	step_down
Movement_RivalTakesTwoStepsDown:
	step_down
Movement_RivalTakesOneStepDown:
	step_down
	step_end
	
Movement_RivalTakesFourStepsRight:
	step_right
Movement_RivalTakesThreeStepsRight:
	step_right
Movement_RivalTakesTwoStepsRight:
	step_right
Movement_RivalTakesOneStepRight:
	step_right
	step_end

_OaksLabGaryText1:
	text "<GREEN>: Yo"
	line "<PLAYER>! Gramps"
	cont "isn't around!"
	done

_OaksLabText40:
	text "<GREEN>: Heh, I"
	line "don't need to be"
	cont "greedy like you!"

	para "Go ahead and"
	line "choose, <PLAYER>!"
	done

_OaksLabText41:
	text "<GREEN>: My"
	line "#MON looks a"
	cont "lot stronger."
	done

_OaksLabText39:
	text "Those are #"
	line "BALLs. They"
	cont "contain #MON!"
	done

_OaksLabCharmanderText:
	text "So! You want the"
	line "fire #MON,"
	cont "CHARMANDER?"
	done

_OaksLabSquirtleText:
	text "So! You want the"
	line "water #MON,"
	cont "SQUIRTLE?"
	done

_OaksLabBulbasaurText:
	text "So! You want the"
	line "plant #MON,"
	cont "BULBASAUR?"
	done

_OaksLabMonEnergeticText:
	text "This #MON is"
	line "really energetic!"
	done

_OaksLabReceivedMonText:
	text "<PLAYER> received"
	line "a @"
	text_from_ram StringBuffer3
	text "!"
	done

_OaksLabLastMonText:
	text "That's PROF.OAK's"
	line "last #MON!"
	done

_OaksLabText_1d2f0:
	text "OAK: Now, <PLAYER>,"
	line "which #MON do"
	cont "you want?"
	done

_OaksLabText_1d2f5:
	text "OAK: If a wild"
	line "#MON appears,"
	cont "your #MON can"
	cont "fight against it!"
	done

_OaksLabText_1d2fa:
	text "OAK: <PLAYER>,"
	line "raise your young"
	cont "#MON by making"
	cont "it fight!"
	done

_OaksLabDeliverParcelText1:
	text "OAK: Oh, <PLAYER>!"

	para "How is my old"
	line "#MON?"

	para "Well, it seems to"
	line "like you a lot."

	para "You must be"
	line "talented as a"
	cont "#MON trainer!"

	para "What? You have"
	line "something for me?"

	para "<PLAYER> delivered"
	line "OAK's PARCEL."
	done

_OaksLabDeliverParcelText2:
	text "Ah! This is the"
	line "custom # BALL"
	cont "I ordered!"
	cont "Thank you!"
	done

_OaksLabAroundWorldText:
	text "#MON around the"
	line "world wait for"
	cont "you, <PLAYER>!"
	done

_OaksLabGivePokeballsText1:
	text "OAK: You can't get"
	line "detailed data on"
	cont "#MON by just"
	cont "seeing them."

	para "You must catch"
	line "them! Use these"
	cont "to capture wild"
	cont "#MON."

	para "<PLAYER> got 5"
	line "# BALLs!"
	done

_OaksLabGivePokeballsText2:
	text "When a wild"
	line "#MON appears,"
	cont "it's fair game."

	para "Just throw a #"
	line "BALL at it and try"
	line "to catch it!"

	para "This won't always"
	line "work, though."

	para "A healthy #MON"
	line "could escape. You"
	cont "have to be lucky!"
	done

_OaksLabPleaseVisitText:
	text "OAK: Come see me"
	line "sometimes."

	para "I want to know how"
	line "your #DEX is"
	cont "coming along."
	done

_OaksLabText_1d31d:
	text "OAK: Good to see "
	line "you! How is your "
	cont "#DEX coming? "
	cont "Here, let me take"
	cont "a look!"
	done

_OaksLabText_1d32c:
	text "It's encyclopedia-"
	line "like, but the"
	cont "pages are blank!"
	done

_OaksLabText8:
	text "?"
	done

_OaksLabText_1d340:
	text "PROF.OAK is the"
	line "authority on"
	cont "#MON!"

	para "Many #MON"
	line "trainers hold him"
	cont "in high regard!"
	done

_OaksLabRivalWaitingText:
	text "<GREEN>: Gramps!"
	line "I'm fed up with"
	cont "waiting!"
	done

_OaksLabChooseMonText:
	text "OAK: <GREEN>?"
	line "Let me think..."

	para "Oh, that's right,"
	line "I told you to"
	cont "come! Just wait!"

	para "Here, <PLAYER>!"

	para "There are 3"
	line "#MON here!"

	para "Haha!"

	para "They are inside"
	line "the # BALLs."

	para "When I was young,"
	line "I was a serious"
	cont "#MON trainer!"

	para "In my old age, I"
	line "have only 3 left,"
	cont "but you can have"
	cont "one! Choose!"
	done

_OaksLabRivalInterjectionText:
	text "<GREEN>: Hey!"
	line "Gramps! What"
	cont "about me?"
	done

_OaksLabBePatientText:
	text "OAK: Be patient!"
	line "<GREEN>, you can"
	cont "have one too!"
	done

_OaksLabLeavingText:
	text "OAK: Hey! Don't go"
	line "away yet!"
	done

_OaksLabRivalPickingMonText:
	text "<GREEN>: I'll take"
	line "this one, then!"
	done

_OaksLabRivalReceivedMonText:
	text "<GREEN> received"
	line "a @"
	text_from_ram StringBuffer4
	text "!"
	done

_OaksLabRivalChallengeText:
	text "<GREEN>: Wait"
	line "<PLAYER>!"
	cont "Let's check out"
	cont "our #MON!"

	para "Come on, I'll take"
	line "you on!"
	done

_OaksLabText_1d3be:
	text "WHAT?"
	line "Unbelievable!"
	cont "I picked the"
	cont "wrong #MON!"
	done

_OaksLabText_1d3c3:
	text "<GREEN>: Yeah! Am"
	line "I great or what?"
	done

_OaksLabRivalToughenUpText:
	text "<GREEN>: Okay!"
	line "I'll make my"
	cont "#MON fight to"
	cont "toughen it up!"

	para "<PLAYER>! Gramps!"
	line "Smell you later!"
	done

_OaksLabText21:
	text "<GREEN>: Gramps!"
	done

_OaksLabText22:
	text "<GREEN>: What did"
	line "you call me for?"
	done

_OaksLabText23:
	text "OAK: Oh right! I"
	line "have a request"
	cont "of you two."
	done

_OaksLabText24:
	text "On the desk there"
	line "is my invention,"
	cont "#DEX!"

	para "It automatically"
	line "records data on"
	cont "#MON you've"
	cont "seen or caught!"

	para "It's a hi-tech"
	line "encyclopedia!"
	done

_OaksLabText25:
	text "OAK: <PLAYER> and"
	line "<GREEN>! Take"
	cont "these with you!"

	para "<PLAYER> got"
	line "#DEX from OAK!"
	done

_OaksLabText26:
	text "To make a complete"
	line "guide on all the"
	cont "#MON in the"
	cont "world..."

	para "That was my dream!"

	para "But, I'm too old!"
	line "I can't do it!"

	para "So, I want you two"
	line "to fulfill my"
	cont "dream for me!"

	para "Get moving, you"
	line "two!"

	para "This is a great"
	line "undertaking in"
	cont "#MON history!"
	done

_OaksLabText27:
	text "<GREEN>: Alright"
	line "Gramps! Leave it"
	cont "all to me!"

	para "<PLAYER>, I hate to"
	line "say it, but I"
	cont "don't need you!"

	para "I know! I'll"
	line "borrow a TOWN MAP"
	cont "from my sis!"

	para "I'll tell her not"
	line "to lend you one,"
	cont "<PLAYER>! Hahaha!"
	done

_OaksLabText_1d405:
	text "I study #MON as"
	line "PROF.OAK's AIDE."
	done

_OakLabEmailText:
	text "There's an e-mail"
	line "message here!"

	para "..."

	para "Calling all"
	line "#MON trainers!"

	para "The elite trainers"
	line "of #MON LEAGUE"
	cont "are ready to take"
	cont "on all comers!"

	para "Bring your best"
	line "#MON and see"
	cont "how you rate as a"
	cont "trainer!"

	para "#MON LEAGUE HQ"
	line "INDIGO PLATEAU"

	para "PS: PROF.OAK,"
	line "please visit us!"
	cont "..."
	done

_PushStartText:
	text "Push START to"
	line "open the MENU!"
	done

_SaveOptionText:
	text "The SAVE option is"
	line "on the MENU"
	cont "screen."
	done

OaksLabRB_MapEventHeader: ; 0x19ba33
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $b, $4, 3, GROUP_PALLET_TOWN_RB, MAP_PALLET_TOWN_RB
	warp_def $b, $5, 3, GROUP_PALLET_TOWN_RB, MAP_PALLET_TOWN_RB

	; xy triggers
	db 4
	xy_trigger 2, 6, 4, 0, OaksLabRB_WaitComeBack, 0, 0
	xy_trigger 2, 6, 5, 0, OaksLabRB_WaitComeBack, 0, 0
	xy_trigger 3, 6, 4, 0, OaksLab_RivalBattleTriggerLeft, 0, 0
	xy_trigger 3, 6, 5, 0, OaksLab_RivalBattleTriggerRight, 0, 0

	; signposts
	db 17
	signpost 1, 6, $0, MapOaksLabRBSignpost11Script
	signpost 1, 7, $0, MapOaksLabRBSignpost11Script
	signpost 1, 8, $0, MapOaksLabRBSignpost11Script
	signpost 1, 9, $0, MapOaksLabRBSignpost11Script
	signpost 7, 0, $0, MapOaksLabRBSignpost11Script
	signpost 7, 1, $0, MapOaksLabRBSignpost11Script
	signpost 7, 2, $0, MapOaksLabRBSignpost11Script
	signpost 7, 3, $0, MapOaksLabRBSignpost11Script
	signpost 7, 6, $0, MapOaksLabRBSignpost11Script
	signpost 7, 7, $0, MapOaksLabRBSignpost11Script
	signpost 7, 8, $0, MapOaksLabRBSignpost11Script
	signpost 7, 9, $0, MapOaksLabRBSignpost11Script
	signpost 0, 4, $0, MapOaksLabRBSignpost12Script
	signpost 0, 5, $0, MapOaksLabRBSignpost13Script
	signpost 3, 9, $0, MapOaksLabRBSignpost14Script
	signpost 1, 0, $0, MapOaksLabRBSignpost15Script
	signpost 1, 1, $0, MapOaksLabRBSignpost15Script

	; people-events
	db 10
	person_event SPRITE_OAK, 6, 9, $6, 0, 0, -1, -1, 0, 0, 0, OakScript_OaksLabRB, EVENT_OAKS_LAB_OAK
	person_event SPRITE_SCIENTIST, 12, 6, $5, 0, 1, -1, -1, 8 + PAL_OW_BLUE, 0, 0, Scientist1Script_OaksLabRB, -1
	person_event SPRITE_SCIENTIST, 13, 12, $4, 1, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, Scientist2Script_OaksLabRB, -1
	person_event SPRITE_TEACHER, 15, 5, $2, 1, 1, -1, -1, 8 + PAL_OW_BLUE, 0, 0, LassScript_OaksLabRB, -1
	person_event SPRITE_BLUE, 7, 8, $5, 0, 0, -1, -1, 0, 0, 0, BlueScript_OaksLabRB, EVENT_RB_RIVAL_IN_LAB
	person_event SPRITE_POKE_BALL, 7, 10, $0, 0, 0, -1, -1, 0, 0, 0, CharmanderPokeballScript, EVENT_SOMEONE_GOT_CHARMANDER_FROM_OAK
	person_event SPRITE_POKE_BALL, 7, 11, $0, 0, 0, -1, -1, 0, 0, 0, SquirtlePokeballScript, EVENT_SOMEONE_GOT_SQUIRTLE_FROM_OAK
	person_event SPRITE_POKE_BALL, 7, 12, $0, 0, 0, -1, -1, 0, 0, 0, BulbasaurPokeballScript, EVENT_SOMEONE_GOT_BULBASAUR_FROM_OAK
	person_event SPRITE_POKEDEX, 5, 6, $0, 0, 0, -1, -1, 0, 0, 0, BlankEncyclopoediaScript, EVENT_RB_DELIVERED_OAKS_PARCEL
	person_event SPRITE_POKEDEX, 5, 7, $0, 0, 0, -1, -1, 0, 0, 0, BlankEncyclopoediaScript, EVENT_RB_DELIVERED_OAKS_PARCEL
; 0x19bac7
