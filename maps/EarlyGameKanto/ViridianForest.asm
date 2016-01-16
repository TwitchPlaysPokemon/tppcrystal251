ViridianForestRB_MapScriptHeader: ; 0x1ac2ba
	; trigger count
	db 0

	; callback count
	db 0
; 0x1ac2bc

ViridianForestRBSignpostText1:
	text "TRAINER TIPS"

	para "Weaken #MON"
	line "before attempting"
	cont "capture!"
	
	para "When healthy,"
	line "they may escape!"
	done

ViridianForestRBSignpostText2:
	text "For poison, use"
	line "ANTIDOTE! Get it"
	cont "at #MON MARTs!"
	done
	
ViridianForestRBSignpostText3:
	text "TRAINER TIPS"

	para "If you want to"
	line "avoid battles,"
	cont "stay away from"
	cont "grassy areas!"
	done

ViridianForestRBSignpostText4:
	text "TRAINER TIPS"

	para "Contact PROF.OAK"
	line "via PC to get"
	cont "your #DEX"
	cont "evaluated!"
	done
	
ViridianForestRBSignpostText5:
	text "TRAINER TIPS"

	para "No stealing of"
	line "#MON from"
	cont "other trainers!"
	cont "Catch only wild"
	cont "#MON!"
	done
	
ViridianForestRBSignpostText6:
	text "LEAVING"
	line "VIRIDIAN FOREST"
	cont "PEWTER CITY AHEAD"
	done

MapViridianForestRBSignpost0Script:
	jumptext ViridianForestRBSignpostText1
	
MapViridianForestRBSignpost1Script:
	jumptext ViridianForestRBSignpostText2
	
MapViridianForestRBSignpost2Script:
	jumptext ViridianForestRBSignpostText3
	
MapViridianForestRBSignpost3Script:
	jumptext ViridianForestRBSignpostText4
	
MapViridianForestRBSignpost4Script:
	jumptext ViridianForestRBSignpostText5
	
MapViridianForestRBSignpost5Script:
	jumptext ViridianForestRBSignpostText6

ViridianForestRB_MapEventHeader: ; 0x1ac4af 
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $2f, $10, 3, GROUP_VIRIDIAN_FOREST_GATE_SOUTH, MAP_VIRIDIAN_FOREST_GATE_SOUTH
	warp_def $2F, $11, 3, GROUP_VIRIDIAN_FOREST_GATE_SOUTH, MAP_VIRIDIAN_FOREST_GATE_SOUTH
	warp_def $1, $1, 1, GROUP_VIRIDIAN_FOREST_GATE_NORTH, MAP_VIRIDIAN_FOREST_GATE_NORTH

	; xy triggers
	db 0

	; signposts
	db 6
	signpost $2D, $12, $0, MapViridianForestRBSignpost0Script
	signpost $20, $10, $0, MapViridianForestRBSignpost1Script
	signpost $28, $18, $0, MapViridianForestRBSignpost2Script
	signpost $11, $1A, $0, MapViridianForestRBSignpost3Script
	signpost $18, $4, $0, MapViridianForestRBSignpost4Script
	signpost $3, $2, $0, MapViridianForestRBSignpost5Script

	; people-events
	db 6
	person_event SPRITE_BUG_CATCHER, $1A, $7, $8, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 2, 5, ObjectEvent, -1
	person_event SPRITE_BUG_CATCHER, $D, $16, $1f, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 2, 3, ObjectEvent, -1
	person_event SPRITE_BUG_CATCHER, $2b, $1D, $9, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 2, 3, ObjectEvent, -1
	
	person_event SPRITE_POKE_BALL, 46, 6, $1, 0, 0, -1, -1, 0, 1, 0, ObjectEvent, -1
	person_event SPRITE_POKE_BALL, 33, 16, $1, 0, 0, -1, -1, 0, 1, 0, ObjectEvent, -1
	person_event SPRITE_FRUIT_TREE, 6, 35, $1, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, -1
; 0x1ac554

