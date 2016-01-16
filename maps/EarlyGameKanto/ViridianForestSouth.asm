ViridianForestSouthRB_MapScriptHeader: ; 0x1ac2ba
	; trigger count
	db 0

	; callback count
	db 0
; 0x1ac2bc

OfficerScript_ViridianSouthRB: ; 0x197634
	jumptextfaceplayer Office_ViridianSouthRB_Text
; 0x197637

Office_ViridianSouthRB_Text: ; 0x19763a
	text "VIRIDIAN FOREST is"
	line "like a maze."
	cont "Be careful, don't"
	cont "get lost in there!"
	done
; 0x197661

ViridianForestSouthRB_MapEventHeader: ; 0x1ac4af 
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $07, $04, 7, GROUP_ROUTE_2_RB, MAP_ROUTE_2_RB
	warp_def $07, $05, 7, GROUP_ROUTE_2_RB, MAP_ROUTE_2_RB
	warp_def $00, $05, 1, GROUP_VIRIDIAN_FOREST_RB, MAP_VIRIDIAN_FOREST_RB

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_OFFICER, 7, 11, $8, 0, 1, -1, -1, 8 + PAL_OW_RED, 0, 0, OfficerScript_ViridianSouthRB, -1
; 0x1ac554

