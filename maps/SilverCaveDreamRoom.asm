SilverCaveDreamRoom_MapScriptHeader:
	db 0 ; triggers
	
	db 1 ; callbacks
	dbw 1, DeleteSilverCaveExit
	
DeleteSilverCaveExit:
	changeblock $9, $21, $2
	changeblock $9, $23, $5
	return

DreamRedScript: ; 0x18c603
	special Functionc48f
	faceplayer
	loadfont
	writetext RedTextBefore
	waitbutton
	closetext
	winlosstext RedTextWinLoss, RedTextWinLoss
	setlasttalked $2
	loadtrainer RED, 2
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmapmusic
	reloadmap
	iftrue DreamRedLost
	setevent EVENT_FIRST_TIME_RED
DreamRedLost
	special Functionc48f
	loadfont
	writetext RedTextAfter
	waitbutton
	closetext
	special Special_FadeToBlack
	special Functiond91
	disappear $2
	pause 15
	special Function8c0ab
	pause 30
	special HealParty
	warp GROUP_DUMMY_BLANK_MAP, MAP_DUMMY_BLANK_MAP, 0, 0
	end

RedTextBefore: ; 0x18c637
	db $0, $56, $4f
	db $56, $57
; 0x18c63c

RedTextWinLoss:
	text "start9"
	done

RedTextAfter: ; 0x18c63f
	db $0, $56, $4f
	db $56, $57
; 0x18c644
	
SilverCaveDreamRoom_MapEventHeader: ; 0x18c644
	; filler
	db 0, 0

	; warps
	db 0

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_RED, 14, 13, $7, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, DreamRedScript, -1
; 0x18c65c
