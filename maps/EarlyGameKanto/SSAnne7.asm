SSAnne7_MapScriptHeader:
	db 0
	db 0

SSAnne7CaptainScript:
	loadfont
	checkevent EVENT_S_S_ANNE_RUBBED_CAPTAINS_BACK
	iftrue .rubbed_back
	writetext _SSAnne7RubText
	playmusic MUSIC_HEAL
	pause 60
	setevent EVENT_S_S_ANNE_RUBBED_CAPTAINS_BACK
	special RestartMapMusic
	waitbutton
	closetext
	faceplayer
	loadfont
	writetext _NotReceivingHM01Text
	waitbutton
	closetext
	special Special_FadeToBlack
	special Functiond91
	playmusic MUSIC_HEAL
	special HealParty
	blackoutmod GROUP_S_S_ANNE_10, MAP_S_S_ANNE_10
	pause 60
	special Function8c0ab
	special RestartMapMusic
	loadfont
	writetext _SSAnne7Text_61932
	waitbutton
	closetext
	spriteface $0, DOWN
	loadfont
	writetext SSAnne7Text_CaptainSetsSail1
	pause 30
	writetext SSAnne7Text_CaptainSetsSail2
	pause 30
	writetext SSAnne7Text_CaptainSetsSail3
	pause 30
	closetext
	pause 15
	playsound SFX_BOAT
	earthquake 45
	pause 15
	faceplayer
	loadfont
	writetext SSAnne7Text_CaptainSetsSail4
	waitbutton
	closetext
	special Function114fc
	end

.rubbed_back
	writetext SSAnne7Text_CaptainSetsSail5
	waitbutton
	closetext
	checkflag ENGINE_51
	iffalse .end
	appear $3
	playsound SFX_EXIT_BUILDING
	waitsfx
	playmusic MUSIC_ROCKET_ENCOUNTER
	checkcode VAR_FACING
	if_equal LEFT, .facing_left
	if_equal RIGHT, .facing_right
	applymovement $3, SSAnne7_Rocket1RunsUpToCaptainLeft
	appear $4
	playsound SFX_EXIT_BUILDING
	waitsfx
	applymovement $4, SSAnne7_Rocket1RunsUpToCaptainRight
	loadfont
	writetext SSAnne7Text_RocketsText
	waitbutton
	closetext
	spriteface $2, LEFT
	pause 15
	spriteface $2, RIGHT
	jump .finish
.facing_left
	applymovement $3, SSAnne7_Rocket1RunsUpToCaptainLeft
	appear $4
	playsound SFX_EXIT_BUILDING
	waitsfx
	applymovement $4, SSAnne7_Rocket1RunsUpToCaptainBelow
	loadfont
	writetext SSAnne7Text_RocketsText
	waitbutton
	closetext
	spriteface $2, LEFT
	pause 15
	spriteface $2, DOWN
	jump .finish
.facing_right
	applymovement $3, SSAnne7_Rocket1RunsUpToCaptainRight
	appear $4
	playsound SFX_EXIT_BUILDING
	waitsfx
	applymovement $4, SSAnne7_Rocket1RunsUpToCaptainBelow
	loadfont
	writetext SSAnne7Text_RocketsText
	waitbutton
	closetext
	spriteface $2, RIGHT
	pause 15
	spriteface $2, DOWN
.finish
	pause 15
	loadfont
	writetext SSAnne7Text_CaptainConfused
	waitbutton
	closetext
	special Special_FadeToBlack
	special Functiond91
	disappear $2
	disappear $3
	disappear $4
	clearevent EVENT_ROCKETS_NOT_YET_BOARDED_SS_ANNE
	domaptrigger GROUP_S_S_ANNE_5, MAP_S_S_ANNE_5, 1
	playmusic MUSIC_NONE
	playsound SFX_TACKLE
	pause 60
	playsound SFX_TACKLE
	pause 60
	playsound SFX_EXIT_BUILDING
	waitsfx
	playsound SFX_EXIT_BUILDING
	waitsfx
	special Function8c0ab
	special RestartMapMusic
.end
	end

SSAnne7TrashcanScript:
	jumptext _SSAnne7Text2
