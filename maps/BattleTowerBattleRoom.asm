BattleTowerBattleRoom_MapScriptHeader: ; 0x9f40f
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x9f419, $0000
	dw UnknownScript_0x9f420, $0000

	; callback count
	db 0
; 0x9f419

UnknownScript_0x9f419: ; 0x9f419
	disappear $2
	priorityjump UnknownScript_0x9f421
	dotrigger $1
; 0x9f420

UnknownScript_0x9f420: ; 0x9f420
	end
; 0x9f421

UnknownScript_0x9f421: ; 0x9f421
	applymovement $0, MovementData_0x9e58c
UnknownScript_0x9f425: ; 0x9f425
	writebyte $2
	special Function170b44
	appear $2
	warpsound
	waitsfx
	applymovement $2, MovementData_0x9e592
	loadfont
	storetext 1
	buttonsound
	closetext
	special Function170215
	special Function8c084
	reloadmap
	if_not_equal $0, UnknownScript_0x9f4c2
	copybytetovar wcf64
	if_equal $7, UnknownScript_0x9f4d9
	applymovement $2, MovementData_0x9e597
	warpsound
	disappear $2
	applymovement $3, MovementData_0x9e59c
	applymovement $0, MovementData_0x9e5a7
	loadfont
	writetext UnknownText_0x9ee92
	waitbutton
	closetext
	playmusic MUSIC_HEAL
	special Function8c084
	special Function1047eb
	pause 60
	special Function8c079
	special RestartMapMusic
	loadfont
	writetext UnknownText_0x9eebc
	yesorno
	iffalse UnknownScript_0x9f483
UnknownScript_0x9f477: ; 0x9f477
	closetext
	applymovement $0, MovementData_0x9e5a9
	applymovement $3, MovementData_0x9e5a1
	jump UnknownScript_0x9f425
; 0x9f483

UnknownScript_0x9f483: ; 0x9f483
	writetext UnknownText_0x9ef5e
	yesorno
	iffalse UnknownScript_0x9f4a3
	writebyte $7
	special Function170687
	writebyte $1f
	special Function170687
	writebyte $3
	special Function170687
	playsound SFX_SAVE
	waitsfx
	special Function8c084
	special Reset
UnknownScript_0x9f4a3: ; 0x9f4a3
	writetext UnknownText_0x9efbf
	yesorno
	iffalse UnknownScript_0x9f477
	writebyte $4
	special Function170687
	writebyte $6
	special Function170687
	closetext
	special Function8c084
	warpfacing $1, GROUP_BATTLE_TOWER_1F, MAP_BATTLE_TOWER_1F, $7, $7
	loadfont
	jump UnknownScript_0x9e4b0
; 0x9f4c2

UnknownScript_0x9f4c2: ; 0x9f4c2
	pause 60
	special Function8c092
	warpfacing $1, GROUP_BATTLE_TOWER_1F, MAP_BATTLE_TOWER_1F, $7, $7
	writebyte $4
	special Function170687
	loadfont
	writetext UnknownText_0x9ea49
	waitbutton
	closetext
	end
; 0x9f4d9

UnknownScript_0x9f4d9: ; 0x9f4d9
	pause 60
	special Function8c092
	warpfacing $1, GROUP_BATTLE_TOWER_1F, MAP_BATTLE_TOWER_1F, $7, $7
BattleTowerBattleRoomScript_0x9f4e4: ; 0x9f4e4
	loadfont
	writetext UnknownText_0x9eaef
	jump UnknownScript_0x9e47a
; 0x9f4eb

UnknownScript_0x9f4eb: ; 0x9f4eb
	writebyte $4
	special Function170687
	loadfont
	writetext UnknownText_0x9f0c1
	waitbutton
	closetext
	end
; 0x9f4f7

UnknownScript_0x9f4f7: ; 0x9f4f7
	writebyte $4
	special Function170687
	writebyte $6
	special Function170687
	loadfont
	writetext UnknownText_0x9ea49
	writetext UnknownText_0x9ec09
	waitbutton
	closetext
	end
; 0x9f50b


UnknownText_0x9f50b: ; 0x9f50b
	text "You'll be returned"
	line "after you SAVE."
	done
; 0x9f52e


BattleTowerBattleRoom_MapEventHeader: ; 0x9f52e
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $3, 4, GROUP_BATTLE_TOWER_HALLWAY, MAP_BATTLE_TOWER_HALLWAY
	warp_def $7, $4, 4, GROUP_BATTLE_TOWER_HALLWAY, MAP_BATTLE_TOWER_HALLWAY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_YOUNGSTER, 4, 8, $6, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_YOUNGSTER_IN_BATTLE_TOWER_BATTLE_ROOM
	person_event SPRITE_RECEPTIONIST, 10, 5, $9, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, -1
; 0x9f558

