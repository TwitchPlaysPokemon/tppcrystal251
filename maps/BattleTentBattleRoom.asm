BattleTentBattleRoom_MapScriptHeader:

	db 2

	dw MapBattleTentBattleRoom_Trigger1, $0000
	dw MapBattleTentBattleRoom_Trigger2, $0000

	db 1
	dbw 5, BattleTentBattleRoom_TurnOnLights


BattleTentBattleRoom_TurnOnLights:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalse BattleTentBattleRoom_DontTurnOnLights
	writecode VAR_TIMEOFDAY, 1
	loadvar wd846, %10000000
	special UpdateTimePals
	loadvar wd846, %00000000
BattleTentBattleRoom_DontTurnOnLights:
	return

MapBattleTentBattleRoom_Trigger1:
	priorityjump MapBattleTentBattleRoomBillScript1
	end

MapBattleTentBattleRoom_Trigger2:
	end

MapBattleTentBattleRoomDoorScript:
	dw EVENT_BEAT_BILL_IN_BATTLE_TENT
	dw .Script
.Script
	jumptext MapBattleTentBattleRoomDoorText
	
MapBattleTentBattleRoomBillScript1:
	pause 15
	showemote $0, 2, 15
	pause 15
	spriteface $2, DOWN
	loadfont
	writetext MapBattleTentBattleRoomBillText1
	waitbutton
	closetext
	applymovement $2, MapBattleTentBattleRoomMovementData5
	loadfont
	writetext MapBattleTentBattleRoomBillText2
	waitbutton
	pause 15
	showemote $0, 2, 15
	pause 15
	loadfont
	writetext MapBattleTentBattleRoomBillText3
	waitbutton
	closetext
	follow $2, $0
	applymovement $2, MapBattleTentBattleRoomMovementData3
	stopfollow
	applymovement $2, MapBattleTentBattleRoomMovementData6
	applymovement $0, MapBattleTentBattleRoomMovementData4
	winlosstext MapBattleTentBattleRoomBillLossText, $0000
	loadtrainer BILL_TC, BILL_BT
	startbattle
	returnafterbattle
	dotrigger $1
	setevent EVENT_BEAT_BILL_IN_BATTLE_TENT
	loadfont
	writetext MapBattleTentBattleRoomBillText4
	waitbutton
	closetext
	applymovement $2, MapBattleTentBattleRoomMovementData9
	loadfont
	verbosegiveitem HM_WHIRLPOOL, 1
	iffalse BillStandingBy
	writetext MapBattleTentBattleRoomBillText5
	waitbutton
	closetext
	spriteface $0, DOWN
	applymovement $2, MapBattleTentBattleRoomMovementData2
	playsound SFX_EXIT_BUILDING
	disappear $2
	pause 15
	end
BillStandingBy:
	writetext MapBattleTentBattleRoomBillText6
	waitbutton
	closetext
	end

MapBattleTentBattleRoomBillScript2:
	faceplayer
	loadfont
	writetext MapBattleTentBattleRoomBillText7
	buttonsound
	verbosegiveitem HM_WHIRLPOOL, 1
	iffalse BillStandingBy
	writetext MapBattleTentBattleRoomBillText5
	waitbutton
	closetext
	copybytetovar PlayerFacing
	if_equal OW_UP, .walkaround
	spriteface $0, DOWN
	applymovement $2, MapBattleTentBattleRoomMovementData7
	jump .done
.walkaround
	spriteface $0, LEFT
	applymovement $2, MapBattleTentBattleRoomMovementData8
	spriteface $0, DOWN
.done
	playsound SFX_EXIT_BUILDING
	disappear $2
	pause 15
	end

MapBattleTentBattleRoomMovementData4:
	step_left
	turn_head_right
	step_end
	
MapBattleTentBattleRoomMovementData5:
	step_left
	step_down
	step_end

MapBattleTentBattleRoomMovementData2:
	step_down
	step_down
	step_down
	step_down
	step_end

MapBattleTentBattleRoomMovementData8:
	step_left
MapBattleTentBattleRoomMovementData7:
	step_down
	step_down
	step_end
	
MapBattleTentBattleRoomMovementData3:
	step_up
	step_up
	step_up
	step_right
	step_end

MapBattleTentBattleRoomMovementData6:
	step_right
	turn_head_left
	step_end

MapBattleTentBattleRoomMovementData9:
	step_left
	step_left
	step_end

	
MapBattleTentBattleRoomBillText1:
	text "Ah, <PLAY_G>!"
	
	para "Thank goodness"
	line "you've come!"
	done
	
MapBattleTentBattleRoomBillText2:
	text "I was sent here to"
	line "do some fixing up."
	
	para "The city plans to"
	line "reopen this faci-"
	cont "lity in the near"
	cont "future."
	
	para "But while I was"
	line "doing repairs in"
	
	para "here, the power"
	line "cut, and the door"
	cont "locked behind me!"
	
	para "It must have been"
	line "you who turned the"

	para "GENERATOR back on."
	line "I owe you one!"
	done
MapBattleTentBattleRoomBillText3:
	text "Hey! While you're"
	line "here<...>"
	
	para "How about a"
	line "quick battle?"
	
	para "This is the BATTLE"
	line "TENT, after all!"
	done

MapBattleTentBattleRoomBillLossText:
	text "Whew<...>"
	done

MapBattleTentBattleRoomBillText4:
	text "That was exhilira-"
	line "ting. Thanks for"
	cont "that."
	
	para "Here, let me give"
	line "you this."

	para "I found it lying"
	line "around, but I have"

	para "no use for it my-"
	line "self."
	done
	
MapBattleTentBattleRoomBillText5:
	text "I'm pretty much"
	line "done with the"
	
	para "repairs in this"
	line "room."
	
	para "I should get mov-"
	line "ing. See you"
	cont "around, <PLAY_G>!"
	done

MapBattleTentBattleRoomBillText6:
	text "Oh? You have no"
	line "room for this<...>"

	para "That's fine. I'll"
	line "hang out here for"

	para "a bit to finish up"
	line "some additional"
	cont "repairs."

	para "Make space in your"
	line "ITEMS pocket,"

	para "then come find me"
	line "again."
	done

MapBattleTentBattleRoomBillText7:
	text "Ah, <PLAY_G>!"

	para "Here's the thing I"
	line "found."
	;cont "from me."
	done
	
MapBattleTentBattleRoomDoorText:
	text "It's locked<...>"
	done
	
BattleTentBattleRoom_MapEventHeader:

	db 0, 0
	
	db 3
	warp_def $7, $5, 4, GROUP_BATTLE_TENT_RUINS, MAP_BATTLE_TENT_RUINS
	warp_def $7, $6, 4, GROUP_BATTLE_TENT_RUINS, MAP_BATTLE_TENT_RUINS
	warp_def $0, $6, 1, GROUP_BATTLE_TENT_PC_ROOM, MAP_BATTLE_TENT_PC_ROOM
	
	db 0
	
	db 1
	signpost $0, $6, $6, MapBattleTentBattleRoomDoorScript
	
	db 1
	person_event SPRITE_BILL, $9, $a, $7, 0, 0, -1, -1, 0, 0, 0, MapBattleTentBattleRoomBillScript2, EVENT_BILL_IN_BATTLE_TENT_BATTLE_ROOM
