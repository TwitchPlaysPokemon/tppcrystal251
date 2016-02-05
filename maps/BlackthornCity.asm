BlackthornCity_MapScriptHeader: ; 0x1a46d0
	; trigger count
	db 2
	dw .Trigger0, 0
	dw .Trigger1, 0

	; callback count
	db 2

	; callbacks

	dbw 5, UnknownScript_0x1a46d8

	dbw 2, SantosCallback
.Trigger0
	priorityjump BlackthornRivalBattle
	end
.Trigger1
	end

UnknownScript_0x1a46d8: ; 0x1a46d8
	checkevent EVENT_EGK_RIVAL_IN_BLACKTHORN
	iffalse .false
	setflag ENGINE_FLYPOINT_BLACKTHORN
.false
	return
; 0x1a46dc

SantosCallback:
	checkcode VAR_WEEKDAY
	if_equal SATURDAY, .SantosAppears
	disappear $9
	return

.SantosAppears
	appear $9
	return

BlackthornRivalBattle:
	special HealParty
	applymovement $0, BlackthornPlayerMovement
	playmusic MUSIC_RIVAL_RB
	showemote $0, $b, 15
	pause 15
	loadfont
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male_rival
	writetext BlackthornEGKRivalText1F
	waitbutton
	closetext
	applymovement $b, BlackthornEGKRivalMovement1
	spriteface $0, LEFT
	loadfont
	writetext BlackthornEGKRivalText2F
	waitbutton
	closetext
	scall .SelectBattle
	winlosstext BlackthornEGKRivalWinTextF, BlackthornEGKRivalLossTextF
	loadvar OtherTrainerClass, BLUE_RB_F
	writecode VAR_BATTLETYPE, BATTLETYPE_RIVAL_RB
	startbattle
	returnafterbattle
	special RestartMapMusic
	loadfont
	writetext BlackthornEGKRivalText3F
	jump .finish_battle

.male_rival
	writetext BlackthornEGKRivalText1
	waitbutton
	closetext
	applymovement $b, BlackthornEGKRivalMovement1
	spriteface $0, LEFT
	loadfont
	writetext BlackthornEGKRivalText2
	waitbutton
	closetext
	scall .SelectBattle
	winlosstext BlackthornEGKRivalWinText, BlackthornEGKRivalLossText
	writecode VAR_BATTLETYPE, BATTLETYPE_RIVAL_RB
	startbattle
	returnafterbattle
	special RestartMapMusic
	loadfont
	writetext BlackthornEGKRivalText3
.finish_battle
	waitbutton
	closetext
	playmusic MUSIC_RIVAL_AFTER_RB
	spriteface $0, DOWN
	applymovement $b, BlackthornEGKRivalMovement2
	disappear $b
	special RestartMapMusic
	dotrigger 1
	setflag ENGINE_FLYPOINT_BLACKTHORN
	end

.SelectBattle
	checkevent EVENT_GOT_CHARMANDER_FROM_OAK
	iftrue .charmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_OAK
	iftrue .squirtle
	loadtrainer BLUE_RB, BLUE_RB_5C
	end

.charmander
	loadtrainer BLUE_RB, BLUE_RB_5A
	end

.squirtle
	loadtrainer BLUE_RB, BLUE_RB_5B
	end

SuperNerdScript_0x1a46e8: ; 0x1a46e8
	faceplayer
	loadfont
	checkevent EVENT_BEAT_CLAIR
	iftrue UnknownScript_0x1a4702
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x1a46fc
	writetext UnknownText_0x1a477a
	waitbutton
	closetext
	end
; 0x1a46fc

UnknownScript_0x1a46fc: ; 0x1a46fc
	writetext UnknownText_0x1a47f3
	waitbutton
	closetext
	end
; 0x1a4702

UnknownScript_0x1a4702: ; 0x1a4702
	writetext UnknownText_0x1a4865
	waitbutton
	closetext
	end
; 0x1a4708

