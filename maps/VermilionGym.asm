VermilionGym_MapScriptHeader: ; 0x1920a3
	; trigger count
	db 0

	; callback count
	db 1
	dbw 1, VermilionGymDoorsScript
; 0x1920a5

VermilionGymDoorsScript:
	checkevent EVENT_VERMILION_DOOR_2
	iffalse VermilionGymEndDoorsScript
	changeblock 4, 4, 1
	return

VermilionGymEndDoorsScript:
	checkevent EVENT_VERMILION_DOOR_1
	iffalse VermilionGymResetDoorsScript
	clearevent EVENT_VERMILION_DOOR_1
VermilionGymResetDoorsScript:
	random 38
	copyvartobyte wdff7
	return

SurgeScript_0x1920a5: ; 0x1920a5
	faceplayer
	loadfont
	checkflag ENGINE_THUNDERBADGE
	iftrue UnknownScript_0x1920d9
	writetext UnknownText_0x192142
	waitbutton
	closetext
	winlosstext UnknownText_0x192238, $0000
	loadtrainer LT_SURGE, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_LTSURGE
	setevent EVENT_BEAT_GENTLEMAN_GREGORY
	setevent EVENT_BEAT_GUITARIST_VINCENT
	setevent EVENT_BEAT_JUGGLER_HORTON
	loadfont
	writetext UnknownText_0x192277
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_THUNDERBADGE
	writetext UnknownText_0x192291
	waitbutton
	verbosegiveitem TM_WILD_CHARGE, 1
	writetext SurgeLastText
	waitbutton
	closetext
	end
; 0x1920d9

UnknownScript_0x1920d9: ; 0x1920d9
	writetext UnknownText_0x192303
	waitbutton
	closetext
	end
; 0x1920df

TrainerGentlemanGregory: ; 0x1920df
	; bit/flag number
	dw $49c

	; trainer group && trainer id
	db GENTLEMAN, GREGORY

	; text when seen
	dw GentlemanGregorySeenText

	; text when trainer beaten
	dw GentlemanGregoryBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GentlemanGregoryScript
; 0x1920eb

GentlemanGregoryScript: ; 0x1920eb
	talkaftercancel
	loadfont
	writetext UnknownText_0x1923b0
	waitbutton
	closetext
	end
; 0x1920f3

TrainerGuitaristVincent: ; 0x1920f3
	; bit/flag number
	dw $494

	; trainer group && trainer id
	db GUITARIST, VINCENT

	; text when seen
	dw GuitaristVincentSeenText

	; text when trainer beaten
	dw GuitaristVincentBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GuitaristVincentScript
; 0x1920ff

GuitaristVincentScript: ; 0x1920ff
	talkaftercancel
	loadfont
	writetext UnknownText_0x19244b
	waitbutton
	closetext
	end
; 0x192107

TrainerJugglerHorton: ; 0x192107
	; bit/flag number
	dw $497

	; trainer group && trainer id
	db JUGGLER, HORTON

	; text when seen
	dw JugglerHortonSeenText

	; text when trainer beaten
	dw JugglerHortonBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw JugglerHortonScript
; 0x192113

JugglerHortonScript: ; 0x192113
	talkaftercancel
	loadfont
	writetext UnknownText_0x1924d6
	waitbutton
	closetext
	end
; 0x19211b

VermilionGymGuyScript: ; 0x19211b
	faceplayer
	loadfont
	checkevent EVENT_BEAT_LTSURGE
	iftrue .VermilionGymGuyWinScript
	writetext VermilionGymGuyText
	waitbutton
	closetext
	end

.VermilionGymGuyWinScript
	writetext VermilionGymGuyWinText
	waitbutton
	closetext
	end
; 0x19212f

MapVermilionGymSignpost1Script: ; 0x19212f
	copybytetovar wdff7
	if_equal 0, VermilionGym_FoundSwitch
	if_equal 12, VermilionGym_FoundSwitch
	if_equal 22, VermilionGym_FoundSwitch
	checkevent EVENT_VERMILION_DOOR_1
	iftrue VermilionGym_ResetSwitches
	jumptext UnknownText_0x19261e
