elitefloorblock: MACRO
IF \1 == 0
	warp_def \2, \3, 3, GROUP_ECRUTEAK_ELITE_FLOOR, MAP_ECRUTEAK_ELITE_FLOOR
	warp_def \2, \3+1, 3, GROUP_ECRUTEAK_ELITE_FLOOR, MAP_ECRUTEAK_ELITE_FLOOR
ELSE
IF \1 == 1
	warp_def \2, \3+1, 3, GROUP_ECRUTEAK_ELITE_FLOOR, MAP_ECRUTEAK_ELITE_FLOOR
	warp_def \2+1, \3+1, 3, GROUP_ECRUTEAK_ELITE_FLOOR, MAP_ECRUTEAK_ELITE_FLOOR
ELSE
IF \1 == 2
	warp_def \2, \3, 3, GROUP_ECRUTEAK_ELITE_FLOOR, MAP_ECRUTEAK_ELITE_FLOOR
	warp_def \2+1, \3, 3, GROUP_ECRUTEAK_ELITE_FLOOR, MAP_ECRUTEAK_ELITE_FLOOR
ELSE
	warp_def \2+1, \3, 3, GROUP_ECRUTEAK_ELITE_FLOOR, MAP_ECRUTEAK_ELITE_FLOOR
	warp_def \2+1, \3+1, 3, GROUP_ECRUTEAK_ELITE_FLOOR, MAP_ECRUTEAK_ELITE_FLOOR
ENDC
ENDC
ENDC
ENDM

elitefloor: MACRO
	elitefloorblock \1, efloorrow, 2
	elitefloorblock \2, efloorrow, 4
	elitefloorblock \3, efloorrow, 6
	elitefloorblock \4, efloorrow, 8
	elitefloorblock \5, efloorrow, 10
	elitefloorblock \6, efloorrow, 12
	elitefloorblock \7, efloorrow, 14
	elitefloorblock \8, efloorrow, 16
	elitefloorblock \9, efloorrow, 18
efloorrow = efloorrow + 2
ENDM

revealefloor: MACRO
	changeblock 2, efloorrow, $40 + \1
	changeblock 4, efloorrow, $40 + \2
	changeblock 6, efloorrow, $40 + \3
	changeblock 8, efloorrow, $40 + \4
	changeblock 10, efloorrow, $40 + \5
	changeblock 12, efloorrow, $40 + \6
	changeblock 14, efloorrow, $40 + \7
	changeblock 16, efloorrow, $40 + \8
	changeblock 18, efloorrow, $40 + \9
efloorrow = efloorrow + 2
ENDM

EcruteakEliteFloor_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 1
	
	dbw 1, EcruteakEliteFloorCallback
	
EcruteakEliteFloorCallback:
	checkevent EVENT_MORTY_REMATCH
	iftrue .revealall
	return
.revealall
	scall RevealWholeFloor
	return

RevealWholeFloor:
efloorrow = 4
	revealefloor 0,0,3,3,2,0,0,3,1
	revealefloor 2,2,0,0,1,3,2,2,3
	revealefloor 2,0,3,0,3,3,3,2,0
	revealefloor 3,3,3,3,3,3,3,1,1
	revealefloor 2,3,3,3,3,3,3,1,1
	revealefloor 2,0,2,0,0,2,2,0,1
	revealefloor 0,2,0,1,2,2,3,2,0
	revealefloor 2,0,0,2,3,2,2,1,1
	revealefloor 2,0,0,2,0,2,2,0,1
	end

MortyRematchScript2:
	faceplayer
	loadfont
	checkevent EVENT_MORTY_REMATCH
	iftrue MortyAfterRematch2
	writetext MortyRematchTextBefore2
	waitbutton
	closetext
	winlosstext MortyRematchBeatenText2, $0000
	loadtrainer MORTY, 2
	startbattle
	returnafterbattle
	setevent EVENT_MORTY_REMATCH
	scall RevealWholeFloor
	reloadmappart
	loadfont
MortyAfterRematch2:
	writetext MortyAfterRematchText2
	waitbutton
	closetext
	end