GrampsScript_0x1a4708: ; 0x1a4708
	jumptextfaceplayer UnknownText_0x1a48c3
; 0x1a470b

GrampsScript_0x1a470b: ; 0x1a470b
	jumptextfaceplayer UnknownText_0x1a48fb
; 0x1a470e

BlackBeltScript_0x1a470e: ; 0x1a470e
	faceplayer
	loadfont
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x1a471c
	writetext UnknownText_0x1a494a
	waitbutton
	closetext
	end
; 0x1a471c

UnknownScript_0x1a471c: ; 0x1a471c
	writetext UnknownText_0x1a4983
	waitbutton
	closetext
	end
; 0x1a4722

CooltrainerFScript_0x1a4722: ; 0x1a4722
	jumptextfaceplayer UnknownText_0x1a49bd
; 0x1a4725

YoungsterScript_0x1a4725: ; 0x1a4725
	jumptextfaceplayer UnknownText_0x1a49f1
; 0x1a4728

CooltrainerFScript_0x1a4728: ; 0x1a4728
	jumptextfaceplayer UnknownText_0x1a4b1e
; 0x1a472b

SantosScript:
	faceplayer
	loadfont
	checkevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	iftrue SantosSaturdayScript
	checkcode VAR_WEEKDAY
	if_not_equal SATURDAY, SantosNotSaturdayScript
	checkevent EVENT_MET_SANTOS_OF_SATURDAY
	iftrue .MetSantos
	writetext MeetSantosText
	buttonsound
	setevent EVENT_MET_SANTOS_OF_SATURDAY
.MetSantos
	writetext SantosGivesGiftText
	buttonsound
	verbosegiveitem SPELL_TAG, 1
	iffalse SantosDoneScript
	setevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	writetext SantosGaveGiftText
	waitbutton
	closetext
	end

SantosSaturdayScript:
	writetext SantosSaturdayText
	waitbutton
SantosDoneScript:
	closetext
	end

SantosNotSaturdayScript:
	writetext SantosNotSaturdayText
	waitbutton
	closetext
	end

MapBlackthornCitySignpost0Script: ; 0x1a4765
	jumptext UnknownText_0x1a4b67
; 0x1a4768

MapBlackthornCitySignpost1Script: ; 0x1a4768
	jumptext UnknownText_0x1a4b91
; 0x1a476b

MapBlackthornCitySignpost2Script: ; 0x1a476b
	jumptext UnknownText_0x1a4bd9
; 0x1a476e

MapBlackthornCitySignpost3Script: ; 0x1a476e
	jumptext UnknownText_0x1a4bef
; 0x1a4771

MapBlackthornCitySignpost4Script: ; 0x1a4771
	jumptext UnknownText_0x1a4c03
; 0x1a4774

MapBlackthornCitySignpost6Script: ; 0x1a4774
	jumpstd pokecentersign
; 0x1a4777

MapBlackthornCitySignpost5Script: ; 0x1a4777
	jumpstd martsign
; 0x1a477a

BlackthornEGKRivalMovement1:
	step_up
	turn_head_right
	step_end

BlackthornEGKRivalMovement2:
	slow_step_down
	slow_step_down
	slow_step_down
	slow_step_down
BlackthornPlayerMovement:
	slow_step_down
	step_end


UnknownText_0x1a477a: ; 0x1a477a
	text "I am sorry."

	para "CLAIR, our GYM"
	line "LEADER, entered"

	para "the DRAGON'S DEN"
	line "behind the GYM."

	para "I have no idea"
	line "when our LEADER"
	cont "will return."
	done
; 0x1a47f3

UnknownText_0x1a47f3: ; 0x1a47f3
	text "CLAIR, our GYM"
	line "LEADER, is waiting"
	cont "for you."

	para "However, it would"
	line "be impossible for"

	para "a run-of-the-mill"
	line "trainer to win."
	done
; 0x1a4865

