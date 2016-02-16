Trainers2:

BillGroup:
; ================================
; ================

	; BILL_TC (1)
	db "BILL@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM)

	; party
	db 100, EEVEE, LEFTOVERS
		db SHADOW_BALL
		db RETURN
		db DOUBLE_TEAM
		db BATON_PASS

	db 100, JOLTEON, BURN_GUARD
		db THUNDERBOLT
		db SHADOW_BALL
		db SUBSTITUTE
		db BATON_PASS

	db 100, VAPOREON, PARLYZ_GUARD
		db SURF
		db ICE_BEAM
		db ACID_ARMOR
		db BATON_PASS

	db 100, FLAREON, POISON_GUARD
		db FLARE_BLITZ
		db RETURN
		db CURSE
		db BATON_PASS

	db 100, UMBREON, FREEZE_GUARD
		db DARK_PULSE
		db CONFUSE_RAY
		db MEAN_LOOK
		db BATON_PASS

	db 100, ESPEON, SLEEP_GUARD
		db PSYCHIC
		db DAZZLINGLEAM
		db GROWTH
		db BATON_PASS


	db $ff ; end

; ================
; ================================

ProfElmGroup:
	db "ELM@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_MAXXP)

	; party
	db 100, DONPHAN
		db MAGNITUDE
		db ROLLOUT
		db DEFENSE_CURL
		db ROCK_THROW

	db 100, XATU
		db FUTURE_SIGHT
		db PSYCHIC_M
		db CONFUSE_RAY
		db RECOVER

	db 100, HOUNDOOM
		db CRUNCH
		db FLAMETHROWER
		db ROAR
		db FAINT_ATTACK

	db 100, CORSOLA
		db SPIKE_CANNON
		db MIRROR_COAT
		db RECOVER
		db RETURN

	db 100, TYRANITAR
		db SANDSTORM
		db CRUNCH
		db ROCK_SLIDE
		db EARTHQUAKE

	db 100, MEGANIUM
		db PETAL_DANCE
		db RAZOR_LEAF
		db REFLECT
		db LIGHT_SCREEN

	db $ff ; end



	db "ELM@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_MAXXP)

	; party
	db 100, DONPHAN
		db MAGNITUDE
		db ROLLOUT
		db DEFENSE_CURL
		db ROCK_THROW

	db 100, XATU
		db FUTURE_SIGHT
		db PSYCHIC_M
		db CONFUSE_RAY
		db RECOVER

	db 100, HOUNDOOM
		db CRUNCH
		db FLAMETHROWER
		db ROAR
		db FAINT_ATTACK

	db 100, CORSOLA
		db SPIKE_CANNON
		db MIRROR_COAT
		db RECOVER
		db RETURN

	db 100, TYRANITAR
		db SANDSTORM
		db CRUNCH
		db ROCK_SLIDE
		db EARTHQUAKE

	db 100, TYPHLOSION
		db FLAMETHROWER
		db STOMP
		db EARTHQUAKE
		db SMOKESCREEN

	db $ff ; end



	db "ELM@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_MAXXP)

	; party
	db 100, DONPHAN
		db MAGNITUDE
		db ROLLOUT
		db DEFENSE_CURL
		db ROCK_THROW

	db 100, XATU
		db FUTURE_SIGHT
		db PSYCHIC_M
		db CONFUSE_RAY
		db RECOVER

	db 100, HOUNDOOM
		db CRUNCH
		db FLAMETHROWER
		db ROAR
		db FAINT_ATTACK

	db 100, CORSOLA
		db SPIKE_CANNON
		db MIRROR_COAT
		db RECOVER
		db RETURN

	db 100, TYRANITAR
		db SANDSTORM
		db CRUNCH
		db ROCK_SLIDE
		db EARTHQUAKE

	db 100, FERALIGATR
		db CRUNCH
		db HYDRO_PUMP
		db IRON_TAIL
		db ICE_PUNCH

	db $ff ; end

tppPcGroup:
	db "PC@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM)

	db 100, MOLTRES, CHARCOAL
		db AGILITY
		db FIRE_BLAST
		db SKY_ATTACK
		db FIRE_SPIN
	db 100, ARTICUNO, NEVERMELTICE
		db AGILITY
		db BLIZZARD
		db FLY
		db ICY_WIND
	db 100, ZAPDOS, MAGNET
		db AGILITY
		db THUNDER
		db DRILL_PECK
		db THUNDERBOLT
	db 100, LUGIA, PRZCUREBERRY
		db AGILITY
		db AEROBLAST
		db PSYCHIC_M
		db SURF
	db 100, HO_OH, LEFTOVERS
		db AGILITY
		db SACRED_FIRE
		db RECOVER
		db SHADOW_BALL
	db 100, MEWTWO, TWISTEDSPOON
		db AGILITY
		db PSYCHIC_M
		db RECOVER
		db HYPER_BEAM
	db $ff

	db "PC@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM)

	; This party is handled separately.

	db $ff

