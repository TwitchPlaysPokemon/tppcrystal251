RedsHouse1FRB_MapScriptHeader: ; 0x19ae9c
	; trigger count
	db 2

	; triggers
	dw RedsHouse1FRB_Trigger1, $0000
	dw RedsHouse1FRB_Trigger2, $0000

	; callback count
	db 0
; 0x19aea2

RedsHouse1FRB_Trigger1: ; 0x19aea2
	end
; 0x19aea3
RedsHouse1FRB_Trigger2:
	end

MomsScript_Start1: ; 0x7a4d8
	setevent EVENT_000_STD
; 0x7a4db

MomsScript_Start2: ; 0x7a4db
	playmusic MUSIC_MOM
	showemote $0, $2, 15
	spriteface $0, $2
	checkevent EVENT_000_STD
	iffalse RedsHouse1FRB_Movement2
	applymovement $2, MovementData_0x7a5fc
	jump RedsHouse1FRB_SkipMovement
; 0x7a4f2

RedsHouse1FRB_Movement2: ; 0x7a4f2
	applymovement $2, MovementData_0x7a5fe
RedsHouse1FRB_SkipMovement: ; 0x7a4f6
	loadfont
	writetext MomText1
	keeptextopen
	stringtotext RedsHouse1FRB_GearName, $1
	scall RedsHouse1FRB_GetItem
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	addcellnum $1
	dotrigger $1
	setevent EVENT_MOM_POSITION_1
	clearevent EVENT_MOM_POSITION_2
	writetext MomText2
	keeptextopen
	special Function90913
RedsHouse1FRB_DSTLoop: ; 0x7a519
	writetext MomText3
	yesorno
	iffalse RedsHouse1FRB_NotDST
	special Function90a54
	yesorno
	iffalse RedsHouse1FRB_DSTLoop
	jump RedsHouse1FRB_TimeIsSet
; 0x7a52a

RedsHouse1FRB_NotDST: ; 0x7a52a
	special Function90a88
	yesorno
	iffalse RedsHouse1FRB_DSTLoop
RedsHouse1FRB_TimeIsSet: ; 0x7a531
	writetext MomText4
	yesorno
	iffalse RedsHouse1FRB_DontNeedPhoneExplanation
	writetext MomText5
	keeptextopen
	jump RedsHouse1FRB_AfterPhoneExplanation
; 0x7a542

RedsHouse1FRB_DontNeedPhoneExplanation: ; 0x7a542
	writetext MomText6
	keeptextopen
; 0x7a549

RedsHouse1FRB_AfterPhoneExplanation: ; 0x7a549
	writetext MomText7
	closetext
	loadmovesprites
	checkevent EVENT_000_STD
	iftrue RedsHouse1FRB_MoveBack1
	checkevent EVENT_001_STD
	iffalse RedsHouse1FRB_MoveBack2
	jump RedsHouse1FRB_DontMoveBack
; 0x7a55d

RedsHouse1FRB_MoveBack1: ; 0x7a55d
	applymovement $2, MovementData_0x7a600
	jump RedsHouse1FRB_DontMoveBack
; 0x7a564

RedsHouse1FRB_MoveBack2: ; 0x7a564
	applymovement $2, MovementData_0x7a602

RedsHouse1FRB_DontMoveBack: ; 0x7a56b
	special RestartMapMusic
	spriteface $2, $2
	end
; 0x7a572

MomScript2: ; 0x7a572
	playmusic MUSIC_MOM
	jump RedsHouse1FRB_SkipMovement
; 0x7a578

RedsHouse1FRB_GearName: ; 0x7a578
	db $54, "GEAR@"
; 0x7a57e

RedsHouse1FRB_GetItem: ; 0x7a57e
	jumpstd receiveitem
	end
; 0x7a582

MomScript1:
	faceplayer
	setevent EVENT_001_STD
	checktriggers
	iffalse MomScript2
	writetext UnknownText_0x19af81
	closetext
	loadmovesprites
	end
; 0x19aeba

MapRedsHouse1FRBSignpost2Script: ; 0x19aeba
	jumptext UnknownText_0x19afe8
; 0x19aebd

MapRedsHouse1FRBSignpost1Script: ; 0x19aebd
	jumpstd picturebookshelf
; 0x19aec0

MovementData_0x7a5fc: ; 0x7a5fc
	turn_head_right
	step_end
; 0x7a5fe

MovementData_0x7a5fe: ; 0x7a5fe
	slow_step_right
	step_end
; 0x7a600

MovementData_0x7a600: ; 0x7a600
	turn_head_left
	step_end
; 0x7a602

MovementData_0x7a602: ; 0x7a602
	slow_step_left
	step_end
; 0x7a604

MomText1: ; 0x7a604
	text "Oh, <PLAYER>…! Our"
	line "neighbor, PROF."

	para "OAK, was looking"
	line "for you."

	para "He said he wanted"
	line "you to do some-"
	cont "thing for him."

	para "Oh! I almost for-"
	line "got! Your #MON"

	para "GEAR is back from"
	line "the repair shop."

	para "Here you go!"
	done
; 0x7a6bd

MomText2: ; 0x7a6bd
	text "#MON GEAR, or"
	line "just #GEAR."

	para "It's essential if"
	line "you want to be a"
	cont "good trainer."

	para "Oh, the day of the"
	line "week isn't set."

	para "You mustn't forget"
	line "that!"
	done
; 0x7a742

MomText3: ; 0x7a742
	text "Is it Daylight"
	line "Saving Time now?"
	done
; 0x7a763

MomText4: ; 0x7a763
	text "Come home to"
	line "adjust your clock"

	para "for Daylight"
	line "Saving Time."

	para "By the way, do you"
	line "know how to use"
	cont "the PHONE?"
	done
; 0x7a7cb

MomText5: ; 0x7a7cb
	text "Don't you just"
	line "turn the #GEAR"

	para "on and select the"
	line "PHONE icon?"
	done
; 0x7a807

MomText6: ; 0x7a807
	text "I'll read the"
	line "instructions."

	para "Turn the #GEAR"
	line "on and select the"
	cont "PHONE icon."
	done
; 0x7a850

MomText7: ; 0x7a850
	text "Phone numbers are"
	line "stored in memory."

	para "Just choose a name"
	line "you want to call."

	para "Gee, isn't that"
	line "convenient?"
	done
; 0x7a8b5

RedsHouse1FRB_MapEventHeader: ; 0x19b017
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $2, 1, GROUP_PALLET_TOWN_RB, MAP_PALLET_TOWN_RB
	warp_def $7, $3, 1, GROUP_PALLET_TOWN_RB, MAP_PALLET_TOWN_RB
	warp_def $0, $7, 1, GROUP_REDS_HOUSE_2F_RB, MAP_REDS_HOUSE_2F_RB

	; xy triggers
	db 2
	xy_trigger 0, $7, $2, 0, MomsScript_Start1, $0, $0
	xy_trigger 0, $7, $3, 0, MomsScript_Start2, $0, $0

	; signposts
	db 3
	signpost 1, 0, $0, MapRedsHouse1FRBSignpost1Script
	signpost 1, 1, $0, MapRedsHouse1FRBSignpost1Script
	signpost 1, 2, $0, MapRedsHouse1FRBSignpost2Script

	; people-events
	db 1
	person_event SPRITE_REDS_MOM, 7, 9, $8, 0, 0, -1, -1, 0, 0, 0, MomScript1, -1
; 0x19b048

