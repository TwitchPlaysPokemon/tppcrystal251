GoldenrodBoutique_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

SetPlayerPal:
	ld a, [ScriptVar]
	ld [wd45b], a
	
BoutiqueCooltrainerMScript:
	jumptextfaceplayer BoutiqueCooltrainerMText

BoutiqueCooltrainerM2Script:
	jumptextfaceplayer BoutiqueCooltrainerM2Text

BoutiqueCooltrainerFScript:
	jumptextfaceplayer BoutiqueCooltrainerFText

BoutiqueRockerScript:
	jumptextfaceplayer BoutiqueRockerText

BoutiqueStylistBusyScript:
	faceplayer
	loadfont
	writetext BoutiqueStylistBusyText
	waitbutton
	closetext
	spriteface $2, LEFT
	end

BoutiqueStylistScript:
	faceplayer
	loadfont
	writetext BoutiqueStylistText1
	yesorno
	iffalse BoutiqueStylistScriptNoStyle
	writetext BoutiqueStylistText2
	checkmoney 0, 500
	if_equal 2, BoutiqueStylistScriptNoMoney
	yesorno
	iffalse BoutiqueStylistScriptNoStyle
	;take money
	;takecoins 500
	playsound SFX_TRANSACTION
	waitsfx
	writetext BoutiqueStylistText3
	loadmenudata MenuDataHeaderBoutique
	interpretmenu2
	writebackup
	if_equal $1, BoutiqueStylistScriptMadeSelection
	if_equal $2, BoutiqueStylistScriptMadeSelection
	if_equal $3, BoutiqueStylistScriptMadeSelection
	if_equal $4, BoutiqueStylistScriptMadeSelection
	if_equal $5, BoutiqueStylistScriptMadeSelection
	end

BoutiqueStylistScriptMadeSelection:
	closetext
	spriteface $3, LEFT
	;move player
	checkcode VAR_FACING
	if_equal UP, .MoveAroundCounterUp
	checkcode VAR_FACING
	if_equal RIGHT, .MoveAroundCounterRight
	applymovement $0, Movement_WalkAroundLong
.MoveAroundCounterUp
	applymovement $0, Movement_WalkFromFront
.MoveAroundCounterRight
	applymovement $0, Movement_WalkFaceLeft
	;do it here
	pause 10
	playsound SFX_FLASH ;change this
	spriteface $0, UP
	pause 03
	spriteface $0, RIGHT
	pause 03
	writebyte $03
	callasm SetPlayerPal
	spriteface $0, DOWN
	pause 03
	spriteface $0, LEFT
	pause 03
	showemote $0, $0, 15
	spriteface $0, RIGHT
	loadfont
	writetext BoutiqueStylistText4
	waitbutton
	closetext
	spriteface $3, DOWN
	end

Movement_WalkAroundLong:
	step_down
	step_down
	step_left
	step_left
	step_end
	
Movement_WalkFromFront:
	step_left
	step_up
	step_up
	step_end
	
Movement_WalkFaceLeft:
	half_step_left
	step_end
	
BoutiqueStylistScriptNoStyle:
	writetext BoutiqueStylistTextExit
	waitbutton
	closetext
	end

BoutiqueStylistText1:
	text "Welcome to the"
	line "BOUTIQUE!"

	para "You seem like you"
	line "want to change"
	cont "your STYLE!"

	para "Would you like to"
	line "change your STYLE?"
	done

BoutiqueStylistText2:
	text "Great! To change"
	line "your STYLE, it'll"
	cont "cost ", $f0, "500, OK?"
	done

BoutiqueStylistText3:
	text "Let's get started!"

	para "What is your"
	line "favorite color?"
	done
	;change it

BoutiqueStylistText4:
	text "Voila! All done!"
	done

BoutiqueStylistTextExit:
	text "Make sure to come"
	line "back if you want"

	para "to change your"
	line "STYLE again!"
	done

BoutiqueStylistScriptNoMoney:
	buttonsound
	writetext BoutiqueStylistTextNoMoney
	waitbutton
	closetext
	end

BoutiqueStylistTextNoMoney:
	text "You don't seem to"
	line "have enough money!"

	para "Come back when"
	line "you get some!"
	done

	;branch to move the player around

BoutiqueCooltrainerMText:
	text "This place is"
	line "amazing!"

	para "I just wish the"
	line "wait wasn't so"
	cont "long<...>"
	done

BoutiqueCooltrainerM2Text:
	text "I'm waiting for"
	line "my friend to"
	cont "get here!"

	para "We're going to"
	line "have matching"
	cont "STYLES!"
	done

BoutiqueCooltrainerFText:
	text "There are so many"
	line "different STYLE"
	cont "options!"

	para "I wonder which"
	line "looks the cutest<...>"
	done

BoutiqueRockerText:
	text "I'm getting my"
	line "hair dyed!"

	para "Gotta keep"
	line "looking fresh!"
	done
	
BoutiqueStylistBusyText:
	text "I'm a professional"
	line "STYLIST!"

	para "I'm giving this"
	line "fresh trainer a"
	cont "brand new STYLE!"
	done

MenuDataHeaderBoutique:
	db $40 ; flags
	db 00, 00 ; start coords
	db 11, 09 ; end coords
	dw MenuDataBoutique
	db 1 ; default option

MenuDataBoutique:
	db $81 ; flags
	db 5 ; items
	db "RED@"
	db "BLUE@"
	db "GREEN@"
	db "BROWN@"
	db "YELLOW@"

GoldenrodBoutique_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $3, 16, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $7, $4, 16, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 6	
	person_event SPRITE_CLERK, 5, 5, $8, 0, 0, -1, -1, 0, 0, 0, BoutiqueStylistBusyScript, -1
	person_event SPRITE_CLERK, 5, 9, $6, 0, 0, -1, -1, 0, 0, 0, BoutiqueStylistScript, -1
	person_event SPRITE_COOLTRAINER_M, 9, 9, $8, 0, 0, -1, -1, 0, 0, 0, BoutiqueCooltrainerMScript, -1
	person_event SPRITE_COOLTRAINER_F, 6, 13, $5, 0, 1, -1, -1, 0, 0, 0, BoutiqueCooltrainerFScript, -1
	person_event SPRITE_ROCKER, 5, 4, $a, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, BoutiqueRockerScript, -1
	person_event SPRITE_COOLTRAINER_M, 11, 13, $2, 1, 1, -1, -1, 8 + PAL_OW_RED, 0, 0, BoutiqueCooltrainerM2Script, -1