; 0x192132

MapVermilionGymSignpost2Script: ; 0x19212f
	copybytetovar wdff7
	if_equal 0, VermilionGym_FoundSwitch
	if_equal 1, VermilionGym_FoundSwitch
	if_equal 14, VermilionGym_FoundSwitch
	if_equal 23, VermilionGym_FoundSwitch
	if_equal 26, VermilionGym_FoundSwitch
	checkevent EVENT_VERMILION_DOOR_1
	iftrue VermilionGym_ResetSwitches
	jumptext UnknownText_0x19261e
; 0x192132

MapVermilionGymSignpost3Script: ; 0x19212f
	copybytetovar wdff7
	if_equal 1, VermilionGym_FoundSwitch
	if_equal 2, VermilionGym_FoundSwitch
	if_equal 16, VermilionGym_FoundSwitch
	if_equal 27, VermilionGym_FoundSwitch
	if_equal 30, VermilionGym_FoundSwitch
	checkevent EVENT_VERMILION_DOOR_1
	iftrue VermilionGym_ResetSwitches
	jumptext UnknownText_0x19261e
; 0x192132

MapVermilionGymSignpost4Script: ; 0x19212f
	copybytetovar wdff7
	if_equal 2, VermilionGym_FoundSwitch
	if_equal 3, VermilionGym_FoundSwitch
	if_equal 18, VermilionGym_FoundSwitch
	if_equal 31, VermilionGym_FoundSwitch
	if_equal 34, VermilionGym_FoundSwitch
	checkevent EVENT_VERMILION_DOOR_1
	iftrue VermilionGym_ResetSwitches
	jumptext UnknownText_0x19261e
; 0x192132

MapVermilionGymSignpost5Script: ; 0x19212f
	copybytetovar wdff7
	if_equal 3, VermilionGym_FoundSwitch
	if_equal 20, VermilionGym_FoundSwitch
	if_equal 35, VermilionGym_FoundSwitch
	checkevent EVENT_VERMILION_DOOR_1
	iftrue VermilionGym_ResetSwitches
	jumptext UnknownText_0x19261e
; 0x192132

MapVermilionGymSignpost6Script: ; 0x19212f
	copybytetovar wdff7
	if_equal 4, VermilionGym_FoundSwitch
	if_equal 12, VermilionGym_FoundSwitch
	if_equal 13, VermilionGym_FoundSwitch
	if_equal 23, VermilionGym_FoundSwitch
	if_equal 24, VermilionGym_FoundSwitch
	checkevent EVENT_VERMILION_DOOR_1
	iftrue VermilionGym_ResetSwitches
	jumptext UnknownText_0x19261e
; 0x192132

MapVermilionGymSignpost7Script: ; 0x19212f
	copybytetovar wdff7
	if_equal 4, VermilionGym_FoundSwitch
	if_equal 5, VermilionGym_FoundSwitch
	if_equal 14, VermilionGym_FoundSwitch
	if_equal 15, VermilionGym_FoundSwitch
	if_equal 22, VermilionGym_FoundSwitch
	if_equal 25, VermilionGym_FoundSwitch
	if_equal 27, VermilionGym_FoundSwitch
	if_equal 28, VermilionGym_FoundSwitch
	checkevent EVENT_VERMILION_DOOR_1
	iftrue VermilionGym_ResetSwitches
	jumptext UnknownText_0x19261e
; 0x192132

MapVermilionGymSignpost8Script: ; 0x19212f
	copybytetovar wdff7
	if_equal 5, VermilionGym_FoundSwitch
	if_equal 6, VermilionGym_FoundSwitch
	if_equal 16, VermilionGym_FoundSwitch
	if_equal 17, VermilionGym_FoundSwitch
	if_equal 26, VermilionGym_FoundSwitch
	if_equal 29, VermilionGym_FoundSwitch
	if_equal 31, VermilionGym_FoundSwitch
	if_equal 32, VermilionGym_FoundSwitch
	checkevent EVENT_VERMILION_DOOR_1
	iftrue VermilionGym_ResetSwitches
	jumptext UnknownText_0x19261e
