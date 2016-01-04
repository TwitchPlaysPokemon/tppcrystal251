Route10North_MapScriptHeader: ; 0x1b207e
	; trigger count
	db 0

	; callback count
	db 1
	dbw 1, ZapdosIsHereScript
; 0x1b2080

ZapdosIsHereScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue YesZapdosIsHere
	disappear $2
YesZapdosIsHere
	return

MapRoute10NorthSignpost0Script: ; 0x1b2080
	jumptext UnknownText_0x1b2086
; 0x1b2083

MapRoute10NorthSignpost1Script: ; 0x1b2083
	jumpstd pokecentersign
; 0x1b2086

UnknownText_0x1b2086: ; 0x1b2086
	text "KANTO POWER PLANT"
	done
; 0x1b2099

ZapdosScript1: ; Debug
	faceplayer
	loadfont
	writetext ZapdosText1
	cry ZAPDOS
	waitbutton
	closetext
	loadpokedata ZAPDOS, 70
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
	
Route10North_MapEventHeader: ; 0x1b2099
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $1, $b, 1, GROUP_ROUTE_10_POKECENTER_1F, MAP_ROUTE_10_POKECENTER_1F
	warp_def $9, $3, 1, GROUP_POWER_PLANT, MAP_POWER_PLANT

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 11, 5, $0, MapRoute10NorthSignpost0Script
	signpost 1, 12, $0, MapRoute10NorthSignpost1Script

	; people-events
	db 1
	person_event SPRITE_BIRD, 14, 8, $0, 0, 0, -1, -1, 0, 0, 0, ZapdosScript1, EVENT_FOUGHT_ZAPDOS
; 0x1b20b3


