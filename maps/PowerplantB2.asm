PowerplantB2_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 0

; <scripts go here>

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
	text "Bizaaah!"
	done
	

; <text goes here>

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
	db 0

	; object events
	db 1
	person_event SPRITE_MOLTRES, 23, 23, $16, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 0, 0, ZapdosScript1, EVENT_FOUGHT_ZAPDOS