UnknownText_0x1a4865: ; 0x1a4865
	text "You defeated"
	line "CLAIR?"

	para "That's amazing!"

	para "I've never heard"
	line "of her losing to"

	para "anyone other than"
	line "LANCE."
	done
; 0x1a48c3

UnknownText_0x1a48c3: ; 0x1a48c3
	text "No. Only chosen"
	line "trainers may train"

	para "here."
	line "Please leave."
	done
; 0x1a48fb

UnknownText_0x1a48fb: ; 0x1a48fb
	text "If CLAIR allows"
	line "it, her grand-"
	cont "father--our MASTER"
	cont "--will also."

	para "You may enter."
	done
; 0x1a494a

UnknownText_0x1a494a: ; 0x1a494a
	text "My radio's busted?"
	line "Lately, I only get"
	cont "this weird signal."
	done
; 0x1a4983

UnknownText_0x1a4983: ; 0x1a4983
	text "Arooo! Voices in"
	line "my head!"

	para "Huh? I'm listening"
	line "to my radio!"
	done
; 0x1a49bd

UnknownText_0x1a49bd: ; 0x1a49bd
	text "Are you going to"
	line "make your #MON"
	cont "forget some moves?"
	done
; 0x1a49f1

UnknownText_0x1a49f1: ; 0x1a49f1
	text "Dragon masters all"
	line "come from the city"
	cont "of BLACKTHORN."
	done
; 0x1a4a27

MeetSantosText:
	text "SANTOS: <...>"

	para "It's Saturday<...>"

	para "I'm SANTOS of"
	line "Saturday<...>"
	done

SantosGivesGiftText:
	text "You can have this<...>"
	done

SantosGaveGiftText:
	text "SANTOS: <...>"

	para "SPELL TAG<...>"

	para "Ghost-type moves"
	line "get stronger<...>"

	para "It will frighten"
	line "you<...>"
	done

SantosSaturdayText:
	text "SANTOS: <...>"

	para "See you again on"
	line "another Saturday<...>"

	para "I won't have any"
	line "more gifts<...>"
	done

SantosNotSaturdayText:
	text "SANTOS: Today's"
	line "not Saturday<...>"
	done

UnknownText_0x1a4b1e: ; 0x1a4b1e
	text "Wow, you came"
	line "through the ICE"
	cont "PATH?"

	para "You must be a real"
	line "hotshot trainer!"
	done
; 0x1a4b67

UnknownText_0x1a4b67: ; 0x1a4b67
	text "BLACKTHORN CITY"

	para "A Quiet Mountain"
	line "Retreat"
	done
; 0x1a4b91

UnknownText_0x1a4b91: ; 0x1a4b91
	text "BLACKTHORN CITY"
	line "#MON GYM"
	cont "LEADER: CLAIR"

	para "The Blessed User"
	line "of Dragon #MON"
	done
; 0x1a4bd9

UnknownText_0x1a4bd9: ; 0x1a4bd9
	text "MOVE DELETER'S"
	line "HOUSE"
	done
; 0x1a4bef

UnknownText_0x1a4bef: ; 0x1a4bef
	text "DRAGON'S DEN"
	line "AHEAD"
	done
; 0x1a4c03

UnknownText_0x1a4c03: ; 0x1a4c03
	text "TRAINER TIPS"

	para "A #MON holding"
	line "a MIRACLEBERRY"

	para "will cure itself"
	line "of any status"
	cont "problem."
	done
; 0x1a4c57

BlackthornEGKRivalText1:
	text "<GREEN>: Hunh?"
	line "Hey, if it isn't"
	cont "<PLAYER>!"
	done