; 0x192132

MapVermilionGymSignpost9Script: ; 0x19212f
	copybytetovar wdff7
	if_equal 6, VermilionGym_FoundSwitch
	if_equal 7, VermilionGym_FoundSwitch
	if_equal 18, VermilionGym_FoundSwitch
	if_equal 19, VermilionGym_FoundSwitch
	if_equal 30, VermilionGym_FoundSwitch
	if_equal 33, VermilionGym_FoundSwitch
	if_equal 35, VermilionGym_FoundSwitch
	if_equal 36, VermilionGym_FoundSwitch
	checkevent EVENT_VERMILION_DOOR_1
	iftrue VermilionGym_ResetSwitches
	jumptext UnknownText_0x19261e
; 0x192132

MapVermilionGymSignpost10Script: ; 0x19212f
	copybytetovar wdff7
	if_equal 7, VermilionGym_FoundSwitch
	if_equal 20, VermilionGym_FoundSwitch
	if_equal 21, VermilionGym_FoundSwitch
	if_equal 35, VermilionGym_FoundSwitch
	if_equal 37, VermilionGym_FoundSwitch
	checkevent EVENT_VERMILION_DOOR_1
	iftrue VermilionGym_ResetSwitches
	jumptext UnknownText_0x19261e
; 0x192132

MapVermilionGymSignpost11Script: ; 0x19212f
	copybytetovar wdff7
	if_equal 8, VermilionGym_FoundSwitch
	if_equal 13, VermilionGym_FoundSwitch
	if_equal 25, VermilionGym_FoundSwitch
	checkevent EVENT_VERMILION_DOOR_1
	iftrue VermilionGym_ResetSwitches
	jumptext UnknownText_0x19261e
; 0x192132

MapVermilionGymSignpost12Script: ; 0x19212f
	copybytetovar wdff7
	if_equal 8, VermilionGym_FoundSwitch
	if_equal 9, VermilionGym_FoundSwitch
	if_equal 15, VermilionGym_FoundSwitch
	if_equal 24, VermilionGym_FoundSwitch
	if_equal 29, VermilionGym_FoundSwitch
	checkevent EVENT_VERMILION_DOOR_1
	iftrue VermilionGym_ResetSwitches
	jumptext UnknownText_0x19261e
; 0x192132

MapVermilionGymSignpost13Script: ; 0x19212f
	copybytetovar wdff7
	if_equal 9, VermilionGym_FoundSwitch
	if_equal 10, VermilionGym_FoundSwitch
	if_equal 17, VermilionGym_FoundSwitch
	if_equal 28, VermilionGym_FoundSwitch
	if_equal 33, VermilionGym_FoundSwitch
	checkevent EVENT_VERMILION_DOOR_1
	iftrue VermilionGym_ResetSwitches
	jumptext UnknownText_0x19261e
; 0x192132

MapVermilionGymSignpost14Script: ; 0x19212f
	copybytetovar wdff7
	if_equal 10, VermilionGym_FoundSwitch
	if_equal 11, VermilionGym_FoundSwitch
	if_equal 19, VermilionGym_FoundSwitch
	if_equal 32, VermilionGym_FoundSwitch
	if_equal 37, VermilionGym_FoundSwitch
	checkevent EVENT_VERMILION_DOOR_1
	iftrue VermilionGym_ResetSwitches
	jumptext UnknownText_0x19261e
; 0x192132

MapVermilionGymSignpost15Script: ; 0x19212f
	copybytetovar wdff7
	if_equal 11, VermilionGym_FoundSwitch
	if_equal 21, VermilionGym_FoundSwitch
	if_equal 36, VermilionGym_FoundSwitch
	checkevent EVENT_VERMILION_DOOR_1
	iftrue VermilionGym_ResetSwitches
	jumptext UnknownText_0x19261e
