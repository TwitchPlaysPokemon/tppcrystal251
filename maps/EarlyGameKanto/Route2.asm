Route2RB_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

Route2RB_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 7
	warp_def 17, 15, 1, GROUP_N_A, MAP_N_A
	warp_def 37, 15, 3, GROUP_ROUTE_2_GATE_RB, MAP_ROUTE_2_GATE_RB
	warp_def 33, 16, 1, GROUP_ROUTE_2_GATE_RB, MAP_ROUTE_2_GATE_RB
	warp_def 33, 17, 2, GROUP_ROUTE_2_GATE_RB, MAP_ROUTE_2_GATE_RB
	warp_def  7, 12, 3, GROUP_DIGLETTS_CAVE_RB, MAP_DIGLETTS_CAVE_RB
	warp_def  9,  3, 3, GROUP_VIRIDIAN_FOREST_NORTH_RB, MAP_VIRIDIAN_FOREST_NORTH_RB
	warp_def 41,  3, 1, GROUP_VIRIDIAN_FOREST_SOUTH_RB, MAP_VIRIDIAN_FOREST_SOUTH_RB
	
	; xy triggers
	db 0

	; signposts
	db 2
	signpost 0, 0, $0, BGEvent
	signpost 0, 0, $0, BGEvent

	; people-events
	db 2
	person_event SPRITE_POKE_BALL, 0, 0, $1, 0, 0, -1, -1, 0, 1, 0, ObjectEvent, -1
	person_event SPRITE_POKE_BALL, 0, 0, $1, 0, 0, -1, -1, 0, 1, 0, ObjectEvent, -1

