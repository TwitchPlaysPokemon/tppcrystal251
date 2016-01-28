ViridianGym_MapScriptHeader: ; 0x9aa24
	; trigger count
	db 0

	; callback count
	db 0
; 0x9aa26

BlueScript_0x9aa26: ; 0x9aa26
	faceplayer
	loadfont
	checkevent EVENT_BLUE_REMATCH
	iftrue BlueAfterRematch
	checkevent EVENT_FIRST_TIME_RED
	iftrue BlueRematchScript
	checkflag ENGINE_EARTHBADGE
	iftrue UnknownScript_0x9aa51
	writetext UnknownText_0x9aa7b
	waitbutton
	closetext
	winlosstext UnknownText_0x9abae, $0000
	checkevent EVENT_GOT_CHARMANDER_FROM_OAK
	iftrue BlueScript_TeamVaporeon
	checkevent EVENT_GOT_BULBASAUR_FROM_OAK
	iftrue BlueScript_TeamFlareon
	loadtrainer BLUE, 3
	jump BlueScript_StartBattle
BlueScript_TeamVaporeon:
	loadtrainer BLUE, 1
	jump BlueScript_StartBattle
BlueScript_TeamFlareon:
	loadtrainer BLUE, 2
BlueScript_StartBattle:
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_BLUE
	setevent EVENT_BEAT_COOLSIBS_ARA_BELLA
	setevent EVENT_BEAT_COOLSIBS_ELAN_IDA
	setevent EVENT_BEAT_COOLTRAINERM_BONITA
	setevent EVENT_BEAT_COOLTRAINERF_SALMA
	loadfont
	writetext UnknownText_0x9ac0f
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_EARTHBADGE
	writetext UnknownText_0x9ac27
	waitbutton
	closetext
	end


BlueRematchScript:
	writetext BlueRematchTextBefore
	waitbutton
	closetext
	winlosstext BlueRematchBeatenText, $0000
	checkevent EVENT_GOT_CHARMANDER_FROM_OAK
	iftrue BlueScript_TeamVaporeonRe
	checkevent EVENT_GOT_BULBASAUR_FROM_OAK
	iftrue BlueScript_TeamFlareonRe
	loadtrainer BLUE, 6
	jump BlueScript_StartBattleRe
BlueScript_TeamVaporeonRe:
	loadtrainer BLUE, 4
	jump BlueScript_StartBattleRe
BlueScript_TeamFlareonRe:
	loadtrainer BLUE, 5
BlueScript_StartBattleRe:
	startbattle
	returnafterbattle
	setevent EVENT_BLUE_REMATCH
	loadfont ;fallthrough

BlueAfterRematch:
	writetext BlueAfterRematchText
	waitbutton
	closetext
	end

BlueRematchTextBefore:
	text "Thanks for coming" 
	line "to lose to me!"
	
	para "This is what I,"
	line "Kanto's top-level"
	cont "Trainer,"
	cont "can really do!"

	done

BlueRematchBeatenText:
	text "You're the"
	line "real deal"
	done

BlueAfterRematchText:
	text "You're tough,"
	line "I'll give you""
	cont "that."
	
	para "But there's always"
	line "someone better."
	
	para "You have to be"
	line "more dedicated!"
	
	para "Smell ya later!"
	done

; 0x9aa51

Trainer_CoolSibsAraBella1:
	dw EVENT_BEAT_COOLSIBS_ARA_BELLA
	db COOL_SIBLINGS, ARA_BELLA1
	dw CoolSibsAraBellaSeenText1
	dw CoolSibsAraBellaBeatenText
	dw $0000
	dw CoolSibsAraBella1Script

CoolSibsAraBella1Script:
	talkaftercancel
	loadfont
	writetext CoolSibsAraBella1Text
	waitbutton
	closetext
	end

Trainer_CoolSibsAraBella2:
	dw EVENT_BEAT_COOLSIBS_ARA_BELLA
	db COOL_SIBLINGS, ARA_BELLA2
	dw CoolSibsAraBellaSeenText2
	dw CoolSibsAraBellaBeatenText
	dw $0000
	dw CoolSibsAraBella2Script

CoolSibsAraBella2Script:
	talkaftercancel
	loadfont
	writetext CoolSibsAraBella2Text
	waitbutton
	closetext
	end

Trainer_CoolSibsElanIda1:
	dw EVENT_BEAT_COOLSIBS_ELAN_IDA
	db COOL_SIBLINGS, ELAN_IDA1
	dw CoolSibsElanIdaSeenText1
	dw CoolSibsElanIdaBeatenText
	dw $0000
	dw CoolSibsElanIda1Script

