Route2NuggetSpeechHouseRB_MapScriptHeader: ; 0x9b845
	; trigger count
	db 0

	; callback count
	db 0
; 0x9b847

Route2NuggetSpeechHouseRB_MapEventHeader: ; 0x9b933
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 1, GROUP_ROUTE_2_RB, MAP_ROUTE_2_RB
	warp_def $7, $3, 1, GROUP_ROUTE_2_RB, MAP_ROUTE_2_RB

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_FISHER, 8, 6, $4, 2, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ObjectEvent, -1
; 0x9b950

