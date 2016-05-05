SilverCaveDreamRoomRed_MapScriptHeader:
	db 0 ; triggers

	db 0 ; callbacks
	; dbw 1, DeleteSilverCaveExit

; DeleteSilverCaveExit:
	; changeblock $9, $21, $2
	; changeblock $9, $23, $5
	; return

DreamREDScript: ; 0x18c603
	special Functionc48f
	faceplayer
	loadfont
	writetext SORCERERTextBefore
	waitbutton
	closetext
	winlosstext SORCERERTextWinLoss, SORCERERTextWinLoss
	loadtrainer SORCERER, 1
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmapmusic
	reloadmap
	iftrue .DreamREDLost
	setevent EVENT_FIRST_TIME_SORCERER
.DreamREDLost
	special Functionc48f
	loadfont
	writetext SORCERERTextAfter
	waitbutton
	closetext
	special Special_FadeToBlack
	special Functiond91
	disappear $2
	pause 15
	special Function8c0ab
	pause 30
	special HealParty
	warp GROUP_DUMMY_BLANK_MAP_RED, MAP_DUMMY_BLANK_MAP_RED, 0, 0
	end

SORCERERTextBefore: ; 0x18c637
	text $56
	line $56
	done
; 0x18c63c

SORCERERTextWinLoss:
	text "............"
	done

SORCERERTextAfter: ; 0x18c63f
	text $56
	line $56
	done
; 0x18c644

SilverCaveDreamRoomRed_MapEventHeader: ; 0x18c644
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
	person_event SPRITE_RED, 14, 13, $7, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, DreamREDScript, -1
; 0x18c65c
