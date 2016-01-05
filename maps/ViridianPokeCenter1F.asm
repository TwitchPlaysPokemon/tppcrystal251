ViridianPokeCenter1F_MapScriptHeader: ; 0x9b68e
	; trigger count
	db 0

	; callback count
	db 0
; 0x9b690

NurseScript_0x9b690: ; 0x9b690
	jumpstd pokecenternurse
; 0x9b693

CooltrainerMScript_0x9b693: ; 0x9b693
	faceplayer
	loadfont
	checkevent EVENT_BLUE_IN_CINNABAR
	iftrue UnknownScript_0x9b6a1
	writetext UnknownText_0x9b6ad
	waitbutton
	closetext
	end
; 0x9b6a1

UnknownScript_0x9b6a1: ; 0x9b6a1
	writetext UnknownText_0x9b6f5
	waitbutton
	closetext
	end
; 0x9b6a7

CooltrainerFScript_0x9b6a7: ; 0x9b6a7
	jumptextfaceplayer UnknownText_0x9b76b
; 0x9b6aa

BugCatcherScript_0x9b6aa: ; 0x9b6aa
	jumptextfaceplayer UnknownText_0x9b7c8
; 0x9b6ad

UnknownText_0x9b6ad: ; 0x9b6ad
	text "Where in the world"
	line "is VIRIDIAN's GYM"

	para "LEADER? I wanted"
	line "to challenge him."
	done
; 0x9b6f5

UnknownText_0x9b6f5: ; 0x9b6f5
	text "There are no GYM"
	line "TRAINERS at the"
	cont "VIRIDIAN GYM."

	para "The LEADER claims"
	line "his policy is to"

	para "win without having"
	line "any underlings."
	done
; 0x9b76b

UnknownText_0x9b76b: ; 0x9b76b
	text "I work as a"
	line "paparazzi."

	para "I am here to get"
	line "some good shots of"
	cont "the celebrities."

	done
; 0x9b7c8

UnknownText_0x9b7c8: ; 0x9b7c8
	text "My dream is to be-"
	line "come a GYM LEADER."
	done
; 0x9b7ef

ViridianPokeCenter1F_MapEventHeader: ; 0x9b7ef
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 5, GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY
	warp_def $7, $4, 5, GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_NURSE, 5, 7, $6, 0, 0, -1, -1, 0, 0, 0, NurseScript_0x9b690, -1
	person_event SPRITE_COOLTRAINER_M, 8, 12, $5, 0, 1, -1, -1, 8 + PAL_OW_RED, 0, 0, CooltrainerMScript_0x9b693, -1
	person_event SPRITE_COOLTRAINER_F, 7, 9, $7, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, CooltrainerFScript_0x9b6a7, -1
	person_event SPRITE_BUG_CATCHER, 10, 5, $9, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, BugCatcherScript_0x9b6aa, -1
; 0x9b838

