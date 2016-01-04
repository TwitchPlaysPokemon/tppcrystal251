OaksLabRB_MapScriptHeader: ; 0x19b3c5
	; trigger count
	db 3
	dw .Trigger1, $0000
	dw .Trigger2, $0000
	dw .Trigger3, $0000

	; callback count
	db 1
	dbw 1, .SetSprites
; 0x19b3c7
.Trigger1:
	priorityjump WalkUpWithOak
	end

.Trigger2:
	end

.Trigger3:
	end

.SetSprites:
	checkevent EVENT_GOT_POKEMON_FROM_OAK
	iftrue .skip
	moveperson $2, $8 $e
.skip
	return

WalkUpWithOak:
	follow $0, $2
	applymovement $2, MovementData_OakWalksUp
	stopfollow
	faceperson $2, $0
	faceperson $6, $2
	loadfont
	writetext BlueText_FedUpWithWaiting
	waitbutton
	closetext
	loadfont
	writetext OakText_MissionStatement
	waitbutton
	closetext
	loadfont
	writetext BlueText_WhatAboutMe
	waitbutton
	closetext
	loadfont
	writetext OakText_BePatient
	waitbutton
	closetext
	dotrigger $1
	end

CharmanderPokeballScript:
	checkevent EVENT_GOT_POKEMON_FROM_OAK
	iftrue OaksLab_LookAtPokeballScript
	refreshscreen $0
	pokepic CHARMANDER
	cry CHARMANDER
	waitbutton
	closepokepic
	loadfont
	writetext TakeCharmanderText
	yesorno
	iffalse DidntChooseStarterScript
	disappear $7
	setevent EVENT_GOT_CHARMANDER_FROM_OAK
	setevent EVENT_GOT_POKEMON_FROM_OAK
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem CHARMANDER, $0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CHARMANDER, 5, BERRY
	closetext
	applymovement $6, Movement_RivalTakesTwoStepsDown
	applymovement $6, Movement_RivalTakesFourStepsRight
	applymovement $6, Movement_RivalTakesOneStepUp
	loadfont
	writetext BlueText_ThisOneIsMine
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	disappear $8
	closetext
	end

BulbasaurPokeballScript:
	checkevent EVENT_GOT_POKEMON_FROM_OAK
	iftrue OaksLab_LookAtPokeballScript
	refreshscreen $0
	pokepic BULBASAUR
	cry BULBASAUR
	waitbutton
	closepokepic
	loadfont
	writetext TakeBulbasaurText
	yesorno
	iffalse DidntChooseStarterScript
	disappear $9
	setevent EVENT_GOT_BULBASAUR_FROM_OAK
	setevent EVENT_GOT_POKEMON_FROM_OAK
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem BULBASAUR, $0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke BULBASAUR, 5, BERRY
	closetext
	applymovement $6, Movement_RivalTakesTwoStepsDown
	applymovement $6, Movement_RivalTakesThreeStepsRight
	applymovement $6, Movement_RivalTakesOneStepUp
	loadfont
	writetext BlueText_ThisOneIsMine
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	disappear $7
	closetext
	end

SquirtlePokeballScript:
	checkevent EVENT_GOT_POKEMON_FROM_OAK
	iftrue OaksLab_LookAtPokeballScript
	refreshscreen $0
	pokepic SQUIRTLE
	cry SQUIRTLE
	waitbutton
	closepokepic
	loadfont
	writetext TakeSquirtleText
	yesorno
	iffalse DidntChooseStarterScript
	disappear $8
	setevent EVENT_GOT_SQUIRTLE_FROM_OAK
	setevent EVENT_GOT_POKEMON_FROM_OAK
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem SQUIRTLE, $0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke SQUIRTLE, 5, BERRY
	closetext
	applymovement $6, Movement_RivalTakesTwoStepsDown
	applymovement $6, Movement_RivalTakesFiveStepsRight
	applymovement $6, Movement_RivalTakesOneStepUp
	loadfont
	writetext BlueText_ThisOneIsMine
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	disappear $9
	closetext
	end

DidntChooseStarterScript:
	writetext OakText_ThinkCarefully
	waitbutton
	closetext
	end

OaksLab_LookAtPokeballScript:
	jumptext OaksLastPkmnText

OaksLab_LookAtPokedexScript:
	jumptext OaksLabPokedexText

