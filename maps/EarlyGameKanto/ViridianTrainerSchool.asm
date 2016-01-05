ViridianTrainerSchoolRB_MapScriptHeader:
	db 0
	db 0

ViridianTrainerSchoolRBLassScript:
	jumptextfaceplayer _SchoolText1

ViridianTrainerSchoolRBTeacherScript:
	jumptextfaceplayer _SchoolText2

ViridianTrainerSchoolRBBookcaseScript:
	jumpstd difficultbookshelf

ViridianTrainerSchoolRBBlackboardScript:
	loadfont
	writetext _ViridianSchoolBlackboardText1
	buttonsound
.loop
	writetext _ViridianSchoolBlackboardText2
	loadmenudata .MenuDataHeader
	interpretmenu
	writebackup
	if_equal 1, .Psn
	if_equal 2, .Par
	if_equal 3, .Slp
	if_equal 4, .Brn
	if_equal 5, .Frz
	closetext
	end

.Psn
	writetext _ViridianBlackboardPoisonText
	buttonsound
	jump .loop

.Par
	writetext _ViridianBlackboardPrlzText
	buttonsound
	jump .loop

.Slp
	writetext _ViridianBlackboardSleepText
	buttonsound
	jump .loop

.Brn
	writetext _ViridianBlackboardBurnText
	buttonsound
	jump .loop

.Frz
	writetext _ViridianBlackboardFrozenText
	buttonsound
	jump .loop

.MenuDataHeader
	db $40 ; flags
	db 00, 00 ; start coords
	db 08, 11 ; end coords
	dw .MenuData2
	db 1 ; default option
; 0x68ae9

.MenuData2
	db $80 ; flags
	dn 3, 2 ; rows, columns
	db 5 ; spacing
	dba .Strings
	dbw BANK(ViridianTrainerSchoolRB_MapScriptHeader), $0000
; 0x68af2

.Strings
	db "PSN@"
	db "PAR@"
	db "SLP@"
	db "BRN@"
	db "FRZ@"
	db "QUIT@"
; 0x68b0b


_SchoolText1:
	text "Whew! I'm trying"
	line "to memorize all"
	cont "my notes."
	done

_SchoolText2:
	text "Okay!"

	para "Be sure to read"
	line "the blackboard"
	cont "carefully!"
	done

_ViridianSchoolBlackboardText1:
	text "The blackboard"
	line "describes #MON"
	cont "STATUS changes"
	cont "during battles."
	done

_ViridianSchoolBlackboardText2:
	text "Which heading do"
	line "you want to read?"
	done

_ViridianBlackboardSleepText:
	text "A #MON can't"
	line "attack if it's"
	cont "asleep!"

	para "#MON will stay"
	line "asleep even after"
	cont "battles."

	para "Use AWAKENING to"
	line "wake them up!"
	done

_ViridianBlackboardPoisonText:
	text "When poisoned, a"
	line "#MON's health"
	cont "steadily drops."

	para "Poison lingers"
	line "after battles."

	para "Use an ANTIDOTE"
	line "to cure poison!"
	done

_ViridianBlackboardPrlzText:
	text "Paralysis could"
	line "make #MON"
	cont "moves misfire!"

	para "Paralysis remains"
	line "after battles."

	para "Use PARLYZ HEAL"
	line "for treatment!"
	done

_ViridianBlackboardBurnText:
	text "A burn reduces"
	line "power and speed."
	cont "It also causes"
	cont "ongoing damage."

	para "Burns remain"
	line "after battles."

	para "Use BURN HEAL to"
	line "cure a burn!"
	done

_ViridianBlackboardFrozenText:
	text "If frozen, a"
	line "#MON becomes"
	cont "totally immobile!"

	para "It stays frozen"
	line "even after the"
	cont "battle ends."

	para "Use ICE HEAL to"
	line "thaw out #MON!"
	done


ViridianTrainerSchoolRB_MapEventHeader:
	db 0, 0
	; warps
	db 2
	warp_def $7, $2, 2, GROUP_VIRIDIAN_CITY_RB, MAP_VIRIDIAN_CITY_RB
	warp_def $7, $3, 2, GROUP_VIRIDIAN_CITY_RB, MAP_VIRIDIAN_CITY_RB

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 0, 3, $0, ViridianTrainerSchoolRBBlackboardScript

	; people-events
	db 2
	person_event SPRITE_LASS, 9, 7, $7, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, ViridianTrainerSchoolRBLassScript, -1
	person_event SPRITE_TEACHER, 5, 8, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, ViridianTrainerSchoolRBTeacherScript, -1