EfloorGrampsScript:
	faceplayer
	loadfont
	writetext EfloorGrampsText
	waitbutton
	closetext
	playsound SFX_WALL_OPEN
	changeblock 2, 10, $43
	changeblock 4, 10, $43
	changeblock 6, 10, $43
	changeblock 8, 10, $43
	changeblock 10, 10, $43
	changeblock 12, 10, $43
	changeblock 2, 12, $42
	changeblock 4, 12, $43
	changeblock 6, 12, $43
	changeblock 8, 12, $43
	changeblock 10, 12, $43
	changeblock 12, 12, $43
	changeblock 2, 14, $42
	changeblock 4, 14, $40
	changeblock 6, 14, $42
	reloadmappart
	end

EfloorGranny1Script:
	faceplayer
	loadfont
	writetext EfloorGranny1Text
	waitbutton
	closetext
	playsound SFX_WALL_OPEN
	changeblock 2, 4, $40
	changeblock 4, 4, $40
	changeblock 2, 6, $42
	changeblock 4, 6, $42
	changeblock 6, 6, $40
	changeblock 8, 6, $40
	changeblock 10, 6, $41
	changeblock 2, 8, $42
	changeblock 4, 8, $40
	changeblock 6, 8, $43
	changeblock 8, 8, $40
	reloadmappart
	end

EfloorGranny2Script:
	faceplayer
	loadfont
	writetext EfloorGranny2Text
	waitbutton
	closetext
	playsound SFX_WALL_OPEN
	changeblock 8, 14, $40
	changeblock 10, 14, $40
	changeblock 12, 14, $42
	changeblock 14, 14, $42
	changeblock 8, 16, $41
	changeblock 10, 16, $42
	changeblock 12, 16, $42
	changeblock 14, 16, $43
	changeblock 16, 16, $42
	changeblock 18, 16, $40
	changeblock 8, 18, $42
	changeblock 10, 18, $43
	changeblock 12, 18, $42
	changeblock 14, 18, $42
	changeblock 16, 18, $41
	changeblock 18, 18, $41
	reloadmappart
	end

EfloorSage1Script:
	faceplayer
	loadfont
	writetext EfloorSage1Text
	waitbutton
	closetext
	playsound SFX_WALL_OPEN
	changeblock 16, 4, $43
	changeblock 18, 4, $41
	changeblock 16, 6, $42
	changeblock 18, 6, $43
	changeblock 16, 8, $42
	changeblock 18, 8, $40
	changeblock 14, 10, $43
	changeblock 16, 10, $41
	changeblock 18, 10, $41
	changeblock 14, 12, $43
	changeblock 16, 12, $41
	changeblock 18, 12, $41
	changeblock 16, 14, $40
	changeblock 18, 14, $41
	reloadmappart
	end

EfloorSage2Script:
	faceplayer
	loadfont
	writetext EfloorSage2Text
	waitbutton
	closetext
	playsound SFX_WALL_OPEN
	changeblock 2, 16, $40
	changeblock 4, 16, $42
	changeblock 6, 16, $40
	changeblock 2, 18, $42
	changeblock 4, 18, $40
	changeblock 6, 18, $40
	changeblock 2, 20, $42
	changeblock 4, 20, $40
	changeblock 6, 20, $40
	changeblock 8, 20, $42
	changeblock 10, 20, $40
	changeblock 12, 20, $42
	changeblock 14, 20, $42
	changeblock 16, 20, $40
	changeblock 18, 20, $41
	reloadmappart
	end

EcruteakGymGuy2Script: ; 0x99e39
	faceplayer
	loadfont
	checkevent EVENT_MORTY_REMATCH
	iftrue .EcruteakGymGuyWinScript
	writetext EcruteakGymGuy2Text
	waitbutton
	closetext
	end

.EcruteakGymGuyWinScript
	writetext EcruteakGymGuy2WinText
	waitbutton
	closetext
	end

MapEcruteakGym2Signpost1Script:
	trainertotext MORTY, 1, $1
	jumpstd gymstatue2

MortyRematchTextBefore2:
	text "Welcome back,"
	line "<PLAY_G>."

	para "I see you were"
	line "able to defeat"
	cont "the ELITE FLOOR."

	para "Ha-Ha!"

	para "<...>So the legend was"
	line "true, and HO-OH"
	cont "chose you<...>"

	para "But that does not"
	line "mean that I have"

	para "lost out on my"
	line "future."

	para "Show me the power"
	line "I trained to face!"
	done

