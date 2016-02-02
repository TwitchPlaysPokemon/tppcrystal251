LancesRoom_MapScriptHeader: ; 0x180e2c
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x180e39, $0000
	dw UnknownScript_0x180e3d, $0000

	; callback count
	db 1

	; callbacks

	dbw 1, UnknownScript_0x180e3e
; 0x180e39

UnknownScript_0x180e39: ; 0x180e39
	priorityjump UnknownScript_0x180e53
	end
; 0x180e3d

UnknownScript_0x180e3d: ; 0x180e3d
	end
; 0x180e3e

UnknownScript_0x180e3e: ; 0x180e3e
	checkevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	iffalse UnknownScript_0x180e48
	changeblock $4, $16, $34
UnknownScript_0x180e48: ; 0x180e48
	checkevent EVENT_LANCES_ROOM_EXIT_OPEN
	iffalse UnknownScript_0x180e52
	changeblock $4, $0, $b
UnknownScript_0x180e52: ; 0x180e52
	return
; 0x180e53

UnknownScript_0x180e53: ; 0x180e53
	applymovement $0, MovementData_0x180f33
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock $4, $16, $34
	reloadmappart
	closetext
	dotrigger $1
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	end
; 0x180e6a

UnknownScript_0x180e6a: ; 0x180e6a
	special Functionc48f
	applymovement $0, MovementData_0x180f38
	jump LanceScript_0x180e7b
; 0x180e74

UnknownScript_0x180e74: ; 0x180e74
	special Functionc48f
	applymovement $0, MovementData_0x180f3c
LanceScript_0x180e7b: ; 0x180e7b
	spriteface $2, $2
	loadfont
	writetext UnknownText_0x180f67
	waitbutton
	closetext
	winlosstext UnknownText_0x1810a4, $0000
	setlasttalked $2
	checkevent EVENT_ENABLE_DIPLOMA_PRINTING
	iftrue LanceRematch
	loadtrainer CHAMPION, 1
	jump StartBattleLance
LanceRematch:
	loadtrainer CHAMPION, 2
StartBattleLance:
	startbattle
	reloadmapmusic
	returnafterbattle
	setevent EVENT_BEAT_CHAMPION_LANCE
	loadfont
	writetext UnknownText_0x181132
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock $4, $0, $b
	reloadmappart
	closetext
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	musicfadeout MUSIC_BEAUTY_ENCOUNTER, $10
	pause 30
	showemote $0, $2, 15
	spriteface $2, $0
	pause 10
	spriteface $0, $0
	appear $3
	applymovement $3, MovementData_0x180f41
	loadfont
	writetext UnknownText_0x1811dd
	waitbutton
	closetext
	appear $4
	applymovement $4, MovementData_0x180f46
	follow $3, $4
	applymovement $3, MovementData_0x180f49
	stopfollow
	spriteface $4, $1
	spriteface $2, $2
	; checkevent EVENT_ENABLE_DIPLOMA_PRINTING
	; iffalse Script_NoOakBattle
	; loadfont
	; special HealParty
	; writetext Text_OakBeforeBattle
	; waitbutton
	; closetext
	; winlosstext OakBeatenText, $0000
	; checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	; iftrue Script_OakHasBlastoise
	; checkevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	; iftrue Script_OakHasVenusaur
	; loadtrainer POKEMON_PROF, OAK_2
	; jump Script_StartOakBattle
; Script_OakHasBlastoise:
	; loadtrainer POKEMON_PROF, OAK_1
	; jump Script_StartOakBattle
; Script_OakHasVenusaur:
	; loadtrainer POKEMON_PROF, OAK_3
; Script_StartOakBattle:
	; startbattle
	; returnafterbattle
	; setevent EVENT_BEAT_OAK
	; playmusic MUSIC_BEAUTY_ENCOUNTER, $10
	; jump Script_returnafteroakbattle
; Script_NoOakBattle:
	loadfont
	writetext UnknownText_0x18121b
	waitbutton
	closetext
Script_returnafteroakbattle:
	applymovement $3, MovementData_0x180f4c
	spriteface $0, $2
	loadfont
	writetext UnknownText_0x18134b
	waitbutton
	closetext
	applymovement $2, MovementData_0x180f4f
	spriteface $0, $1
	loadfont
	writetext UnknownText_0x18137b
	waitbutton
	closetext
	follow $2, $0
	spriteface $3, $1
	spriteface $4, $1
	applymovement $2, MovementData_0x180f53
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear $2
	applymovement $0, MovementData_0x180f55
	playsound SFX_EXIT_BUILDING
	disappear $0
	applymovement $3, MovementData_0x180f57
	showemote $0, $3, 15
	loadfont
	writetext UnknownText_0x1813c5
	pause 30
	closetext
	applymovement $3, MovementData_0x180f5b
	special Function8c084
	pause 15
	warpfacing $1, GROUP_HALL_OF_FAME, MAP_HALL_OF_FAME, $4, $d
	end
; 0x180f33

	

MovementData_0x180f33: ; 0x180f33
	step_up
	step_up
	step_up
	step_up
	step_end
; 0x180f38

MovementData_0x180f38: ; 0x180f38
	step_up
	step_up
	turn_head_right
	step_end
; 0x180f3c

MovementData_0x180f3c: ; 0x180f3c
	step_up
	step_left
	step_up
	turn_head_right
	step_end
; 0x180f41

MovementData_0x180f41: ; 0x180f41
	big_step_up
	big_step_up
	big_step_up
	turn_head_down
	step_end
; 0x180f46

MovementData_0x180f46: ; 0x180f46
	step_up
	step_up
	step_end
; 0x180f49

MovementData_0x180f49: ; 0x180f49
	step_left
	turn_head_right
	step_end
; 0x180f4c

