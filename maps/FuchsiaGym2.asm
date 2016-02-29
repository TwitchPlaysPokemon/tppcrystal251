FuchsiaGym2_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 0
	
InvisibleJanineScript:
	checkevent EVENT_JANINE_REMATCH
	iftrue JanineAfterRematch
JanineRematchScript:
	loadfont
	writetext InvisibleTrainerFoundText
	waitbutton
	closetext
	; TODO make her appear
	applymovement $1, MovementData_0x195f27_2
	faceplayer
	writetext JanineBeforeRematchText
	waitbutton
	closetext
	winlosstext JanineRematchBeatenText, $0000
	loadtrainer JANINE, 2
	startbattle
	returnafterbattle
	setevent EVENT_JANINE_REMATCH
	loadfont ;fallthrough
	jump JanineJustAfterRematch

JanineAfterRematch:
	;TODO make her appear
	faceplayer
	loadfont
JanineJustAfterRematch:
	writetext JanineAfterRematchText
	waitbutton
	closetext
	end
	
FakeJanine1Script:
	loadfont
	checkevent EVENT_FAKE_JANINE_1
	iftrue .revealed
	setevent EVENT_FAKE_JANINE_1
	writetext InvisibleTrainerFoundText
	waitbutton
	closetext
	; TODO make her appear
	applymovement $2, MovementData_0x195f27_2
.revealed
	faceplayer
	writetext FakeJanine1Text
	waitbutton
	closetext
	end
	
FakeJanine2Script:
	loadfont
	checkevent EVENT_FAKE_JANINE_2
	iftrue .revealed
	setevent EVENT_FAKE_JANINE_2
	writetext InvisibleTrainerFoundText
	waitbutton
	closetext
	; TODO make her appear
	applymovement $3, MovementData_0x195f27_2
.revealed
	faceplayer
	writetext FakeJanine2Text
	waitbutton
	closetext
	end
	
FuchsiaGym2GuyScript:
	faceplayer
	loadfont
	checkevent EVENT_JANINE_REMATCH
	iftrue .FuchsiaGym2GuyWinScript
	writetext FuchsiaGym2GuyText
	waitbutton
	closetext
	end

.FuchsiaGym2GuyWinScript
	writetext FuchsiaGym2GuyWinText
	waitbutton
	closetext
	end
	
MovementData_0x195f27_2:
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	step_end
	
InvisibleTrainerFoundText:
	text "Fufufu!"
	
	para "You have finally"
	line "found me!"
	done
	
FakeJanine1Text:
	text "Anyways, I'm not"
	line "JANINE<...>"
	done

FakeJanine2Text:
	text "Your LEADER is in"
	line "the another room<...>"
	done
	
JanineBeforeRematchText:
	text "The essence of"
	line "ninjas' moves"
	cont "obtained by"
	cont "training!"
	
	para "Feel the horror"
	line "from the Poison"
	cont "type #MON who've"
	cont "mastered it."

	done
; 0x1960e6

JanineRematchBeatenText:
	text "<...>!!!"
	line "So<...> So strong!"

	done

JanineAfterRematchText:
	text "While I admire"
	line "your victory," 
	
	para "I'm disappointed"
	line "that I lost<...>"

	para "I'll train with"
	line "my father to be"
	cont "better than before"
	cont "and challenge you"
	cont "again!"

	done
	
FuchsiaGym2GuyText: ; 0x196299
	text "Yo, CHAMP!"

	para "<...>yes. She is here,"
	line "hiding in this"
	cont "new invisible maze."
	
	para "Even herself is"
	line "invisible!"
	done
; 0x196325

FuchsiaGym2GuyWinText: ; 0x196325
	text "That was a great"
	line "battle, trainer!"
	done
; 0x196353	

FuchsiaGym2_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 0

	; coord events
	db 0

	; bg events
	db 2
	signpost 23, 5, $0, MapFuchsiaGymSignpost1Script
	signpost 23, 8, $0, MapFuchsiaGymSignpost1Script

	; object events
	db 4
	person_event SPRITE_JANINE, 14, 12, $3, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, InvisibleJanineScript, -1
	person_event SPRITE_FUCHSIA_GYM_1, 10, 11, $a, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, FakeJanine1Script, -1
	person_event SPRITE_FUCHSIA_GYM_2, 23, 12, $a, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, FakeJanine2Script, -1
	person_event SPRITE_GYM_GUY, 27, 13, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, FuchsiaGym2GuyScript, -1
