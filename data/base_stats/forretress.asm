	db FORRETRESS ; 205

	db  75,  90, 140,  40,  60,  60
	;   hp  atk  def  spd  sat  sdf

	db BUG, STEEL
	db 75 ; catch rate
	db 163 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 20 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn INSECT, INSECT ; egg groups

	; tmhm
	tmhm CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, SOLARBEAM, FLASH_CANNON, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, STRING_SHOT, REST, ATTRACT, THUNDER_WAVE, ROCK_SLIDE, SUBSTITUTE, STRENGTH,

	; end
