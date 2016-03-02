BlackthornGymRematch2F_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 0

BoulderScriptRematch2F: ; 0x19575e
	jumpstd strengthboulder

; <text goes here>

BlackthornGymRematch2F_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 0

	; coord events
	db 0

	; bg events
	db 0

	; object events
	db 5
	person_event SPRITE_BOULDER, 25, 5, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScriptRematch2F, -1
	person_event SPRITE_BOULDER, 23, 18, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScriptRematch2F, -1
	person_event SPRITE_BOULDER, 8, 4, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScriptRematch2F, -1
	person_event SPRITE_BOULDER, 8, 5, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScriptRematch2F, -1
	person_event SPRITE_BOULDER, 22, 5, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScriptRematch2F, -1

