CinnabarVolcanoB3F_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 2
	dbw 1, CinnabarVolcanoB3F_CheckBlocks
	dbw 2, SimonCheck_CinnabarVolcanoB3F1

CinnabarVolcanoB3F_CheckBlocks:
	checkevent EVENT_MOLTRES_BOULDER_1c
	iftrue CinnabarVolcanoB3F_CheckBlocks_Not1
	checkevent EVENT_MOLTRES_BOULDER_2c
	iftrue CinnabarVolcanoB3F_CheckBlocks_1_Not2
	checkevent EVENT_MOLTRES_BOULDER_3c
	iftrue CinnabarVolcanoB3F_CheckBlocks_1_2_Not3
	checkevent EVENT_MOLTRES_BOULDER_4c
	iftrue CinnabarVolcanoB3F_CheckBlocks_1_2_3_Not4
	changemap CinnabarVolcanoB3F_Bld1234_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_1_2_3_Not4:
	changemap CinnabarVolcanoB3F_Bld123_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_1_2_Not3:
	checkevent EVENT_MOLTRES_BOULDER_4c
	iftrue CinnabarVolcanoB3F_CheckBlocks_1_2_Not3_Not4
	changemap CinnabarVolcanoB3F_Bld124_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_1_2_Not3_Not4:
	changemap CinnabarVolcanoB3F_Bld12_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_1_Not2:
	checkevent EVENT_MOLTRES_BOULDER_3c
	iftrue CinnabarVolcanoB3F_CheckBlocks_1_Not2_Not3
	checkevent EVENT_MOLTRES_BOULDER_4c
	iftrue CinnabarVolcanoB3F_CheckBlocks_1_Not2_3_Not4
	changemap CinnabarVolcanoB3F_Bld134_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_1_Not2_3_Not4:
	changemap CinnabarVolcanoB3F_Bld13_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_1_Not2_Not3:
	checkevent EVENT_MOLTRES_BOULDER_4c
	iftrue CinnabarVolcanoB3F_CheckBlocks_1_Not2_Not3_Not4
	changemap CinnabarVolcanoB3F_Bld14_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_1_Not2_Not3_Not4:
	changemap CinnabarVolcanoB3F_Bld1_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_Not1:
	checkevent EVENT_MOLTRES_BOULDER_2c
	iftrue CinnabarVolcanoB3F_CheckBlocks_Not1_Not2
	checkevent EVENT_MOLTRES_BOULDER_3c
	iftrue CinnabarVolcanoB3F_CheckBlocks_Not1_2_Not3
	checkevent EVENT_MOLTRES_BOULDER_4c
	iftrue CinnabarVolcanoB3F_CheckBlocks_Not1_2_3_Not4
	changemap CinnabarVolcanoB3F_Bld234_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_Not1_2_3_Not4:
	changemap CinnabarVolcanoB3F_Bld23_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_Not1_2_Not3:
	checkevent EVENT_MOLTRES_BOULDER_4c
	iftrue CinnabarVolcanoB3F_CheckBlocks_Not1_2_Not3_Not4
	changemap CinnabarVolcanoB3F_Bld24_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_Not1_2_Not3_Not4:
	changemap CinnabarVolcanoB3F_Bld2_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_Not1_Not2:
	checkevent EVENT_MOLTRES_BOULDER_3c
	iftrue CinnabarVolcanoB3F_CheckBlocks_Not1_Not2_Not3
	checkevent EVENT_MOLTRES_BOULDER_4c
	iftrue CinnabarVolcanoB3F_CheckBlocks_Not1_Not2_3_Not4
	changemap CinnabarVolcanoB3F_Bld34_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_Not1_Not2_3_Not4:
	changemap CinnabarVolcanoB3F_Bld3_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_Not1_Not2_Not3:
	checkevent EVENT_MOLTRES_BOULDER_4c
	iftrue CinnabarVolcanoB3F_CheckBlocks_Not1_Not2_Not3_Not4
	changemap CinnabarVolcanoB3F_Bld4_BlockData
CinnabarVolcanoB3F_CheckBlocks_Not1_Not2_Not3_Not4:
	return

SimonScript1_CinnabarVolcanoB3F:
	faceplayer
	loadfont
	checkevent EVENT_GOT_RESEARCH_NOTES
	iftrue SimonScript2_CinnabarVolcanoB3F
	writetext SimonText1_CinnabarVolcanoB3F
	giveitem RESEARCHNOTE, 1
	iffalse .fail
	playsound SFX_ITEM
	waitsfx
	setevent EVENT_GOT_RESEARCH_NOTES
	waitbutton
	closetext
	end
.fail
	buttonsound
	writetext TooFullForResearchNotes
	waitbutton
	closetext
	end

