	db FARFETCH_D ; 083

	db 52, 65, 55, 60, 58, 61
	; hp atk def spd sat sdf

	db NORMAL, FLYING
	db 45 ; catch rate
	db 94 ; base exp
	db NO_ITEM ; item 1
	db STICK ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn AVIAN, FIELD ; egg groups

	; tmhm
	tmhm HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, ENDURE, IRON_TAIL, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, REST, ATTRACT, THIEF, STEEL_WING, CUT, FLY,
	; end
