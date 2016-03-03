BlackthornGymRematch1F_MapScriptHeader:
	; trigger
	db 0

	; callback count
	db 1

	; callback
	dbw 1, BoulderTile

; <scripts go here>
BoulderTiles: ; 0x194e05
	checkevent EVENT_BLACKTHORN_REMATCH_BOULDER_1
	iffalse .check2
	changeblock 12, 12, $3B
.check2
	checkevent EVENT_BLACKTHORN_REMATCH_BOULDER_2
	iffalse .check3
	changeblock 6, 16, $3B
.check3
	checkevent EVENT_BLACKTHORN_REMATCH_BOULDER_3
	iffalse .check4
	changeblock 2, 12, $3B
.check4
	checkevent EVENT_BLACKTHORN_REMATCH_BOULDER_4
	iffalse .nope
	changeblock 8, 2, $3B
.nope
	return

ClairTextScript:
	faceplayer
	loadfont
	checkevent EVENT_CLAIR_REMATCH
	iffalse ClairMeetMeInDragonsDenScript
	writetext ClairFullyDefeatedText
	waitbutton
	closetext
	end

ClairMeetMeInDragonsDenScript:
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iffalse ClairRejectNoMtMoon
	checkevent EVENT_BEAT_INDIGO_RIVAL_AT_LEAST_ONCE
	iffalse ClairReject
	writetext ClairMeetMeInDragonsDenText
	waitbutton
	closetext
	domaptrigger GROUP_DRAGONS_DEN_B1F, MAP_DRAGONS_DEN_B1F, $1
	end

ClairRejectNoMtMoon:
	writetext ClairRejectNoMtMoonText
	waitbutton
	closetext
	end

ClairReject:
	writetext ClairRejectText
	waitbutton
	closetext
	end

BlackthornGym2GuyScript:
	faceplayer
	loadfont
	checkevent EVENT_CLAIR_REMATCH
	iftrue .BlackthornGymGuyWinScript
	writetext BlackthornGym2GuyText
	waitbutton
	closetext
	end

.BlackthornGymGuyWinScript
	writetext BlackthornGym2GuyWinText
	waitbutton
	closetext
	end

BlackthornGymRematchStatue: ; 0x194eea
	checkflag ENGINE_RISINGBADGE
	iftrue BlackthornGymRematchStatue2
	jumpstd gymstatue1

BlackthornGymRematchStatue2: ; 0x194ef3
	trainertotext CLAIR, 1, $1
	jumpstd gymstatue2

ClairMeetMeInDragonsDenText:
	text "Let me guess."

	para "You want a rematch"
	line "with me?"

	para "Fine. Meet me at"
	line "the DRAGON SHRINE."

	para "You know where"
	line "that is, right?"

	para "I will meet you"
	line "there."
	done

ClairRejectNoMtMoonText:
	text "Let me guess."

	para "You want a rematch"
	line "with me?"

	para "It'll have to be"
	line "later."

	para "I'm training with"
	line "the elders today."

	done

ClairRejectText:
	text "Let me guess."

	para "You want a rematch"
	line "with me?"

	para "While I'd love to"
	line "have another go"
	cont "with you<...>"

	para "There's this red-"
	line "haired boy who's"

	para "been training in"
	line "the DRAGON'S DEN."

	para "He keeps talking"
	line "about how he needs"

	para "to become stronger"
	line "so he can stand up"
	cont "to you."

	para "I think I've seen"
	line "him around INDIGO"
	cont "PLATEAU a few days"
	cont "during the week."

	para "I'll get ready"
	line "while you deal"
	cont "with that."

	done

ClairFullyDefeatedText:
	text "Thank you for the"
	line "rematch."

	para "It's always been"
	line "a dream of mine"
	para "to fight a trainer"
	line "as powerful as"
	cont "you, <PLAY_G>."

	para "I could not have"
	line "imagined a better"
	para "place than the"
	line "DRAGON SHRINE to"
	para "face such a worthy"
	line "opponent."

	para "Good luck on"
	line "your journey."

	done

BlackthornGym2GuyText:
	text "Yo, CHAMP!"

	para "Looks like CLAIR"
	line "did some re-"
	cont "modeling while you"
	cont "were away!"

	para "<...>I wonder when"
	line "she found the"
	cont "time to do this<...>"
	done

BlackthornGym2GuyWinText:
	text "I heard the news!"

	para "I wish I could"
	line "have seen the"
	cont "battle!"

	para "Congratulations,"
	cont "CHAMP!"
	done

BlackthornGymRematch1F_MapEventHeader:
	; filler
	db 0, 0

	; warp
	db 12
	warp_def $17, $4, 1, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY
	warp_def $17, $5, 1, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY
	warp_def $15, $d, 1, GROUP_BLACKTHORNGYMREMATCH2F, MAP_BLACKTHORNGYMREMATCH2F
	warp_def $d, $5, 2, GROUP_BLACKTHORNGYMREMATCH2F, MAP_BLACKTHORNGYMREMATCH2F
	warp_def $9, $9, 3, GROUP_BLACKTHORNGYMREMATCH2F, MAP_BLACKTHORNGYMREMATCH2F
	warp_def $9, $3, 4, GROUP_BLACKTHORNGYMREMATCH2F, MAP_BLACKTHORNGYMREMATCH2F
	warp_def $3, $d, 5, GROUP_BLACKTHORNGYMREMATCH2F, MAP_BLACKTHORNGYMREMATCH2F
	warp_def $9, $f, 6, GROUP_BLACKTHORNGYMREMATCH2F, MAP_BLACKTHORNGYMREMATCH2F

	warp_def $d, $d, 9, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F
	warp_def $11, $7, 10, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F
	warp_def $d, $3, 11, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F
	warp_def $3, $9, 12, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F

	; coord event
	db 0

	; bg event
	db 2
	signpost 21, 3, $0, BlackthornGymRematchStatue
	signpost 21, 6, $0, BlackthornGymRematchStatue

	; object event
	db 2
	person_event SPRITE_CLAIR, 7, 8, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ClairTextScript, -1
	person_event SPRITE_GYM_GUY, 25, 9, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, BlackthornGym2GuyScript, -1

