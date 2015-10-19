SeafoamIslandsB2F_MapScriptHeader:
	db 0
	
	db 0
	
BoulderScript_SeafoamIslandB2F:
	jumpstd strengthboulder
	
SeafoamIslandsB2F_MapEventHeader:
	db 0, 0
	
	db 4
	warp_def 3, 9, 3, GROUP_SEAFOAM_ISLANDS_B1F, MAP_SEAFOAM_ISLANDS_B1F
	warp_def 15, 21, 4, GROUP_SEAFOAM_ISLANDS_B1F, MAP_SEAFOAM_ISLANDS_B1F
	warp_def 3, 3, 1, GROUP_SEAFOAM_ISLANDS_B3F, MAP_SEAFOAM_ISLANDS_B3F
	warp_def 21, 3, 2, GROUP_SEAFOAM_ISLANDS_B3F, MAP_SEAFOAM_ISLANDS_B3F
	
	db 0
	
	db 0
	
	db 3
	person_event SPRITE_BOULDER, 19, 16, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScript_SeafoamIslandB2F, -1
	person_event SPRITE_BOULDER, 20, 10, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScript_SeafoamIslandB2F, -1
	person_event SPRITE_BOULDER, 24, 19, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScript_SeafoamIslandB2F, -1
	