; 0x192132

VermilionGym_FoundSwitch:
	loadfont
	writetext Text_FoundSwitch
	playsound SFX_PUSH_BUTTON
	buttonsound
	checkevent EVENT_VERMILION_DOOR_1
	iftrue UnlockSecondSwitch
	setevent EVENT_VERMILION_DOOR_1
	writetext Text_FoundFirstSwitch
	waitbutton
	closetext
	end
	
UnlockSecondSwitch:
	setevent EVENT_VERMILION_DOOR_2
	writetext Text_FoundSecondSwitch
	playsound SFX_ENTER_DOOR
	changeblock 4, 4, 1
	waitbutton
	closetext
	end
	
VermilionGym_ResetSwitches:
	loadfont
	writetext UnknownText_0x19261e
	buttonsound
	writetext Text_ResetSwitches
	playsound SFX_WRONG
	waitbutton
	closetext
	random 38
	copyvartobyte wdff7
	clearevent EVENT_VERMILION_DOOR_1
	end

MapVermilionGymSignpost16Script: ; 0x192132
	checkflag ENGINE_THUNDERBADGE
	iftrue UnknownScript_0x19213b
	jumpstd gymstatue1
; 0x19213b

UnknownScript_0x19213b: ; 0x19213b
	trainertotext LT_SURGE, 1, $1
	jumpstd gymstatue2
; 0x192142

Text_FoundSwitch:
	text "A switch beneath"
	line "the trash can?"

	para "Let's push it!"
	done

Text_FoundFirstSwitch:
	text "The first electric"
	line "lock opened!"
	done

Text_FoundSecondSwitch:
	text "The second elec-"
	line "tric lock opened!"
	done

Text_ResetSwitches:
	text "Oh no! The locks"
	line "reset!"
	done

UnknownText_0x192142: ; 0x192142
	text "SURGE: Hey, you"
	line "little tyke!"

	para "I have to hand it"
	line "to you. It may not"

	para "be very smart to"
	line "challenge me, but"
	cont "it takes guts!"

	para "When it comes to"
	line "electric #MON,"
	cont "I'm number one!"

	para "I've never lost on"
	line "the battlefield."

	para "I'll zap you just"
	line "like I did my"
	cont "enemies in war!"
	done
; 0x192238

UnknownText_0x192238: ; 0x192238
	text "SURGE: Arrrgh!"
	line "You are strong!"

	para "OK, kid. You get"
	line "THUNDERBADGE!"
	done
; 0x192277

UnknownText_0x192277: ; 0x192277
	text "<PLAYER> received"
	line "THUNDERBADGE."
	done
; 0x192291

UnknownText_0x192291: ; 0x192291
	text "SURGE: THUNDER-"
	line "BADGE increases"
	cont "#MON's speed. "

	para "Oh, and have"
	line "this too!"

SurgeLastText:
	text "That's WILD"
	line "CHARGE"

	para "An electrifying"
	line "strike for brave" 
	cont "electric #MON."

	para "It's good for"
	line "shock tactics!"

	para "Consider it proof"
	line "that you defeated"

	para "me. Use it"
	line "proudly, hear?"

	done
; 0x192303

UnknownText_0x192303: ; 0x192303
	text "SURGE: Hey, kid!"
	line "Still slugging and"
	cont "chugging away?"

	para "My #MON and I"
	line "are still at it!"
	done
; 0x192356

GentlemanGregorySeenText: ; 0x192356
	text "You're here to"
	line "defeat LT.SURGE?"

	para "Not if I can help"
	line "it!"
	done
; 0x19238c

GentlemanGregoryBeatenText: ; 0x19238c
	text "Sorry I failed"
	line "you, LT.SURGE,"
	cont "sir!"
	done
; 0x1923b0

UnknownText_0x1923b0: ; 0x1923b0
	text "When I was still"
	line "in the army, LT."

	para "SURGE saved my"
	line "life."
	done
; 0x1923e8

