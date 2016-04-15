VermilionGym2_MapScriptHeader:

.Triggers
	db 3
	dw .Trigger0, 0
	dw .Trigger1, 0
	dw .Trigger2, 0

.Callbacks
	db 1
	dbw 5, .CheckTriggers

.CheckTriggers
	checkevent EVENT_SURGE_REMATCH
	iftrue .open_all_doors
	dotrigger $0
	return

.open_all_doors
	dotrigger $2
	changemap VermilionGym2Off_BlockData
	return

.Trigger0
	end
.Trigger1
	end
.Trigger2
	end

VermilionGymRematch_SwitchTrigger1:
	playsound SFX_PUSH_BUTTON
	waitsfx
	refreshscreen $0
	changemap VermilionGym2Red_BlockData
	closetext
	playsound SFX_WALL_OPEN
	waitsfx
	dotrigger $0
	end

VermilionGymRematch_SwitchTrigger0:
	playsound SFX_PUSH_BUTTON
	waitsfx
	refreshscreen $0
	changemap VermilionGym2Blue_BlockData
	closetext
	playsound SFX_WALL_OPEN
	waitsfx
	dotrigger $1
	end

SurgeRematchScript:
	faceplayer
	loadfont
	checkevent EVENT_BEAT_ELM
	iftrue .Postgame
	checkevent EVENT_SURGE_REMATCH
	iftrue .AfterRematch
	checkevent EVENT_MEW_ISLAND_SURGE_CHALLENGE
	iftrue .WasChallenged
	writetext SurgeRematchTextBefore
	jump .StartBattle
.WasChallenged:
	writetext SurgeRematchTextBeforeChallenge
.StartBattle:
	waitbutton
	closetext
	winlosstext SurgeRematchBeatenText, $0000
	loadtrainer LT_SURGE, 2
	startbattle
	returnafterbattle
	setevent EVENT_SURGE_REMATCH
	dotrigger $2
	changemap VermilionGym2Off_BlockData
	loadfont
.AfterRematch:
	checkevent EVENT_MEW_ISLAND_SURGE_CHALLENGE
	iftrue .WasChallenged2
	writetext SurgeAfterRematchText
	jump .StartBattle2
.WasChallenged2:
	writetext SurgeAfterRematchTextChallenge
.StartBattle2:
	waitbutton
	closetext
	end

.Postgame:
    writetext SurgePostgameRematchText
    yesorno
    iffalse .return
    closetext
    loadtrainer LT_SURGE, 2
    winlosstext SurgePostgameBeatenText, 0
    startbattle
    returnafterbattle
    loadfont
    writetext SurgePostgameAfterText
    waitbutton
.return
    closetext
    end

VermilionGymGuyRematchScript: ; 0x19211b
	faceplayer
	loadfont
	checkevent EVENT_SURGE_REMATCH
	iftrue .Won
	writetext VermilionGymGuyRematchText
	waitbutton
	closetext
	end

.Won
	writetext VermilionGymGuyWonRematchText
	waitbutton
	closetext
	end
; 0x19212f

MapVermilionGymRematchStatuesScript:
	trainertotext LT_SURGE, 1, $1
	jumpstd gymstatue2
; 0x192142

SurgeRematchTextBefore:
	text "What's up?"
	line "I'm doing great!"

	para "Hey, you!"
	line "Battle me again!"
	cont "What do you say?"
	done

SurgeRematchTextBeforeChallenge:
	text "What's up?"
	line "I'm doing great!"

	para "You want to go"
	line "chasing MEW?"

	para "That's no place for"
	line "kids to just go"
	cont "wandering around!"

	para "Tell ya what, you"
	line "prove youself on"
	cont "the battlefield,"

	para "and I'll give the"
	line "all-clear."

	para "Ten-hut!"
	done


SurgeRematchBeatenText:
	text "Arrrgh!"
	line "You are strong!"
	done

SurgeAfterRematchText:
	text "You are very"
	line "strong!"

	para "I'll have to go"
	line "back to camp and"
	para "brush up on my"
	line "training."

	done

SurgeAfterRematchTextChallenge:
	text "You are very"
	line "strong!"

	para "You should be able"
	line "to handle GUYANA"
	cont "no problem!"

	done

SurgePostgameRematchText:
	text "Hey, kid!"

	para "You still out"
	line "training, yeah?"

	para "Wanna go again?"
	done

SurgePostgameBeatenText:
	text "Woah, shocking!"
	done

SurgePostgameAfterText:
	text "You are one"
	line "tough tyke!"

	para "I have no choice"
	line "but to admit my"
	cont "defeat<...> again."

	para "I should have you"
	line "come to training"

	para "camp to train my"
	line "crew!"
	done

VermilionGymGuyRematchText:
	text "Yo, champ!"

	para "LT.SURGE has amped"
	line "up his game!"

	para "You may want to"
	line "take a moment to"

	para "look around be-"
	line "fore you charge"
	cont "in!"
	done

VermilionGymGuyWonRematchText:
	text "Impressive!"

	para "LT.SURGE is gonna"
	line "need to recharge"
	cont "after that battle!"
	done

VermilionGym2_MapEventHeader:
	db 0, 0
; warps
	db 2
	warp_def 27, 9, 7, GROUP_VERMILION_CITY, MAP_VERMILION_CITY
	warp_def 27, 10, 7, GROUP_VERMILION_CITY, MAP_VERMILION_CITY

; xy triggers
	db 11
	xy_trigger 0, 21,  0, $0, VermilionGymRematch_SwitchTrigger0, $0, $0
	xy_trigger 0, 17,  1, $0, VermilionGymRematch_SwitchTrigger0, $0, $0
	xy_trigger 0, 25, 16, $0, VermilionGymRematch_SwitchTrigger0, $0, $0
	xy_trigger 0, 13, 18, $0, VermilionGymRematch_SwitchTrigger0, $0, $0
	xy_trigger 0,  5,  9, $0, VermilionGymRematch_SwitchTrigger0, $0, $0
	xy_trigger 1, 25,  0, $0, VermilionGymRematch_SwitchTrigger1, $0, $0
	xy_trigger 1, 21,  2, $0, VermilionGymRematch_SwitchTrigger1, $0, $0
	xy_trigger 1, 17, 13, $0, VermilionGymRematch_SwitchTrigger1, $0, $0
	xy_trigger 1, 21, 18, $0, VermilionGymRematch_SwitchTrigger1, $0, $0
	xy_trigger 1,  9,  9, $0, VermilionGymRematch_SwitchTrigger1, $0, $0
	xy_trigger 1,  5, 17, $0, VermilionGymRematch_SwitchTrigger1, $0, $0

; signposts
	db 2
	signpost 25,  8, $0, MapVermilionGymRematchStatuesScript
	signpost 25, 11, $0, MapVermilionGymRematchStatuesScript

; people events
	db 7
	person_event SPRITE_SURGE, 5, 17, $6, 0, 0, -1, -1, 0, 0, 0, SurgeRematchScript, -1
	person_event SPRITE_GENTLEMAN, 8, 8, $6, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, -1
	person_event SPRITE_ROCKER, 30, 5, $7, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, -1
	person_event SPRITE_FISHER, 29, 23, $8, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, -1
	person_event SPRITE_SUPER_NERD, 21, 14, $a, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, -1
	person_event SPRITE_COOLTRAINER_M, 8, 24, $6, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, -1
	person_event SPRITE_GYM_GUY, 29, 14, $6, 0, 0, -1, -1, 0, 0, 0, VermilionGymGuyRematchScript, -1