OaksLab_CallPlayerBackUp:
	spriteface $0, UP
	loadfont
	writetext OakText_WhereAreYouGoing
	waitbutton
	closetext
	applymovement $0, MovementData_RivalTakesOneStepUp
	end

OaksLab_RivalBattleTriggerLeft:
	scall OaksLab_RivalBattleIntroScript
	checkevent EVENT_GOT_CHARMANDER_FROM_OAK
	iftrue .charmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_OAK
	iftrue .squirtle
	applymovement $6, Movement_RivalTakesFourStepsLeftOneStepDown
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
	applymovement $6, Movement_RivalTakesOneStepRight
	spriteface $0, RIGHT
	jump OaksLab_RivalFinishesLeaving

OaksLab_RivalBattleTriggerRight:
	scall OaksLab_RivalBattleIntroScript
	checkevent EVENT_GOT_CHARMANDER_FROM_OAK
	iftrue .charmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_OAK
	iftrue .squirtle
	applymovement $6, Movement_RivalTakesThreeStepsLeftOneStepDown
	loadtrainer BLUE_RB, BLUE_RB_1C
	jump .startbattle
.squirtle
	applymovement $6, Movement_RivalTakesTwoStepsLeftOneStepDown
	loadtrainer BLUE_RB, BLUE_RB_1B
	jump .startbattle
.charmander
	applymovement $6, Movement_RivalTakesOneStepsLeftOneStepDown
	loadtrainer BLUE_RB, BLUE_RB_1A
.startbattle
	scall OaksLab_DoRivalBattle
	applymovement $6, Movement_RivalTakesOneStepLeft
	spriteface $0, RIGHT
	jump OaksLab_RivalFinishesLeaving
	
OaksLab_RivalBattleIntroScript:
	checkevent EVENT_GOT_POKEMON_FROM_OAK
	iffalse OaksLab_CallPlayerBackUp
	playmusic MUSIC_RIVAL_RB
	spriteface $6, DOWN
	spriteface $0, UP
	loadfont
	writetext BlueText_IllTakeYouOn
	waitbutton
	closetext
	end

OaksLab_DoRivalBattle:
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	winlosstext BlueText_WonFirstFight, BlueText_LostFirstFight
	startbattle
	reloadmapmusic
	reloadmap
	special DeleteSavedMusic
	special RestartMapMusic
	loadfont
	writetext BlueText_BattleToToughen
	waitbutton
	closetext
	end

OaksLab_RivalFinishesLeaving:
	applymovement $6, Movement_RivalTakesTwoStepsDown
	spriteface $0, DOWN
	applymovement $6, Momement_RivalTakesThreeStepsDown
	disappear $6
	special RestartMapMusic
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
	jumptextfaceplayer OakText_GoAheadAndChoose
.BeforeRivalBattle
	jumptextfaceplayer OakText_HappyWithMon
.AfterRivalBattle
	jumptextfaceplayer OakText_BattleALot
.RatePokedex
	checkevent EVENT_001_STD
	iffalse .AfterRivalBattle
	faceplayer
	loadfont
	writetext OakText_StartDexRating
	waitbutton
	special ProfOaksPCBoot
	closetext
	end

.GivePokedex
	faceplayer
	loadfont
	writetext OakText_IsThatForMe
	buttonsound
	writetext GaveParcelToOakText
	playsound SFX_KEY_ITEM
	waitsfx
	buttonsound
	writetext OakText_CustomPokeball
	waitbutton
	closetext
	playmusic MUSIC_RIVAL_RB
	loadfont
	writetext BlueText_YouRang
	waitbutton
	closetext
	appear $6
	checkcode VAR_FACING
	if_equal UP, .rivalwalksfivesteps
	if_equal DOWN, .rivalwalksthreesteps
	applymovement $6, Movement_RivalTakesFourStepsUp
	jump .continuewithdex
.rivalwalksthreesteps
	applymovement $6, Movement_RivalTakesThreeStepsUp
	jump .continuewithdex
.rivalwalksfivesteps
	applymovement $6, Movement_RivalTakesFiveStepsUp
