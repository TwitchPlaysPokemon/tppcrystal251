BillsGarden_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 0

; <scripts go here>

; <text goes here>

BillsGarden_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def 33, 17, 3, GROUP_BILLS_HOUSE, MAP_BILLS_HOUSE
	warp_def 33, 18, 3, GROUP_BILLS_HOUSE, MAP_BILLS_HOUSE

	; coord events
	db 0

	; bg events
	db 0

	; object events
	db 0

