HallOfFame_MapScriptHeader: ; 0x181445
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x18144f, $0000
	dw UnknownScript_0x181453, $0000

	; callback count
	db 0
; 0x18144f

UnknownScript_0x18144f: ; 0x18144f
	priorityjump UnknownScript_0x181454
	end
; 0x181453

UnknownScript_0x181453: ; 0x181453
	end
; 0x181454

UnknownScript_0x181454: ; 0x181454
	disappear $3
	follow $2, $0
	applymovement $2, MovementData_0x181499
	stopfollow
	spriteface $0, $3
	loadfont
	writetext UnknownText_0x1814a6
	waitbutton
	closetext
	checkevent EVENT_BEAT_OAK
	iftrue ElmBattleScript
ReturnAfterElmBattle:
	spriteface $2, $1
	applymovement $0, MovementData_0x1814a4
	dotrigger $1
	pause 15
	writebyte $2
	special HealMachineAnim
	setevent EVENT_FIRST_TIME_HALL_OF_FAME
	setevent EVENT_GRAMPS_WITH_ABRA_IN_INDIGO_PLATEAU_POKECENTER
	setevent EVENT_SILVER_IN_SPROUT_TOWER
	clearevent EVENT_RED_IN_SILVER_CAVE
	setevent EVENT_OLIVINE_PORT_NO_SERVICE_CROWD
	clearevent EVENT_OLIVINE_PORT_IN_SERVICE_CROWD
	domaptrigger GROUP_SPROUT_TOWER_3F, MAP_SPROUT_TOWER_3F, $1
	special HealParty
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue UnknownScript_0x181497
	specialphonecall $5
UnknownScript_0x181497: ; 0x181497
	halloffame
	end
; 0x181499

ElmBattleScript:
	showemote $0, $2, 15
	pause 15
	spriteface $0, $0
	spriteface $2, $0
	appear $3
	applymovement $3, MovementData_ElmWalksUp
	loadfont
	writetext ElmText1
	waitbutton
	closetext
	winlosstext ElmText2, $0000
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue ElmFightsWithFeraligatr
	checkevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	iftrue ElmFightsWithMeganium
	loadtrainer PROF_ELM, ELM_2
	jump StartElmBattle
ElmFightsWithFeraligatr:
	loadtrainer PROF_ELM, ELM_3
	jump StartElmBattle
ElmFightsWithMeganium:
	loadtrainer PROF_ELM, ELM_1
StartElmBattle:
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_ELM
	jump ReturnAfterElmBattle

MovementData_0x181499: ; 0x181499
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_right
	turn_head_left
	step_end
; 0x1814a4

MovementData_ElmWalksUp:
	step_up
	step_up
	step_up
	step_end

MovementData_0x1814a4: ; 0x1814a4
	slow_step_up
	step_end
; 0x1814a6

UnknownText_0x1814a6: ; 0x1814a6
	text "LANCE: It's been a"
	line "long time since I"
	cont "last came here."

	para "This is where we"
	line "honor the LEAGUE"

	para "CHAMPIONS for all"
	line "eternity."

	para "Their courageous"
	line "#MON are also"
	cont "inducted."

	para "Here today, we"
	line "witnessed the rise"

	para "of a new LEAGUE"
	line "CHAMPION--a"

	para "trainer who feels"
	line "compassion for,"

	para "and trust toward,"
	line "all #MON."

	para "A trainer who"
	line "succeeded through"

	para "perseverance and"
	line "determination."

	para "The new LEAGUE"
	line "CHAMPION who has"

	para "all the makings"
	line "of greatness!"

	para "<PLAY_G>, allow me"
	line "to register you"

	para "and your partners"
	line "as CHAMPIONS!"
	done
; 0x181678

ElmText1:
	text "ELM: Ah, <PLAY_G>!"
	
	para "Before you do"
	line "that, I wanted to"
	cont "ask you something."
	
	para "You have been all"
	line "over both JOHTO"
	cont "and KANTO."
	
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

ElmText2:
	text "Well done!"
	
	para "In all my life I"
	line "have never seen"
	
	para "such an intense"
	line "battle, let alone"
	
	para "participated in"
	line "one."
	
	para "I have nothing"
	line "more to say."
	
	para "<PLAY_G>!"
	line "Go forth and re-"
	
	para "gister your #-"
	line "MON for all poste-"
	cont "rity!"
	done

HallOfFame_MapEventHeader: ; 0x181678
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $d, $4, 3, GROUP_LANCES_ROOM, MAP_LANCES_ROOM
	warp_def $d, $5, 4, GROUP_LANCES_ROOM, MAP_LANCES_ROOM

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_LANCE, 16, 8, $7, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, -1
	person_event SPRITE_ELM, 12, 8, $7, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_ELM_VISIBLE_IN_HALLOFFAME
; 0x181695





