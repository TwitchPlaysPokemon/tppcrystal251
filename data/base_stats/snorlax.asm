	db SNORLAX ; 143

	db 160, 110, 65, 30, 65, 65
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 25 ; catch rate
	db 154 ; base exp
	db LEFTOVERS ; item 1
	db LEFTOVERS ; item 2
	db 31 ; gender
	db 100 ; unknown
	db 40 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db FAST ; growth rate
	dn MONSTER, MONSTER ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, ZEN_HEADBUTT, CURSE, BODY_SLAM, TOXIC, ZAP_CANNON, ROCK_SMASH, FOCUS_BLAST, HIDDEN_POWER, SUNNY_DAY, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, FLARE_BLITZ, WILD_CHARGE, SOLARBEAM, THUNDER, EARTHQUAKE, RETURN, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, FIRE_BLAST, GUNK_SHOT, SEISMIC_TOSS, REST, ATTRACT, ROCK_SLIDE, SUBSTITUTE, SURF, STRENGTH, FLAMETHROWER, THUNDERBOLT, ICE_BEAM, ICE_PUNCH, THUNDERPUNCH, FIRE_PUNCH
	; end
