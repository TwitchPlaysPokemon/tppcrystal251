CinnabarVolcanoLab_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 0

; <scripts go here>

; <text goes here>

CinnabarVolcanoLab_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 1
	warp_def   0, 16,  2, GROUP_CINNABAR_VOLCANO_HALLWAY, MAP_CINNABAR_VOLCANO_HALLWAY ; hallway

	; coord events
	db 0

	; bg events
	db 0

	; object events
	db 1
	person_event SPRITE_POKEDEX, 17, 11, $0, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, -1

