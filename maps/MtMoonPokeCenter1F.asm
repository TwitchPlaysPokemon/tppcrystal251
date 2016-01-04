MtMoonPokeCenter1F_MapScriptHeader: ; 0x694c7
	; trigger count
	db 0

	; callback count
	db 0
; 0x694c9

NurseScript_MtMoon: ; 0x694c9
	jumpstd pokecenternurse
; 0x694cc

FisherScript1_MtMoon:
	faceplayer
	loadfont
	checkevent EVENT_BOUGHT_MAGIKARP_FROM_SALESMAN
	iftrue FisherScript2_MtMoon
	writetext FisherText1_MtMoon
	yesorno
	iffalse FisherScript3_MtMoon
	checkcode VAR_PARTYCOUNT
	if_equal $6, FisherScript4_MtMoon
	playsound SFX_TRANSACTION
	writetext FisherText2_MtMoon
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke MAGIKARP, 5, 0, 0
	takemoney $0, 500
	setevent EVENT_BOUGHT_MAGIKARP_FROM_SALESMAN
FisherScript2_MtMoon:
	writetext FisherText3_MtMoon
	waitbutton
	closetext
	end

FisherScript3_MtMoon:
	writetext FisherText4_MtMoon
	waitbutton
	closetext
	end

FisherScript4_MtMoon:
	writetext FisherText5_MtMoon
	waitbutton
	closetext
	end

FisherScript5_MtMoon: ;send to pc check
	checkcode VAR_BOXSPACE 
	if_equal $0, FisherScript4_MtMoon
	writetext FisherText6_MtMoon
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke MAGIKARP, 5, 0, 0
	takemoney $0, 500
	setevent EVENT_BOUGHT_MAGIKARP_FROM_SALESMAN
	jump FisherScript2_MtMoon

FisherText1_MtMoon:
	text "Hey, you!"
	
	para "Listen up, this is"
	line "the deal of a"
	cont "lifetime here."
	
	para "What I have here"
	line "is a super-rare"
	cont "#MON!"
	
	para "And for only ¥500,"
	line "it can be yours!"
	
	para "Don't you want"
	line "this #MON?"
	done
	
FisherText2_MtMoon:
	text "Then here you go!"
	
	para "<PLAY_G> received"
	line "a MAGIKARP!"
	done
	
FisherText3_MtMoon:
	text "Well, that's it."
	line "No refunds."
	done
	
FisherText4_MtMoon:
	text "Are you sure?"
	line "You're missing out."
	done
	
FisherText5_MtMoon:
	text "WHAT?!"
	
	para "You have no room"
	line "in your party"
	cont "or PC box!"
	done

FisherText6_MtMoon:
	text "Your party is"
	line "full, so I sent"
	cont "it to the PC!"
	
	para "<PLAY_G> received"
	line "a MAGIKARP!"
	done

MtMoonPokeCenter1F_MapEventHeader: ; 0x69935
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 2, GROUP_ROUTE_3, MAP_ROUTE_3
	warp_def $7, $4, 2, GROUP_ROUTE_3, MAP_ROUTE_3
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_NURSE, 5, 7, $6, 0, 0, -1, -1, 0, 0, 0, NurseScript_MtMoon, -1
	person_event SPRITE_FISHER, 8, 6, $a, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, FisherScript1_MtMoon, -1
; 0x6998b

