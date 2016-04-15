VermilionGym2_MapScriptHeader: ; 0x1920a3
	; trigger count
	db 0

	; callback count
	db 0
	
VermilionGym2_MapEventHeader: ; 0x19263d
	; filler
	db 0, 0

	; warps
	db 2
	warp_def 27, 9, 7, GROUP_VERMILION_CITY, MAP_VERMILION_CITY
	warp_def 27, 10, 7, GROUP_VERMILION_CITY, MAP_VERMILION_CITY

	; xy triggers
	db 0

	; signposts
	db 0
	signpost 15, 3, $0, MapVermilionGymSignpost16Script
	signpost 15, 6, $0, MapVermilionGymSignpost16Script

	; people-events
	db 0