MortyRematchBeatenText2:
	text "How is this"
	line "possible<...>?"
	done

MortyAfterRematchText2:
	text "Our potentials"
	line "aren't so"
	cont "different."

	para "But you seem to"
	line "have something<...>"

	para "Something more" 
	line "than that<...>"
	done

EfloorGrampsText:
	text "A long time ago,"
	line "I would listen to"

	para "a song that was"
	line "inspirational."

	para "I couldn't under-"
	line "stand most of the"

	para "words, but they"
	line "kept saying to"
	cont "DO YOUR BEST<...>"

	para "<...>But I can't"
	line "remember the name"
	para "of that catchy"
	line "tune."

	para "<...>Maybe it was"
	line "part of a"
	cont "compilation?"
	done

EfloorGranny1Text:

	text "I don't know why"
	line "MORTY had the idea"

	para "to rebuild his"
	line "puzzle to be this"
	cont "hard<...>"

	para "He once heard a"
	line "story about a"

	para "trainer who would"
	line "always jump ledges"
	cont "on ROUTE 22."

	para "I wonder if that's"
	line "why he did this?"

	done

EfloorGranny2Text:
	text "No matter how hard"
	line "the obstacle you"
	cont "are facing is<...>"

	para "You can always"
	line "overcome it!"

	para "Stay determined!"
	done

EfloorSage1Text:
	text "Oh hello!"

	para "Sorry to tell you,"
	line "but this is the"
	cont "wrong path<...>"

	para "There's nothing"
	line "except a dead end"
	cont "behind me."
	done

EfloorSage2Text:
	text "Ah-ha!"

	para "You have fallen"
	line "into my trap!"

	para "Try the other"
	line "entrance and hope"

	para "that MORTY doesn't"
	line "fool you again."
	done

EcruteakGymGuy2Text:

	text "Yo, Champ!"

	para "MORTY has upgraded"
	line "his floor to the"
	cont "whole new level!"

	para "He even called it"
	line "THE ELITE FLOOR<...>"

	para "I really don't"
	line "understand him"
	cont "sometimes<...>"
	done

EcruteakGymGuy2WinText:
	text "Whew, <PLAYER>."
	line "You did great!"

	para "I was cowering in"
	line "the corner out of"
	cont "pure terror!"
	done

EcruteakEliteFloor_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 9 * 9 * 2 + 3
	warp_def $19, $a, 10, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $19, $b, 10, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $16, $a, 4, GROUP_ECRUTEAK_ELITE_FLOOR, MAP_ECRUTEAK_ELITE_FLOOR
efloorrow = 4
	elitefloor 0,0,3,3,2,0,0,3,1
	elitefloor 2,2,0,0,1,3,2,2,3
	elitefloor 2,0,3,0,3,3,3,2,0
	elitefloor 3,3,3,3,3,3,3,1,1
	elitefloor 2,3,3,3,3,3,3,1,1
	elitefloor 2,0,2,0,0,2,2,0,1
	elitefloor 0,2,0,1,2,2,3,2,0
	elitefloor 2,0,0,2,3,2,2,1,1
	elitefloor 2,0,0,2,0,2,2,0,1

	; coord events
	db 0

	; bg events
	db 2
	signpost $17, $9, $0, MapEcruteakGym2Signpost1Script
	signpost $17, $c, $0, MapEcruteakGym2Signpost1Script

	; object events
	db 7
	person_event SPRITE_MORTY, 5, 15, $6, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 0, 0, MortyRematchScript2, -1
	person_event SPRITE_GYM_GUY, 27, 17, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, EcruteakGymGuy2Script, -1
	person_event SPRITE_SAGE, 12, 22, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, EfloorSage1Script, -1
	person_event SPRITE_SAGE, 21, 6, $9, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, EfloorSage2Script, -1
	person_event SPRITE_GRANNY, 11, 15, $6, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 0, 0, EfloorGranny1Script, -1
	person_event SPRITE_GRANNY, 19, 18, $6, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 0, 0, EfloorGranny2Script, -1
	person_event SPRITE_GRAMPS, 15, 7, $6, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, EfloorGrampsScript, -1
