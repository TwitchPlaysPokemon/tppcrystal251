RocketHideout2_MapScriptHeader:
	; triggers
	db 1
	dw RocketHideout2_MapTrigger1, $0000

	; callbacks
	db 0
	; dbw 1, RocketHideout2_TurnOnLights
	


RocketHideout2_MapTrigger1:
	end

RocketHideout2_TurnOnLights:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalse RocketHideout2_DontTurnOnLights
	writecode VAR_TIMEOFDAY, 1
	loadvar wd846, %10000000
	special UpdateTimePals
	loadvar wd846, %00000000
RocketHideout2_DontTurnOnLights:
	return	
	
; <scripts go here>
; Script_RocketHideoutB2F_SpinTile1:
	; applymovement $0, RHB2_spin_left_2_tiles
	; end
	
; Script_RocketHideoutB2F_SpinTile2:
	; applymovement $0, RHB2_spin_right_4_tiles
	; end
	
; Script_RocketHideoutB2F_SpinTile4:
	; applymovement $0, RHB2_spin_up_1_tile
; Script_RocketHideoutB2F_SpinTile3:
	; applymovement $0, RHB2_spin_right_4_tiles
	; jump Script_RocketHideoutB2F_SpinTile12
	
; Script_RocketHideoutB2F_SpinTile6:
	; applymovement $0, RHB2_spin_up_3_tiles
; Script_RocketHideoutB2F_SpinTile5:
	; applymovement $0, RHB2_spin_left_2_tiles
	; end

; Script_RocketHideoutB2F_SpinTile7:
	; applymovement $0, RHB2_spin_right_4_tiles
; Script_RocketHideoutB2F_SpinTile15:
	; applymovement $0, RHB2_spin_down_2_tiles
	; end

; <text goes here>

