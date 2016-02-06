RaikouRoom_MapScriptHeader:
	db	0
	db	0

StaticRaikouScript:
	loadfont
	writetext StaticRaikouCry
	cry RAIKOU
	waitbutton
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_ROAMING
	loadpokedata RAIKOU, 0 ; Grab level from memory
	startbattle
	returnafterbattle
	disappear $2
	end

StaticRaikouCry:
	text "Grrraaasshh!!"
	done

RaikouRoom_MapEventHeader:
	db 0, 0
	db 1
	warp_def 5, 5, 2, GROUP_POWERPLANTB2, MAP_POWERPLANTB2

	db 0
	db 0
	db 1
	person_event SPRITE_RAIKOU, 7, 9, $6, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 0, 0, StaticRaikouScript, EVENT_STATIC_RAIKOU
