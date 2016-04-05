GoldenrodBoutique_MapScriptHeader: ; 0x18e03e
	; trigger count
	db 0

	; callback count
	db 0
; 0x18e040

BoutiqueClerkScript_0x18e040: ; 0x18e040
	loadfont
	pokemart $0, $0003
	closetext
	end
; 0x18e047

BoutiqueCooltrainerMScript_0x18e047: ; 0x18e047
	jumptextfaceplayer BoutiqueUnknownText_0x18e04d
; 0x18e04a

BoutiqueBugCatcherScript_0x18e04a: ; 0x18e04a
	jumptextfaceplayer BoutiqueUnknownText_0x18e0b6
; 0x18e04d

BoutiqueUnknownText_0x18e04d: ; 0x18e04d
	text "There's no MASTER"
	line "BALL here. #"

	para "BALLS will have"
	line "to do."

	para "I wish KURT would"
	line "make me some of"
	cont "his custom BALLS."
	done
; 0x18e0b6

BoutiqueUnknownText_0x18e0b6: ; 0x18e0b6
	text "A GREAT BALL is"
	line "better for catch-"
	cont "ing #MON than a"
	cont "# BALL."

	para "But KURT's might"
	line "be better some-"
	cont "times."
	done
; 0x18e118

GoldenrodBoutique_MapEventHeader: ; 0x18e118
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $3, 16, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $7, $4, 16, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_CLERK, 7, 5, $9, 0, 0, -1, -1, 0, 0, 0, BoutiqueClerkScript_0x18e040, -1
	person_event SPRITE_COOLTRAINER_M, 9, 6, $7, 0, 0, -1, -1, 0, 0, 0, BoutiqueCooltrainerMScript_0x18e047, -1
	person_event SPRITE_BUG_CATCHER, 6, 11, $5, 0, 2, -1, -1, 8 + PAL_OW_RED, 0, 0, BoutiqueBugCatcherScript_0x18e04a, -1
; 0x18e14f

