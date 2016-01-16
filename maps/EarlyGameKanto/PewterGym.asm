PewterGymRB_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

PewterGymRB_BrockScript:
	faceplayer
	loadfont
	checkflag ENGINE_BOULDERBADGE
	iftrue .have_badge
	writetext PewterGymRB_BrockIntroText
	waitbutton
	closetext
	winlosstext PewterGymRB_BrockLostText, $0000
	loadtrainer BROCK, BROCK_RB
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_BROCK
	setevent EVENT_BEAT_CAMPER_JERRY ; XXX
	loadfont
	writetext PewterGymRB_GotBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_BOULDERBADGE
	writetext PewterGymRB_BrockCongratsText
	waitbutton
	scall .tm
	closetext
	end

.have_badge:
	writetext PewterGymRB_BrockAfterText
	waitbutton
	scall .tm
	closetext
	end

.tm:
	givetm TM_SANDSTORM, EVENT_GOT_TM_SANDSTORM, .already_had_it, .bag_full
	writetext PewterGymRB_TMText
.already_had_it:
.bag_full:
	end

TrainerCamperJerryRB:
	trainer EVENT_BEAT_CAMPER_JERRY, CAMPER, JERRY_RB, CamperJerryRBSeenText, CamperJerryRBBeatenText, NULL, CamperJerryRBScript

CamperJerryRBScript:
	talkaftercancel
	loadfont
	writetext CamperJerryRBAfterText
	waitbutton
	closetext
	end

PewterGymRB_GymGuyScript:
	faceplayer
	loadfont
	checkevent EVENT_BEAT_BROCK
	iftrue .Won
	writetext PewterGymRB_GymGuyText
	waitbutton
	closetext
	end

.Won
	writetext PewterGymRB_GymGuyWinText
	yesorno
	iffalse .no
	writetext PewterGymRB_GymGuyYesText
	jump .ok
.no
	writetext PewterGymRB_GymGuyNoText
.ok
	writetext PewterGymRB_AdviceText
	waitbutton
	closetext
	end

PewterGymRB_StatueScript:
	checkflag ENGINE_BOULDERBADGE
	iftrue .HaveBadge
	jumpstd gymstatue1

.HaveBadge:
	trainertotext BROCK, BROCK_RB, $1
	jumpstd gymstatue2

PewterGymRB_BrockIntroText:
	text "I'm BROCK!"
	line "I'm PEWTER's GYM"
	cont "LEADER!"

	para "I believe in rock"
	line "hard defense and"
	cont "determination!"

	para "That's why my"
	line "#MON are all"
	cont "the ROCK-type!"

	para "Do you still want"
	line "to challenge me?"

	para "Fine then! Show"
	line "me your best!"
	done

;	text "BROCK: Wow, it's"
;	line "not often that we"

;	para "get a challenger"
;	line "from JOHTO."

;	para "I'm BROCK, the"
;	line "PEWTER GYM LEADER."

;	para "I'm an expert on"
;	line "rock-type #MON."

;	para "My #MON are im-"
;	line "pervious to most"

;	para "physical attacks."
;	line "You'll have a hard"

;	para "time inflicting"
;	line "any damage."

;	para "Come on!"
;	done

PewterGymRB_BrockLostText:

	text "BROCK: I took"
	line "you for granted."

	para "As proof of your"
	line "victory, here's"
	cont "the BOULDERBADGE!"
	done

PewterGymRB_GotBadgeText:
	text "<PLAYER> received"
	line "BOULDERBADGE."
	done

PewterGymRB_BrockCongratsText:

	text "BROCK: <PLAY_G>,"
	line "thanks. I enjoyed"

	para "battling you, even"
	line "though I am a bit"
	cont "upset."

	para "That BOULDERBADGE"
	line "will make your"

	para "#MON even more"
	line "powerful."
	done

PewterGymRB_BrockAfterText:
	text "There are all"
	line "kinds of trainers"
	cont "in the world!"

	para "You appear to be"
	line "very gifted as a"
	cont "#MON trainer!"

	para "Go to the GYM in"
	line "CERULEAN and test"
	cont "your abilities!"
	done

;	text "BROCK: The world"
;	line "is huge. There are"

;	para "still many strong"
;	line "trainers like you."

;	para "Just wait and see."
;	line "I'm going to be-"
;	cont "come a lot strong-"
;	cont "er too."
;	done

PewterGymRB_TMText:
	text "A TM contains a"
	line "technique that"
	para "can be taught to"
	line "#MON!"

	; XXX Is this still the case?
	para "A TM is good only"
	line "once! So when you"
	para "use one to teach"
	line "a new technique,"
	para "pick the #MON"
	line "carefully!"

	para "TM37 contains"
	line "SANDSTORM!"

	para "Your #MON will"
	line "strengthen their"
	para "defenses while"
	line "dealing damage!"
	done

;	para "TM34 contains"
;	line "BIDE!"

;	para "Your #MON will"
;	line "absorb damage in"
;	cont "battle then pay"
;	cont "it back double!"
;	done
t
CamperJerryRBSeenText:
	text "Stop right there,"
	line "kid!"

	para "You're still light"
	line "years from facing"
	cont "BROCK!"
	done

CamperJerryRBBeatenText:
	text "Darn!"

	para "Light years isn't"
	line "time! It measures"
	cont "distance!"
	done

CamperJerryRBAfterText:
	text "You're pretty hot,"
	line "but not as hot"
	cont "as BROCK!"
	done

PewterGymRB_GymGuyText:
	text "Hiya! I can tell"
	line "you have what it"
	cont "takes to become a"
	cont "#MON champ!"

	para "I'm no trainer,"
	line "but I can tell"
	cont "you how to win!"

	para "Let me take you"
	line "to the top!"
	done

PewterGymRB_GymGuyYesText:
	text "All right! Let's"
	line "get happening!"
	done

PewterGymRB_AdviceText:
	text "The 1st #MON"
	line "out in a match is"
	para "at the top of the"
	line "#MON LIST!"

	para "By changing the"
	line "order of #MON,"
	para "matches could be"
	line "made easier!"
	done

PewterGymRB_GymGuyNoText:
	text "It's a free"
	line "service! Let's"
	cont "get happening!"
	done

PewterGymRB_GymGuyWinText:
	text "Just as I thought!"
	line "You're #MON"
	cont "champ material!"

	para "The way you took"
	line "charge was really"
	para "inspiring. I mean"
	line "that seriously."
	done

PewterGymRB_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def 13, 4, 2, GROUP_PEWTER_CITY_RB, MAP_PEWTER_CITY_RB
	warp_def 13, 5, 2, GROUP_PEWTER_CITY_RB, MAP_PEWTER_CITY_RB

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 11, 2, $0, PewterGymRB_StatueScript
	signpost 11, 7, $0, PewterGymRB_StatueScript

	; people-events
	db 3
	person_event SPRITE_BROCK, 5, 9, $6, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 0, 0, PewterGymRB_BrockScript, -1
	person_event SPRITE_YOUNGSTER, 9, 6, $9, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 2, 3, TrainerCamperJerryRB, -1
	person_event SPRITE_GYM_GUY, 15, 10, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 1, PewterGymRB_GymGuyScript, -1
