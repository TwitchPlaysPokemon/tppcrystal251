PhanceroRuinsB3F_MapScriptHeader:
	db 0
	db 0
	
PhanceroRuinsB3F_PhanceroScript1:
	loadfont
	writetext PhanceroText1
	cry PHANCERO
	waitbutton
	closetext
	loadpokedata PHANCERO, 100
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	startbattle
	writebyte PHANCERO
	special SpecialMonCheck
	iffalse DontKillPhancero
	disappear $2
DontKillPhancero
	returnafterbattle
	end

PhanceroText1:
	text "Gushaaah!!"
	done

PhanceroRuinsB3F_MapEventHeader:
	db 0,0
	db 2
	warp_def 5, 3, 2, GROUP_PHANCERO_RUINS_B2F, MAP_PHANCERO_RUINS_B2F
	warp_def 9, 3, 2, GROUP_UNION_CAVE_B2F, MAP_UNION_CAVE_B2F
	db 0
	db 0
	db 1
	person_event SPRITE_MOLTRES, 7, 7, $16, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, PhanceroRuinsB3F_PhanceroScript1, EVENT_FOUGHT_PHANCERO