.continuewithdex
	special RestartMapMusic
	loadfont
	writetext OakText_HereHaveThisPokedex
	buttonsound
	disappear $a
	disappear $b
	setflag ENGINE_POKEDEX
	writetext OakText_GotPokedex
	playsound SFX_KEY_ITEM
	waitsfx
	writetext OakText_MyDream
	waitbutton
	closetext
	loadfont
	checkcode VAR_FACING
	if_equal DOWN, .finishaboveoak
	spriteface $6, RIGHT
	if_equal UP, .finishbelowoak
	writetext BlueText_GetTownMap
	waitbutton
	closetext
	playmusic MUSIC_RIVAL_AFTER_RB
	applymovement $6, Movement_RivalTakesFourStepsDown
	disappear $6
	special RestartMapMusic
	end

.finishaboveoak
	writetext BlueText_GetTownMap
	waitbutton
	closetext
	playmusic MUSIC_RIVAL_AFTER_RB
	applymovement $6, Movement_RivalTakesThreeStepsDown
	disappear $6
	special RestartMapMusic
	end

.finishbelowoak
	writetext BlueText_GetTownMap
	waitbutton
	closetext
	playmusic MUSIC_RIVAL_AFTER_RB
	applymovement $6, Movement_RivalTakesFiveStepsDown
	disappear $6
	special RestartMapMusic
	end

BlueScript_OaksLabRB:
	checkevent EVENT_GOT_POKEMON_FROM_OAK
	iftrue .MyMonIsTheBest
	checkevent EVENT_PALLET_TOWN_RB_OAK
	iftrue .HurryUpAndChoose
	jumptextfaceplayer BlueText_GrampsIsntHere

.HurryUpAndChoose
	jumptextfaceplayer BlueText_HurryUpAndChoose

.MyMonIsTheBest
	jumptextfaceplayer BlueText_MyMonIsTheBest

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
	
Movement_RivalTakesFiveStepsRight:
	step_right
Movement_RivalTakesFourStepsRight:
	step_right
Movement_RivalTakesThreeStepsRight:
	step_right
	step_right
Movement_RivalStepsRightToLeave:
	step_right
	step_end

OakText_StartDexRating:
	text "How is your #-"
	line "DEX coming?"

	para "Let's see…"
	done
OaksLabRB_MapEventHeader: ; 0x19ba33
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $b, $4, 3, GROUP_PALLET_TOWN_RB, MAP_PALLET_TOWN_RB
	warp_def $b, $5, 3, GROUP_PALLET_TOWN_RB, MAP_PALLET_TOWN_RB

	; xy triggers
	db 0

	; signposts
	db 16
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

	; people-events
	db 10
	person_event SPRITE_OAK, 6, 8, $6, 0, 0, -1, -1, 0, 0, 0, OakScript_OaksLabRB, -1
	person_event SPRITE_SCIENTIST, 12, 5, $5, 0, 1, -1, -1, 8 + PAL_OW_BLUE, 0, 0, Scientist1Script_OaksLabRB, -1
	person_event SPRITE_SCIENTIST, 13, 12, $4, 1, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, Scientist2Script_OaksLabRB, -1
	person_event SPRITE_SCIENTIST, 8, 5, $2, 1, 1, -1, -1, 8 + PAL_OW_BLUE, 0, 0, Scientist3Script_OaksLabRB, -1
	person_event SPRITE_BLUE, 7, 7, $5, 0, 0, -1, -1, 0, 0, 0, BlueScript_OaksLabRB, EVENT_RB_RIVAL_IN_LAB
	person_event SPRITE_POKEBALL, 7, 10, $0, 0, 0, -1, -1, 0, 0, 0, CharmanderPokeballScript, EVENT_SOMEONE_GOT_CHARMANDER_FROM_OAK
	person_event SPRITE_POKEBALL, 7, 11, $0, 0, 0, -1, -1, 0, 0, 0, SquirtlePokeballScript, EVENT_SOMEONE_GOT_SQUIRTLE_FROM_OAK
	person_event SPRITE_POKEBALL, 7, 12, $0, 0, 0, -1, -1, 0, 0, 0, BulbasaurPokeballScript, EVENT_SOMEONE_GOT_BULBASAUR_FROM_OAK
	person_event SPRITE_POKEDEX, 7, 12, $0, 0, 0, -1, -1, 0, 0, 0, BlankEncyclopoediaScript, EVENT_RB_DELIVERED_OAKS_PARCEL
	person_event SPRITE_POKEDEX, 7, 12, $0, 0, 0, -1, -1, 0, 0, 0, BlankEncyclopoediaScript, EVENT_RB_DELIVERED_OAKS_PARCEL
; 0x19bac7



