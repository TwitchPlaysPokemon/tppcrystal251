	db PHANCERO ; 252

	db  178,137,  57, 128, 85,  65
	;   hp  atk  def  spd  sat  sdf

	db GHOST, FLYING
	db 3 ; catch rate
	db 216 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 255 ; gender
	db 100 ; unknown
	db 80 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db FAST ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm CURSE, TOXIC, ROCK_SMASH, FOCUS_BLAST, HIDDEN_POWER, SUNNY_DAY, EARTH_POWER, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE,THUNDER, EARTHQUAKE, RETURN, PSYCHIC, SHADOW_BALL,SKY_ATTACK, DOUBLE_TEAM, SHADOW_CLAW, SWAGGER, SLEEP_TALK, SANDSTORM, SEISMIC_TOSS,SWORDS_DANCE, DARK_PULSE, REST, THIEF,THUNDER_WAVE, SUBSTITUTE, CUT, FLY, SURF, WHIRLPOOL, WATERFALL, ICE_BEAM
	; end
