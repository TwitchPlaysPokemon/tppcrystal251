CeruleanPokeCenter1FRB_MapScriptHeader: ; 0x18820d
	; trigger count
	db 0

	; callback count
	db 0
; 0x18820f

CeruleanPokeCenter1FRBNurse: ; 0x18820f
	jumpstd pokecenternurse
; 0x188212
CeruleanPokeCenter1FRBSuperNerdScript:
	jumptextfaceplayer _CeruleanPokecenterText1

CeruleanPokeCenter1FRBGentlemanScript:
	jumptextfaceplayer _CeruleanPokecenterText3

CeruleanPokeCenter1FRBYoungsterScript:
	jumptextfaceplayer _CeruleanPokecenterGuyText

_CeruleanPokecenterText1:
	text "That BILL!"

	para "I heard that"
	line "he'll do whatever"
	cont "it takes to get"
	cont "rare #MON!"
	done

_CeruleanPokecenterGuyText:
	text "BILL has lots of"
	line "#MON!"

	para "He collects rare"
	line "ones too!"
	done


_CeruleanPokecenterText3:
	text "Have you heard"
	line "about BILL?"

	para "Everyone calls"
	line "him a #MANIAC!"

	para "I think people"
	line "are just jealous"
	cont "of BILL, though."

	para "Who wouldn't want"
	line "to boast about"
	cont "their #MON?"
	done



CeruleanPokeCenter1FRB_MapEventHeader: ; 0x188386
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 3, GROUP_CERULEAN_CITY_RB, MAP_CERULEAN_CITY_RB
	warp_def $7, $4, 3, GROUP_CERULEAN_CITY_RB, MAP_CERULEAN_CITY_RB
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_NURSE, 5, 7, $6, 0, 0, -1, -1, 0, 0, 0, CeruleanPokeCenter1FRBNurse, -1
	person_event SPRITE_SUPER_NERD, 8, 12, $5, 0, 1, -1, -1, 0, 0, 0, CeruleanPokeCenter1FRBSuperNerdScript, -1
	person_event SPRITE_GENTLEMAN, 9, 5, $2, 1, 1, -1, -1, 8 + PAL_OW_BLUE, 0, 0, CeruleanPokeCenter1FRBGentlemanScript, -1
	person_event SPRITE_YOUNGSTER, 7, 5, $6, 0, 0, -1, -1, 0, 0, 0, CeruleanPokeCenter1FRBYoungsterScript, -1
; 0x1883c2

