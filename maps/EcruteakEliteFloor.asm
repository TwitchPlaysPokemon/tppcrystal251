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

EcruteakEliteFloor_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 0
	
MortyAfterRematch2:
	writetext MortyAfterRematchText2
	waitbutton
	closetext
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
	loadfont
	jump MortyAfterRematch2
	
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

	para "So the legend was"
	line "true, and HO-OH"
	cont "chose you<...>"

	para "But that does not"
	line "mean that I have"
	cont "lost out on my"
	cont "future."
	
	para "Show me the power"
	line "I trained for!"
	done

MortyRematchBeatenText2:
	text "How is this"
	line "possible<...>"
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

EcruteakGymGuy2Text:
	text "MORTY has upgraded"
	line "his floor to the"
	cont "whole new level."
	
	para "He even called it"
	line "THE ELITE FLOOR."
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
	db 2
	person_event SPRITE_MORTY, 5, 15, $6, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 0, 0, MortyScript_0x99d58, -1
	person_event SPRITE_GYM_GUY, 27, 17, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, EcruteakGymGuy2Script, -1