RocketHideout2_MapEventHeader:
	; filler
	db 0, 0
	
	;warps
	db 4
	warp_def 6, 17, 3, GROUP_ROCKET_HIDEOUT_3, MAP_ROCKET_HIDEOUT_3 ;to b3 rocket maze upper stairs left
	warp_def 13, 26, 4, GROUP_ROCKET_HIDEOUT_3, MAP_ROCKET_HIDEOUT_3 ;to b3 rocket maze lower stairs right
	warp_def 6, 9, 1, GROUP_ROCKET_HIDEOUT_1, MAP_ROCKET_HIDEOUT_1 ;to b1 rocket maze stairs left
	warp_def 14, 21, 2, GROUP_ROCKET_HIDEOUT_1, MAP_ROCKET_HIDEOUT_1 ;to b1 rocket maze stairs right


	; coord events
	db 0
	; db 43
	; xy_trigger 0,  $5,  $4, $0, Script_RocketHideoutB2F_SpinTile1, $0, $0
	; xy_trigger 0,  $7,  $4, $0, Script_RocketHideoutB2F_SpinTile2, $0, $0
	; xy_trigger 0,  $b,  $4, $0, Script_RocketHideoutB2F_SpinTile3, $0, $0
	; xy_trigger 0,  $c,  $4, $0, Script_RocketHideoutB2F_SpinTile4, $0, $0
	; xy_trigger 0,  $f,  $4, $0, Script_RocketHideoutB2F_SpinTile5, $0, $0
	; xy_trigger 0, $12,  $4, $0, Script_RocketHideoutB2F_SpinTile6, $0, $0
	; xy_trigger 0,  $a,  $5, $0, Script_RocketHideoutB2F_SpinTile7, $0, $0
	; xy_trigger 0, $12,  $6, $0, Script_RocketHideoutB2F_SpinTile8, $0, $0
	; xy_trigger 0, $14,  $6, $0, Script_RocketHideoutB2F_SpinTile9, $0, $0
	; xy_trigger 0,  $5,  $8, $0, Script_RocketHideoutB2F_SpinTile10, $0, $0
	; xy_trigger 0,  $8,  $8, $0, Script_RocketHideoutB2F_SpinTile11, $0, $0
	; xy_trigger 0,  $b,  $8, $0, Script_RocketHideoutB2F_SpinTile12, $0, $0
	; xy_trigger 0,  $f,  $8, $0, Script_RocketHideoutB2F_SpinTile13, $0, $0
	; xy_trigger 0, $13,  $8, $0, Script_RocketHideoutB2F_SpinTile14, $0, $0
	; xy_trigger 0,  $a,  $9, $0, Script_RocketHideoutB2F_SpinTile15, $0, $0
	; xy_trigger 0,  $5,  $a, $0, Script_RocketHideoutB2F_SpinTile16, $0, $0
	; xy_trigger 0,  $5,  $a, $0, Script_RocketHideoutB2F_SpinTile17, $0, $0
	; xy_trigger 0,  $6,  $a, $0, Script_RocketHideoutB2F_SpinTile18, $0, $0
	; xy_trigger 0,  $b,  $a, $0, Script_RocketHideoutB2F_SpinTile19, $0, $0
	; xy_trigger 0,  $d,  $a, $0, Script_RocketHideoutB2F_SpinTile20, $0, $0
	; xy_trigger 0,  $f,  $a, $0, Script_RocketHideoutB2F_SpinTile21, $0, $0
	; xy_trigger 0, $15,  $a, $0, Script_RocketHideoutB2F_SpinTile22, $0, $0
	; xy_trigger 0,  $a,  $b, $0, Script_RocketHideoutB2F_SpinTile23, $0, $0
	; xy_trigger 0,  $c,  $b, $0, Script_RocketHideoutB2F_SpinTile24, $0, $0
	; xy_trigger 0,  $e,  $b, $0, Script_RocketHideoutB2F_SpinTile25, $0, $0
	; xy_trigger 0,  $5,  $c, $0, Script_RocketHideoutB2F_SpinTile26, $0, $0
	; xy_trigger 0,  $7,  $c, $0, Script_RocketHideoutB2F_SpinTile27, $0, $0
	; xy_trigger 0,  $9,  $c, $0, Script_RocketHideoutB2F_SpinTile28, $0, $0
	; xy_trigger 0,  $c,  $c, $0, Script_RocketHideoutB2F_SpinTile29, $0, $0
	; xy_trigger 0,  $6,  $d, $0, Script_RocketHideoutB2F_SpinTile30, $0, $0
	; xy_trigger 0,  $8,  $d, $0, Script_RocketHideoutB2F_SpinTile31, $0, $0
	; xy_trigger 0,  $c,  $d, $0, Script_RocketHideoutB2F_SpinTile32, $0, $0
	; xy_trigger 0,  $e,  $d, $0, Script_RocketHideoutB2F_SpinTile33, $0, $0
	; xy_trigger 0,  $f,  $d, $0, Script_RocketHideoutB2F_SpinTile34, $0, $0
	; xy_trigger 0, $12,  $d, $0, Script_RocketHideoutB2F_SpinTile35, $0, $0
	; xy_trigger 0, $13,  $d, $0, Script_RocketHideoutB2F_SpinTile36, $0, $0
	; xy_trigger 0,  $d,  $e, $0, Script_RocketHideoutB2F_SpinTile37, $0, $0
	; xy_trigger 0,  $c,  $f, $0, Script_RocketHideoutB2F_SpinTile38, $0, $0
	; xy_trigger 0,  $a, $10, $0, Script_RocketHideoutB2F_SpinTile39, $0, $0
	; xy_trigger 0,  $c, $10, $0, Script_RocketHideoutB2F_SpinTile40, $0, $0
	; xy_trigger 0,  $e, $10, $0, Script_RocketHideoutB2F_SpinTile41, $0, $0
	; xy_trigger 0,  $6, $11, $0, Script_RocketHideoutB2F_SpinTile42, $0, $0
	; xy_trigger 0,  $7, $11, $0, Script_RocketHideoutB2F_SpinTile43, $0, $0

	; bg events
	db 0

	; object events
	db 0

