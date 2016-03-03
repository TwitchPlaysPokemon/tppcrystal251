BlackthornGymRematch1F_MapScriptHeader:
	; triggers
	db 0

	; callback count
	db 1

	; callbacks
	dbw 1, BoulderTiles

; <scripts go here>
BoulderTiles: ; 0x194e05
	checkevent EVENT_BLACKTHORN_REMATCH_BOULDER_1
	iffalse BoulderTileEnd
	changeblock 6, 6, $3B
BoulderTileEnd: ; 0x194e23
	checkevent EVENT_BLACKTHORN_REMATCH_BOULDER_2
	iffalse BoulderTileEnd
	changeblock 8, 3, $3B
BoulderTileEnd: ; 0x194e23
	checkevent EVENT_BLACKTHORN_REMATCH_BOULDER_3
	iffalse BoulderTileEnd
	changeblock 6, 1, $3B
BoulderTileEnd: ; 0x194e23
	checkevent EVENT_BLACKTHORN_REMATCH_BOULDER_4
	iffalse BoulderTileEnd
	changeblock 1, 4, $3B
BoulderTileEnd: ; 0x194e23
	return

; <text goes here>

BlackthornGymRematch1F_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 12
	warp_def $17, $4, 1, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY
	warp_def $17, $5, 1, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY
	warp_def $15, $d, 1, GROUP_BLACKTHORNGYMREMATCH2F, MAP_BLACKTHORNGYMREMATCH2F
	warp_def $d, $5, 2, GROUP_BLACKTHORNGYMREMATCH2F, MAP_BLACKTHORNGYMREMATCH2F
	warp_def $9, $9, 3, GROUP_BLACKTHORNGYMREMATCH2F, MAP_BLACKTHORNGYMREMATCH2F
	warp_def $9, $3, 4, GROUP_BLACKTHORNGYMREMATCH2F, MAP_BLACKTHORNGYMREMATCH2F
	warp_def $3, $d, 5, GROUP_BLACKTHORNGYMREMATCH2F, MAP_BLACKTHORNGYMREMATCH2F
	warp_def $9, $f, 6, GROUP_BLACKTHORNGYMREMATCH2F, MAP_BLACKTHORNGYMREMATCH2F
	
	warp_def $d, $d, 9, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F
	warp_def $11, $6, 10, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F
	warp_def $d, $2, 11, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F
	warp_def $3, $8, 12, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F

	; coord events
	db 0

	; bg events
	db 0

	; object events
	db 0

