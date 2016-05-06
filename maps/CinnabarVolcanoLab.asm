CinnabarVolcanoLab_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 1
	dbw 1, AlreadyGotResearchNotesCheck

AlreadyGotResearchNotesCheck:
	checkitem RESEARCHNOTE
  	iftrue .dont_close_chamber
	changeblock 8, 10, $b2
.dont_close_chamber
	disappear $3
	disappear $4
	return

SimonScript2_CinnabarVolcanoB3F
	faceplayer
	loadfont
	writetext SimonText2_CinnabarVolcanoB3F
	waitbutton
	closetext
	end

PickUpResearchNotesScript:
	loadfont
	giveitem RESEARCHNOTE, 1
	iffalse .fail
	disappear $2
	checkevent EVENT_BLUE_REMATCH
	iffalse .skip
	setevent EVENT_COOLTRAINER_BLOCKING_CERULEAN_CAVE
.skip
	writetext GotResearchNotesText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
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
	waitsfx
	appear $4
	refreshscreen 0
	cry MEWTWO
	waitsfx
	showemote $0, $3, 15
	loadfont
	writetext SimonText2_Lab
	waitbutton
	closetext
	spriteface $3, RIGHT
	follow $3, $4
	playsound SFX_TACKLE
	applymovement $3, MoveSimonToLeft
	waitsfx
	applymovement $0, MovePlayerUp
	pause 20
	spriteface $3, DOWN
	loadfont
	writetext SimonText3_Lab
	waitbutton
	closetext
	playsound SFX_WARP_FROM
	special Special_FadeToBlack
	special Functiond91
	disappear $4
	special Function8c0ab
	waitsfx
	spriteface $3, RIGHT
	showemote $0, $3, 15
	;battle and other dialogue
	special DeleteSavedMusic
	special RestartMapMusic
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
	text "AAAAAAAHHH!" ; subtle nod to a magmar we caught in AR
	done

SimonText3_Lab:
	text "What? You again!"

	para "Help me out here,"
	line "kid!"
	done
	;move this to his post event text before he leaves
	;para "I mentioned ear-"
	;line "lier?"

	;para "It was on this"
	;line "very island."

	;para "I like to believe"
	;line "my partner made it"

	;para "out before the"
	;line "volcano blew."

	;para "But there's no"
	;line "trace of the"

	;para "mansion, and no"
	;line "trace of him."

	;; Simon doesn't give you the notes anymore. Maybe put something else here?
	; para "All I have left"
	; line "are these old"

	; para "RESEARCH NOTES"
	; line "I swiped from this"

	; para "old coot on the"
	; line "way in."

	; para "Take them back."

	; para "Just take them."

	; para "<PLAY_G> was"
	; line "given RESEARCH"
	; cont "NOTES."
	done

GotResearchNotesText:
	text "<PLAYER> found"
	line "RESEARCHNOTE!"
	done

TooFullForResearchNotes:
	text "<PLAYER> found"
	line "RESEARCHNOTE!"

	para "But the bag is"
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

MoveSimonToCapsule:
	slow_step_right
	step_end

MoveSimonToLeft:
	fix_facing
	step_left
	remove_fixed_facing
	step_end

MovePlayerUp:
	step_up
	step_end

CinnabarVolcanoLab_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 1
	warp_def  0, 16,  2, GROUP_CINNABAR_VOLCANO_HALLWAY, MAP_CINNABAR_VOLCANO_HALLWAY ; hallway

	; coord events
	db 0

	; bg events
	db 0

	; object events
	db 3
	person_event SPRITE_POKEDEX, 17, 11, $1, 0, 0, -1, -1, 0, 0, 0, PickUpResearchNotesScript, -1 ;EVENT_GOT_RESEARCH_NOTES
	person_event SPRITE_PHARMACIST, 12, 11, $3, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, SimonScript2_CinnabarVolcanoB3F, 0
	person_event SPRITE_MONSTER, 14, 13, $1, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, 0
