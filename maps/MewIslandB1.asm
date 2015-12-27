MewIslandB1_MapScriptHeader:
	; trigger count
	db 0

	; callback count 
	db 0

MewIslandB1_MapEventHeader: 
	; filler
	db 0, 0

	db 3
	warp_def $3, $3, 2, GROUP_MEWISLANDF1, MAP_MEWISLANDF1
	warp_def $3, $19, 3, GROUP_MEWISLANDF1, MAP_MEWISLANDF1
	warp_def $8, $e, 1, GROUP_MEWISLANDF1, MAP_MEWISLANDF1

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0
	
