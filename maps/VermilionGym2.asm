VermilionGym2_MapScriptHeader:

.Callbacks
	db 1
	dbw 5, .CheckTriggers

.Triggers
	db 3
	dw .Trigger0, 0
	dw .Trigger1, 0
	dw .Trigger2, 0

.CheckTriggers
	checktriggers
	if_equal 2, .open_all_doors
	dotrigger $0
	return

.open_all_doors
	changemap VermilionGym2Off_BlockData
	return

.Trigger0
	end
.Trigger1
	end
.Trigger2
	end

VermilionGymRematch_SwitchTrigger0:
	playsound SFX_PUSH_BUTTON
	waitsfx
	refreshscreen $0
	changemap VermilionGym2Blue_BlockData
	closetext
	playsound SFX_WALL_OPEN
	waitsfx
	dotrigger $1
	end

VermilionGymRematch_SwitchTrigger1:
	playsound SFX_PUSH_BUTTON
	waitsfx
	refreshscreen $0
	changemap VermilionGym2Red_BlockData
	closetext
	playsound SFX_WALL_OPEN
	waitsfx
	dotrigger $0
	end

VermilionGym2_MapEventHeader:
	db 0, 0
; warps
	db 2
	warp_def 27, 9, 7, GROUP_VERMILION_CITY, MAP_VERMILION_CITY
	warp_def 27, 10, 7, GROUP_VERMILION_CITY, MAP_VERMILION_CITY

; xy triggers
	db 11
	xy_trigger 0, 25,  0, $0, VermilionGymRematch_SwitchTrigger0, $0, $0
	xy_trigger 0, 21,  2, $0, VermilionGymRematch_SwitchTrigger0, $0, $0
	xy_trigger 0, 17, 13, $0, VermilionGymRematch_SwitchTrigger0, $0, $0
	xy_trigger 0, 21, 18, $0, VermilionGymRematch_SwitchTrigger0, $0, $0
	xy_trigger 0,  9,  9, $0, VermilionGymRematch_SwitchTrigger0, $0, $0
	xy_trigger 0,  5, 17, $0, VermilionGymRematch_SwitchTrigger0, $0, $0
	xy_trigger 1, 21,  0, $0, VermilionGymRematch_SwitchTrigger1, $0, $0
	xy_trigger 1, 17,  1, $0, VermilionGymRematch_SwitchTrigger1, $0, $0
	xy_trigger 1, 25, 16, $0, VermilionGymRematch_SwitchTrigger1, $0, $0
	xy_trigger 1, 13, 18, $0, VermilionGymRematch_SwitchTrigger1, $0, $0
	xy_trigger 1,  5,  9, $0, VermilionGymRematch_SwitchTrigger1, $0, $0

; signposts
	db 2
	signpost 25,  8, $0, MapVermilionGymSignpost16Script
	signpost 25, 11, $0, MapVermilionGymSignpost16Script

; people events
	db 7
	person_event SPRITE_SURGE, 5, 17, $6, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, -1
	person_event SPRITE_GENTLEMAN, 8, 8, $6, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, -1
	person_event SPRITE_ROCKER, 30, 5, $7, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, -1
	person_event SPRITE_FISHER, 29, 23, $8, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, -1
	person_event SPRITE_SUPER_NERD, 21, 14, $a, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, -1
	person_event SPRITE_COOLTRAINER_M, 8, 24, $6, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, -1
	person_event SPRITE_GYM_GUY, 29, 14, $6, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, -1