MovementData_0x180f4c: ; 0x180f4c
	big_step_up
	turn_head_right
	step_end
; 0x180f4f

MovementData_0x180f4f: ; 0x180f4f
	step_up
	step_left
	turn_head_down
	step_end
; 0x180f53

MovementData_0x180f53: ; 0x180f53
	step_up
	step_end
; 0x180f55

MovementData_0x180f55: ; 0x180f55
	step_up
	step_end
; 0x180f57

MovementData_0x180f57: ; 0x180f57
	step_up
	step_right
	turn_head_up
	step_end
; 0x180f5b

MovementData_0x180f5b: ; 0x180f5b
	big_step_right
	big_step_right
	big_step_left
	big_step_left
	big_step_left
	big_step_right
	big_step_right
	big_step_right
	big_step_left
	big_step_left
	turn_head_up
	step_end
; 0x180f67

UnknownText_0x180f67: ; 0x180f67
	text "LANCE: I've been"
	line "waiting for you."

	para "<PLAY_G>!"

	para "I knew that you,"
	line "with your skills,"

	para "would eventually"
	line "reach me here."

	para "There's no need"
	line "for words now."

	para "We will battle to"
	line "determine who is"

	para "the stronger of"
	line "the two of us."

	para "As the most power-"
	line "ful trainer and as"

	para "the #MON LEAGUE"
	line "CHAMPION<...>"

	para "I, LANCE the drag-"
	line "on master, accept"
	cont "your challenge!"
	done
; 0x1810a4

UnknownText_0x1810a4: ; 0x1810a4
	text "<...>It's over."

	para "But it's an odd"
	line "feeling."

	para "I'm not angry that"
	line "I lost. In fact, I"
	cont "feel happy."

	para "Happy that I"
	line "witnessed the rise"

	para "of a great new"
	line "CHAMPION!"
	done
; 0x181132

UnknownText_0x181132: ; 0x181132
	text "<...>Whew."

	para "You have become"
	line "truly powerful,"
	cont "<PLAY_G>."

	para "Your #MON have"
	line "responded to your"

	para "strong and up-"
	line "standing nature."

	para "As a trainer, you"
	line "will continue to"

	para "grow strong with"
	line "your #MON."
	done
; 0x1811dd

UnknownText_0x1811dd: ; 0x1811dd
	text "MARY: Oh, no!"
	line "It's all over!"

	para "PROF.OAK, if you"
	line "weren't so slow<...>"
	done
; 0x18121b

UnknownText_0x18121b: ; 0x18121b
	text "PROF.OAK: Ah,"
	line "<PLAY_G>!"

	para "It's been a long"
	line "while."

	para "You certainly look"
	line "more impressive."

	para "Your conquest of"
	line "the LEAGUE is just"
	cont "fantastic!"

	para "Your dedication,"
	line "trust and love for"

	para "your #MON made"
	line "this happen."

	para "Your #MON were"
	line "outstanding too."

	para "Because they be-"
	line "lieved in you as a"

	para "trainer, they per-"
	line "severed."

	para "Congratulations,"
	line "<PLAY_G>!"
	done
; 0x18134b

UnknownText_0x18134b: ; 0x18134b
	text "MARY: Let's inter-"
	line "view the brand new"
	cont "CHAMPION!"
	done
; 0x18137b

UnknownText_0x18137b: ; 0x18137b
	text "LANCE: This is"
	line "getting to be a"
	cont "bit too noisy<...>"

	para "<PLAY_G>, could you"
	line "come with me?"
	done
; 0x1813c5

UnknownText_0x1813c5: ; 0x1813c5
	text "MARY: Oh, wait!"
	line "We haven't done"
	cont "the interview!"
	done
; 0x1813f4

; Text_OakBeforeBattle:
	; text "PROF.OAK: Ah,"
	; line "<PLAY_G>!"

	; para "It's been a long"
	; line "while."

	; para "You certainly look"
	; line "more impressive."

	; para "Your conquest of"
	; line "the LEAGUE is just"
	; cont "fantastic!"

	; para "Your dedication,"
	; line "trust and love for"

	; para "your #MON made"
	; line "this happen."

	; para "Your #MON were"
	; line "outstanding too."

	; para "Because they be-"
	; line "lieved in you as a"

	; para "trainer, they per-"
	; line "severed."

	; para "Now, <PLAY_G>."

	; para "I want you to come"
	; line "at me with all"

	; para "the strength that"
	; line "got you this far."
	; done
	
; OakBeatenText:
	; text "Excellent!"

	; para "I have nothing"
	; line "left to say. You"

	; para "truly are a"
	; line "#MON MASTER!"
	; done

LancesRoom_MapEventHeader: ; 0x1813f4
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $17, $4, 3, GROUP_KARENS_ROOM, MAP_KARENS_ROOM
	warp_def $17, $5, 4, GROUP_KARENS_ROOM, MAP_KARENS_ROOM
	warp_def $1, $4, 1, GROUP_HALL_OF_FAME, MAP_HALL_OF_FAME
	warp_def $1, $5, 2, GROUP_HALL_OF_FAME, MAP_HALL_OF_FAME

	; xy triggers
	db 2
	xy_trigger 1, $5, $4, $0, UnknownScript_0x180e6a, $0, $0
	xy_trigger 1, $5, $5, $0, UnknownScript_0x180e74, $0, $0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_LANCE, 7, 9, $6, 0, 0, -1, -1, 0, 0, 0, LanceScript_0x180e7b, -1
	person_event SPRITE_TEACHER, 11, 8, $7, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, ObjectEvent, EVENT_MARY_AND_OAK_IN_LANCES_ROOM
	person_event SPRITE_OAK, 11, 8, $7, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_MARY_AND_OAK_IN_LANCES_ROOM
; 0x181445

