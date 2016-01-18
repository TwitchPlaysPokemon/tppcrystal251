PewterPokeCenter1FRB_MapScriptHeader: ; 0x1a2ee5
	; trigger count
	db 0

	; callback count
	db 0
; 0x1a2ee7

PewterPokecenter1FRBNurseScript: ; 0x1a2ee7
	jumpstd pokecenternurse
; 0x1a2eea

PewterPokecenter1FRBTeacherScript: ; 0x1a2eea
	jumptextfaceplayer _PewterPokecenterText1
; 0x1a2eed

PewterPokecenter1FRBJigglypuffScript: ; 0x1a2eed
	loadfont
	writetext _PewterPokecenterText5
	cry JIGGLYPUFF
	waitbutton
	closetext
	end
; 0x1a2ef7

PewterPokecenter1FRBBugCatcherScript: ; 0x1a2ef7
	jumptextfaceplayer _PewterCityPokecenterGuyText
; 0x1a2efa

_PewterPokecenterText1: ; 0x1a2f01
	text "What!?"

	para "TEAM ROCKET is"
	line "at MT.MOON? Huh?"
	cont "I'm on the phone!"

	para "Scram!"
	done

; 0x1a2f5d

_PewterPokecenterText5: ; 0x1a2f5d
	text "JIGGLYPUFF: Puu"
	line "pupuu!"
	done
; 0x1a2f75

_PewterCityPokecenterGuyText: ; 0x1a2f75
	text "Yawn!"

	para "When JIGGLYPUFF"
	line "sings, #MON"
	cont "get drowsy…"

	para "…Me too…"
	line "Snore…"
	done
; 0x1a2ff4

PewterPokeCenter1FRB_MapEventHeader: ; 0x1a2ff4
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 4, GROUP_PEWTER_CITY_RB, MAP_PEWTER_CITY_RB
	warp_def $7, $4, 4, GROUP_PEWTER_CITY_RB, MAP_PEWTER_CITY_RB
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_NURSE, 5, 7, $6, 0, 0, -1, -1, 0, 0, 0, PewterPokecenter1FRBNurseScript, -1
	person_event SPRITE_GENTLEMAN, 10, 12, $8, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, PewterPokecenter1FRBTeacherScript, -1
	person_event SPRITE_JIGGLYPUFF, 7, 5, $16, 0, 0, -1, -1, 0, 0, 0, PewterPokecenter1FRBJigglypuffScript, -1
	person_event SPRITE_BUG_CATCHER, 7, 6, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, PewterPokecenter1FRBBugCatcherScript, -1
; 0x1a304a

