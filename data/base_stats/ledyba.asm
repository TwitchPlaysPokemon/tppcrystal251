	db LEDYBA ; 165

	db  40,  20,  30,  55,  40,  80
	;   hp  atk  def  spd  sat  sdf

	db BUG, FLYING
	db 255 ; catch rate
	db 54 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 15 ; step cycles to hatch
	db 5 ; unknown
	dn 6, 6 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db SLOW ; growth rate
	dn INSECT, INSECT ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, GIGA_DRAIN, SOLARBEAM, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWORDS_DANCE, STRING_SHOT, REST, ATTRACT, THIEF, SUBSTITUTE, FLASH, ICE_PUNCH, THUNDERPUNCH
	; end
