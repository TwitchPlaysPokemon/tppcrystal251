PhanceroRuinsB2F_MapScriptHeader:
	db 0
	db 1
	dbw 1, Script_CheckPhanceroPuzzleSolved
	
Script_CheckPhanceroPuzzleSolved:
	checkevent EVENT_SOLVED_PHANCERO_PUZZLE
	iffalse Script_PhanceroPuzzleNotSolved
	changeblock 2, 4, $18
	changeblock 4, 4, $19
Script_PhanceroPuzzleNotSolved:
	return
	
Script_PhanceroRuinsB2FStatue:
	jumptext Text_PhanceroRuinsB2FStatue
	
Script_PhanceroPuzzle:
	refreshscreen $0
	writebyte $7
	special Functionc360
	loadmovesprites
	iftrue OpenHolePhanceroB2F
	end
	
OpenHolePhanceroB2F:
	setevent EVENT_SOLVED_PHANCERO_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_8
	earthquake 30
	showemote $0, $0, 15
	changeblock $2, $4, $18
	changeblock $4, $4, $19
	reloadmappart
	playsound SFX_STRENGTH
	earthquake 80
	applymovement $0, MovementData_RunInPlaceB2F
	playsound SFX_KINESIS
	waitbutton
	pause 20
	warpcheck
	end

Script_PhanceroPuzzleDescription:
	jumptext Text_PhanceroPuzzleDescription
	
MovementData_RunInPlaceB2F: ; 0x587fe
	db $59 ; movement
	step_end
	
Text_PhanceroRuinsB2FStatue:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done
	
Text_PhanceroPuzzleDescription:
	text "A #MON that"
	line "defies all logic."
	
	para "Highly corrupt, it"
	line "was banished to"
	cont "the murky depths,"
	cont "and sealed away."
	done
	
PhanceroRuinsB2F_MapEventHeader:
	db 0,0
	db 3
	warp_def 8, 3, 2, GROUP_PHANCERO_RUINS_B1F, MAP_PHANCERO_RUINS_B1F
	warp_def 5, 3, 1, GROUP_PHANCERO_RUINS_B3F, MAP_PHANCERO_RUINS_B3F
	warp_def 5, 4, 1, GROUP_PHANCERO_RUINS_B3F, MAP_PHANCERO_RUINS_B3F
	db 0
	db 4
	signpost 5, 2, 0, Script_PhanceroRuinsB2FStatue
	signpost 4, 3, 1, Script_PhanceroPuzzle
	signpost 4, 4, 1, Script_PhanceroPuzzleDescription
	signpost 5, 5, 0, Script_PhanceroRuinsB2FStatue
	db 0
