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
		db IRON_TAIL
		db DOUBLE_TEAM
		db BATON_PASS

	db 100, JOLTEON, BURN_GUARD
		db THUNDERBOLT
		db HEADBUTT
		db SUBSTITUTE
		db BATON_PASS

	db 100, VAPOREON, PARLYZ_GUARD
		db WATERFALL
		db AURORA_BEAM
		db ACID_ARMOR
		db BATON_PASS

	db 100, FLAREON, POISON_GUARD
		db FIRE_BLAST
		db SMOG
		db CURSE
		db BATON_PASS

	db 100, UMBREON, FREEZE_GUARD
		db SHADOW_BALL
		db CONFUSE_RAY
		db CHARM
		db BATON_PASS

	db 100, ESPEON, SLEEP_GUARD
		db PSYBEAM
		db FLASH
		db GROWTH
		db BATON_PASS


	db $ff ; end

; ================
; ================================

ProfElmGroup:
	db "ELM@"
	db (1 << TRAINERTYPE_MOVES)

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
	db (1 << TRAINERTYPE_MOVES)

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
	db (1 << TRAINERTYPE_MOVES)

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
	db (1 << TRAINERTYPE_MOVES)

	db 56, MURKROW
		db FAINT_ATTACK
		db WING_ATTACK
		db AGILITY
		db MEAN_LOOK

	db 58, RHYDON
		db HORN_DRILL
		db ROCK_SLIDE
		db EARTHQUAKE
		db STOMP

	db 59, NIDOKING
		db HORN_DRILL
		db SURF
		db EARTHQUAKE
		db STOMP

	db 59, NIDOQUEEN
		db HORN_DRILL
		db SURF
		db EARTHQUAKE
		db STOMP

	db 58, DUGTRIO
		db FISSURE
		db MAGNITUDE
		db DIG
		db EARTHQUAKE

	db 61, KANGASKHAN
		db STOMP
		db DOUBLE_TEAM
		db EARTHQUAKE
		db HEADBUTT

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
	db (1 << TRAINERTYPE_ITEM)

	db 5, SQUIRTLE, BERRY
	db $ff

	; Lab, choose Squirtle
	db "<GREEN>@"
	db (1 << TRAINERTYPE_ITEM)

	db 5, BULBASAUR, BERRY
	db $ff

	; Lab, choose Bulbasaur
	db "<GREEN>@"
	db (1 << TRAINERTYPE_ITEM)

	db 5, CHARMANDER, BERRY
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

