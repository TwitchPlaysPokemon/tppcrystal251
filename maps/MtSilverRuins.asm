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
	playsound SFX_THUNDER
	earthquake 10
	refreshscreen 0
	special Function8c084
	;change tiles to missingno
	changeblock 16, 0, $6d
	changeblock 18, 0, $6d
	changeblock 20, 0, $6d
	changeblock 22, 0, $6d
	changeblock 24, 0, $6d
	changeblock 26, 0, $6d
	changeblock 16, 2, $6d
	changeblock 18, 2, $6d
	changeblock 20, 2, $6d
	changeblock 22, 2, $6d
	changeblock 24, 2, $6d
	changeblock 26, 2, $6d
	changeblock 16, 4, $6d
	changeblock 18, 4, $6d
	changeblock 20, 4, $6d
	changeblock 22, 4, $6d
	changeblock 24, 4, $6d
	changeblock 26, 4, $6d
	changeblock 16, 6, $6d
	changeblock 18, 6, $6d
	changeblock 20, 6, $6d
	changeblock 22, 6, $6d
	changeblock 24, 6, $6d
	changeblock 26, 6, $6d
	changeblock 16, 8, $6d
	changeblock 18, 8, $6d
	changeblock 20, 8, $6d
	changeblock 22, 8, $6d
	changeblock 24, 8, $6d
	changeblock 26, 8, $6d
	changeblock 16, 10, $6d
	changeblock 18, 10, $6d
	changeblock 20, 10, $6d
	changeblock 22, 10, $6d
	changeblock 24, 10, $6d
	changeblock 26, 10, $6d
	reloadmappart
	closetext
	special Function8c079
	;look around
	pause 15
	checkcode VAR_FACING
	if_equal RIGHT, .LookAroundRight
	spriteface $0, UP
	pause 15	
	spriteface $0, DOWN
	pause 15	
	spriteface $0, RIGHT
	pause 30	
	spriteface $0, LEFT
	jump .ContinueEffects	
.LookAroundRight
	spriteface $0, UP
	pause 15	
	spriteface $0, DOWN
	pause 15	
	spriteface $0, LEFT
	pause 30	
	spriteface $0, RIGHT
.ContinueEffects
	pause 15
	faceplayer
	loadfont
	writetext Text_MtSilverRuinsBird
	cry 252
	waitbutton
	closetext
	playsound SFX_FLY
	checkcode VAR_FACING
	if_equal RIGHT, .ChangeBlocksFacingRight
	spriteface $0, DOWN
	applymovement $3, Movement_BirdToCenter
	playsound SFX_THUNDER
	earthquake 10
	refreshscreen 0
	special Function8c084
	changeblock 14, 0, $72
	changeblock 16, 0, $72
	changeblock 18, 0, $72
	changeblock 20, 0, $72
	changeblock 22, 0, $72
	changeblock 24, 0, $72
	changeblock 26, 0, $72
	changeblock 14, 2, $72
	changeblock 16, 2, $72
	changeblock 18, 2, $72
	changeblock 20, 2, $72
	changeblock 22, 2, $72
	changeblock 24, 2, $72
	changeblock 26, 2, $72
	changeblock 14, 4, $72
	changeblock 16, 4, $72
	changeblock 18, 4, $72
	changeblock 20, 4, $72
	changeblock 22, 4, $72
	changeblock 24, 4, $72
	changeblock 26, 4, $72
	changeblock 14, 6, $72
	changeblock 16, 6, $72
	changeblock 18, 6, $72
	changeblock 20, 6, $72
	changeblock 22, 6, $72
	changeblock 24, 6, $72
	changeblock 26, 6, $72
	changeblock 14, 8, $72
	changeblock 16, 8, $72
	changeblock 18, 8, $72
	changeblock 20, 8, $72
	changeblock 22, 8, $72
	changeblock 24, 8, $72
	changeblock 26, 8, $72
	changeblock 14, 10, $72
	changeblock 16, 10, $72
	changeblock 18, 10, $72
	changeblock 20, 10, $72
	changeblock 22, 10, $72
	changeblock 24, 10, $72
	changeblock 26, 10, $72
	reloadmappart
	closetext
	special Function8c079
	pause 30
	spriteface $0, UP
	pause 20	
	spriteface $0, DOWN
	pause 20
	applymovement $0, Movement_WalkLeftToCenter
	jump .ShowArena
.ChangeBlocksFacingRight
	spriteface $0, DOWN
	applymovement $3, Movement_BirdToCenter
	playsound SFX_THUNDER
	earthquake 10
	refreshscreen 0
	special Function8c084
	changeblock 14, 0, $72
	changeblock 16, 0, $72
	changeblock 18, 0, $72
	changeblock 20, 0, $72
	changeblock 22, 0, $72
	changeblock 24, 0, $72
	changeblock 26, 0, $72
	changeblock 14, 2, $72
	changeblock 16, 2, $72
	changeblock 18, 2, $72
	changeblock 20, 2, $72
	changeblock 22, 2, $72
	changeblock 24, 2, $72
	changeblock 26, 2, $72
	changeblock 14, 4, $72
	changeblock 16, 4, $72
	changeblock 18, 4, $72
	changeblock 20, 4, $72
	changeblock 22, 4, $72
	changeblock 24, 4, $72
	changeblock 26, 4, $72
	changeblock 14, 6, $72
	changeblock 16, 6, $72
	changeblock 18, 6, $72
	changeblock 20, 6, $72
	changeblock 22, 6, $72
	changeblock 24, 6, $72
	changeblock 26, 6, $72
	changeblock 14, 8, $72
	changeblock 16, 8, $72
	changeblock 18, 8, $72
	changeblock 20, 8, $72
	changeblock 22, 8, $72
	changeblock 24, 8, $72
	changeblock 26, 8, $72
	changeblock 14, 10, $72
	changeblock 16, 10, $72
	changeblock 18, 10, $72
	changeblock 20, 10, $72
	changeblock 22, 10, $72
	changeblock 24, 10, $72
	changeblock 26, 10, $72
	reloadmappart
	closetext
	special Function8c079
	pause 30
	spriteface $0, UP
	pause 20	
	spriteface $0, DOWN
	pause 50
	applymovement $0, Movement_WalkToCenter
