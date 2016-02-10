MtSilverRuins_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 0

; <scripts go here>

; <text goes here>

MtSilverRuins_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def 47, 27, 2, GROUP_SILVER_CAVE_ROOM_3, MAP_SILVER_CAVE_ROOM_3
	warp_def 47, 28, 3, GROUP_SILVER_CAVE_ROOM_3, MAP_SILVER_CAVE_ROOM_3
	; coord events
	db 0

	; bg events
	db 0

	; object events
	db 0