SSAnne7SeasicknessBookScript:
	jumptext _SSAnne7Text3

SSAnne7_Rocket1RunsUpToCaptainLeft:
	step_right
	step_right
	step_right
	step_up
	step_up
	step_up
	step_up
	step_up
	turn_head_right
	step_end

SSAnne7_Rocket1RunsUpToCaptainBelow:
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_up
	step_up
	step_end

SSAnne7_Rocket1RunsUpToCaptainRight:
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_up
	step_up
	step_right
	step_up
	turn_head_left
	step_end

_SSAnne7RubText:
	text "CAPTAIN: Ooargh…"
	line "I feel hideous…"
	cont "Urrp! Seasick…"

	para "<PLAYER> rubbed"
	line "the CAPTAIN's"
	cont "back!"

	para "Rub-rub…"
	line "Rub-rub…"
	done

_NotReceivingHM01Text:
	text "CAPTAIN: Whew!"
	line "Thank you! I"
	cont "feel much better!"

	para "You want to see"
	line "my CUT technique?"

	para "I could show you"
	line "if I wasn't ill…"

	para "I know! Let me"
	line "heal your #MON."

	para "It's the least I"
	line "can do to thank"
	cont "you for healing"
	cont "me."
	done

_SSAnne7Text_61932:
	text "CAPTAIN: Whew!"

	para "Now that I'm not"
	line "sick any more, I"
	cont "guess it's time."
	done

SSAnne7Text_CaptainSetsSail1:
	text "All set for depar-"
	line "ture?"
	done

SSAnne7Text_CaptainSetsSail2:
	text "PA: Aye-aye, cap-"
	line "tain!"
	done

SSAnne7Text_CaptainSetsSail3:
	text "Then let's get out"
	line "to sea, lads!"
	done

SSAnne7Text_CaptainSetsSail4:
	text "And we're off!"

	para $56, " ", $56, " ", $56
	line $56, " ", $56, "Huh?"

	para "You wanted to get"
	line "off in VERMILION?"

	para "Oh, this is un-"
	line "usual", $75

	para "If we go back now,"
	line "other passengers"
	cont "will be upset."

	para "It'll be another"
	line "year before we"
	cont "can return."

	para "Our next port of"
	line "call is OLIVINE"
	cont "CITY in around"
	cont "a week's time."

	para "If you get off in"
	line "OLIVINE, we can"
	cont "arrange FAST SHIP"
	cont "passage back to"
	cont "VERMILION CITY."

	para "Meanwhile, you're"
	line "welcome to enjoy"
	cont "our onboard"
	cont "luxury services."
	done

SSAnne7Text_CaptainSetsSail5:
	text "Ah, <PLAYER>!"

	para "Are you enjoying"
	line "your stay aboard"
	cont "the S.S.ANNE?"
	done

SSAnne7Text_RocketsText:
	text "Not another word,"
	line "CAPTAIN."
	cont "This is a mutiny."

	para "Come quietly, or"
	line "you will expe-"
	cont "rience a world of"
	cont "pain."
	done

SSAnne7Text_CaptainConfused:
	text "Wh-what's this"
	line "about? Mutiny?!"
	done

_SSAnne7Text2:
	text "Yuck! Shouldn't"
	line "have looked!"
	done

_SSAnne7Text3:
	text "How to Conquer"
	line "Seasickness…"
	para "The CAPTAIN's"
	line "reading this!"
	done

SSAnne7_MapEventHeader:
	db 0, 0
	db 1
	warp_def 7, 0, 9, GROUP_S_S_ANNE_2, MAP_S_S_ANNE_2

	db 0
	db 2
	signpost 1, 4, $0, SSAnne7TrashcanScript
	signpost 2, 1, $0, SSAnne7SeasicknessBookScript

	db 3
	person_event SPRITE_GRAMPS, 6, 8, $7, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, SSAnne7CaptainScript, EVENT_ROCKET_TAKEOVER_OF_SS_ANNE
	person_event SPRITE_ROCKET, 11, 4, $7, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_S_S_ANNE_7_ROCKETS
	person_event SPRITE_GIOVANNI, 11, 4, $7, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_S_S_ANNE_7_ROCKETS