;at this point, we are at the same point regardless of initial location
.ShowArena	
	spriteface $0, RIGHT
	pause 10
;ball
	playsound SFX_FLASH
	special Function8c084
	refreshscreen 0
	changeblock 20, 6, $73
	changeblock 22, 6, $74
	changeblock 20, 8, $75
	changeblock 22, 8, $76
	reloadmappart
	special Function8c079
	applymovement $0, MovementSurprisedPlayer
	loadfont
	writetext ElmText_ShoutPlayerName
	waitbutton
	closetext
	spriteface $0, DOWN
	spriteface $3, DOWN
	showemote $0, $3, 10
	;good job elm, screwing up things
	;reset map change center blocks
	playsound SFX_FLASH
	special Function8c084
	changemap MtSilverRuins_BlockData
	changeblock 20, 6, $6e
	changeblock 22, 6, $6f
	changeblock 20, 8, $70
	changeblock 22, 8, $71
	reloadmappart
	closetext
	special Function8c079
	playsound SFX_RUN
	spriteface $0, UP
	applymovement $3, Movement_UnknownBirdFliesAway
	disappear $3
	waitsfx
	appear $2
	applymovement $2, Movement_ElmWalksUpToPlayer
	loadfont
	writetext ElmText_SawBird
	waitbutton
	closetext
	spriteface $0, RIGHT
	spriteface $2, LEFT
	loadfont
	writetext ElmText_MtSilverRuinsFinalBattleIntro
	waitbutton
	closetext
	pause 10
	spriteface $2, UP
	pause 30 
	showemote $0, $2, 10
	spriteface $2, LEFT
	loadfont
	writetext ElmContinueText_MtSilverRuins
	waitbutton
	closetext
	checkevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	iftrue .LoadMeganiumTeam
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .LoadTyphlosionTeam
	loadtrainer PROF_ELM, 3
	jump .StartBattle
.LoadTyphlosionTeam
	loadtrainer PROF_ELM, 2
	jump .StartBattle
.LoadMeganiumTeam
	loadtrainer PROF_ELM, 1
.StartBattle
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
	pause 30
	special HealParty
	refreshscreen $0
	credits
	end

Movement_ElmWalksUpToPlayer:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

Movement_UnknownBirdFliesAway:
	step_up
	step_up
	step_up
	step_up
	step_end
	
Movement_BirdToCenter:
	fast_jump_step_down
	jump_step_down
	jump_step_right
	step_up
	step_left
	step_end

Movement_WalkLeftToCenter:
	step_left
	step_left
Movement_WalkToCenter:
	step_down
	step_sleep 10
	step_down
	step_sleep 15
	slow_step_down
	half_step_right
	step_end

MovementSurprisedPlayer:
	big_step_left
	turn_head_right
	step_sleep 40
	slow_step_right
	step_end
	
	
; <text goes here>
Text_MtSilverRuinsBird:
	text "Gyaaa!"
	done
	
ElmText_ShoutPlayerName:
	text "<PLAYER>!"
	done

ElmText_SawBird:
	text "That bird that"
	line "just flew off<...>"

	para "Could that have"
	line "been a #MON?!"

	para "It seems there are"
	line "new things to dis-"
	cont "cover every day."
	done

ElmText_MtSilverRuinsFinalBattleIntro
	text "<PLAYER>, I didn't"
	line "expect to see you"
	cont "here<...>"
	
	para "I felt a small"
	line "EARTHQUAKE while"
	
	para "I was outside"
	line "doing research and"
	
	para "came to check it"
	line "out<...>"
	
	para "It seems I might"
	line "have interrupted"
	cont "a very rare event<...>"

	para "Oh, that's right."

	para "<PLAYER>, I wanted"
	line "to ask you some-"
	cont "thing."

	para "It would be better"
	line "if we were in my"
	cont "LAB<...>"

	para "But this is a good"
	line "place for it too,"
	
	para "as our mysterious"
	line "friend seems to"
	
	para "have set up an"
	line "area for us<...>"
	done

ElmContinueText_MtSilverRuins:
	text"<PLAYER>!"

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

	para "I knew you had"
	line "wanted to become"
	cont "the best trainer<...>"

	para "To catch all"
	line "species of #MON"
	cont "was your quest"
	cont "too - was it not?"

	para "But to train them<...>"

	para "That was your"
	line "cause all along."
	done
ElmText_MtSilverRuinsFinalBattleAfter_Part2:
	text "You've traveled"
	line "across regions,"

	para "searching - both"
	line "far and wide."

	para "And now, having"
	line "battled with you,"

	para "I see the power"
	line "that you hold"
	cont "inside."

	;POKEMON! Gotta Catch em-- oh wait

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
	person_event SPRITE_ELM, 16, 26, $7, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_ELM_IN_SILVER_CAVE_RUINS
	person_event SPRITE_BIRD, 8, 25, $3, 0, 0, -1, -1, 8 + PAL_OW_SILVER, 0, 0, MtSilverRuinsElmScript, EVENT_ELM_IN_SILVER_CAVE_RUINS
