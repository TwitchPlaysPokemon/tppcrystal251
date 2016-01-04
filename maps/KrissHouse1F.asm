KrissHouse1F_MapScriptHeader: ; 0x7a4cc
	; trigger count
	db 0

	; callback count
	db 0
; 0x7a4d6

MomScript_0x7a582: ; 0x7a582
	loadfont
	checkevent EVENT_SPOKE_TO_MOM_AFTER_DELIVERING_MYSTERY_EGG
	iftrue UnknownScript_0x7a5af
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue UnknownScript_0x7a5b8
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue UnknownScript_0x7a5b5
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue UnknownScript_0x7a5a9
	writetext UnknownText_0x7a8b5
	closetext
	loadmovesprites
	end
; 0x7a5a9

UnknownScript_0x7a5a9: ; 0x7a5a9
	writetext UnknownText_0x7a8e5
	closetext
	loadmovesprites
	end
; 0x7a5af

UnknownScript_0x7a5af: ; 0x7a5af
	writetext UnknownText_0x7a957
	closetext
	loadmovesprites
	end
; 0x7a5b5

UnknownScript_0x7a5b5: ; 0x7a5b5
	setevent EVENT_SPOKE_TO_MOM_AFTER_DELIVERING_MYSTERY_EGG
UnknownScript_0x7a5b8: ; 0x7a5b8
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	special Function16218
	closetext
	loadmovesprites
	end
; 0x7a5c1

PokefanFScript_0x7a5c1: ; 0x7a5c1
	faceplayer
	loadfont
	checktime $1
	iftrue UnknownScript_0x7a5d2
	checktime $2
	iftrue UnknownScript_0x7a5d9
	checktime $4
	iftrue UnknownScript_0x7a5e0
UnknownScript_0x7a5d2: ; 0x7a5d2
	writetext UnknownText_0x7a97d
	keeptextopen
	jump UnknownScript_0x7a5e7
; 0x7a5d9

UnknownScript_0x7a5d9: ; 0x7a5d9
	writetext UnknownText_0x7a99c
	keeptextopen
	jump UnknownScript_0x7a5e7
; 0x7a5e0

UnknownScript_0x7a5e0: ; 0x7a5e0
	writetext UnknownText_0x7a9b4
	keeptextopen
	jump UnknownScript_0x7a5e7
; 0x7a5e7

UnknownScript_0x7a5e7: ; 0x7a5e7
	writetext UnknownText_0x7a9d3
	closetext
	loadmovesprites
	spriteface $6, $3
	end
; 0x7a5f0

MapKrissHouse1FSignpost3Script: ; 0x7a5f0
	jumptext UnknownText_0x7aad0
; 0x7a5f3

MapKrissHouse1FSignpost0Script: ; 0x7a5f3
	jumptext UnknownText_0x7aa3a
; 0x7a5f6

MapKrissHouse1FSignpost1Script: ; 0x7a5f6
	jumptext UnknownText_0x7aa64
; 0x7a5f9

MapKrissHouse1FSignpost2Script: ; 0x7a5f9
	jumptext UnknownText_0x7aa91
; 0x7a5fc

UnknownText_0x7a8b5: ; 0x7a8b5
	text "PROF.ELM is wait-"
	line "ing for you."

	para "Hurry up, baby!"
	done
; 0x7a8e5

UnknownText_0x7a8e5: ; 0x7a8e5
	text "So, what was PROF."
	line "ELM's errand?"

	para "…"

	para "That does sound"
	line "challenging."

	para "But, you should be"
	line "proud that people"
	cont "rely on you."
	done
; 0x7a957

UnknownText_0x7a957: ; 0x7a957
	text "<PLAYER>, do it!"

	para "I'm behind you all"
	line "the way!"
	done
; 0x7a97d

UnknownText_0x7a97d: ; 0x7a97d
	text "Good morning,"
	line "<PLAY_G>!"

	para "I'm visiting!"
	done
; 0x7a99c

UnknownText_0x7a99c: ; 0x7a99c
	text "Hello, <PLAY_G>!"
	line "I'm visiting!"
	done
; 0x7a9b4

UnknownText_0x7a9b4: ; 0x7a9b4
	text "Good evening,"
	line "<PLAY_G>!"

	para "I'm visiting!"
	done
; 0x7a9d3

UnknownText_0x7a9d3: ; 0x7a9d3
	text "<PLAY_G>, have you"
	line "heard?"

	para "My daughter is"
	line "adamant about"

	para "becoming PROF."
	line "ELM's assistant."

	para "She really loves"
	line "#MON!"
	done
; 0x7aa3a

UnknownText_0x7aa3a: ; 0x7aa3a
	text "Mom's specialty!"

	para "CINNABAR VOLCANO"
	line "BURGER!"
	done
; 0x7aa64

UnknownText_0x7aa64: ; 0x7aa64
	text "The sink is spot-"
	line "less. Mom likes it"
	cont "clean."
	done
; 0x7aa91

UnknownText_0x7aa91: ; 0x7aa91
	text "Let's see what's"
	line "in the fridge…"

	para "FRESH WATER and"
	line "tasty LEMONADE!"
	done
; 0x7aad0

UnknownText_0x7aad0: ; 0x7aad0
	text "There's a movie on"
	line "TV: Stars dot the"

	para "sky as two boys"
	line "ride on a train…"

	para "I'd better get"
	line "rolling too!"
	done
; 0x7ab31

KrissHouse1F_MapEventHeader: ; 0x7ab31
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $6, 2, GROUP_NEW_BARK_TOWN, MAP_NEW_BARK_TOWN
	warp_def $7, $7, 2, GROUP_NEW_BARK_TOWN, MAP_NEW_BARK_TOWN
	warp_def $0, $9, 1, GROUP_KRISS_HOUSE_2F, MAP_KRISS_HOUSE_2F

	; xy triggers
	db 0
	; xy_trigger 0, $4, $8, $0, UnknownScript_0x7a4d8, $0, $0
	; xy_trigger 0, $4, $9, $0, UnknownScript_0x7a4db, $0, $0

	; signposts
	db 4
	signpost 1, 0, $0, MapKrissHouse1FSignpost0Script
	signpost 1, 1, $0, MapKrissHouse1FSignpost1Script
	signpost 1, 2, $0, MapKrissHouse1FSignpost2Script
	signpost 1, 4, $0, MapKrissHouse1FSignpost3Script

	; people-events
	db 5
	person_event SPRITE_MOM, 8, 11, $8, 0, 0, -1, -1, 0, 0, 0, MomScript_0x7a582, EVENT_MOM_POSITION_1
	person_event SPRITE_MOM, 6, 6, $7, 0, 0, -1, 1, 0, 0, 0, MomScript_0x7a582, EVENT_MOM_POSITION_2
	person_event SPRITE_MOM, 8, 11, $8, 0, 0, -1, 2, 0, 0, 0, MomScript_0x7a582, EVENT_MOM_POSITION_2
	person_event SPRITE_MOM, 6, 4, $7, 0, 0, -1, 4, 0, 0, 0, MomScript_0x7a582, EVENT_MOM_POSITION_2
	person_event SPRITE_POKEFAN_F, 8, 8, $9, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, PokefanFScript_0x7a5c1, EVENT_NEIGHBOR_IN_YOUR_HOUSE_1F
; 0x7abab

