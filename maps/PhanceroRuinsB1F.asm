PhanceroRuinsB1F_MapScriptHeader:
	db 0
	db 1
	dbw 1, PuzzleCheck_PhanceroRuinsB1F
	
PuzzleCheck_PhanceroRuinsB1F:
	checkevent EVENT_SOLVED_ARTICUNO_PUZZLE
	iffalse PuzzleCheck2_PhanceroRuinsB1F
	changeblock 7, 5, $1b
	changeblock 8, 5, $1c
PuzzleCheck2_PhanceroRuinsB1F:
	checkevent EVENT_SOLVED_ZAPDOS_PUZZLE
	iffalse PuzzleCheck3_PhanceroRuinsB1F
	changeblock 3, 13, $1b
	changeblock 4, 13, $1c
PuzzleCheck3_PhanceroRuinsB1F:
	checkevent EVENT_SOLVED_MOLTRES_PUZZLE
	iffalse PuzzleCheck4_PhanceroRuinsB1F
	changeblock 11, 13, $1b
	changeblock 12, 13, $1c
PuzzleCheck4_PhanceroRuinsB1F:
	copybytetovar UnlockedUnowns
	if_less_than $7f, PuzzleCheck5_PhanceroRuinsB1F
	changeblock 7, 9, $2f
PuzzleCheck5_PhanceroRuinsB1F:
	return
	
Script_PhanceroRuinsB1FStatue:
	jumptext Text_PhanceroRuinsB1FStatue
	
Script_ArticunoPuzzle:
	checkevent EVENT_SOLVED_ARTICUNO_PUZZLE
	iftrue Script_ThereWasSomethingHere_PhanceroB1F
	refreshscreen $0
	writebyte $4
	special Functionc360
	loadmovesprites
	iftrue DisappearArticunoPhanceroB1F
	end
	
Script_ArticunoPuzzleDescription:
	checkevent EVENT_SOLVED_ARTICUNO_PUZZLE
	iftrue Script_ThereWasSomethingHere_PhanceroB1F
	jumptext Text_ArticunoPuzzleDescription
	
DisappearArticunoPhanceroB1F:
	setevent EVENT_SOLVED_ARTICUNO_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_5
	earthquake 30
	showemote $0, $0, 15
	changeblock 7, 5, $1b
	changeblock 8, 5, $1c
	reloadmappart
	playsound SFX_STRENGTH
	earthquake 80
	loadfont
	writetext Text_PuzzleVanished_PhanceroRuinsB1F
	jump CheckAllPuzzles_PhanceroRuinsB1F
	
Script_ZapdosPuzzle:
	checkevent EVENT_SOLVED_ZAPDOS_PUZZLE
	iftrue Script_ThereWasSomethingHere_PhanceroB1F
	refreshscreen $0
	writebyte $5
	special Functionc360
	loadmovesprites
	iftrue DisappearZapdosPhanceroB1F
	end
	
Script_ZapdosPuzzleDescription:
	checkevent EVENT_SOLVED_ZAPDOS_PUZZLE
	iftrue Script_ThereWasSomethingHere_PhanceroB1F
	jumptext Text_ZapdosPuzzleDescription
	
DisappearZapdosPhanceroB1F:
	setevent EVENT_SOLVED_ZAPDOS_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_6
	earthquake 30
	showemote $0, $0, 15
	changeblock 3, 13, $1b
	changeblock 4, 13, $1c
	reloadmappart
	playsound SFX_STRENGTH
	earthquake 80
	loadfont
	writetext Text_PuzzleVanished_PhanceroRuinsB1F
	jump CheckAllPuzzles_PhanceroRuinsB1F

	
Script_MoltresPuzzle:
	checkevent EVENT_SOLVED_MOLTRES_PUZZLE
	iftrue Script_ThereWasSomethingHere_PhanceroB1F
	refreshscreen $0
	writebyte $6
	special Functionc360
	loadmovesprites
	iftrue DisappearMoltresPhanceroB1F
	end
	
Script_MoltresPuzzleDescription:
	checkevent EVENT_SOLVED_MOLTRES_PUZZLE
	iftrue Script_ThereWasSomethingHere_PhanceroB1F
	jumptext Text_MoltresPuzzleDescription
	
DisappearMoltresPhanceroB1F:
	setevent EVENT_SOLVED_MOLTRES_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_7
	earthquake 30
	showemote $0, $0, 15
	changeblock 11, 13, $1b
	changeblock 12, 13, $1c
	reloadmappart
	playsound SFX_STRENGTH
	earthquake 80
	loadfont
	writetext Text_PuzzleVanished_PhanceroRuinsB1F
CheckAllPuzzles_PhanceroRuinsB1F:
	copybytetovar UnlockedUnowns
	if_not_equal $7f, B2FUnlockEnd_PhanceroRuinsB1F
	keeptextopen
	writetext Text_NextLevelUnlocked
	changeblock 7, 9, $2f
	playsound SFX_ENTER_DOOR
	pause 10
B2FUnlockEnd_PhanceroRuinsB1F:
	closetext
	loadmovesprites
	end
	
Script_ThereWasSomethingHere_PhanceroB1F:
	jumptext Text_ThereWasSomethingHere_PhanceroB1F
	
Text_PhanceroRuinsB1FStatue:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done
	
Text_PuzzleVanished_PhanceroRuinsB1F:
	text "The puzzle disap-"
	line "peared!"
	done

Text_NextLevelUnlocked:
	text "A hole opened in"
	line "the floor!"
	done

Text_ThereWasSomethingHere_PhanceroB1F:
	text "Whatever was here"
	line "before is gone."
	done

Text_ArticunoPuzzleDescription:
	text "A chilling bird"
	line "that freezes the"
	cont "air around it."
	done

Text_ZapdosPuzzleDescription:
	text "An electrifying"
	line "bird that sends"
	cont "lightning bolts"
	cont "when it flaps its"
	cont "wings."
	done
	
Text_MoltresPuzzleDescription:
	text "A fiery bird that"
	line "lights up the"
	cont "night sky."
	done
	
PhanceroRuinsB1F_MapEventHeader:
	db 0,0
	db 2
	warp_def 14, 7, 10, GROUP_RUINS_OF_ALPH_INNER_CHAMBER, MAP_RUINS_OF_ALPH_INNER_CHAMBER
	warp_def 9, 7, 1, GROUP_PHANCERO_RUINS_B2F, MAP_PHANCERO_RUINS_B2F
	db 0
	db 12
	signpost 5, 6, 0, Script_PhanceroRuinsB1FStatue
	signpost 4, 7, 1, Script_ArticunoPuzzle
	signpost 4, 8, 1, Script_ArticunoPuzzleDescription
	signpost 5, 9, 0, Script_PhanceroRuinsB1FStatue
	signpost 13, 2, 0, Script_PhanceroRuinsB1FStatue
	signpost 12, 3, 1, Script_ZapdosPuzzle
	signpost 12, 4, 1, Script_ZapdosPuzzleDescription
	signpost 13, 5, 0, Script_PhanceroRuinsB1FStatue
	signpost 13, 10, 0, Script_PhanceroRuinsB1FStatue
	signpost 12, 11, 1, Script_MoltresPuzzle
	signpost 12, 12, 1, Script_MoltresPuzzleDescription
	signpost 13, 13, 0, Script_PhanceroRuinsB1FStatue
	db 0
