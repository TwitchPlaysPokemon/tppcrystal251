BattleTentGenerator_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 1
	
	dbw 1, MapBattleTentGeneratorSwitchScript5

; <scripts go here>
MapBattleTentGeneratorSwitchScript5:
	; checkevent EVENT_RESTORED_POWER_TO_KANTO
	; iffalse MapBattleTentGeneratorSwitchScript6
	; writecode VAR_TIMEOFDAY, 1
	; loadvar wd846, %10000000
	; special UpdateTimePals
	; loadvar wd846, %00000000
; MapBattleTentGeneratorSwitchScript6:
	checkevent EVENT_TURNED_ON_BATTLE_TENT_GENERATOR
	iffalse MapBattleTentGeneratorSwitchScript8
	changeblock $a, $b, $7
	changeblock $a, $c, $7
MapBattleTentGeneratorSwitchScript8:
	return

MapBattleTentGeneratorSwitchScript1:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalse MapBattleTentGeneratorSwitchScript4
	playsound SFX_BOOT_PC
	loadfont
	checkevent EVENT_TURNED_ON_BATTLE_TENT_GENERATOR
	iftrue MapBattleTentGeneratorSwitchScript3
	writetext MapBattleTentGeneratorSwitchText1
	yesorno
	iffalse MapBattleTentGeneratorSwitchScript7
	playsound SFX_PUSH_BUTTON
	pause 15
	playsound SFX_ENTER_DOOR
	changeblock $a, $b, $7
	changeblock $a, $c, $7
	setevent EVENT_TURNED_ON_BATTLE_TENT_GENERATOR
	writetext MapBattleTentGeneratorSwitchText2
MapBattleTentGeneratorSwitchScript2:
	waitbutton
MapBattleTentGeneratorSwitchScript7:
	closetext
	end

MapBattleTentGeneratorSwitchScript3:
	writetext MapBattleTentGeneratorSwitchText3
	jump MapBattleTentGeneratorSwitchScript2
	
MapBattleTentGeneratorSwitchScript4:
	jumptext MapBattleTentGeneratorSwitchText4
	
MapBattleTentGeneratorRandomPCScript1:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalse MapBattleTentGeneratorSwitchScript4
	jumptext MapBattleTentGeneratorRandomPCText

; <text goes here>

MapBattleTentGeneratorSwitchText1:
	text "BATTLE TENT"
	line "GENERATOR"
	cont "CONTROL PANEL"
	
	para "GENERATOR STATUS:"
	line "OFFLINE"
	
	para "TURN ON GENERATOR?"
	done
	
MapBattleTentGeneratorSwitchText2:
	text "BATTLE TENT"
	line "GENERATOR"
	cont "STARTUP OKAY"
	
	para "ADMIN ACCESS"
	line "DOOR UNLOCKED"
	done
	
MapBattleTentGeneratorSwitchText3:
	text "BATTLE TENT"
	line "GENERATOR"
	cont "CONTROL PANEL"
	
	para "GENERATOR STATUS:"
	line "NORMAL"
	done

MapBattleTentGeneratorSwitchText4:
	text $56, " ", $56, " ", $56
	line "It won't turn on."
	done
	
MapBattleTentGeneratorRandomPCText:
	text "Various letters"
	line "and numbers appear"
	cont "on the screen."
	
	para "It's impossible to"
	line "decipher."
	done
	
BattleTentGenerator_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 3
	warp_def 14, 13, 3, GROUP_BATTLE_TENT_RUINS, MAP_BATTLE_TENT_RUINS ;to b tent upper ruins
	warp_def 08, 1, 1, GROUP_ROCKET_HIDEOUT_4, MAP_ROCKET_HIDEOUT_4 ;to b4 rocket maze lower stairs right
	warp_def 14, 1, 2, GROUP_ROCKET_HIDEOUT_4, MAP_ROCKET_HIDEOUT_4 ;to b4 rocket maze upper office right

	; coord events
	db 0

	; bg events
	db 2
	signpost $4, $e, 0, MapBattleTentGeneratorSwitchScript1
	signpost $4, $0, 0, MapBattleTentGeneratorRandomPCScript1

	; object events
	db 0