GuitaristVincentSeenText: ; 0x1923e8
	text "LT.SURGE recog-"
	line "nized my potential"

	para "with electric"
	line "#MON."

	para "Think you can beat"
	line "me?"
	done
; 0x192437

GuitaristVincentBeatenText: ; 0x192437
	text "Ooh, how shocking!"
	done
; 0x19244b

UnknownText_0x19244b: ; 0x19244b
	text "If the GYM's traps"
	line "were working, you"

	para "would have been"
	line "toast…"
	done
; 0x192487

JugglerHortonSeenText: ; 0x192487
	text "I'm the best"
	line "juggler in KANTO!"
	done
; 0x1924ba

JugglerHortonBeatenText: ; 0x1924ba
	text "Dropped my balls!"
	done
; 0x1924d6

UnknownText_0x1924d6: ; 0x1924d6
	text "I can only juggle"
	line "three balls"
	cont "at once..."
	done
; 0x192517

VermilionGymGuyText: ; 0x192517
	text "Yo! CHAMP in"
	line "making!"

	para "You lucked out"
	line "this time."

	para "LT.SURGE is very"
	line "cautious. He has"

	para "traps set all over"
	line "the GYM."

	para "But--he-heh--the"
	line "traps aren't"
	cont "active right now."

	para "You'll have no"
	line "problem getting to"
	cont "LT.SURGE."
	done
; 0x1925df

VermilionGymGuyWinText: ; 0x1925df
	text "Whew! That was an"
	line "electrifying bout!"

	para "It sure made me"
	line "nervous."
	done
; 0x19261e

UnknownText_0x19261e: ; 0x19261e
	text "Nope! Nothing here"
	line "but trash."
	done
; 0x19263d

VermilionGym_MapEventHeader: ; 0x19263d
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $11, $4, 7, GROUP_VERMILION_CITY, MAP_VERMILION_CITY
	warp_def $11, $5, 7, GROUP_VERMILION_CITY, MAP_VERMILION_CITY

	; xy triggers
	db 0

	; signposts
	db 17
	signpost 7, 1, $0, MapVermilionGymSignpost1Script
	signpost 7, 3, $0, MapVermilionGymSignpost2Script
	signpost 7, 5, $0, MapVermilionGymSignpost3Script
	signpost 7, 7, $0, MapVermilionGymSignpost4Script
	signpost 7, 9, $0, MapVermilionGymSignpost5Script
	signpost 9, 1, $0, MapVermilionGymSignpost6Script
	signpost 9, 3, $0, MapVermilionGymSignpost7Script
	signpost 9, 5, $0, MapVermilionGymSignpost8Script
	signpost 9, 7, $0, MapVermilionGymSignpost9Script
	signpost 9, 9, $0, MapVermilionGymSignpost10Script
	signpost 11, 1, $0, MapVermilionGymSignpost11Script
	signpost 11, 3, $0, MapVermilionGymSignpost12Script
	signpost 11, 5, $0, MapVermilionGymSignpost13Script
	signpost 11, 7, $0, MapVermilionGymSignpost14Script
	signpost 11, 9, $0, MapVermilionGymSignpost15Script
	signpost 15, 3, $0, MapVermilionGymSignpost16Script
	signpost 15, 6, $0, MapVermilionGymSignpost16Script

	; people-events
	db 5
	person_event SPRITE_SURGE, 6, 9, $6, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 0, 0, SurgeScript_0x1920a5, -1
	person_event SPRITE_GENTLEMAN, 12, 12, $8, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 2, 4, TrainerGentlemanGregory, -1
	person_event SPRITE_ROCKER, 11, 8, $6, 0, 3, -1, -1, 8 + PAL_OW_RED, 2, 3, TrainerGuitaristVincent, -1
	person_event SPRITE_SUPER_NERD, 14, 4, $9, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 2, 4, TrainerJugglerHorton, -1
	person_event SPRITE_GYM_GUY, 19, 11, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 1, VermilionGymGuyScript, -1
; 0x1926e3

