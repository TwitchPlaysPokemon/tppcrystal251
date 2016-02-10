SilverCaveRoom3_MapScriptHeader: ; 0x18c601
	; trigger count
	db 0

	; callback count
	db 0
; 0x18c603

RedScript_0x18c603: ; 0x18c603
	special Functionc48f
	faceplayer
	loadfont
	writetext UnknownText_0x18c637
	waitbutton
	closetext
	winlosstext UnknownText_0x18c63c, UnknownText_0x18c63c
	loadtrainer RED, 1
	startbattle
	reloadmapmusic
	returnafterbattle
	setevent EVENT_BEAT_AIIIAAB
	special Functionc48f
	loadfont
	writetext UnknownText_0x18c63f
	waitbutton
	closetext
	; special Special_FadeToBlack
	; special Functiond91
	; disappear $2
	; pause 15
	; special Function8c0ab
	; pause 30
	; special HealParty
	; refreshscreen $0
	; credits
	follow $2, $0 ; Player starts to follow Abe
	applymovement $2, Movement_AbeSortaKindaLeadsPlayerIntoRuins ; Anarchy or RIOT
	stopfollow
	disappear $2
	playsound SFX_EXIT_BUILDING
	waitsfx
	applymovement $0, Movement_PlayerEntersRuins
	warpcheck
	end
; 0x18c637

Movement_AbeSortaKindaLeadsPlayerIntoRuins:
	step_up
	step_up
	half_step_right
	half_step_left
	half_step_down
	step_sleep 16
	half_step_down
	step_down
	half_step_right
	step_left
	half_step_up
	half_step_right
	half_step_down
	half_step_left
	step_up
	half_step_up
	half_step_up
	half_step_up
	half_step_up
	step_right
Movement_PlayerEntersRuins:
	step_up
	step_end

UnknownText_0x18c637: ; 0x18c637
	text $56
	line $56
	done
; 0x18c63c

UnknownText_0x18c63c: ; 0x18c63c
	text "wait4baba"
	done
; 0x18c63f

UnknownText_0x18c63f: ; 0x18c63f
	text $56
	line $56
	done
; 0x18c644

SilverCaveRoom3_MapEventHeader: ; 0x18c644
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $21, $9, 2, GROUP_SILVER_CAVE_ROOM_2, MAP_SILVER_CAVE_ROOM_2

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_RED, 14, 13, $7, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, RedScript_0x18c603, EVENT_RED_IN_SILVER_CAVE
; 0x18c65c

