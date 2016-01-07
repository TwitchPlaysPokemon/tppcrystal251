ViridianPokeCenter1FRB_MapScriptHeader: ; 0x9b68e
	; trigger count
	db 0

	; callback count
	db 0
; 0x9b690

ViridianPokeCenterRBNurseScript: ; 0x9b690
	jumpstd pokecenternurse
; 0x9b693

ViridianPokeCenter1FCooltrainerMScript: ; 0x9b693
	jumptextfaceplayer _ViridianPokeCenterText1

ViridianPokeCenter1FCooltrainerFScript: ; 0x9b6a7
	jumptextfaceplayer _ViridianPokeCenterText3
; 0x9b6aa

ViridianPokeCenter1FBugCatcherScript: ; 0x9b6aa
	jumptextfaceplayer _ViridianCityPokecenterGuyText
; 0x9b6ad

_ViridianPokeCenterText1:
	text "You can use that"
	line "PC in the corner."

	para "The receptionist"
	line "told me. So kind!"
	done

_ViridianPokeCenterText3:
	text "There's a #MON"
	line "CENTER in every"
	cont "town ahead."

	para "They don't charge"
	line "any money either!"
	done

_ViridianCityPokecenterGuyText::
	text "#MON CENTERs"
	line "heal your tired,"
	cont "hurt or fainted"
	cont "#MON!"
	done

ViridianPokeCenter1FRB_MapEventHeader: ; 0x9b7ef
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 4, GROUP_VIRIDIAN_CITY_RB, MAP_VIRIDIAN_CITY_RB
	warp_def $7, $4, 4, GROUP_VIRIDIAN_CITY_RB, MAP_VIRIDIAN_CITY_RB
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_NURSE, 5, 7, $6, 0, 0, -1, -1, 0, 0, 0, ViridianPokeCenterRBNurseScript, -1
	person_event SPRITE_COOLTRAINER_M, 8, 12, $5, 0, 1, -1, -1, 8 + PAL_OW_RED, 0, 0, ViridianPokeCenter1FCooltrainerMScript, -1
	person_event SPRITE_GENTLEMAN, 7, 9, $7, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ViridianPokeCenter1FCooltrainerFScript, -1
	person_event SPRITE_BUG_CATCHER, 10, 5, $9, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, ViridianPokeCenter1FBugCatcherScript, -1
; 0x9b838

