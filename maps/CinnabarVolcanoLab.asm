CinnabarVolcanoLab_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 1
	dbw 2, AlreadyGotResearchNotesCheck	
	
SimonScript2_CinnabarVolcanoB3F
	writetext SimonText2_CinnabarVolcanoB3F
	waitbutton
	closetext
	end

; SimonCheck_CinnabarVolcanoB3F1:
	; checkevent EVENT_BEAT_SIMON_1
	; iffalse SimonCheck_CinnabarVolcanoB3FEnd
	; checkevent EVENT_BEAT_SIMON_2
	; iffalse SimonCheck_CinnabarVolcanoB3FEnd
	; checkevent EVENT_BEAT_SIMON_3
	; iffalse SimonCheck_CinnabarVolcanoB3FEnd
	; checkevent EVENT_BEAT_SIMON_4
	; iffalse SimonCheck_CinnabarVolcanoB3FEnd
	; checkevent EVENT_BEAT_SIMON_5
	; iffalse SimonCheck_CinnabarVolcanoB3FEnd
	; checkevent EVENT_BEAT_SIMON_6
	; iffalse SimonCheck_CinnabarVolcanoB3FEnd
	; checkevent EVENT_SAW_MEW_IN_GARDEN
	; iffalse SimonCheck_CinnabarVolcanoB3FEnd
	; appear $7
	; return

; SimonCheck_CinnabarVolcanoB3FEnd:
	; disappear $7
	; return

AlreadyGotResearchNotesCheck:
	checkitem RESEARCHNOTE
  	iftrue DontShowNotes
	appear $2
	disappear $3
	disappear $4
	changeblock 8, 10, $b2
	return
	
DontShowNotes:
	disappear $2
	return

PickUpResearchNotesScript:
	loadfont
	writetext PickedUpNotesText
	giveitem RESEARCHNOTE, 1
	iffalse .fail
	playsound SFX_ITEM
	waitsfx
	setevent EVENT_GOT_RESEARCH_NOTES
	waitbutton
	closetext
	disappear $2
	;event here
	appear $3
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	applymovement $3, MoveSimonToPath
	spriteface $0, UP
	applymovement $3, MoveSimonToCapsule
	spriteface $3, UP
	loadfont
	writetext SimonText1_Lab
	waitbutton
	closetext
	playmusic MUSIC_NONE
	playsound SFX_2_BOOPS
	waitsfx
	playsound SFX_STRENGTH
	earthquake 10
	refreshscreen 0
	changeblock 8, 10, $b1
	reloadmappart
	appear $4
	waitsfx
	cry MEWTWO
	waitsfx
	showemote $0, $3, 15
	loadfont
	writetext SimonText2_Lab
	waitbutton
	closetext
	applymovement $4, MoveMewtwoForward
	applymovement $3, MoveSimonToLeft
	applymovement $0, MovePlayerUp
	playsound SFX_TACKLE
	waitsfx
	pause 20
	playsound SFX_WARP_FROM
	special Function8c084
	disappear $4
	special Function8c079
	waitsfx
	;battle and other dialogue
	special DeleteSavedMusic
	playmapmusic	
	end
.fail
	buttonsound
	writetext TooFullForResearchNotes
	waitbutton
	closetext
	end
	
PickedUpNotesText:
	text "<PLAY_G> found"
	line "RESEARCH NOTES!"
	done

SimonText1_Lab:
	text "Man, it's hot down"
	line "here<...>"
	
	para "I wonder if<...>"
	done
SimonText2_Lab:
	text "AAAAAAAAH!"
	done

SimonText3_Lab:
	text "Oh, it's you"
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

MoveSimonToPath:
	slow_step_down
	slow_step_down
	slow_step_down
	slow_step_right
	step_end
MoveSimonToCapsule
	slow_step_right
	step_end
	
MoveSimonToLeft
	big_step_left
	step_end
	
MoveMewtwoForward
	big_step_down
	step_end
	
MovePlayerUp
	step_up
	step_end
	
CinnabarVolcanoLab_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 1
	warp_def   0, 16,  2, GROUP_CINNABAR_VOLCANO_HALLWAY, MAP_CINNABAR_VOLCANO_HALLWAY ; hallway

	; coord events
	db 0

	; bg events
	db 0

	; object events
	db 3
	person_event SPRITE_POKEDEX, 17, 11, $0, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, PickUpResearchNotesScript, -1
	person_event SPRITE_PHARMACIST, 12, 11, $0, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, ObjectEvent, 0
	person_event SPRITE_MONSTER, 14, 13, $0, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, 0

