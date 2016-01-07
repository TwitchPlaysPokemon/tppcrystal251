BattleTentRuins_MapScriptHeader: ; -- Required
	; trigger count
	db 0
	
	; callback count
	db 1
	dbw 1, MapBattleTentRuinsTurnOnLights
	
	; callbacks
;	dbw 2, MapBattleTentRuinsBillScript1

; <scripts go here>
MapBattleTentRuinsTurnOnLights
	; checkevent EVENT_RESTORED_POWER_TO_KANTO
	; iffalse MapBattleTentRuinsDontChangeBackDoorTile
	; writecode VAR_TIMEOFDAY, 1
	; loadvar wd846, %10000000
	; special UpdateTimePals
	; loadvar wd846, %00000000
	checkevent EVENT_TURNED_ON_BATTLE_TENT_GENERATOR
	iffalse MapBattleTentRuinsDontChangeBackDoorTile
	changeblock $5, $0, $4
	return

MapBattleTentRuinsDontChangeBackDoorTile:
	changeblock $a, $7, $1
	return

MapBattleTentRuinsDoorScript:
	dw EVENT_TURNED_ON_BATTLE_TENT_GENERATOR
	dw .script
.script
	jumptext MapBattleTentRuinsDoorText
	
MapBattleTentRuinsMonitorScript:
	checkevent EVENT_TURNED_ON_BATTLE_TENT_GENERATOR
	iftrue MapBattleTentRuinsMonitorScript2
	jumptext MapBattleTentRuinsMonitorText1
	
MapBattleTentRuinsMonitorScript2:
	jumptext MapBattleTentRuinsMonitorText2
	

; <text goes here>
MapBattleTentRuinsDoorText:
	text "It's locked..."
	done

MapBattleTentRuinsMonitorText1:
	text "The monitor is"
	line "blank", $56
	done	
MapBattleTentRuinsMonitorText2:
	text "SYSTEM OFFLINE", $56
	done

BattleTentRuins_MapEventHeader: ; -- Required
	db 0, 0 ; Filler
	
	; warps
	db 4
	warp_def $7, $1, 10, GROUP_CELADON_CITY, MAP_CELADON_CITY 
	warp_def $7, $2, 10, GROUP_CELADON_CITY, MAP_CELADON_CITY 
	warp_def $7, $a, 1, GROUP_BATTLE_TENT_GENERATOR, MAP_BATTLE_TENT_GENERATOR
	warp_def $0, $5, 1, GROUP_BATTLE_TENT_BATTLE_ROOM, MAP_BATTLE_TENT_BATTLE_ROOM

	; coord events
	db 0

	; bg events
	db 2
	signpost $0, $5, $0, MapBattleTentRuinsDoorScript
	signpost $4, $4, $0, MapBattleTentRuinsMonitorScript

	; object events
	db 0