SimonScript2_CinnabarVolcanoB3F
	writetext SimonText2_CinnabarVolcanoB3F
	waitbutton
	closetext
	end

SimonCheck_CinnabarVolcanoB3F1:
	checkevent EVENT_BEAT_SIMON_1
	iffalse SimonCheck_CinnabarVolcanoB3FEnd
	checkevent EVENT_BEAT_SIMON_2
	iffalse SimonCheck_CinnabarVolcanoB3FEnd
	checkevent EVENT_BEAT_SIMON_3
	iffalse SimonCheck_CinnabarVolcanoB3FEnd
	checkevent EVENT_BEAT_SIMON_4
	iffalse SimonCheck_CinnabarVolcanoB3FEnd
	checkevent EVENT_BEAT_SIMON_5
	iffalse SimonCheck_CinnabarVolcanoB3FEnd
	checkevent EVENT_BEAT_SIMON_6
	iffalse SimonCheck_CinnabarVolcanoB3FEnd
	checkevent EVENT_SAW_MEW_IN_GARDEN
	iffalse SimonCheck_CinnabarVolcanoB3FEnd
	appear $7
	return

SimonCheck_CinnabarVolcanoB3FEnd:
	disappear $7
	return


; <scripts go here>

MoltresScript1:
	faceplayer
	loadfont
	writetext MoltresText1
	cry MOLTRES
	waitbutton
	closetext
	loadpokedata MOLTRES, 95
	writecode VAR_BATTLETYPE, BATTLETYPE_KANTOLEGEND
	startbattle
	writebyte MOLTRES
	special SpecialMonCheck
	iffalse DontKillMoltres
	disappear $2
DontKillMoltres:
	returnafterbattle
	end

BoulderScript_CinnabarVolcanoB3F:
	jumptext BoulderText_CinnabarVolcanoB3F

BoulderText_CinnabarVolcanoB3F:
	text "The boulder is"
	line "blocking the lava"

	para "flow. Better not"
	line "touch it!"
	done

MoltresText1:
	text "Gyaoooh!"
	done

SimonText1_CinnabarVolcanoB3F:
	text "Man, it's hot down"
	line "here."

	para "Oh, it's you"
	line "again."

	para "Remember that ab-"
	line "andoned building"

	para "I mentioned ear-"
	line "lier?"

	para "It was on this"
	line "very island."

	para "I like to believe"
	line "my partner made it"

	para "out before the"
	line "volcano blew."

	para "But there's no"
	line "trace of the"

	para "mansion, and no"
	line "trace of him."

	para "All I have left"
	line "are these old"
	para "RESEARCH NOTES"
	line "I swiped from this"
	para "old coot on the"
	line "way in."

	para "Take them back."

	para "Just take them."

	para "<PLAY_G> was"
	line "given RESEARCH"
	cont "NOTES."
	done

TooFullForResearchNotes:
	text "But the bag is"
	line "full<...>"
	done

SimonText2_CinnabarVolcanoB3F:
	text "I want to be"
	line "alone for a while."
	done
; <text goes here>

CinnabarVolcanoB3F_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 4
	warp_def   5, 9,  9, GROUP_CINNABAR_VOLCANO_B2F, MAP_CINNABAR_VOLCANO_B2F ; ladder top
	warp_def  25, 3, 10, GROUP_CINNABAR_VOLCANO_B2F, MAP_CINNABAR_VOLCANO_B2F ; ladder bottom
	warp_def  27, 3, 11, GROUP_CINNABAR_VOLCANO_B2F, MAP_CINNABAR_VOLCANO_B2F ; fall spot
	warp_def   1, 9,  1, GROUP_CINNABAR_VOLCANO_HALLWAY, MAP_CINNABAR_VOLCANO_HALLWAY ; hallway
	; coord events
	db 0

	; bg events
	db 0

	; object events
	db 6
	person_event SPRITE_BIRD, 7, 23, $0, 0, 0, -1, -1, 0, 0, 0, MoltresScript1, EVENT_FOUGHT_MOLTRES
    person_event SPRITE_BOULDER, 29, 12, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScript_CinnabarVolcanoB3F, EVENT_MOLTRES_BOULDER_1c
    person_event SPRITE_BOULDER, 30, 34, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScript_CinnabarVolcanoB3F, EVENT_MOLTRES_BOULDER_2c
    person_event SPRITE_BOULDER, 18, 18, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScript_CinnabarVolcanoB3F, EVENT_MOLTRES_BOULDER_3c
	person_event SPRITE_BOULDER, 17, 32, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScript_CinnabarVolcanoB3F, EVENT_MOLTRES_BOULDER_4c
	person_event SPRITE_PHARMACIST, 8, 14, $9, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, SimonScript1_CinnabarVolcanoB3F, EVENT_SIMON_IN_VOLCANO