CoolSibsElanIda1Script:
	talkaftercancel
	loadfont
	writetext CoolSibsElanIda1Text
	waitbutton
	closetext
	end

Trainer_CoolSibsElanIda2:
	dw EVENT_BEAT_COOLSIBS_ELAN_IDA
	db COOL_SIBLINGS, ELAN_IDA2
	dw CoolSibsElanIdaSeenText2
	dw CoolSibsElanIdaBeatenText
	dw $0000
	dw CoolSibsElanIda2Script

CoolSibsElanIda2Script:
	talkaftercancel
	loadfont
	writetext CoolSibsElanIda2Text
	waitbutton
	closetext
	end

Trainer_CooltrainerMBonita:
	dw EVENT_BEAT_COOLTRAINERM_BONITA
	db COOLTRAINERM, BONITA
	dw CooltrainerMBonitaSeenText
	dw CooltrainerMBonitaBeatenText
	dw $0000
	dw CooltrainerMBonitaScript

CooltrainerMBonitaScript:
	talkaftercancel
	loadfont
	writetext CooltrainerMBonitaText
	waitbutton
	closetext
	end

Trainer_CooltrainerFSalma:
	dw EVENT_BEAT_COOLTRAINERF_SALMA
	db COOLTRAINERF, SALMA
	dw CooltrainerFSalmaSeenText
	dw CooltrainerFSalmaBeatenText
	dw $0000
	dw CooltrainerFSalmaScript

CooltrainerFSalmaScript:
	talkaftercancel
	loadfont
	writetext CooltrainerFSalmaText
	waitbutton
	closetext
	end

UnknownScript_0x9aa51: ; 0x9aa51
	writetext UnknownText_0x9acab
	waitbutton
	closetext
	end
; 0x9aa57

ViridianGymGuyScript: ; 0x9aa57
	faceplayer
	loadfont
	checkevent EVENT_BEAT_BLUE
	iftrue .ViridianGymGuyWinScript
	writetext ViridianGymGuyText
	waitbutton
	closetext
	end

.ViridianGymGuyWinScript
	writetext ViridianGymGuyWinText
	waitbutton
	closetext
	end
; 0x9aa6b

MapViridianGymSignpost1Script: ; 0x9aa6b
	checkflag ENGINE_EARTHBADGE
	iftrue UnknownScript_0x9aa74
	jumpstd gymstatue1
; 0x9aa74

UnknownScript_0x9aa74: ; 0x9aa74
	trainertotext BLUE, 1, $1
	jumpstd gymstatue2
; 0x9aa7b

UnknownText_0x9aa7b: ; 0x9aa7b
	text "BLUE: Yo! Finally"
	line "got here, huh?"

	para "I wasn't in the"
	line "mood at CINNABAR,"

	para "but now I'm ready"
	line "to battle you."

	para "<...>"

	para "You're telling me"
	line "you conquered all"
	cont "the GYMS in JOHTO?"

	para "Heh! JOHTO's GYMS"
	line "must be pretty"
	cont "pathetic then."

	para "Hey, don't worry"
	line "about it."

	para "I'll know if you"
	line "are good or not by"

	para "battling you right"
	line "now."

	para "Ready, JOHTO"
	line "CHAMP?"
	done
; 0x9abae

UnknownText_0x9abae: ; 0x9abae
	text "BLUE: What?"

	para "How the heck did I"
	line "lose to you?"

	para "<...>"

	para "Tch, all right<...>"
	line "Here, take this--"
	cont "it's EARTHBADGE."
	done
; 0x9ac0f

UnknownText_0x9ac0f: ; 0x9ac0f
	text "<PLAYER> received"
	line "EARTHBADGE."
	done
; 0x9ac27

UnknownText_0x9ac27: ; 0x9ac27
	text "BLUE: <...>"

	para "All right, I was"
	line "wrong. You're the"

	para "real deal. You are"
	line "a good trainer."

	para "I'm going to call"
	line "CELADON and tell"
	cont "them what they can"
	cont "open the TM DEPOT"
	cont "for you."

	para "Someday I'm going"
	line "to beat you someday."

	para "Don't you forget"
	line "it!"
	done
; 0x9acab

UnknownText_0x9acab: ; 0x9acab
	text "BLUE: Listen, you."

	para "You'd better not"
	line "lose until I beat"
	cont "you. Got it?"
	done
; 0x9acee

ViridianGymGuyText: ; 0x9acee
	text "Yo, CHAMP in"
	line "making!"

	para "How's it going?"
	line "Looks like you're"
	cont "on a roll."

	para "The GYM LEADER is"
	line "a guy who battled"

	para "the CHAMPION three"
	line "months ago."

	para "He's no pushover."

	para "Give it everything"
	line "you've got!"
	done
