	db MEWTWO ; 150

	db 106, 110, 90, 130, 154, 90
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC
	db 3 ; catch rate
	db 220 ; base exp
	db NO_ITEM ; item 1
	db BERSERK_GENE ; item 2
	db 255 ; gender
	db 100 ; unknown
	db 120 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db FAST ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, ZEN_HEADBUTT, CURSE, BODY_SLAM, TOXIC, ZAP_CANNON, ROCK_SMASH, FOCUS_BLAST, HIDDEN_POWER, SUNNY_DAY, WILLOWISP, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, SOLARBEAM, THUNDER, EARTHQUAKE, RETURN, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, FIRE_BLAST, SEISMIC_TOSS, REST, THUNDER_WAVE, ROCK_SLIDE, SUBSTITUTE, STRENGTH, FLASH, FLAMETHROWER, THUNDERBOLT, ICE_BEAM, ICE_PUNCH, THUNDERPUNCH, FIRE_PUNCH
	; end