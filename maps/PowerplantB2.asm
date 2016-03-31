PowerplantB2_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 1
	
	dbw 1, PowerplantB2SetBlocksScript

; <scripts go here>

;puzzle order is RIGHT, LEFT, TOP, BOTTOM

PowerplantB2SetBlocksScript:
	checkevent EVENT_ZAPDOS_DOOR_UNLOCKED
	iffalse PowerplantB2SetBlocksFalseScript
	;change all blocks to be on if we already did the puzzle
	;switches
	changeblock 36, 14, $56
	changeblock 38, 14, $55
	;center area
	;right side
	changeblock 24, 16, $56
	changeblock 24, 18, $56
	changeblock 24, 20, $56
	changeblock 24, 22, $56
	;left side
	changeblock 14, 16, $56
	changeblock 14, 18, $56
	changeblock 14, 20, $56
	changeblock 14, 22, $56
	;top
	changeblock 16, 14, $56
	changeblock 18, 14, $56
	changeblock 20, 14, $56
	changeblock 22, 14, $56
	;bottom
	changeblock 16, 24, $56
	changeblock 20, 24, $56
	changeblock 22, 24, $56
	;gate
	changeblock 18, 24, $4d
PowerplantB2SetBlocksFalseScript:
	return

ZapdosScript1:
	faceplayer
	loadfont
	writetext ZapdosText1
	cry ZAPDOS
	waitbutton
	closetext
	loadpokedata ZAPDOS, 95
	writecode VAR_BATTLETYPE, BATTLETYPE_KANTOLEGEND
	startbattle
	writebyte ZAPDOS
	special SpecialMonCheck
	iffalse DontKillZapdos
	disappear $2
	setevent EVENT_FOUGHT_ZAPDOS
DontKillZapdos:
	returnafterbattle
	end

ZapdosText1:
	text "ZAPDOS: Bizaaah!"
	done
	
GeneratorTextOnline:
	text "The generator"
	line "roared to life."
	done
	
GeneratorTextSuccess:
	text "STARUP SEQUENCE:"
	line "CONTINUING"
	done
	
GeneratorTextFail:
	text "STARUP SEQUENCE:"
	line "-FAILURE-"
	
	para "POWER ORDER BROKEN"
	line "SHUTTING DOWN<...>"
	done
	
GeneratorTextCompleted:
	text "SECURITY OVERRIDE"
	line "ACTIVATED."
	
	para "ACCESS GRANTED."
	done
	
;generator 1 right
ZapdosCaveGenerator1Script:

	waitsfx
	playsound SFX_PUSH_BUTTON
	waitsfx
	playsound SFX_UNKNOWN_60
	earthquake 90
	waitsfx
	playsound SFX_THUNDER
	refreshscreen 0
	changeblock 36, 14, $56
	changeblock 38, 14, $55
	;center area
	;right side
	changeblock 24, 16, $56
	changeblock 24, 18, $56
	changeblock 24, 20, $56
	changeblock 24, 22, $56
	reloadmappart
	waitsfx
	jumptext GeneratorTextOnline
	;check to see if proper pattern here
	;if wrong play sfx, change blocks off
	;if true, keep blocks set, show text
	jumptext GeneratorTextSuccess
	end

;generator 3 top
ZapdosCaveGenerator2Script:

	waitsfx
	playsound SFX_PUSH_BUTTON
	waitsfx
	playsound SFX_UNKNOWN_60
	earthquake 90
	waitsfx
	playsound SFX_THUNDER
	refreshscreen 0
	changeblock 18, 0, $57
	changeblock 20, 0, $56
	;center area
	;top
	changeblock 16, 14, $56
	changeblock 18, 14, $56
	changeblock 20, 14, $56
	changeblock 22, 14, $56
	reloadmappart
	waitsfx
	jumptext GeneratorTextOnline
	;check to see if proper pattern here
	;if wrong play sfx, change blocks off
	;if true, keep blocks set, show text
	jumptext GeneratorTextSuccess
	end

;generator 2 left
ZapdosCaveGenerator3Script:

	waitsfx
	playsound SFX_PUSH_BUTTON
	waitsfx
	playsound SFX_UNKNOWN_60
	earthquake 90
	waitsfx
	playsound SFX_THUNDER
	refreshscreen 0
	changeblock 0, 14, $57
	changeblock 2, 14, $56
	;center area
	;left side
	changeblock 14, 16, $56
	changeblock 14, 18, $56
	changeblock 14, 20, $56
	changeblock 14, 22, $56
	reloadmappart
	waitsfx
	jumptext GeneratorTextOnline
	;check to see if proper pattern here
	;if wrong play sfx, change blocks off
	;if true, keep blocks set, show text
	jumptext GeneratorTextSuccess
	end

;generator 4 bottom
ZapdosCaveGenerator4Script:

	waitsfx
	playsound SFX_PUSH_BUTTON
	waitsfx
	playsound SFX_UNKNOWN_60
	earthquake 90
	waitsfx
	playsound SFX_THUNDER
	refreshscreen 0
	changeblock 20, 32, $56
	changeblock 22, 32, $55
	;center area
	;bottom
	changeblock 16, 24, $56
	changeblock 20, 24, $56
	changeblock 22, 24, $56
	reloadmappart
	waitsfx
	jumptext GeneratorTextOnline
	;check to see if proper pattern here
	;if wrong play sfx, change blocks off
	;if true, keep blocks set, show text, set flag and open gate
	jumptext GeneratorTextCompleted
	;gate
	earthquake 90
	playsound SFX_STRENGTH
	refreshscreen 0
	changeblock 18, 24, $4d
	reloadmappart
	end


PowerplantB2_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def 31, 35, 2, GROUP_POWERPLANTB1, MAP_POWERPLANTB1
	warp_def 31, 5, 2, GROUP_ROUTE_10_NORTH, MAP_ROUTE_10_NORTH

	; coord events
	db 0

	; bg events
	db 4
	signpost 15, 39, $0, ZapdosCaveGenerator1Script
	signpost 1, 18, $0, ZapdosCaveGenerator2Script
	signpost 15, 0, $0, ZapdosCaveGenerator3Script
	signpost 33, 23, $0, ZapdosCaveGenerator4Script
	
	; object events
	db 1
	person_event SPRITE_MOLTRES, 23, 23, $16, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 0, 0, ZapdosScript1, EVENT_FOUGHT_ZAPDOS