BlackthornEGKRivalText2:
	text "Have you been"
	line "goofing off in"
	cont "JOHTO all along?"

	para "Ah, you've been"
	line "collecting BADGES"
	cont "here. Great!"

	para "My rival should"
	line "be strong to keep"
	cont "me sharp!"

	para "While working on"
	line "#DEX, I looked"
	para "all over for"
	line "powerful #MON!"

	para "Not only that, I"
	line "assembled teams"
	para "that would beat"
	line "any #MON type!"

	para "And now!"

	para "I'm about to chal-"
	line "lenge the #MON"
	para "LEAGUE's ELITE"
	line "FOUR!"

	para "<PLAYER>! Do you"
	line "know what that"
	cont "means?"

	para "I'll tell you!"

	para "I'm primed to be-"
	line "come the most"
	para "powerful trainer"
	line "in the world!"
	done

BlackthornEGKRivalWinText:
	text "NO!"

	para "That can't be!"
	line "You beat my best!"

	para "After all that"
	line "work to collect"
	cont "all the badges?"

	para "My reign is over"
	line "before it began?"
	cont "It's not fair!"
	done

BlackthornEGKRivalLossText:
	text "Hahaha!"
	line "I won, I won!"

	para "I'm too good for"
	line "you, <PLAYER>!"

	para "You did well to"
	line "even reach me,"
	cont "<GREEN>, the"
	cont "#MON genius!"

	para "Nice try, loser!"
	line "Hahaha!"
	done

BlackthornEGKRivalText3:
	text "Why?"
	line "Why did I lose?"

	para "I never made any"
	line "mistakes raising"
	cont "my #MON..."

	para "Darn it! You may"
	line "become the LEAGUE"
	para "CHAMPION before"
	line "me!"

	para "Grr<...>"

	para "No! I can't let"
	line "this get me down!"

	para "I should be happy."
	line "Happy for you,"
	cont "<PLAYER>."

	para "No, seriously."
	line "This whole time,"

	para "you've been raising"
	line "your #MON in a"
	cont "way I never could."

	para "You've grown,"
	line "<PLAYER>."

	para "For once, I'm the"
	line "one who needs to"
	cont "catch up to you."

	para "Thanks for showing"
	line "me that."

	para "I need to heal my"
	line "#MON."

	para "<PLAYER>! Really!"
	line "Smell ya later!"
	done

BlackthornEGKRivalText1F:
	text "<PLAYER>? Is that"
	line "really you?"
	done

BlackthornEGKRivalText2F:
	text "It is! I can't be-"
	line "lieve it! <PLAYER>!"

	para "It's been so long"
	line "since our battle"
	cont "on the S.S. ANNE!"

	para "Have you been rai-"
	line "sing your #MON"
	cont "well?"

	para "I've taken really"
	line "good care of mine."

	para "They've grown real"
	line "strong. We've been"
	para "winning BADGES"
	line "quite easily."

	para "Oh? I see you've"
	line "got 7 BADGES your-"
	cont "self!"

	para "That settles it."
	line "<PLAYER>!"

	para "I challenge you to"
	line "a #MON battle!"

	para "Let's show each-"
	line "other just how"

	para "much we've both"
	line "grown!"
	done

BlackthornEGKRivalWinTextF:
	text "Wow!"

	para "<PLAYER>, you've"
	line "gotten really good"
	cont "at this."

	para "Well done!"
	done

BlackthornEGKRivalLossTextF:
	text "Huh, I guess I won"
	line "this one."

	para "Aww, don't feel"
	line "too bad about it,"
	cont "<PLAYER>."

	para "It's not your"
	line "fault you lost."

	para "You put up a good"
	line "fight and had fun"
	cont "doing it!"

	para "Isn't that what's"
	line "important, in the"
	cont "end?"
	done

BlackthornEGKRivalText3F:
	text "Whew<...>"

	para "Congratulations,"
	line "<PLAYER>!"

	para "You've grown up so"
	line "much since I last"
	cont "saw you."

	para "<PLAYER>, you have"
	line "come of age!"

	para "You understand"
	line "that your victory"

	para "was not just your"
	line "own doing!"

	para "The bond you share"
	line "with your #MON"
	cont "is marvelous!"

	para "Well, I need to"
	line "rest up at the"
	cont "#MON CENTER."

	para "<PLAYER>, that was"
	line "a lot of fun."

	para "Promise me we'll"
	line "battle again soon!"
	done

