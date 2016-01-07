RocketHideout4_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 0
	; dbw 1, RocketHideout4_TurnOnLights


RocketHideout4_TurnOnLights:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalse RocketHideout4_DontTurnOnLights
	writecode VAR_TIMEOFDAY, 1
	loadvar wd846, %10000000
	special UpdateTimePals
	loadvar wd846, %00000000
RocketHideout4_DontTurnOnLights:
	return	
; <scripts go here>

; <text goes here>

RocketHideout4_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 4
	warp_def 03, 27, 2, GROUP_BATTLE_TENT_GENERATOR, MAP_BATTLE_TENT_GENERATOR ;to generator upper left
	warp_def 09, 27, 3, GROUP_BATTLE_TENT_GENERATOR, MAP_BATTLE_TENT_GENERATOR ;to generator lower left
	warp_def 20, 13, 2, GROUP_ROCKET_HIDEOUT_3, MAP_ROCKET_HIDEOUT_3 ;to b3 rocket maze lower stairs left
	warp_def 2, 11, 1, GROUP_ROCKET_HIDEOUT_3, MAP_ROCKET_HIDEOUT_3 ;to b3 rocket maze upper stairs left

	; coord events
	db 0

	; bg events
	db 0

	; object events
	db 0

