MewIslandEntrance_MapScriptHeader:
	; trigger count
	db 0

	; callback count 
	db 0
	
MewIslandSign:
	jumptext MewIslandSign_Text
	
MewIslandSign_Text: ; 0x1aaa6f
	text "This sign is"
	line "illegible."
	done

MewIslandEntrance_MapEventHeader: 
	; filler
	db 0, 0

	db 3
	warp_def $1b, $9, 1, GROUP_MEWISLANDUNDERGROUND, MAP_MEWISLANDUNDERGROUND
	warp_def $1b, $a, 2, GROUP_MEWISLANDUNDERGROUND, MAP_MEWISLANDUNDERGROUND
	warp_def $5, $c, 1, GROUP_MEWISLANDF1, MAP_MEWISLANDF1

	; xy triggers
	db 0

	; signposts
	db 1 
	signpost $F, $5, $0, MewIslandSign

	; people-events
	db 0
	
