VermilionPokeCenter1FRB_MapScriptHeader: ; 0x191601
	; trigger count
	db 0

	; callback count
	db 0
; 0x191603

VermilionPokeCenter1FRB_NurseScript: ; 0x191603
	jumpstd pokecenternurse
; 0x191606

VermilionPokeCenter1FRB_FishingGuruScript: ; 0x191606
	jumptextfaceplayer _VermilionPokecenterText1
; 0x19161a

VermilionPokeCenter1FRB_SailorScript: ; 0x19161a
	jumptextfaceplayer _VermilionPokecenterText2
; 0x19161d

VermilionPokeCenter1FRB_BugCatcherScript: ; 0x19161d
	jumptextfaceplayer _VermilionPokecenterGuyText
; 0x191620

_VermilionPokecenterText1:
	text "Even if they are"
	line "the same level,"
	cont "#MON can have"
	cont "very different"
	cont "abilities."

	para "A #MON raised"
	line "by a trainer is"
	cont "stronger than one"
	cont "in the wild."
	done

_VermilionPokecenterText2:
	text "My #MON was"
	line "poisoned!"

	para "It eventually wore"
	line "off, but man was"
	cont "it scary!"
	done

_VermilionPokecenterGuyText:
	text "It is true that a"
	line "higher level"
	cont "#MON will be"
	cont "more powerful<...>"

	para "But, all #MON"
	line "will have weak"
	cont "points against"
	cont "specific types."

	para "So, there is no"
	line "universally"
	cont "strong #MON."
	done


VermilionPokeCenter1FRB_MapEventHeader: ; 0x191791
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 2, GROUP_VERMILION_CITY_RB, MAP_VERMILION_CITY_RB
	warp_def $7, $4, 2, GROUP_VERMILION_CITY_RB, MAP_VERMILION_CITY_RB
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_NURSE, 5, 7, $6, 0, 0, -1, -1, 0, 0, 0, VermilionPokeCenter1FRB_NurseScript, -1
	person_event SPRITE_FISHING_GURU, 6, 11, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, VermilionPokeCenter1FRB_FishingGuruScript, -1
	person_event SPRITE_SAILOR, 9, 10, $4, 1, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, VermilionPokeCenter1FRB_SailorScript, -1
	person_event SPRITE_BUG_CATCHER, 9, 5, $3, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, VermilionPokeCenter1FRB_BugCatcherScript, -1
; 0x1917da

