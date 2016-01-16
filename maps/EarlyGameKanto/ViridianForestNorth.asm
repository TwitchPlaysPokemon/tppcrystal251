ViridianForestNorthRB_MapScriptHeader: ; 0x1ac2ba
	; trigger count
	db 0

	; callback count
	db 0
; 0x1ac2bc

OfficerScript_ViridianNorthRB: ; 0x197634
	jumptextfaceplayer Office_ViridianNorthRB_Text
; 0x197637

Office_ViridianNorthRB_Text: ; 0x19763a
	text "VIRIDIAN FOREST"
	line "has many trees"
	cont "that form a maze."
	
	para "People get lost"
	line "easily here."
	done
; 0x197661

ViridianForestNorthRB_MapEventHeader: ; 0x1ac4af 
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $07, $04, 3, GROUP_VIRIDIAN_FOREST_RB, MAP_VIRIDIAN_FOREST_RB
	warp_def $07, $05, 3, GROUP_VIRIDIAN_FOREST_RB, MAP_VIRIDIAN_FOREST_RB
	warp_def $00, $05, 6, GROUP_ROUTE_2_RB, MAP_ROUTE_2_RB

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_OFFICER, 7, 11, $8, 0, 1, -1, -1, 8 + PAL_OW_RED, 0, 0, OfficerScript_ViridianNorthRB, -1
; 0x1ac554

