DummyBlankMapRed_MapScriptHeader:
	; triggers
	db 3

	dw DummyBlankMapRed_Trigger1, $0000
	dw DummyBlankMapRed_Trigger2, $0000
	dw DummyBlankMapRed_Trigger3, $0000

	; callbacks
	db 1
	dbw 1, DummyRedHidePlayer

DummyBlankMapRed_Trigger1:
	priorityjump DummyMapRed_WarpCheck1
	end

DummyBlankMapRed_Trigger2:
	priorityjump DummyMapRed_WarpCheck2
	end

DummyBlankMapRed_Trigger3:
	end

DummyRedHidePlayer:
	disappear $0
	return

DummyMapRed_WarpCheck1:
	loadfont
	writetext KrissHouse2FDreaming1Text
	waitbutton
	closetext
	playsound SFX_EXIT_BUILDING
	pause 15
	dotrigger $1
	warpfacing $1, GROUP_SILVER_CAVE_DREAM_ROOM_RED, MAP_SILVER_CAVE_DREAM_ROOM_RED, $9, $21
	end

DummyMapRed_WarpCheck2:
	loadfont
	checkevent EVENT_FIRST_TIME_SORCERER
	iftrue DummyMapRed_BeatRed
	writetext KrissHouse2FDreaming2Text
	dotrigger $0
	jump DummyMapRed_Continue

DummyMapRed_BeatRed:
	writetext WasItADreamTextKriss
DummyMapRed_Continue
	waitbutton
	closetext
	playsound SFX_EXIT_BUILDING
	pause 15
	warp GROUP_KRISS_HOUSE_2F, MAP_KRISS_HOUSE_2F, $1, $4
	end

KrissHouse2FDreaming1Text:
	text "While <PLAY_G>"
	line "was sleeping<...>"
	done

KrissHouse2FDreaming2Text:
	text "What a horrible"
	line "nightmare!"
	done

WasItADreamTextKriss:
	text "Was it all a"
	line "dream<...>?"
	done

DummyBlankMapRed_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 0

	; xy triggers
	db 0

	; signposts
	db 0

	; person events
	db 0