GiovanniGroup:
	db "GIOVANNI@"
	db (1 << TRAINERTYPE_MOVES) | ( 1 << TRAINERTYPE_ITEM)

	db 62, MURKROW, BLACKGLASSES
		db DARK_PULSE
		db WING_ATTACK
		db AGILITY
		db MEAN_LOOK

	db 64, RHYDON, SOFT_SAND
		db HORN_DRILL
		db ROCK_SLIDE
		db EARTHQUAKE
		db STOMP

	db 65, NIDOKING, GOLD_BERRY
		db HORN_DRILL
		db SURF
		db EARTHQUAKE
		db STOMP

	db 65, NIDOQUEEN, GOLD_BERRY
		db HORN_DRILL
		db SURF
		db EARTHQUAKE
		db STOMP

	db 64, DUGTRIO, BRIGHTPOWDER
		db FISSURE
		db MAGNITUDE
		db DIG
		db EARTHQUAKE

	db 67, KANGASKHAN, LEFTOVERS
		db BODY_SLAM
		db DOUBLE_TEAM
		db EARTHQUAKE
		db REVERSAL

	db $ff

CoolSiblingsGroup:
	db "ELAN&IDA@"
	db 0 ; normal

	db 90, PORYGON2
	db 90, AZUMARILL
	db $ff

	db "ELAN&IDA@"
	db 0 ; normal

	db 90, AZUMARILL
	db 90, PORYGON2
	db $ff

	db "ARA&BELLA@"
	db 0 ; normal
	db 91, STANTLER
	db 91, TAUROS
	db $ff

	db "ARA&BELLA@"
	db 0 ; normal
	db 91, TAUROS
	db 91, STANTLER
	db $ff

; ===========================
; =====================

RivalRBGroup:
	; Lab, choose Charmander
	db "<GREEN>@"
	db 0

	db 5, SQUIRTLE
	db $ff

	; Lab, choose Squirtle
	db "<GREEN>@"
	db 0

	db 5, BULBASAUR
	db $ff

	; Lab, choose Bulbasaur
	db "<GREEN>@"
	db 0

	db 5, CHARMANDER
	db $ff

; ===============================

	; Route 22, choose Charmander
	db "<GREEN>@"
	db 0 ; normal

	db 9, PIDGEY
	db 8, SQUIRTLE
	db $ff

	; Route 22, choose Squirtle
	db "<GREEN>@"
	db 0 ; normal

	db 9, PIDGEY
	db 8, BULBASAUR
	db $ff

	; Route 22, choose Bulbasaur
	db "<GREEN>@"
	db 0 ; normal

	db 9, PIDGEY
	db 8, CHARMANDER
	db $ff

; ==============================

	; Route 24, choose Charmander
	db "<GREEN>@"
	db 0 ; normal

	db 18, PIDGEOTTO
	db 15, ABRA
	db 15, RATTATA
	db 17, SQUIRTLE
	db $ff

	; Route 24, choose Squirtle
	db "<GREEN>@"
	db 0 ; normal

	db 18, PIDGEOTTO
	db 15, ABRA
	db 15, RATTATA
	db 17, BULBASAUR
	db $ff

	; Route 24, choose Bulbasaur
	db "<GREEN>@"
	db 0 ; normal

	db 18, PIDGEOTTO
	db 15, ABRA
	db 15, RATTATA
	db 17, CHARMANDER
	db $ff

; ==============================

	; SS Anne, choose Charmander
	db "<GREEN>@"
	db 0 ; normal

	db 19, PIDGEOTTO
	db 16, RATICATE
	db 18, KADABRA
	db 20, WARTORTLE
	db $ff

	; SS Anne, choose Squirtle
	db "<GREEN>@"
	db 0 ; normal

	db 19, PIDGEOTTO
	db 16, RATICATE
	db 18, KADABRA
	db 20, IVYSAUR
	db $ff

	; SS Anne, choose Bulbasaur
	db "<GREEN>@"
	db 0 ; normal

	db 19, PIDGEOTTO
	db 16, RATICATE
	db 18, KADABRA
	db 20, CHARMELEON
	db $ff

