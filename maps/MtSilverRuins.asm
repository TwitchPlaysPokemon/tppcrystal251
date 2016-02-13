MtSilverRuins_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 0

; <scripts go here>

MtSilverRuinsElmScript:
	waitsfx
	playmusic MUSIC_NONE
	faceplayer
	loadfont
	writetext Text_MtSilverRuinsBird
	cry 252
	waitbutton
	closetext
	playsound SFX_RUN
	checkcode VAR_FACING
	if_equal LEFT, .PlayerToRightLookingLeft
	spriteface $0, UP
	applymovement $3, Movement_UnknownBirdFliesAway
	disappear $3
	waitsfx
	moveperson $2, 20, 9
	appear $2
	applymovement $2, Movement_ElmWalksUpToPlayerOnLeft
	spriteface $0, DOWN
	jump .TehUrn
.PlayerToRightLookingLeft
	spriteface $0, UP
	applymovement $3, Movement_UnknownBirdFliesAway
	disappear $3
	waitsfx
	moveperson $2, 22, 9
	appear $2
	applymovement $2, Movement_ElmWalksUpToPlayerOnRight
	spriteface $0, DOWN
.TehUrn
	loadfont
	writetext ElmText_MtSilverRuinsFinalBattleIntro
	waitbutton
	closetext
	loadtrainer PROF_ELM, 1
	winlosstext ElmWinText_MtSilverRuins, ElmLossText_MtSilverRuins
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmapmusic
	reloadmap
	setevent EVENT_BEAT_ELM
	loadfont
	writetext ElmText_MtSilverRuinsFinalBattleAfter_Part1
	buttonsound
	waitsfx
	playmusic MUSIC_HALL_OF_FAME
	writetext ElmText_MtSilverRuinsFinalBattleAfter_Part2
	waitbutton
	closetext
	special Special_FadeToBlack
	special Functiond91
	special Functionc48f
	pause 30
	special HealParty
	refreshscreen $0
	credits
	end

Movement_ElmWalksUpToPlayerOnLeft:
Movement_ElmWalksUpToPlayerOnRight:
Movement_UnknownBirdFliesAway:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

; <text goes here>
Text_MtSilverRuinsBird:
	text "Gyaaa!"
	done

ElmText_MtSilverRuinsFinalBattleIntro:
	text "Ah, <PLAYER>! I"
	line "didn't expect to"
	cont "see you here!"

	para "That bird that"
	line "just flew off<...>"

	para "Could that have"
	line "been a #MON?!"

	para "It seems there are"
	line "new things to dis-"
	cont "cover every day."

	para "Oh, that's right."

	para "<PLAYER>, I wanted"
	line "to ask you some-"
	cont "thing."

	para "It would be better"
	line "if we were in my"
	cont "LAB<...>"

	para "But this is a good"
	line "place for it too,"
	cont "I guess."

	para "You've caught every"
	line "#MON out there,"

	para "and defeated the"
	line "greatest trainers."

	para "That's why I want"
	line "to challenge you,"
	cont "<PLAY_G>."

	para "To help me see"
	line "just how far away"
	cont "I really am."
	done

ElmWinText_MtSilverRuins:
	text "Well done!"

	para "In all my life I"
	line "have never seen"

	para "such an intense"
	line "battle, let alone"

	para "participated in"
	line "one."

	para "I have nothing"
	line "more to say."

	para "You <PLAY_G>, are a"
	line "#MON MASTER!"
	done

ElmLossText_MtSilverRuins:
	text "Ah!"

	para "It would seem my"
	line "skills haven't"
	cont "grown rusty."

	para "Still, that was"
	line "exhilarating."

	para "I haven't had such"
	line "a good fight in a"
	cont "long time."

	para "I have nothing"
	line "more to say."

	para "You <PLAY_G>, are a"
	line "#MON MASTER!"
	done

ElmText_MtSilverRuinsFinalBattleAfter_Part1:
	text "<...>Whew."

	para "<PLAYER>, you've"
	line "certainly been"
	cont "through a lot."

	para "When I first met"
	line "you in NEW BARK,"

	para "I had no idea you"
	line "were on a quest to"

	para "catch every #-"
	line "MON in the region"

	para "and become the"
	line "very best, like no"
	cont "one ever was."

	para "To catch them was"
	line "your real quest,"
	cont "yes<...>"

	para "But to train them<...>"
	line "That was your"

	para "cause all along,"
	line "wasn't it?"
	done
ElmText_MtSilverRuinsFinalBattleAfter_Part2:
	text "You traveled a-"
	line "cross the land,"

	para "searching far and"
	line "wide."

	para "And now, having"
	line "battled with you,"

	para "I see the power"
	line "that's inside."

	para "<PLAYER>!"

	para "Truly, honestly,"
	line "congratulations!"
	done

MtSilverRuins_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 16
	warp_def 47, 27, 2, GROUP_SILVER_CAVE_ROOM_3, MAP_SILVER_CAVE_ROOM_3
	warp_def 47, 28, 3, GROUP_SILVER_CAVE_ROOM_3, MAP_SILVER_CAVE_ROOM_3
	warp_def 43, 27, 1, GROUP_MT_SILVER_RUINS_B1, MAP_MT_SILVER_RUINS_B1
	warp_def 43, 28, 2, GROUP_MT_SILVER_RUINS_B1, MAP_MT_SILVER_RUINS_B1
	warp_def 44, 18, 3, GROUP_MT_SILVER_RUINS_B1, MAP_MT_SILVER_RUINS_B1
	warp_def 36, 16, 4, GROUP_MT_SILVER_RUINS_B1, MAP_MT_SILVER_RUINS_B1
	warp_def 32, 4, 5, GROUP_MT_SILVER_RUINS_B1, MAP_MT_SILVER_RUINS_B1
	warp_def 26, 4, 6, GROUP_MT_SILVER_RUINS_B1, MAP_MT_SILVER_RUINS_B1
	warp_def 24, 16, 7, GROUP_MT_SILVER_RUINS_B1, MAP_MT_SILVER_RUINS_B1
	warp_def 32, 20, 8, GROUP_MT_SILVER_RUINS_B1, MAP_MT_SILVER_RUINS_B1
	warp_def 26, 22, 9, GROUP_MT_SILVER_RUINS_B1, MAP_MT_SILVER_RUINS_B1
	warp_def 28, 28, 10, GROUP_MT_SILVER_RUINS_B1, MAP_MT_SILVER_RUINS_B1
	warp_def 16, 28, 11, GROUP_MT_SILVER_RUINS_B1, MAP_MT_SILVER_RUINS_B1
	warp_def 4, 4, 12, GROUP_MT_SILVER_RUINS_B1, MAP_MT_SILVER_RUINS_B1
	warp_def 1, 3, 13, GROUP_MT_SILVER_RUINS_B1, MAP_MT_SILVER_RUINS_B1 
	warp_def 1, 4, 14, GROUP_MT_SILVER_RUINS_B1, MAP_MT_SILVER_RUINS_B1
	; coord events 
	db 0

	; bg events
	db 0

	; object events
	db 2
	person_event SPRITE_ELM, 14, 24, $7, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_ELM_IN_SILVER_CAVE_RUINS
	person_event SPRITE_BIRD, 8, 25, $3, 0, 0, -1, -1, 8 + PAL_OW_SILVER, 0, 0, MtSilverRuinsElmScript, EVENT_BIRD_IN_SILVER_CAVE_RUINS