BlackthornCity_MapEventHeader: ; 0x1a4c57
	; filler
	db 0, 0

	; warps
	db 8
	warp_def $b, $12, 1, GROUP_BLACKTHORN_GYM_1F, MAP_BLACKTHORN_GYM_1F
	warp_def $15, $d, 1, GROUP_BLACKTHORN_DRAGON_SPEECH_HOUSE, MAP_BLACKTHORN_DRAGON_SPEECH_HOUSE
	warp_def $17, $1d, 1, GROUP_BLACKTHORN_DODRIO_TRADE_HOUSE, MAP_BLACKTHORN_DODRIO_TRADE_HOUSE
	warp_def $1d, $f, 2, GROUP_BLACKTHORN_MART, MAP_BLACKTHORN_MART
	warp_def $1d, $15, 1, GROUP_BLACKTHORN_POKECENTER_1F, MAP_BLACKTHORN_POKECENTER_1F
	warp_def $1f, $9, 1, GROUP_MOVE_DELETERS_HOUSE, MAP_MOVE_DELETERS_HOUSE
	warp_def $9, $24, 2, GROUP_ICE_PATH_1F, MAP_ICE_PATH_1F
	warp_def $1, $14, 1, GROUP_DRAGONS_DEN_1F, MAP_DRAGONS_DEN_1F

	; xy triggers
	db 0

	; signposts
	db 7
	signpost 24, 34, $0, MapBlackthornCitySignpost0Script
	signpost 13, 17, $0, MapBlackthornCitySignpost1Script
	signpost 31, 7, $0, MapBlackthornCitySignpost2Script
	signpost 3, 21, $0, MapBlackthornCitySignpost3Script
	signpost 25, 5, $0, MapBlackthornCitySignpost4Script
	signpost 29, 16, $0, MapBlackthornCitySignpost5Script
	signpost 29, 22, $0, MapBlackthornCitySignpost6Script

	; people-events
	db 10
	person_event SPRITE_SUPER_NERD, 16, 22, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, SuperNerdScript_0x1a46e8, EVENT_GUY_BLOCKING_BLACKTHORN_GYM
	person_event SPRITE_SUPER_NERD, 16, 23, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, SuperNerdScript_0x1a46e8, EVENT_GUY_NOT_BLOCKING_BLACKTHORN_GYM
	person_event SPRITE_GRAMPS, 6, 24, $6, 0, 0, -1, -1, 0, 0, 0, GrampsScript_0x1a4708, EVENT_GRAMPS_BLOCKING_DRAGONS_DEN
	person_event SPRITE_GRAMPS, 6, 25, $8, 0, 0, -1, -1, 0, 0, 0, GrampsScript_0x1a470b, EVENT_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	person_event SPRITE_BLACK_BELT, 35, 28, $5, 0, 1, -1, -1, 8 + PAL_OW_BLUE, 0, 0, BlackBeltScript_0x1a470e, -1
	person_event SPRITE_COOLTRAINER_F, 29, 13, $5, 0, 2, -1, -1, 8 + PAL_OW_RED, 0, 0, CooltrainerFScript_0x1a4722, -1
	person_event SPRITE_YOUNGSTER, 19, 17, $5, 0, 1, -1, -1, 0, 0, 0, YoungsterScript_0x1a4725, -1
	person_event SPRITE_YOUNGSTER, 24, 26, $6, 0, 0, -1, -1, 0, 0, 0, SantosScript, EVENT_SANTOS_OF_SATURDAY
	person_event SPRITE_COOLTRAINER_F, 23, 39, $7, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, CooltrainerFScript_0x1a4728, -1
	person_event SPRITE_EGK_RIVAL, 15, 39, $7, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_EGK_RIVAL_IN_BLACKTHORN
