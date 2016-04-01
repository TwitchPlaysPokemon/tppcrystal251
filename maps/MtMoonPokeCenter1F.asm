MtMoonPokeCenter1F_MapScriptHeader: ; 0x694c7
	; trigger count
	db 0

	; callback count
	db 0
; 0x694c9

NurseScript_MtMoon: ; 0x694c9
	jumpstd pokecenternurse
; 0x694cc

FisherScript1_MtMoon:
	jumptextfaceplayer FisherText1_MtMoon

FisherText1_MtMoon:
	text "Hey, you!"

	para "Wanna buy a"
	line "MAGIKARP? No?"

	para "Then shoo!"
	done

MtMoonPokeCenter1F_MapEventHeader: ; 0x69935
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 2, GROUP_ROUTE_3, MAP_ROUTE_3
	warp_def $7, $4, 2, GROUP_ROUTE_3, MAP_ROUTE_3
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_NURSE, 5, 7, $6, 0, 0, -1, -1, 0, 0, 0, NurseScript_MtMoon, -1
	person_event SPRITE_FISHER, 8, 6, $a, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, FisherScript1_MtMoon, -1
; 0x6998b