; ================================
	; Blackthorn City, Choose Charmander
	db "<GREEN>@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM)

	db 59, PIDGEOT, SHARP_BEAK
		db WING_ATTACK
		db SAND_ATTACK
		db SKY_ATTACK
		db WHIRLWIND

	db 57, ALAKAZAM, TWISTEDSPOON
		db FUTURE_SIGHT
		db PSYCHIC
		db REFLECT
		db RECOVER

	db 59, RHYDON, SCOPE_LENS
		db TAKE_DOWN
		db EARTHQUAKE
		db HORN_DRILL
		db SCARY_FACE

	db 59, ARCANINE, CHARCOAL
		db EXTREMESPEED
		db FLAMETHROWER
		db ROAR
		db BITE

	db 61, EXEGGUTOR, MIRACLE_SEED
		db GIGA_DRAIN
		db SEED_BOMB
		db SLEEP_POWDER
		db LIGHT_SCREEN

	db 63, BLASTOISE, MYSTIC_WATER
		db HYDRO_PUMP
		db RAIN_DANCE
		db AQUA_JET
		db BITE

	db $ff

	; Blackthorn City, Choose Squirtle
	db "<GREEN>@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM)

	db 59, PIDGEOT, SHARP_BEAK
		db WING_ATTACK
		db SAND_ATTACK
		db SKY_ATTACK
		db WHIRLWIND

	db 57, ALAKAZAM, TWISTEDSPOON
		db FUTURE_SIGHT
		db PSYCHIC
		db REFLECT
		db RECOVER

	db 59, RHYDON, SCOPE_LENS
		db TAKE_DOWN
		db EARTHQUAKE
		db HORN_DRILL
		db SCARY_FACE

	db 59, GYARADOS, MYSTIC_WATER
		db HYDRO_PUMP
		db DRAGON_RAGE
		db BITE
		db THRASH

	db 61, ARCANINE, CHARCOAL
		db EXTREMESPEED
		db FLAMETHROWER
		db ROAR
		db BITE

	db 63, VENUSAUR, MIRACLE_SEED
		db SOLARBEAM
		db SYNTHESIS
		db SUNNY_DAY
		db GROWTH

	db $ff

	; Blackthorn City, Choose Bulbasaur
	db "<GREEN>@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM)

	db 59, PIDGEOT, SHARP_BEAK
		db WING_ATTACK
		db SAND_ATTACK
		db SKY_ATTACK
		db WHIRLWIND

	db 57, ALAKAZAM, TWISTEDSPOON
		db FUTURE_SIGHT
		db PSYCHIC
		db REFLECT
		db RECOVER

	db 59, RHYDON, SCOPE_LENS
		db TAKE_DOWN
		db EARTHQUAKE
		db HORN_DRILL
		db SCARY_FACE

	db 59, EXEGGUTOR, MIRACLE_SEED
		db GIGA_DRAIN
		db SEED_BOMB
		db SLEEP_POWDER
		db LIGHT_SCREEN

	db 61, GYARADOS, MYSTIC_WATER
		db HYDRO_PUMP
		db DRAGON_RAGE
		db BITE
		db THRASH

	db 63, CHARIZARD, CHARCOAL
		db FIRE_BLAST
		db WING_ATTACK
		db SLASH
		db FIRE_SPIN

	db $ff

BrockRBGroup:
; BROCK (1)
	db "BROCK@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 12, GEODUDE
		db TACKLE
		db DEFENSE_CURL
		db ROLLOUT
		db SANDSTORM

	db 14, ONIX
		db BIDE
		db WRAP
		db IRON_TAIL
		db SANDSTORM
	db $ff ; end

MistyRBGroup:
	; MISTY (1)
	db "MISTY@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 18, STARYU
		db SWIFT
		db RAIN_DANCE
		db RAPID_SPIN
		db BUBBLE

	db 21, STARMIE
		db BUBBLEBEAM
		db CONFUSION
		db SWIFT
		db HARDEN

	db $ff ; end

BabaGroup:
	db "BABA@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_NICKNAME) | (1 << TRAINERTYPE_ITEM) | (1 << TRAINERTYPE_MAXXP)

	db 100, TYPHLOSION, LEFTOVERS, "BEST@"
		db THUNDERPUNCH
		db FLAMETHROWER
		db EARTHQUAKE
		db STRENGTH

	db 100, SUICUNE, MYSTIC_WATER, "DONG@"
		db SURF
		db ICY_WIND
		db AURORA_BEAM
		db GUST

	db 100, PIDGEOT, GOLD_BERRY, "EVER@"
		db FLY
		db AIR_SLASH
		db STEEL_WING
		db HEAT_WAVE

	db 100, GYARADOS, BITTER_BERRY, "DADA@"
		db OUTRAGE
		db CRUNCH
		db WATERFALL
		db HYPER_BEAM

	db 100, POLITOED, PARLYZ_GUARD, "ORGY@"
		db SURF
		db PERISH_SONG
		db HYPNOSIS
		db RAIN_DANCE

	db 100, TOGETIC, SCOPE_LENS, "DEKU@"
		db NASTY_PLOT
		db ATTRACT
		db DAZZLINGLEAM
		db METRONOME

	db $ff
