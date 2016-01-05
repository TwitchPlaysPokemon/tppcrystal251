Route23RB_MapScriptHeader:
	db 2
	dw .Trigger0, 0
	dw .Trigger1, 0
	db 0
.Trigger0
	end
.Trigger1
	end

Route23RB_OfficerScript:
	faceplayer
	jump Route23RBScript_Continue

Route23RB_CascadeBadgeCheckTrigger:
	faceperson $2, $0
	faceperson $0, $2
Route23RBScript_Continue:
	loadfont
	checkflag ENGINE_CASCADEBADGE
	iftrue .permit
	writetext _VictoryRoadGuardText1
	waitbutton
	closetext
	spriteface $2, DOWN
	applymovement $0, Movement_PlayerStepsDown_Route23RB
	end

.permit
	writetext _VictoryRoadGuardText2
	playsound SFX_LEVEL_UP
	waitsfx
	buttonsound
	writetext _VictoryRoadGuardText_513a3
	waitbutton
	closetext
	dotrigger $1
	end

Movement_PlayerStepsDown_Route23RB:
	step_down
	step_end

_VictoryRoadGuardText1:
	text "You can pass here"
	line "only if you have"
	cont "the CASCADEBADGE!"

	para "You don't have the"
	line "CASCADEBADGE yet!"

	para "You have to have"
	line "it to get to"
	cont "#MON LEAGUE!"
	done

_VictoryRoadGuardText2:
	text "You can pass here"
	line "only if you have"
	cont "the CASCADEBADGE!"

	para "Oh! That is the"
	line "CASCADEBADGE!"
	done

_VictoryRoadGuardText_513a3:
	text "OK then! Please,"
	line "go right ahead!"
	done

_Route23Text8:
	text "VICTORY ROAD GATE"
	line "- #MON LEAGUE"
	done



Route23RB_MapEventHeader:
	db 0, 0
	db 2
	warp_def $7, $6, 3, GROUP_VICTORY_ROAD_GATE_RB, MAP_VICTORY_ROAD_GATE_RB
	warp_def $7, $7, 4, GROUP_VICTORY_ROAD_GATE_RB, MAP_VICTORY_ROAD_GATE_RB

	db 3
	xy_trigger 0, 4, 5, $0, Route23RB_CascadeBadgeCheckTrigger, 0, 0
	xy_trigger 0, 4, 6, $0, Route23RB_CascadeBadgeCheckTrigger, 0, 0
	xy_trigger 0, 4, 8, $0, Route23RB_CascadeBadgeCheckTrigger, 0, 0

	db 0

	db 1
	person_event SPRITE_OFFICER, 10, 14, $6, 0, 0, -1, -1, 0, 0, 0, Route23RB_OfficerScript, -1