; 0x9ada0

ViridianGymGuyWinText: ; 0x9ada0
	text "Man, you are truly"
	line "tough<...>"

	para "That was a heck of"
	line "an inspirational"

	para "battle. It brought"
	line "tears to my eyes."
	done
; 0x9ae04

CooltrainerFSalmaSeenText:
	text "What do you think?"

	para "You've never seen"
	line "such a wonderful"

	para "GYM before, have"
	line "you?"
	done

CooltrainerFSalmaBeatenText:
	text "Whatever!"
	done

CooltrainerFSalmaText:
	text "There are many"
	line "kinds of GYMs in"

	para "the world, but I"
	line "really like this"
	cont "one!"
	done

CoolSibsAraBellaSeenText1:
	text "ARA: Anyway, fight"
	line "me and see!"
	done

CoolSibsAraBellaSeenText2:
	text "BELLA: Want to"
	line "know why they call"
	cont "us COOL SIBLINGS?"
	done

CoolSibsAraBellaBeatenText:
	text "ARA: I was"
	line "deceived!"

	para "BELLA: Too strong!"
	done

CoolSibsAraBella1Text:
	text "ARA: Me, I should"
	line "be a pretty good"
	cont "practice partner<...>"
	done

CoolSibsAraBella2Text:
	text "BELLA: You"
	line "shouldn't say that"
	cont "about yourself!"
	done
	
CoolSibsElanIdaSeenText1:
	text "IDA: I'm IDA! Next"
	line "to me is ELAN!"

	para "Together we are"
	line "COOL SIBLINGS!"
	done

CoolSibsElanIdaSeenText2:
	text "ELAN: All right,"
	line "let's get this"
	cont "fight started!"
	para "Come on!"
	done

CoolSibsElanIdaBeatenText:
	text "IDA: Wow. You're"
	line "really something."

	para "ELAN: Well, this"
	line "is surprising."
	done

CoolSibsElanIda1Text:
	text "IDA: If the only"
	line "thing GYM TRAIN-"
	cont "ERs have is"
	cont "strength, they"
	cont "won't do well."

	para "Bringing out your"
	line "opponent's"
	cont "strength is also"
	cont "very important!"
	done

CoolSibsElanIda2Text:
	text "ELAN: You're"
	line "stronger than we"
	cont "anticipated!"
	done

CooltrainerMBonitaSeenText:
	text "Looking around the"
	line "room like that,"

	para "doesn't it make"
	line "you a little diz-"
	cont "zy?"
	done

CooltrainerMBonitaBeatenText:
	text "All of my #MON<...>"
	line "All dizzy and"
	cont "fainted<...>"
	done

CooltrainerMBonitaText:
	text "Looks like you've"
	line "still got some en-"
	cont "ergy left."
	done

ViridianGym_MapEventHeader: ; 0x9ae04
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $2d, $6, 1, GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY
	warp_def $2d, $7, 1, GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 43, 5, $0, MapViridianGymSignpost1Script
	signpost 43, 8, $0, MapViridianGymSignpost1Script

	; people-events
	db 8
	person_event SPRITE_BLUE, 7, 11, $6, 0, 0, -1, -1, 0, 0, 0, BlueScript_0x9aa26, EVENT_BLUE_IN_HIS_GYM
	person_event SPRITE_GYM_GUY, 45, 12, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ViridianGymGuyScript, EVENT_BLUE_IN_HIS_GYM
	person_event SPRITE_COOLTRAINER_F, 12, 11, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 1, Trainer_CoolSibsElanIda1, EVENT_BLUE_IN_HIS_GYM
	person_event SPRITE_COOLTRAINER_M, 12, 10, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 1, Trainer_CoolSibsElanIda2, EVENT_BLUE_IN_HIS_GYM
	person_event SPRITE_COOLTRAINER_M, 24, 7, $9, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 1, Trainer_CooltrainerMBonita, EVENT_BLUE_IN_HIS_GYM
	person_event SPRITE_COOLTRAINER_F, 38, 7, $9, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 1, Trainer_CooltrainerFSalma, EVENT_BLUE_IN_HIS_GYM
	person_event SPRITE_COOLTRAINER_M, 39, 10, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 1, Trainer_CoolSibsAraBella1, EVENT_BLUE_IN_HIS_GYM
	person_event SPRITE_COOLTRAINER_F, 39, 11, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 1, Trainer_CoolSibsAraBella2, EVENT_BLUE_IN_HIS_GYM
; 0x9ae38

