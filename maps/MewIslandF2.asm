MewIslandF2_MapScriptHeader:
	; trigger count
	db 0

	; callback count 
	db 0

MewIslandF2_MapEventHeader: 
	; filler
	db 0, 0

	db 19
	warp_def $a, $8, 4, GROUP_MEWISLANDF1, MAP_MEWISLANDF1
	warp_def $2, $a, 5, GROUP_MEWISLANDF1, MAP_MEWISLANDF1
	warp_def $d, $17, 6, GROUP_MEWISLANDF1, MAP_MEWISLANDF1
	warp_def $8, $18, 7, GROUP_MEWISLANDF1, MAP_MEWISLANDF1
	warp_def $3, $17, 1, GROUP_MEWISLANDPEAK, MAP_MEWISLANDPEAK
	warp_def 5, 5, 18, GROUP_MEWISLANDF1, MAP_MEWISLANDF1
	warp_def 7, 7, 19, GROUP_MEWISLANDF1, MAP_MEWISLANDF1
	warp_def 4, 8, 20, GROUP_MEWISLANDF1, MAP_MEWISLANDF1
	warp_def 6, 12, 21, GROUP_MEWISLANDF1, MAP_MEWISLANDF1
	warp_def 8, 17, 22, GROUP_MEWISLANDF1, MAP_MEWISLANDF1
	warp_def 2, 19, 23, GROUP_MEWISLANDF1, MAP_MEWISLANDF1
	warp_def 8, 21, 24, GROUP_MEWISLANDF1, MAP_MEWISLANDF1
	warp_def 6, 25, 25, GROUP_MEWISLANDF1, MAP_MEWISLANDF1
	warp_def 13, 24, 26, GROUP_MEWISLANDF1, MAP_MEWISLANDF1
	warp_def 12, 15, 27, GROUP_MEWISLANDF1, MAP_MEWISLANDF1
	warp_def 12, 9, 28, GROUP_MEWISLANDF1, MAP_MEWISLANDF1
	warp_def 13, 6, 3, GROUP_MEWISLANDB1, MAP_MEWISLANDB1
	warp_def 12, 5, 29, GROUP_MEWISLANDF1, MAP_MEWISLANDF1
	warp_def 13, 3, 30, GROUP_MEWISLANDF1, MAP_MEWISLANDF1

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0
	
