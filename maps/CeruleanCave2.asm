CeruleanCave2_MapScriptHeader: ; 0x1ac2ba
	; trigger count
	db 0

	; callback count
	db 0 
	
CeruleanCave2_Rock:  
	jumpstd smashrock
	
CeruleanCave2_Item1: 
	db PP_UP, 1
	
CeruleanCave2_Item2: 
	db CALCIUM, 1
	
CeruleanCave2_Item3: 
	db FULL_HEAL, 1
	
CeruleanCave2_Item4: 
	db CONFUSEGUARD, 1

CeruleanCave2_MapEventHeader: 
	; filler
	db 0, 0

	db 6
	warp_def $b, $f, 3, GROUP_CERULEANCAVE1, MAP_CERULEANCAVE1
	warp_def $1, $13, 4, GROUP_CERULEANCAVE1, MAP_CERULEANCAVE1
	warp_def $6, $8, 5, GROUP_CERULEANCAVE1, MAP_CERULEANCAVE1
	warp_def $1, $3, 6, GROUP_CERULEANCAVE1, MAP_CERULEANCAVE1
	warp_def $f, $b, 7, GROUP_CERULEANCAVE1, MAP_CERULEANCAVE1
	warp_def $1, $19, 8, GROUP_CERULEANCAVE1, MAP_CERULEANCAVE1

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 8
	person_event SPRITE_ROCK, $b + 4, $11 + 4, $18, 0, 0, -1, -1, 0, 0, 0, CeruleanCave2_Rock, -1
	person_event SPRITE_ROCK, $9 + 4, $a + 4, $18, 0, 0, -1, -1, 0, 0, 0, CeruleanCave2_Rock, -1
	person_event SPRITE_ROCK, $2 + 4, $0 + 4, $18, 0, 0, -1, -1, 0, 0, 0, CeruleanCave2_Rock, -1
	person_event SPRITE_ROCK, $5 + 4, $4 + 4, $18, 0, 0, -1, -1, 0, 0, 0, CeruleanCave2_Rock, -1
	
	person_event SPRITE_POKE_BALL, $3 + 4, $1b + 4, $1, 0, 0, -1, -1, 0, 1, 0, CeruleanCave2_Item1, EVENT_ITEM_CERULEANCAVE2_PPUP
	person_event SPRITE_POKE_BALL, $0 + 4, $9 + 4, $1, 0, 0, -1, -1, 0, 1, 0, CeruleanCave2_Item2, EVENT_ITEM_CERULEANCAVE2_CALCIUM
	person_event SPRITE_POKE_BALL, $c + 4, $b + 4, $1, 0, 0, -1, -1, 0, 1, 0, CeruleanCave2_Item3, EVENT_ITEM_CERULEANCAVE2_FULL_HEAL
	person_event SPRITE_POKE_BALL, $f + 4, $1b + 4, $1, 0, 0, -1, -1, 0, 1, 0, CeruleanCave2_Item4, EVENT_ITEM_CERULEANCAVE2_CONFUSEGUARD

