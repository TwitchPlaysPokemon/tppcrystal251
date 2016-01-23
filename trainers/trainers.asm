Trainers:

; All trainers follow a basic structure:
	; Name
		; String in format "Text@"
	; Type
		; Bit 0: moves
		; Bit 1: item
		; Bit 2: nickname
	; Party
		; Up to six monsters following the data type
	; $ff

;List is sorted by trainer class
;fist string is the name, ending in an @ symbol
; then it's how many features the trainer uses, 0 means none, (1 << TRAINERTYPE_MOVES) = custom sets, (1 << TRAINERTYPE_ITEM) = hold items and (1 << TRAINERTYPE_NICKNAME) = nickname
; multiple can be used by sepperating them by | , but those you use must be fully specified on the whole trainer
; specifying moves requires specifying all 4 as the game assumes the trainer is so long based on that. items and nicknames are inserted after the species name behind commas with nicknames in quotes ("Aiiiiiirrr@")
; Mon syntax: level, specicies, item/nickname, 4 moves. remove features that you have not turned on. up to 6 mons can be entered
; then, lastly an $ff to show that the trainer is complete

; what trainer is where is not recorded here, the game instead records where they are on here in the map files. The easiest way to find which trainer is pointed to from where is to use bulba as refernce


FalknerGroup:
; ================================
; ================

	; FALKNER (1)
	db "Falkner@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 22, SPEAROW
		db PECK
		db MUD_SLAP
		db LEER
		db NONE

	db 25, PIDGEOTTO
		db WING_ATTACK
		db MUD_SLAP
		db QUICK_ATTACK
		db SAND_ATTACK

	db 27, NOCTOWL
		db NIGHT_SHADE
		db HYPNOSIS
		db WING_ATTACK
		db MUD_SLAP

	db $ff ; end

	; FALKNER (2)
	db "Falkner@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, NOCTOWL
		db NIGHT_SHADE
		db HYPNOSIS
		db DREAM_EATER
		db DOUBLE_TEAM

	db 100, FARFETCH_D
		db HEADBUTT
		db IRON_TAIL
		db SLASH
		db SWORDS_DANCE

	db 100, DODRIO
		db TRI_ATTACK
		db ICE_BEAM
		db SLEEP_TALK
		db REST

	db 100, CROBAT
		db GIGA_DRAIN
		db STEEL_WING
		db CONFUSE_RAY
		db AGILITY

	db 100, FEAROW
		db HYPER_BEAM
		db TOXIC
		db SWAGGER
		db AGILITY

	db 100, PIDGEOT
		db SKY_ATTACK
		db EARTHQUAKE
		db SAND_ATTACK
		db DOUBLE_TEAM

	db $ff

; ================
; ================================


WhitneyGroup:
; ================================
; ================

	; WHITNEY (1)
	db "Whitney@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 32, CLEFAIRY
		db DOUBLESLAP
		db MIMIC
		db MOONBLAST
		db METRONOME

	db 32, JIGGLYPUFF
		db ROLLOUT
		db DEFENSE_CURL
		db SING
		db PLAY_ROUGH

	db 34, SNUBBULL
		db BITE
		db PLAY_ROUGH
		db CHARM
		db ATTRACT

	db 38, MILTANK
		db ROLLOUT
		db ATTRACT
		db STOMP
		db MILK_DRINK

	db $ff ; end

	; WHITNEY (2)
	db "Whitney@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, GIRAFARIG
		db SHADOW_BALL
		db PSYCHIC_M
		db THUNDERBOLT
		db EARTHQUAKE

	db 100, LICKITUNG
		db MAGNITUDE
		db ROLLOUT
		db CONFUSE_RAY
		db BELLY_DRUM

	db 100, CLEFABLE
		db DOUBLE_EDGE
		db THUNDERBOLT
		db ICE_BEAM
		db MOONLIGHT

	db 100, SNORLAX
		db HYPNOSIS
		db BODY_SLAM
		db REST
		db CURSE

	db 100, KANGASKHAN
		db BODY_SLAM
		db EARTHQUAKE
		db ATTRACT
		db SUBSTITUTE

	db 100, MILTANK
		db SHADOW_BALL
		db MILK_DRINK
		db MIRROR_COAT
		db ROLLOUT

	db $ff


; ================
; ================================


BugsyGroup:
; ================================
; ================

	; BUGSY (1)
	db "Bugsy@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 27, BUTTERFREE
		db CONFUSION
		db TACKLE
		db GUST
		db STUN_SPORE

	db 27, BEEDRILL
		db POISON_STING
		db FURY_ATTACK
		db TWINEEDLE
		db PIN_MISSILE

	db 32, SCYTHER
		db QUICK_ATTACK
		db SLASH
		db FURY_CUTTER
		db DOUBLE_TEAM

	db $ff ; end

	; BUGSY (2)
	db "Bugsy@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, BUTTERFREE
		db SOLARBEAM
		db NIGHTMARE
		db SLEEP_POWDER
		db SUNNY_DAY

	db 100, BEEDRILL
		db SLUDGE_BOMB
		db MEGAHORN
		db DOUBLE_TEAM
		db SWORDS_DANCE

	db 100, PINSIR
		db ROCK_SLIDE
		db DYNAMICPUNCH
		db MEGAHORN
		db MIND_READER

	db 100, SHUCKLE
		db EARTHQUAKE
		db TOXIC
		db ROCK_SLIDE
		db SANDSTORM

	db 100, LEDIAN
		db ICE_PUNCH
		db SOLARBEAM
		db THUNDERPUNCH
		db SUNNY_DAY

	db 100, SCYTHER
		db WING_ATTACK
		db STEEL_WING
		db SWAGGER
		db SWORDS_DANCE

	db $ff

; ================
; ================================


MortyGroup:
; ================================
; ================

	; MORTY (1)
	db "Morty@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 35, GASTLY
		db LICK
		db SPITE
		db MEAN_LOOK
		db CURSE

	db 37, HAUNTER
		db HYPNOSIS
		db MIMIC
		db CURSE
		db NIGHT_SHADE

	db 39, MISDREAVUS
		db SPITE
		db MEAN_LOOK
		db MIMIC
		db NIGHT_SHADE

	db 42, GENGAR
		db HYPNOSIS
		db SHADOW_BALL
		db MEAN_LOOK
		db DREAM_EATER

	db $ff ; end

	; MORTY (2)
	db "Morty@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, MURKROW
		db SHADOW_BALL
		db DRILL_PECK
		db HYPNOSIS
		db DREAM_EATER

	db 100, SNEASEL
		db LICK
		db FURY_CUTTER
		db SPITE
		db SWORDS_DANCE

	db 100, HOUNDOOM
		db SHADOW_BALL
		db CONFUSE_RAY
		db ROAR
		db DOUBLE_TEAM

	db 100, GENGAR
		db THUNDERBOLT
		db ICE_PUNCH
		db CONFUSE_RAY
		db DESTINY_BOND

	db 100, UMBREON
		db SHADOW_BALL
		db MEAN_LOOK
		db TOXIC
		db REST

	db 100, MISDREAVUS
		db THUNDER
		db HYPNOSIS
		db DREAM_EATER
		db CONFUSE_RAY

	db $ff

; ================
; ================================


PryceGroup:
; ================================
; ================

	; PRYCE (1)
	db "Pryce@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 43, SEEL
		db HEADBUTT
		db ICY_WIND
		db AURORA_BEAM
		db REST

	db 46, DEWGONG
		db HEADBUTT
		db ICY_WIND
		db AURORA_BEAM
		db REST

	db 48, PILOSWINE
		db ICY_WIND
		db FURY_ATTACK
		db MIST
		db BLIZZARD

	db 45, DELIBIRD
		db PRESENT
		db ICY_WIND
		db BLIZZARD
		db FLY

	db 49, JYNX
		db ICE_BEAM
		db PSYCHIC_M
		db LOVELY_KISS
		db SING

	db $ff ; end

	; PRYCE (2)
	db "Pryce@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, DEWGONG
		db ICE_BEAM
		db HEADBUTT
		db TOXIC
		db MIRROR_COAT

	db 100, PILOSWINE
		db BLIZZARD
		db BITE
		db ROCK_SLIDE
		db AMNESIA

	db 100, JYNX
		db SHADOW_BALL
		db PSYCHIC_M
		db ICE_PUNCH
		db MEAN_LOOK

	db 100, DELIBIRD
		db PRESENT
		db BLIZZARD
		db DOUBLE_TEAM
		db SPIKES

	db 100, CLOYSTER
		db MEGAHORN
		db TAKE_DOWN
		db BLIZZARD
		db BARRIER

	db 100, LAPRAS
		db THUNDER
		db BLIZZARD
		db PSYCHIC_M
		db RAIN_DANCE

	db $ff

; ================
; ================================


JasmineGroup:
; ================================
; ================

	; JASMINE (1)
	db "Jasmine@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 51, MAGNEMITE
		db THUNDERBOLT
		db SUPERSONIC
		db SONICBOOM
		db THUNDER_WAVE

	db 53, STEELIX
		db SCREECH
		db SUNNY_DAY
		db ROCK_THROW
		db IRON_TAIL

	db 55, MAGNETON
		db THUNDERBOLT
		db SUPERSONIC
		db SONICBOOM
		db THUNDER_WAVE
		
	db 57, SCIZOR
		db DOUBLE_TEAM
		db SLASH
		db METAL_CLAW
		db AGILITY

	db $ff ; end

	; JASMINE (2)
	db "Jasmine@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, MAGNEMITE
		db THUNDERBOLT
		db PSYWAVE
		db THUNDER_WAVE
		db SUPERSONIC

	db 100, SKARMORY
		db DRILL_PECK
		db SOLARBEAM
		db FURY_CUTTER
		db SWORDS_DANCE

	db 100, FORRETRESS
		db GIGA_DRAIN
		db ROLLOUT
		db SUBSTITUTE
		db SPIKES

	db 100, MAGNETON
		db THUNDER
		db TRI_ATTACK
		db RAIN_DANCE
		db ICE_BEAM

	db 100, STEELIX
		db EARTHQUAKE
		db DRAGONBREATH
		db REST
		db SANDSTORM

	db 100, SCIZOR
		db WING_ATTACK
		db SLASH
		db STEEL_WING
		db SWORDS_DANCE

	db $ff ; end

; ================
; ================================


ChuckGroup:
; ================================
; ================

	; CHUCK (1)
	db "Chuck@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 50, PRIMEAPE
		db LEER
		db RAGE
		db KARATE_CHOP
		db FURY_ATTACK

	db 52, POLIWRATH
		db HYPNOSIS
		db MIND_READER
		db SURF
		db DYNAMICPUNCH

	db 54, MACHAMP
		db DYNAMICPUNCH
		db KARATE_CHOP
		db THUNDERPUNCH
		db SEISMIC_TOSS

	db $ff ; end

	; CHUCK (2)
	db "Chuck@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, HITMONTOP
		db DIG
		db HI_JUMP_KICK
		db DIZZY_PUNCH
		db MIND_READER

	db 100, MACHAMP
		db SUBMISSION
		db FLAMETHROWER
		db ICE_PUNCH
		db FOCUS_ENERGY

	db 100, HITMONLEE
		db HI_JUMP_KICK
		db FAINT_ATTACK
		db FOCUS_ENERGY
		db MIND_READER

	db 100, PRIMEAPE
		db IRON_TAIL
		db ROCK_SLIDE
		db THUNDERBOLT
		db FOCUS_ENERGY

	db 100, HITMONCHAN
		db DYNAMICPUNCH
		db THUNDERPUNCH
		db ICE_PUNCH
		db MIND_READER

	db 100, POLIWRATH
		db DYNAMICPUNCH
		db HYDRO_PUMP
		db BLIZZARD
		db MIND_READER

	db $ff

; ================
; ================================


ClairGroup:
; ================================
; ================

	; CLAIR (1)
	db "Clair@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 60, DRAGONAIR
		db THUNDER_WAVE
		db SURF
		db SLAM
		db DRAGONBREATH

	db 61, DRAGONAIR
		db THUNDER_WAVE
		db THUNDERBOLT
		db SLAM
		db DRAGONBREATH

	db 62, DRAGONAIR
		db THUNDER_WAVE
		db ICE_BEAM
		db SLAM
		db DRAGONBREATH

	db 63, KINGDRA
		db SMOKESCREEN
		db SURF
		db HYPER_BEAM
		db DRAGONBREATH

	db 65, DRAGONITE
		db OUTRAGE
		db HYPER_BEAM
		db EARTHQUAKE
		db THUNDER

	db $ff ; end

	; CLAIR (2)
	db "Clair@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, GYARADOS
		db DRAGONBREATH
		db FIRE_BLAST
		db THRASH
		db ROAR

	db 100, ONIX
		db ROCK_SLIDE
		db DRAGONBREATH
		db TWISTER
		db SHARPEN

	db 100, CHARIZARD
		db OUTRAGE
		db REST
		db BELLY_DRUM
		db SEISMIC_TOSS

	db 100, AERODACTYL
		db ROCK_SLIDE
		db STEEL_WING
		db EARTHQUAKE
		db AGILITY

	db 100, DRAGONITE
		db DYNAMICPUNCH
		db ICE_PUNCH
		db THUNDERPUNCH
		db THUNDER_WAVE

	db 100, KINGDRA
		db DRAGONBREATH
		db REST
		db DOUBLE_TEAM
		db SWAGGER

	db $ff

; ================
; ================================


Rival1Group:
; ================================
; ================

	; RIVAL1 (1)
	db "?@"
	db 0 ; normal

	; party
	db 20, CHIKORITA

	db $ff ; end

; ================

	; RIVAL1 (2)
	db "?@"
	db 0 ; normal

	; party
	db 20, CYNDAQUIL

	db $ff ; end

; ================

	; RIVAL1 (3)
	db "?@"
	db 0 ; normal

	; party
	db 20, TOTODILE

	db $ff ; end

; ================

	; RIVAL1 (4)
	db "?@"
	db 0 ; normal

	; party
	db 15, GASTLY
	db 17, ZUBAT
	db 19, BAYLEEF

	db $ff ; end

; ================

	; RIVAL1 (5)
	db "?@"
	db 0 ; normal

	; party
	db 15, GASTLY
	db 17, ZUBAT
	db 19, QUILAVA

	db $ff ; end

; ================

	; RIVAL1 (6)
	db "?@"
	db 0 ; normal

	; party
	db 15, GASTLY
	db 17, ZUBAT
	db 19, CROCONAW

	db $ff ; end

; ================

	; RIVAL1 (7)
	db "?@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 26, HAUNTER
		db LICK
		db SPITE
		db MEAN_LOOK
		db CURSE

	db 25, MAGNEMITE
		db TACKLE
		db THUNDERSHOCK
		db SUPERSONIC
		db SONICBOOM

	db 27, ZUBAT
		db LEECH_LIFE
		db SUPERSONIC
		db BITE
		db CONFUSE_RAY

	db 28, BAYLEEF
		db GROWL
		db REFLECT
		db RAZOR_LEAF
		db POISONPOWDER

	db $ff ; end

; ================

	; RIVAL1 (8)
	db "?@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 26, HAUNTER
		db LICK
		db SPITE
		db MEAN_LOOK
		db CURSE

	db 25, MAGNEMITE
		db TACKLE
		db THUNDERSHOCK
		db SUPERSONIC
		db SONICBOOM

	db 27, ZUBAT
		db LEECH_LIFE
		db SUPERSONIC
		db BITE
		db CONFUSE_RAY

	db 28, QUILAVA
		db LEER
		db SMOKESCREEN
		db EMBER
		db QUICK_ATTACK

	db $ff ; end

; ================

	; RIVAL1 (9)
	db "?@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 26, HAUNTER
		db LICK
		db SPITE
		db MEAN_LOOK
		db CURSE

	db 25, MAGNEMITE
		db TACKLE
		db THUNDERSHOCK
		db SUPERSONIC
		db SONICBOOM

	db 27, ZUBAT
		db LEECH_LIFE
		db SUPERSONIC
		db BITE
		db CONFUSE_RAY

	db 28, CROCONAW
		db LEER
		db RAGE
		db WATER_GUN
		db BITE

	db $ff ; end

; ================

	; RIVAL1 (10)
	db "?@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 38, GOLBAT
		db LEECH_LIFE
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 37, MAGNEMITE
		db TACKLE
		db THUNDERSHOCK
		db SONICBOOM
		db THUNDER_WAVE

	db 40, HAUNTER
		db LICK
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL

	db 43, SNEASEL
		db LEER
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK

	db 43, MEGANIUM
		db REFLECT
		db RAZOR_LEAF
		db POISONPOWDER
		db BODY_SLAM

	db $ff ; end

; ================

	; RIVAL1 (11)
	db "?@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 38, GOLBAT
		db LEECH_LIFE
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 37, MAGNEMITE
		db TACKLE
		db THUNDERSHOCK
		db SONICBOOM
		db THUNDER_WAVE

	db 40, HAUNTER
		db LICK
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL

	db 43, SNEASEL
		db LEER
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK

	db 43, QUILAVA
		db SMOKESCREEN
		db EMBER
		db QUICK_ATTACK
		db FLAME_WHEEL

	db $ff ; end

; ================

	; RIVAL1 (12)
	db "?@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 38, GOLBAT
		db LEECH_LIFE
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 37, MAGNEMITE
		db TACKLE
		db THUNDERSHOCK
		db SONICBOOM
		db THUNDER_WAVE

	db 40, HAUNTER
		db LICK
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL

	db 43, SNEASEL
		db LEER
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK

	db 43, FERALIGATR
		db RAGE
		db WATER_GUN
		db BITE
		db SCARY_FACE

	db $ff ; end

; ================

	; RIVAL1 (13)
	db "?@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 50, SNEASEL
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK
		db FURY_CUTTER

	db 52, GOLBAT
		db LEECH_LIFE
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 53, MAGNETON
		db THUNDERSHOCK
		db SONICBOOM
		db THUNDER_WAVE
		db SWIFT

	db 53, HAUNTER
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL
		db CONFUSE_RAY

	db 53, ALAKAZAM
		db DISABLE
		db PSYCHIC_M
		db RECOVER
		db FUTURE_SIGHT

	db 56, MEGANIUM
		db REFLECT
		db RAZOR_LEAF
		db POISONPOWDER
		db BODY_SLAM

	db $ff ; end

; ================

	; RIVAL1 (14)
	db "?@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 50, SNEASEL
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK
		db FURY_CUTTER

	db 52, GOLBAT
		db LEECH_LIFE
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 53, MAGNETON
		db THUNDERSHOCK
		db SONICBOOM
		db THUNDER_WAVE
		db SWIFT

	db 53, HAUNTER
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL
		db CONFUSE_RAY

	db 53, ALAKAZAM
		db DISABLE
		db PSYCHIC_M
		db RECOVER
		db FUTURE_SIGHT

	db 56, TYPHLOSION
		db SMOKESCREEN
		db EMBER
		db QUICK_ATTACK
		db FLAME_WHEEL

	db $ff ; end

; ================

	; RIVAL1 (15)
	db "?@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 50, SNEASEL
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK
		db FURY_CUTTER

	db 52, GOLBAT
		db LEECH_LIFE
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 53, MAGNETON
		db THUNDERSHOCK
		db SONICBOOM
		db THUNDER_WAVE
		db SWIFT

	db 53, HAUNTER
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL
		db CONFUSE_RAY

	db 53, ALAKAZAM
		db DISABLE
		db PSYCHIC_M
		db RECOVER
		db FUTURE_SIGHT

	db 56, FERALIGATR
		db RAGE
		db WATER_GUN
		db SCARY_FACE
		db SLASH

	db $ff ; end

; ================
; ================================


PokemonProfGroup:
; ================================
; ================

	; PROFESSOR (1)
	db "Oak@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 100, TAUROS
		db STOMP
		db EARTHQUAKE
		db DOUBLE_EDGE
		db GLARE

	db 100, EXEGGUTOR
		db SOLARBEAM
		db SUNNY_DAY
		db HYPNOSIS
		db SEED_BOMB

	db 100, ARCANINE
		db EXTREMESPEED
		db FLAMETHROWER
		db CRUNCH
		db AGILITY

	db 100, BLASTOISE
		db ICE_BEAM
		db HYDRO_PUMP
		db RAPID_SPIN
		db CRUNCH

	db 100, GYARADOS
		db HYPER_BEAM
		db CRUNCH
		db FLAIL
		db HYDRO_PUMP

	db 100, PIKACHU
		db SURF
		db FLY
		db THUNDERBOLT
		db DOUBLE_TEAM

	db $ff ; end

; =================

	; PROFESSOR (2)
	db "Oak@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 100, TAUROS
		db STOMP
		db EARTHQUAKE
		db DOUBLE_EDGE
		db GLARE

	db 100, EXEGGUTOR
		db SOLARBEAM
		db SUNNY_DAY
		db HYPNOSIS
		db SEED_BOMB

	db 100, ARCANINE
		db EXTREMESPEED
		db FLAMETHROWER
		db CRUNCH
		db AGILITY

	db 100, CHARIZARD
		db FLY
		db FIRE_BLAST
		db DRAGONBREATH
		db SLASH

	db 100, GYARADOS
		db HYPER_BEAM
		db CRUNCH
		db FLAIL
		db HYDRO_PUMP

	db 100, PIKACHU
		db SURF
		db FLY
		db THUNDERBOLT
		db DOUBLE_TEAM

	db $ff ; end

; =================

	; PROFESSOR (3)
	db "Oak@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 100, TAUROS
		db STOMP
		db EARTHQUAKE
		db DOUBLE_EDGE
		db GLARE

	db 100, EXEGGUTOR
		db SOLARBEAM
		db SUNNY_DAY
		db HYPNOSIS
		db SEED_BOMB

	db 100, ARCANINE
		db EXTREMESPEED
		db FLAMETHROWER
		db CRUNCH
		db AGILITY

	db 100, VENUSAUR
		db SOLARBEAM
		db SLUDGE_BOMB
		db BODY_SLAM
		db LEECH_SEED

	db 100, GYARADOS
		db HYPER_BEAM
		db CRUNCH
		db FLAIL
		db HYDRO_PUMP

	db 100, PIKACHU
		db SURF
		db FLY
		db THUNDERBOLT
		db DOUBLE_TEAM

	db $ff ; end

; ================
; ================================


WillGroup:
; ================================
; ================

	; WILL (1)
	db "Will@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 64, XATU
		db QUICK_ATTACK
		db FUTURE_SIGHT
		db CONFUSE_RAY
		db PSYCHIC_M

	db 66, JYNX
		db DOUBLESLAP
		db LOVELY_KISS
		db ICE_PUNCH
		db PSYCHIC_M

	db 66, EXEGGUTOR
		db REFLECT
		db LEECH_SEED
		db SEED_BOMB
		db PSYCHIC_M

	db 66, SLOWBRO
		db CURSE
		db AMNESIA
		db BODY_SLAM
		db PSYCHIC_M

	db 68, XATU
		db QUICK_ATTACK
		db FUTURE_SIGHT
		db CONFUSE_RAY
		db PSYCHIC_M

	db $ff ; end

	; WILL (1)
	db "Will@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, XATU
		db FUTURE_SIGHT
		db PSYCHIC_M
		db CONFUSE_RAY
		db WING_ATTACK

	db 100, JYNX
		db ICE_BEAM
		db BLIZZARD
		db LOVELY_KISS
		db PSYCHIC_M

	db 100, EXEGGUTOR
		db SUBSTITUTE
		db LEECH_SEED
		db GIGA_DRAIN
		db PSYCHIC_M

	db 100, SLOWKING
		db PSYCHIC_M
		db BODY_SLAM
		db SURF
		db AMNESIA

	db 100, WOBBUFFET
		db DESTINY_BOND
		db MIRROR_COAT
		db COUNTER
		db SAFEGUARD

	db 100, ALAKAZAM
		db THUNDER
		db FIRE_BLAST
		db BLIZZARD
		db PSYCHIC_M

	db $ff

; ================
; ================================


PKMNTrainerGroup:
; ================================
; ================

	; CAL (1)
	db "Cal@"
	db 0 ; normal

	; party
	db 15, CHIKORITA
	db 15, CYNDAQUIL
	db 15, TOTODILE

	db $ff ; end

; ================

	; CAL (2)
	db "Cal@"
	db 0 ; normal

	; party
	db 35, BAYLEEF
	db 35, QUILAVA
	db 35, CROCONAW

	db $ff ; end

; ================

	; CAL (3)
	db "Cal@"
	db 0 ; normal

	; party
	db 100, MEGANIUM
	db 100, TYPHLOSION
	db 100, FERALIGATR

	db $ff ; end

; ================

	; CAL (4)
	db "Ajdnnw@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 100, STEELIX
		db ROCK_THROW
		db STRENGTH
		db EARTHQUAKE
		db IRON_TAIL

	db 100, DRAGONITE
		db OUTRAGE
		db DRAGONBREATH
		db TWISTER
		db WATERFALL

	db 100, ESPEON
		db MORNING_SUN
		db FLASH
		db ATTRACT
		db PSYCHIC_M

	db 100, FERALIGATR
		db SURF
		db ICY_WIND
		db CUT
		db NONE

	db 100, PIDGEOT
		db FLY
		db QUICK_ATTACK
		db WING_ATTACK
		db MIRROR_MOVE

	db $ff ; end

; ================
; ================================


BrunoGroup:
; ================================
; ================

	; BRUNO (1)
	db "Bruno@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 70, HITMONTOP
		db PURSUIT
		db QUICK_ATTACK
		db DIG
		db PROTECT

	db 70, HITMONLEE
		db SWAGGER
		db DOUBLE_KICK
		db HI_JUMP_KICK
		db FORESIGHT

	db 70, HITMONCHAN
		db THUNDERPUNCH
		db ICE_PUNCH
		db FIRE_PUNCH
		db MACH_PUNCH

	db 68, ONIX
		db WRAP
		db EARTHQUAKE
		db SANDSTORM
		db ROCK_SLIDE

	db 72, MACHAMP
		db ROCK_SLIDE
		db FORESIGHT
		db VITAL_THROW
		db CROSS_CHOP

	db $ff ; end

	; BRUNO (2)
	db "Bruno@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, STEELIX
		db IRON_TAIL
		db ROCK_SLIDE
		db EARTHQUAKE
		db HARDEN

	db 100, HITMONTOP
		db PURSUIT
		db ROLLING_KICK
		db EARTHQUAKE
		db PROTECT

	db 100, HITMONLEE
		db SWAGGER
		db DOUBLE_KICK
		db HI_JUMP_KICK
		db MIND_READER

	db 100, HITMONCHAN
		db THUNDERPUNCH
		db ICE_PUNCH
		db FIRE_PUNCH
		db MACH_PUNCH

	db 100, MACHAMP
		db ROCK_SLIDE
		db FORESIGHT
		db DYNAMICPUNCH
		db CROSS_CHOP

	db 100, PRIMEAPE
		db CROSS_CHOP
		db KARATE_CHOP
		db RAGE
		db FURY_ATTACK

	db $ff


; ================
; ================================


KarenGroup:
; ================================
; ================

	; KAREN (1)
	db "Karen@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 69, UMBREON
		db SAND_ATTACK
		db CONFUSE_RAY
		db FAINT_ATTACK
		db MEAN_LOOK

	db 69, VILEPLUME
		db STUN_SPORE
		db ACID
		db MOONLIGHT
		db PETAL_DANCE

	db 72, GENGAR
		db LICK
		db SPITE
		db CURSE
		db DESTINY_BOND

	db 71, MURKROW
		db QUICK_ATTACK
		db WHIRLWIND
		db PURSUIT
		db FAINT_ATTACK

	db 74, HOUNDOOM
		db ROAR
		db PURSUIT
		db FLAMETHROWER
		db CRUNCH

	db $ff ; end

	; KAREN (2)
	db "Karen@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, UMBREON
		db FAINT_ATTACK
		db MEAN_LOOK
		db BATON_PASS
		db DOUBLE_TEAM

	db 100, VILEPLUME
		db PETAL_DANCE
		db MOONLIGHT
		db SLUDGE_BOMB
		db POISONPOWDER

	db 100, GENGAR
		db CURSE
		db SPITE
		db NIGHT_SHADE
		db SHADOW_BALL

	db 100, MURKROW
		db FLY
		db FAINT_ATTACK
		db WHIRLWIND
		db PURSUIT

	db 100, HOUNDOOM
		db FLAMETHROWER
		db CRUNCH
		db PURSUIT
		db ROAR

	db 100, SNEASEL
		db ICE_BEAM
		db FAINT_ATTACK
		db SWORDS_DANCE
		db BATON_PASS

; ================
; ================================


KogaGroup:
; ================================
; ================

	; KOGA (1)
	db "Koga@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 65, ARIADOS
		db DOUBLE_TEAM
		db MEAN_LOOK
		db BATON_PASS
		db GIGA_DRAIN

	db 66, VENOMOTH
		db SUPERSONIC
		db GUST
		db PSYCHIC_M
		db TOXIC

	db 69, FORRETRESS
		db PROTECT
		db SWIFT
		db EXPLOSION
		db SPIKES

	db 67, MUK
		db MINIMIZE
		db ACID_ARMOR
		db SLUDGE_BOMB
		db TOXIC

	db 70, CROBAT
		db DOUBLE_TEAM
		db QUICK_ATTACK
		db WING_ATTACK
		db TOXIC

	db $ff ; end

	; KOGA (2)
	db "Koga@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, ARIADOS
		db DOUBLE_TEAM
		db TOXIC
		db BATON_PASS
		db GIGA_DRAIN

	db 100, VENOMOTH
		db DOUBLE_TEAM
		db PSYCHIC_M
		db TOXIC
		db WING_ATTACK

	db 100, FORRETRESS
		db PROTECT
		db SWIFT
		db SPIKES
		db EXPLOSION

	db 100, MUK
		db SLUDGE
		db MINIMIZE
		db ACID_ARMOR
		db TOXIC

	db 100, WEEZING
		db EXPLOSION
		db SLUDGE
		db TOXIC
		db BODY_SLAM

	db 100, CROBAT
		db FLY
		db DOUBLE_TEAM
		db BATON_PASS
		db TOXIC

	db $ff

; ================
; ================================


ChampionGroup:
; ================================
; ================

	; CHAMPION (1)
	db "Lance@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 72, GYARADOS
		db FLAIL
		db RAIN_DANCE
		db SURF
		db HYPER_BEAM

	db 73, DRAGONITE
		db THUNDER_WAVE
		db TWISTER
		db THUNDER
		db HYPER_BEAM

	db 74, DRAGONITE
		db THUNDER_WAVE
		db TWISTER
		db BLIZZARD
		db HYPER_BEAM

	db 74, AERODACTYL
		db WING_ATTACK
		db ANCIENTPOWER
		db ROCK_SLIDE
		db HYPER_BEAM

	db 75, CHARIZARD
		db FLAMETHROWER
		db WING_ATTACK
		db SLASH
		db HYPER_BEAM

	db 80, DRAGONITE
		db FIRE_BLAST
		db SAFEGUARD
		db OUTRAGE
		db HYPER_BEAM

	db $ff ; end

	; CHAMPION (2)
	db "Lance@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, GYARADOS
		db HYDRO_PUMP
		db THRASH
		db RAIN_DANCE
		db HYPER_BEAM

	db 100, TYRANITAR
		db SANDSTORM
		db EARTHQUAKE
		db CRUNCH
		db HYPER_BEAM

	db 100, KINGDRA
		db OCTAZOOKA
		db OUTRAGE
		db SMOKESCREEN
		db HYPER_BEAM

	db 100, AERODACTYL
		db ROCK_SLIDE
		db ANCIENTPOWER
		db FLY
		db HYPER_BEAM

	db 100, CHARIZARD
		db FIRE_BLAST
		db SLASH
		db FLY
		db HYPER_BEAM

	db 100, DRAGONITE
		db OUTRAGE
		db THUNDER_WAVE
		db THUNDER
		db HYPER_BEAM

	db $ff

; ================
; ================================


BrockGroup:
; ================================
; ================

	; BROCK (1)
	db "Brock@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 80, GOLEM
		db EXPLOSION
		db ROCK_SLIDE
		db ROLLOUT
		db EARTHQUAKE

	db 80, RHYHORN
		db FURY_ATTACK
		db SCARY_FACE
		db EARTHQUAKE
		db HORN_DRILL

	db 80, OMASTAR
		db BITE
		db SURF
		db PROTECT
		db SPIKE_CANNON

	db 80, ONIX
		db WRAP
		db ROCK_SLIDE
		db BIDE
		db SANDSTORM

	db 80, KABUTOPS
		db SLASH
		db SURF
		db ENDURE
		db GIGA_DRAIN

	db 80, AERODACTYL
		db WING_ATTACK
		db CRUNCH
		db ROCK_SLIDE
		db DOUBLE_TEAM

	db $ff ; end

; ================

	; BROCK (1)
	db "Brock@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, GOLEM
		db EXPLOSION
		db ROCK_SLIDE
		db ROLLOUT
		db EARTHQUAKE

	db 100, RHYHORN
		db FURY_ATTACK
		db SCARY_FACE
		db EARTHQUAKE
		db HORN_DRILL

	db 100, OMASTAR
		db BITE
		db SURF
		db PROTECT
		db SPIKE_CANNON

	db 100, ONIX
		db WRAP
		db ROCK_SLIDE
		db BIDE
		db SANDSTORM

	db 100, KABUTOPS
		db SLASH
		db SURF
		db ENDURE
		db GIGA_DRAIN

	db 100, AERODACTYL
		db WING_ATTACK
		db CRUNCH
		db ROCK_SLIDE
		db DOUBLE_TEAM

	db $ff ; end


; ================================


MistyGroup:
; ================================
; ================

	; MISTY (1)
	db "Misty@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 70, GOLDUCK
		db SURF
		db DISABLE
		db CONFUSION
		db PSYCHIC_M

	db 70, QUAGSIRE
		db SURF
		db AMNESIA
		db EARTHQUAKE
		db RAIN_DANCE

	db 73, LAPRAS
		db SURF
		db PERISH_SONG
		db BLIZZARD
		db RAIN_DANCE

	db 70, STARMIE
		db SURF
		db CONFUSE_RAY
		db RECOVER
		db ICE_BEAM

	db 72, KINGDRA
		db OCTAZOOKA
		db DRAGONBREATH
		db TWISTER
		db SMOKESCREEN

	db 70, QWILFISH
		db POISON_STING
		db HYDRO_PUMP
		db SPIKE_CANNON
		db SCREECH

	db $ff ; end
	; MISTY (1)
	db "Misty@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, GOLDUCK
		db SURF
		db DISABLE
		db CONFUSION
		db PSYCHIC_M

	db 100, QUAGSIRE
		db SURF
		db AMNESIA
		db EARTHQUAKE
		db RAIN_DANCE

	db 100, LAPRAS
		db SURF
		db PERISH_SONG
		db BLIZZARD
		db RAIN_DANCE

	db 100, STARMIE
		db SURF
		db CONFUSE_RAY
		db RECOVER
		db ICE_BEAM

	db 100, KINGDRA
		db OCTAZOOKA
		db DRAGONBREATH
		db TWISTER
		db SMOKESCREEN

	db 100, QWILFISH
		db POISON_STING
		db HYDRO_PUMP
		db SPIKE_CANNON
		db SCREECH

	db $ff ; end


; ================
; ================================


LtSurgeGroup:
; ================================
; ================

	; LT_SURGE (1)
	db "LT.Surge@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 75, RAICHU
		db THUNDER_WAVE
		db QUICK_ATTACK
		db THUNDERBOLT
		db THUNDER

	db 73, ELECTRODE
		db SCREECH
		db DOUBLE_TEAM
		db SWIFT
		db EXPLOSION

	db 74, MAGNETON
		db MIND_READER
		db DOUBLE_TEAM
		db SWIFT
		db ZAP_CANNON

	db 73, ELECTRODE
		db SCREECH
		db DOUBLE_TEAM
		db SWIFT
		db EXPLOSION

	db 77, ELECTABUZZ
		db QUICK_ATTACK
		db THUNDERPUNCH
		db LIGHT_SCREEN
		db THUNDER

	db 76, JOLTEON
		db SAND_ATTACK
		db THUNDERBOLT
		db BITE
		db AGILITY

	db $ff ; end

; ================
; ================================


ScientistGroup:
; ================================
; ================

	; SCIENTIST (1)
	db "Ross@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 41, DITTO, METAL_POWDER

	db $ff ; end

; ================

	; SCIENTIST (2)
	db "Mitch@"
	db 0 ; normal

	; party
	db 39, BELLOSSOM
	db 39, VILEPLUME

	db $ff ; end

; ================

	; SCIENTIST (3)
	db "Jed@"
	db 0 ; normal

	; party
	db 38, SKARMORY
	db 37, FLAAFFY
	db 38, PORYGON

	db $ff ; end

; ================

	; SCIENTIST (4)
	db "Marc@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM)

	; party
	db 49, KOFFING, LEFTOVERS
		db ROLLOUT
		db PAIN_SPLIT
		db CURSE
		db SCREECH

	db 49, KOFFING, LEFTOVERS
		db SLUDGE_BOMB
		db FLAMETHROWER
		db THUNDERBOLT
		db EXPLOSION

	db 51, KOFFING, LEFTOVERS
		db FIRE_BLAST
		db SLUDGE_BOMB
		db REST
		db SLEEP_TALK

	db 51, KOFFING, LEFTOVERS
		db TOXIC
		db FLAMETHROWER
		db PROTECT
		db SWAGGER

	db 53, KOFFING, LEFTOVERS
		db TOXIC
		db SMOKESCREEN
		db ATTRACT
		db THUNDER

	db 53, KOFFING, LEFTOVERS
		db SLUDGE_BOMB
		db ZAP_CANNON
		db ATTRACT
		db SWAGGER
		
	db $ff ; end

; ================

	; SCIENTIST (5)
	db "Rich@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM)

	; party

	db 53, PORYGON2, BERSERK_GENE
		db DOUBLE_EDGE
		db THIEF
		db RECOVER
		db CONVERSION2

	db $ff ; end

; ================
; ================================


ErikaGroup:
; ================================
; ================

	; ERIKA (1)
	db "Erika@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 79, TANGELA
		db VINE_WHIP
		db WRAP
		db GIGA_DRAIN
		db SLEEP_POWDER

	db 80, JUMPLUFF
		db MEGA_DRAIN
		db LEECH_SEED
		db COTTON_SPORE
		db GIGA_DRAIN

	db 81, VICTREEBEL
		db SUNNY_DAY
		db SYNTHESIS
		db ACID
		db RAZOR_LEAF

	db 82, BELLOSSOM
		db SUNNY_DAY
		db SYNTHESIS
		db PETAL_DANCE
		db SOLARBEAM

	db 83, VILEPLUME
		db PETAL_DANCE
		db ACID
		db SLUDGE
		db SYNTHESIS

	db $ff ; end

; ================
; ================================


YoungsterGroup:
; ================================
; ================

	; YOUNGSTER (1)
	db "Joey@"
	db 0 ; normal

	; party
	db 20, SENTRET
	db 22, RATTATA

	db $ff ; end

; ================

	; YOUNGSTER (2)
	db "Mikey@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 20, TEDDIURSA, QUICK_CLAW
	db 20, HOOTHOOT, BERRY
	db 22, FURRET, FOCUS_BAND

	db $ff ; end

; ================

	; YOUNGSTER (3)
	db "Albert@"
	db 0 ; normal

	; party
	db 22, MAREEP
	db 22, SNUBBULL
	db 24, FLAAFFY

	db $ff ; end

; ================

	; YOUNGSTER (4)
	db "Gordon@"
	db 0 ; normal

	; party
	db 23, SUNKERN
	db 23, TOGEPI
	db 24, SMEARGLE

	db $ff ; end

; ================

	; YOUNGSTER (5)
	db "Samuel@"
	db 0 ; normal

	; party
	db 26, AIPOM
	db 25, NIDORINO
	db 25, NIDORINA
	db 27, GIRAFARIG

	db $ff ; end

; ================

	; YOUNGSTER (6)
	db "Ian@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 26, CHANSEY, LUCKY_PUNCH
	db 30, DITTO, METAL_POWDER

	db $ff ; end

; ================

	; YOUNGSTER (7)
	db "Joey@"
	db 0 ; normal

	; party
	db 30, FURRET
	db 32, RATTATA

	db $ff ; end

; ================

	; YOUNGSTER (8)
	db "Joey@"
	db 0 ; normal

	; party

	db 40, SQUIRTLE
	db 41, FURRET
	db 42, RATTATA

	db $ff ; end

; ================

	; YOUNGSTER (9)
	db "Warren@"
	db 0 ; normal

	; party
	db 35, FEAROW

	db $ff ; end

; ================

	; YOUNGSTER (10)
	db "Jimmy@"
	db 0 ; normal

	; party
	db 33, RATICATE
	db 33, ARBOK

	db $ff ; end

; ================

	; YOUNGSTER (11)
	db "Owen@"
	db 0 ; normal

	; party
	db 81, IVYSAUR

	db $ff ; end

; ================

	; YOUNGSTER (12)
	db "Jason@"
	db 0 ; normal

	; party
	db 79, RHYHORN
	db 80, TANGELA
	db 81, LICKITUNG

	db $ff ; end

; ================

	; YOUNGSTER (13)
	db "Joey@"
	db 0 ; normal

	; party

	db 60, WARTORTLE
	db 61, FURRET
	db 62, RATTATA

	db $ff ; end

; ================

	; YOUNGSTER (14)
	db "Joey@"
	db 0 ; normal

	; party

	db 80, FURRET
	db 81, BLASTOISE
	db 82, RATICATE

	db $ff ; end

	db "Ben@"
	db 0
	db 11, RATTATA
	db 11, EKANS
	db $ff

	db "Calvin@"
	db 0
	db 14, SPEAROW
	db $ff

; ================

	db "Josh@"
	db 0
	db 10, RATTATA
	db 11, RATTATA
	db 12, ZUBAT
	db $ff

	db "Timmy@"
	db 0
	db 14, SANDSHREW
	db 14, EKANS
	db $ff
;==========
	db "Joey@"
	db 0
	db 15, SPEAROW
	db 16, RATTATA
	db $ff

	db "Dan@"
	db 0
	db 17, SLOWPOKE
	db $ff

	db "Chad@"
	db 0
	db 14, EKANS
	db 14, SANDSHREW
	db $ff

	db "Eddie@"
	db 0
	db 21, EKANS
	db $ff

	db "Dave@"
	db 0
	db 18, NIDORAN_M
	db 19, NIDORINO
	db $ff

	db "Dillon@"
	db 0
	db 19, SANDSHREW
	db 19, ZUBAT
	db $ff

	db "Yasu@"
	db 0
	db 15, RATTATA
	db 17, RATTATA
	db 19, RATICATE
	db $ff

	db "TYLER@"
	db 0
	db 21, NIDORAN_M
; ================================


SchoolboyGroup:
; ================================
; ================

	; SCHOOLBOY (1)
	db "Jack@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 28, HOUNDOUR
		db FLAMETHROWER
		db SLUDGE_BOMB
		db BODY_SLAM
		db BITE
		
	db 30, PINSIR
		db FISSURE
		db NONE
		db HARDEN
		db PIN_MISSILE

	db $ff ; end

; ================

	; SCHOOLBOY (2)
	db "Kipp@"
	db 0 ; normal

	; party
	db 76, GROWLITHE
	db 76, KADABRA

	db $ff ; end

; ================

	; SCHOOLBOY (3)
	db "Alan@"
	db 0 ; normal

	; party
	db 31, SUDOWOODO

	db $ff ; end

; ================

	; SCHOOLBOY (4)
	db "Johnny@"
	db 0 ; normal

	; party
	db 76, YANMA
	db 77, PARASECT

	db $ff ; end

; ================

	; SCHOOLBOY (5)
	db "Danny@"
	db 0 ; normal

	; party
	db 31, JYNX
	db 31, ELECTABUZZ
	db 31, MAGMAR

	db $ff ; end

; ================

	; SCHOOLBOY (6)
	db "Tommy@"
	db 0 ; normal

	; party
	db 80, DITTO
	db 77, ALAKAZAM

	db $ff ; end

; ================

	; SCHOOLBOY (7)
	db "Dudley@"
	db 0 ; normal

	; party
	db 35, ODDISH

	db $ff ; end

; ================

	; SCHOOLBOY (8)
	db "Joe@"
	db 0 ; normal

	; party
	db 33, TANGELA
	db 33, VAPOREON

	db $ff ; end

; ================

	; SCHOOLBOY (9)
	db "Billy@"
	db 0 ; normal

	; party
	db 75, MACHOP
	db 76, HITMONTOP
	db 77, MACHOKE

	db $ff ; end

; ================

	; SCHOOLBOY (10)
	db "Chad@"
	db 0 ; normal

	; party
	db 34, MAGNEMITE
	db 34, EEVEE
	db 34, FLAAFFY

	db $ff ; end

; ================

	; SCHOOLBOY (11)
	db "Nate@"
	db 0 ; normal

	; party
	db 32, LEDIAN
	db 32, EXEGGUTOR

	db $ff ; end

; ================

	; SCHOOLBOY (12)
	db "Ricky@"
	db 0 ; normal

	; party
	db 32, AIPOM
	db 32, DITTO

	db $ff ; end

; ================

	; SCHOOLBOY (13)
	db "Jack@"
	db 0 ; normal

	; party
	db 40, HOUNDOUR
	db 40, STARYU
	db 42, PINSIR

	db $ff ; end

; ================

	; SCHOOLBOY (14)
	db "Jack@"
	db 0 ; normal

	; party
	db 60, BULBASAUR
	db 61, STARYU
	db 62, PINSIR
	db 63, HOUNDOOM

	db $ff ; end

; ================

	; SCHOOLBOY (15)
	db "Alan@"
	db 0 ; normal

	; party
	db 17, TANGELA
	db 17, YANMA

	db $ff ; end

; ================

	; SCHOOLBOY (16)
	db "Alan@"
	db 0 ; normal

	; party
	db 20, NATU
	db 22, TANGELA
	db 20, QUAGSIRE
	db 25, YANMA

	db $ff ; end

; ================

	; SCHOOLBOY (17)
	db "Chad@"
	db 0 ; normal

	; party
	db 39, EEVEE
	db 40, MAGNEMITE
	db 41, FLAAFFY
	db 42, VAPOREON

	db $ff ; end

; ================

	; SCHOOLBOY (18)
	db "Chad@"
	db 0 ; normal

	; party
	db 60, EEVEE
	db 61, FLAAFFY
	db 61, VAPOREON
	db 62, MAGNETON

	db $ff ; end

; ================

	; SCHOOLBOY (19)
	db "Jack@"
	db 0 ; normal

	; party
	db 80, IVYSAUR
	db 81, PINSIR
	db 82, HOUNDOOM
	db 83, STARMIE

	db $ff ; end

; ================

	; SCHOOLBOY (20)
	db "Jack@"
	db 0 ; normal

	; party

	db 95, PINSIR
	db 95, HOUNDOOM
	db 95, STARMIE
	db 95, VENUSAUR

	db $ff ; end

; ================

	; SCHOOLBOY (21)
	db "Alan@"
	db 0 ; normal

	; party
	db 27, NATU
	db 27, TANGELA
	db 30, QUAGSIRE
	db 30, YANMA

	db $ff ; end

; ================

	; SCHOOLBOY (22)
	db "Alan@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 35, XATU
		db PECK
		db NIGHT_SHADE
		db SWIFT
		db FUTURE_SIGHT

	db 32, TANGELA
		db POISONPOWDER
		db VINE_WHIP
		db WRAP
		db MEGA_DRAIN

	db 32, YANMA
		db QUICK_ATTACK
		db DOUBLE_TEAM
		db SONICBOOM
		db SUPERSONIC

	db 35, QUAGSIRE
		db TAIL_WHIP
		db NONE
		db AMNESIA
		db EARTHQUAKE

	db $ff ; end

; ================

	; SCHOOLBOY (23)
	db "Chad@"
	db 0 ; normal

	; party
	db 80, EEVEE
	db 80, FLAAFFY
	db 82, VAPOREON
	db 82, MAGNETON
	db 84, FLAREON

	db $ff ; end

; ================

	; SCHOOLBOY (24)
	db "Chad@"
	db 0 ; normal

	; party

	db 95, MAGNETON
	db 95, FLAREON
	db 95, JOLTEON
	db 95, VAPOREON
	db 95, MAGNETON
	db 95, ESPEON

	db $ff ; end

; ================
; ================================


BirdKeeperGroup:
; ================================
; ================

	; BIRD_KEEPER (1)
	db "Rod@"
	db 0 ; normal

	; party
	db 21, SPEAROW
	db 23, FEAROW

	db $ff ; end

; ================

	; BIRD_KEEPER (2)
	db "Abe@"
	db 0 ; normal

	; party
	db 21, PIDGEY
	db 21, DODUO
	db 23, FARFETCH_D

	db $ff ; end

; ================

	; BIRD_KEEPER (3)
	db "Bryan@"
	db 0 ; normal

	; party
	db 29, TOGETIC
	db 30, PIDGEOTTO

	db $ff ; end

; ================

	; BIRD_KEEPER (4)
	db "Theo@"
	db 0 ; normal

	; party
	db 45, PIDGEY
	db 45, SPEAROW
	db 45, DODUO
	
	db $ff ; end

; ================

	; BIRD_KEEPER (5)
	db "Toby@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 35, NOCTOWL
		db HYPNOSIS
		db DREAM_EATER
		db NIGHTMARE
		db NONE
	
	db $ff ; end

; ================

	; BIRD_KEEPER (6)
	db "Denis@"
	db 0 ; normal

	; party
	db 46, SKIPLOOM
	db 47, LEDIAN

	db $ff ; end

; ================

	; BIRD_KEEPER (7)
	db "Vance@"
	db 0 ; normal

	; party
	db 54, PIDGEOTTO
	db 57, DELIBIRD

	db $ff ; end

; ================

	; BIRD_KEEPER (8)
	db "Hank@"
	db 0 ; normal

	; party
	db 12, PIDGEY
	db 34, PIDGEOT

	db $ff ; end

; ================

	; BIRD_KEEPER (9)
	db "Roy@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 77, MURKROW
		db FLY
		db PURSUIT
		db PERISH_SONG
		db PROTECT

	db 78, XATU
		db PSYCHIC_M
		db DRILL_PECK
		db SOLARBEAM
		db ATTRACT

	db 79, FEAROW
		db FLY
		db TOXIC
		db REST
		db SLEEP_TALK

	db $ff ; end

; ================

	; BIRD_KEEPER (10)
	db "Boris@"
	db 0 ; normal

	; party
	db 74, DODUO
	db 75, DODRIO

	db $ff ; end

; ================

	; BIRD_KEEPER (11)
	db "Bob@"
	db 0 ; normal

	; party
	db 74, SPEAROW
	db 75, FEAROW

	db $ff ; end

; ================

	; BIRD_KEEPER (12)
	db "Jose@"
	db 0 ; normal

	; party
	db 82, FARFETCH_D
	db 84, DODRIO

	db $ff ; end

; ================

	; BIRD_KEEPER (13)
	db "Peter@"
	db 0 ; normal

	; party
	db 23, TOGETIC
	db 25, MURKROW

	db $ff ; end

; ================

	; BIRD_KEEPER (14)
	db "Jose@"
	db 0 ; normal

	; party
	db 94, DODRIO
	db 96, FEAROW
	db 98, FARFETCH_D

	db $ff ; end

; ================

	; BIRD_KEEPER (15)
	db "Perry@"
	db 0 ; normal

	; party
	db 79, FARFETCH_D

	db $ff ; end

; ================

	; BIRD_KEEPER (16)
	db "Bret@"
	db 0 ; normal

	; party
	db 78, SCYTHER
	db 79, VENOMOTH

	db $ff ; end

; ================

	; BIRD_KEEPER (17)
	db "Jose@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 40, FARFETCH_D
		db FURY_ATTACK
		db PROTECT
		db FLY
		db SLASH

	db $ff ; end

; ================

	; BIRD_KEEPER (18)
	db "Vance@"
	db 0 ; normal

	; party
	db 80, PIDGEOTTO
	db 85, DELIBIRD

	db $ff ; end

; ================

	; BIRD_KEEPER (19)
	db "Vance@"
	db 0 ; normal

	; party

	db 96, PIDGEOT
	db 98, MANTINE
	db 100, DELIBIRD

	db $ff ; end

; ================
; ================================


LassGroup:
; ================================
; ================

	; LASS (1)
	db "Carrie@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 33, SMEARGLE
		db TRI_ATTACK
		db MOONBLAST
		db EARTHQUAKE
		db SPORE

	db $ff ; end

; ================

	; LASS (2)
	db "Bridget@"
	db 0 ; normal

	; party
	db 30, TOGETIC
	db 31, MARILL
	db 32, MR__MIME

	db $ff ; end

; ================

	; LASS (3)
	db "Alice@"
	db 0 ; normal

	; party
	db 82, GLOOM
	db 82, VENONAT
	db 82, HAUNTER

	db $ff ; end

; ================

	; LASS (4)
	db "Krise@"
	db 0 ; normal

	; party
	db 30, LEDIAN
	db 31, VENOMOTH

	db $ff ; end

; ================

	; LASS (5)
	db "Connie@"
	db 0 ; normal

	; party
	db 46, DELIBIRD

	db $ff ; end

; ================

	; LASS (6)
	db "Linda@"
	db 0 ; normal

	; party
	db 80, BULBASAUR
	db 81, IVYSAUR
	db 82, VENUSAUR

	db $ff ; end

; ================

	; LASS (7)
	db "Laura@"
	db 0 ; normal

	; party
	db 28, GLOOM
	db 31, PIDGEOTTO
	db 31, BELLOSSOM

	db $ff ; end

; ================

	; LASS (8)
	db "Shannon@"
	db 0 ; normal

	; party
	db 29, PARAS
	db 29, PARAS
	db 32, PARASECT

	db $ff ; end

; ================

	; LASS (9)
	db "Michelle@"
	db 0 ; normal

	; party
	db 76, SKIPLOOM
	db 77, WEEPINBELL
	db 78, BAYLEEF
	
	db $ff ; end

; ================

	; LASS (10)
	db "Dana@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 35, TOGETIC
		db METRONOME
		db 0
		db 0
		db 0

	db 35, DROWZEE
		db METRONOME
		db 0
		db 0
		db 0

	db 35, CLEFAIRY
		db METRONOME
		db 0
		db 0
		db 0

	db 35, TOGEPI
		db METRONOME
		db 0
		db 0
		db 0

	db $ff ; end

; ================

	; LASS (11)
	db "Ellen@"
	db 0 ; normal

	; party
	db 30, WIGGLYTUFF
	db 34, GRANBULL

	db $ff ; end

; ================

	; LASS (12)
	db "Connie@"
	db 0 ; normal

	; party
	db 21, MARILL

	db $ff ; end

; ================

	; LASS (13)
	db "Connie@"
	db 0 ; normal

	; party
	db 21, MARILL

	db $ff ; end

; ================

	; LASS (14)
	db "Dana@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 50, TOGETIC
		db METRONOME
		db 0
		db 0
		db 0

	db 50, TEDDIURSA
		db METRONOME
		db 0
		db 0
		db 0

	db 50, CHANSEY
		db METRONOME
		db 0
		db 0
		db 0

	db 50, GRANBULL
		db METRONOME
		db 0
		db 0
		db 0


	db $ff ; end

; ================

	; LASS (15)
	db "Dana@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 65, TOGETIC
		db METRONOME
		db 0
		db 0
		db 0

	db 65, GRANBULL
		db METRONOME
		db 0
		db 0
		db 0

	db 65, CHANSEY
		db METRONOME
		db 0
		db 0
		db 0

	db 65, URSARING
		db METRONOME
		db 0
		db 0
		db 0

	db $ff ; end

; ================

	; LASS (16)
	db "Dana@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 80, TOGETIC
		db METRONOME
		db 0
		db 0
		db 0

	db 80, MACHAMP
		db METRONOME
		db 0
		db 0
		db 0

	db 80, CHANSEY
		db METRONOME
		db 0
		db 0
		db 0

	db 80, GOLEM
		db METRONOME
		db 0
		db 0
		db 0

	db 80, HYPNO
		db METRONOME
		db 0
		db 0
		db 0

	db $ff ; end

; ================

	; LASS (17)
	db "Dana@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, TOGETIC
		db METRONOME
		db 0
		db 0
		db 0

	db 100, ALAKAZAM
		db METRONOME
		db 0
		db 0
		db 0

	db 100, POLITOED
		db METRONOME
		db 0
		db 0
		db 0

	db 100, GENGAR
		db METRONOME
		db 0
		db 0
		db 0
	
	db 100, BLISSEY
		db METRONOME
		db 0
		db 0
		db 0

	db 100, SNORLAX
		db METRONOME
		db 0
		db 0
		db 0

	db $ff ; end

	db "Janice@"
	db 0
	db 9, PIDGEY
	db 9, PIDGEY
	db $ff

	db "Sally@"
	db 0
	db 10, RATTATA
	db 10, NIDORAN_F
	db $ff

	db "Robin@"
	db (1 << TRAINERTYPE_NICKNAME)
	db 14, JIGGLYPUFF, "Jiggles@"
	db $ff

	db "Miriam@"
	db 0
	db 11, ODDISH
	db 11, BELLSPROUT
	db $ff
	
	db "Iris@"
	db (1 << TRAINERTYPE_NICKNAME)
	db 14, CLEFAIRY, "Cleffles@"
	db $ff

	db "Crissy@"
	db 0
	db 31, PARAS
	db 31, PARAS
	db 33, PARASECT
	db $ff

	db "Ali@"
	db 0
	db 12, PIDGEY
	db 12, ODDISH
	db 12, BELLSPROUT
	db $ff

	db "Reli@"
	db 0
	db 16, NIDORAN_M
	db 16, NIDORAN_F
	db $ff

	db "Haley@"
	db 0
	db 13, ODDISH
	db 14, PIDGEY
	db 13, ODDISH
	db $ff

	db "ANN@"
	db 0
	db 18, PIDGEY
	db 18, NIDORAN_F
	db $ff

	db "DAWN@"
	db 0
	db 18, RATTATA
	db 18, PIKACHU
	db $ff

; ================
; ================================


JanineGroup:
; ================================
; ================

	; JANINE (1)
	db "Janine@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 83, CROBAT
		db SCREECH
		db SUPERSONIC
		db CONFUSE_RAY
		db WING_ATTACK

	db 84, WEEZING
		db FIRE_BLAST
		db SLUDGE_BOMB
		db TOXIC
		db EXPLOSION

	db 84, ARBOK
		db GLARE
		db TOXIC
		db CRUNCH
		db WRAP
		
	db 85, MUK
		db SLUDGE
		db MINIMIZE
		db TOXIC
		db ACID_ARMOR

	db 82, ARIADOS
		db SCARY_FACE
		db GIGA_DRAIN
		db STRING_SHOT
		db NIGHT_SHADE

	db 86, VENOMOTH
		db FORESIGHT
		db DOUBLE_TEAM
		db GUST
		db PSYCHIC_M

	db $ff ; end
; ================
; ================================


CooltrainerMGroup:
; ================================
; ================

	; COOLTRAINERM (1)
	db "Nick@"
	db 0 ; normal

	; party

	db 43, CHARIZARD
	db 43, VENUSAUR
	db 43, BLASTOISE

	db $ff ; end

; ================

	; COOLTRAINERM (2)
	db "Aaron@"
	db 0 ; normal

	; party
	db 37, IVYSAUR
	db 37, CHARMELEON
	db 37, WARTORTLE

	db $ff ; end

; ================

	; COOLTRAINERM (3)
	db "Paul@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 57, DRATINI, CHARCOAL
	db 57, DRATINI, DRAGON_SCALE
	db 59, DRAGONAIR, MINT_BERRY

	db $ff ; end

; ================

	; COOLTRAINERM (4)
	db "Cody@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 57, HORSEA, FOCUS_BAND
	db 59, SEADRA, DRAGON_SCALE

	db $ff ; end

; ================

	; COOLTRAINERM (5)
	db "Mike@"
	db 0 ; normal

	; party
	db 57, ONIX
	db 59, STEELIX

	db $ff ; end

; ================

	; COOLTRAINERM (6)
	db "Gaven@"
	db 0 ; normal

	; party

	db 82, VICTREEBEL
	db 82, KINGLER
	db 84, FLAREON
	db 84, MACHAMP

	db $ff ; end

; ================

	; COOLTRAINERM (7)
	db "Gaven@"
	db 0 ; normal

	; party

	db 96, VICTREEBEL
	db 97, KINGLER
	db 98, FLAREON	
	db 99, SNORLAX
	db 100, MACHAMP
	
	db $ff ; end

; ================

	; COOLTRAINERM (8)
	db "Ryan@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 55, CHANSEY, LUCKY_PUNCH
	db 57, CLEFABLE, QUICK_CLAW

	db $ff ; end

; ================

	; COOLTRAINERM (9)
	db "Jake@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 60, CORSOLA, QUICK_CLAW
	db 61, PARASECT, MIRACLEBERRY
	db 62, MAGCARGO, LEFTOVERS

	db $ff ; end

; ================

	; COOLTRAINERM (10)
	db "Gaven@"
	db 0 ; normal

	; party

	db 60, WEEPINBELL
	db 61, KINGLER
	db 62, FLAREON
	db 63, MACHAMP

	db $ff ; end

; ================

	; COOLTRAINERM (11)
	db "Blake@"
	db 0 ; normal

	; party

	db 58, JYNX
	db 59, HITMONTOP
	db 60, MAGNETON

	db $ff ; end

; ================

	; COOLTRAINERM (12)
	db "Brian@"
	db 0 ; normal

	; party

	db 59, STARMIE
	db 59, MILTANK

	db $ff ; end

; ================

	; COOLTRAINERM (13)
	db "Erick@"
	db 0 ; normal

	; party
	db 10, BULBASAUR
	db 10, CHARMANDER
	db 10, SQUIRTLE

	db $ff ; end

; ================

	; COOLTRAINERM (14)
	db "Andy@"
	db 0 ; normal

	; party
	db 10, BULBASAUR
	db 10, CHARMANDER
	db 10, SQUIRTLE

	db $ff ; end

; ================

	; COOLTRAINERM (15)
	db "Tyler@"
	db 0 ; normal

	; party
	db 10, BULBASAUR
	db 10, CHARMANDER
	db 10, SQUIRTLE

	db $ff ; end

; ================

	; COOLTRAINERM (16)
	db "Sean@"
	db 0 ; normal

	; party
	db 35, FLAREON
	db 35, TANGELA
	db 35, TAUROS

	db $ff ; end

; ================

	; COOLTRAINERM (17)
	db "Kevin@"
	db 0 ; normal

	; party
	db 38, RHYHORN
	db 35, CHARMELEON
	db 35, WARTORTLE

	db $ff ; end

; ================

	; COOLTRAINERM (18)
	db "Steve@"
	db 0 ; normal

	; party
	db 14, BULBASAUR
	db 14, CHARMANDER
	db 14, SQUIRTLE

	db $ff ; end

; ================

	; COOLTRAINERM (19)
	db "Allen@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 56,CHARMELEON, FOCUS_BAND
	db 56,BELLOSSOM, QUICK_CLAW

	db $ff ; end

; ================

	; COOLTRAINERM (20)
	db "Darin@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 61, MEGANIUM, LEFTOVERS

	db $ff ; end

	db "Bonita@"
	db 0 ; normal

	db 90, GRANBULL
	db 92, SUDOWOODO
	db $ff

; ================
; ================================


CooltrainerFGroup:
; ================================
; ================

	; COOLTRAINERF (1)
	db "Gwen@"
	db 0 ; normal

	; party
	db 43, EEVEE
	db 43, FLAREON
	db 43, VAPOREON
	db 43, JOLTEON
	db 43, ESPEON
	db 43, UMBREON	

	db $ff ; end

; ================

	; COOLTRAINERF (2)
	db "Lois@"
	db 0 ; normal

	; party

	db 37, FORRETRESS
	db 37, HERACROSS

	db $ff ; end

; ================

	; COOLTRAINERF (3)
	db "Fran@"
	db 0 ; normal

	; party
	db 58, GYARADOS

	db $ff ; end

; ================

	; COOLTRAINERF (4)
	db "Lola@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 60, CHARIZARD, BITTER_BERRY

	db $ff ; end

; ================

	; COOLTRAINERF (5)
	db "Kate@"
	db 0 ; normal

	; party
	db 26, SHELLDER
	db 28, CLOYSTER

	db $ff ; end

; ================

	; COOLTRAINERF (6)
	db "Irene@"
	db 0 ; normal

	; party
	db 22, GOLDEEN
	db 24, SEAKING

	db $ff ; end

; ================

	; COOLTRAINERF (7)
	db "Kelly@"
	db 0 ; normal

	; party

	db 55, WARTORTLE
	db 56, GRAVELER
	db 57, SCIZOR

	db $ff ; end

; ================

	; COOLTRAINERF (8)
	db "Joyce@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 60, RAPIDASH, GOLD_BERRY
	db 61, MANTINE, MIRACLEBERRY
	db 62, VENUSAUR, LEFTOVERS

	db $ff ; end

; ================

	; COOLTRAINERF (9)
	db "Beth@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 59, CATERPIE, FOCUS_BAND
	db 60, CHARMANDER, CHARCOAL
	db 61, PIDGEOTTO, PINK_BOW
	db 62, PIKACHU, LIGHT_BALL

	db $ff ; end

; ================

	; COOLTRAINERF (10)
	db "Reena@"
	db 0 ; normal

	; party
	db 59, NIDOKING
	db 59, NIDOQUEEN

	db $ff ; end

; ================

	; COOLTRAINERF (11)
	db "Megan@"
	db 0 ; normal

	; party

	db 59, BULBASAUR
	db 59, IVYSAUR
	db 59, VENUSAUR

	db $ff ; end

; ================

	; COOLTRAINERF (12)
	db "Beth@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 79, METAPOD, FOCUS_BAND
	db 80, SQUIRTLE, BLACKGLASSES
	db 81, PIDGEOTTO, PINK_BOW
	db 82, CHARMELEON, CHARCOAL
	db 83, PIKACHU, LIGHT_BALL

	db $ff ; end

; ================

	; COOLTRAINERF (13)
	db "Carol@"
	db 0 ; normal

	; party
	db 35, ELECTRODE
	db 35, STARMIE
	db 35, NINETALES

	db $ff ; end

; ================

	; COOLTRAINERF (14)
	db "Quinn@"
	db 0 ; normal

	; party
	db 38, IVYSAUR
	db 38, STARMIE

	db $ff ; end

; ================

	; COOLTRAINERF (15)
	db "Emma@"
	db 0 ; normal

	; party
	db 45, LAPRAS

	db $ff ; end

; ================

	; COOLTRAINERF (16)
	db "Cybil@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 55, JUMPLUFF, LEFTOVERS
	db 57, BUTTERFREE, GOLD_BERRY

	db $ff ; end

; ================

	; COOLTRAINERF (17)
	db "Jenn@"
	db 0 ; normal

	; party
	db 24, STARYU
	db 26, STARMIE

	db $ff ; end

; ================

	; COOLTRAINERF (18)
	db "Beth@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 95, BULBASAUR, LEFTOVERS
	db 96, BUTTERFREE, FOCUS_BAND
	db 95, SQUIRTLE, BLACKGLASSES
	db 97, PIDGEOT, PINK_BOW
	db 98, CHARIZARD, CHARCOAL
	db 100, PIKACHU, LIGHT_BALL

	db $ff ; end

; ================

	; COOLTRAINERF (19)
	db "Reena@"
	db 0 ; normal

	; party
	db 81, NIDORINO
	db 81, NIDORINA
	db 83, NIDOQUEEN
	db 83, NIDOKING

	db $ff ; end

; ================

	; COOLTRAINERF (20)
	db "Reena@"
	db 0 ; normal

	; party

	db 94, NIDORAN_M
	db 94, NIDORAN_F
	db 96, NIDORINA
	db 96, NIDORINO
	db 98, NIDOKING
	db 98, NIDOQUEEN
	
	db $ff ; end

; ================

	; COOLTRAINERF (21)
	db "Cara@"
	db 0 ; normal

	; party

	db 59, FORRETRESS
	db 61, AMPHAROS

	db $ff ; end

	db "Salma@"
	db (1 << TRAINERTYPE_ITEM)

	db 90, SLOWKING, BERRY
	db 92, LICKITUNG, NO_ITEM
	db $ff

; ================
; ================================


BeautyGroup:
; ================================
; ================

	; BEAUTY (1)
	db "Victoria@"
	db 0 ; normal

	; party

	db 30, MEOWTH
	db 31, DUNSPARCE
	db 31, AIPOM
	db 32, FURRET

	db $ff ; end

; ================

	; BEAUTY (2)
	db "Samantha@"
	db 0 ; normal

	; party

	db 30, STANTLER
	db 32, GIRAFARIG

	db $ff ; end

; ================

	; BEAUTY (3)
	db "Julie@"
	db 0 ; normal

	; party
	db 15, SENTRET

	db $ff ; end

; ================

	; BEAUTY (4)
	db "Jaclyn@"
	db 0 ; normal

	; party
	db 15, SENTRET

	db $ff ; end

; ================

	; BEAUTY (5)
	db "Brenda@"
	db 0 ; normal

	; party
	db 16, FURRET

	db $ff ; end

; ================

	; BEAUTY (6)
	db "Cassie@"
	db 0 ; normal

	; party
	db 28, VILEPLUME
	db 34, BUTTERFREE

	db $ff ; end

; ================

	; BEAUTY (7)
	db "Caroline@"
	db 0 ; normal

	; party
	db 30, MARILL
	db 32, SEEL
	db 30, MARILL

	db $ff ; end

; ================

	; BEAUTY (8)
	db "Carlene@"
	db 0 ; normal

	; party
	db 15, SENTRET

	db $ff ; end

; ================

	; BEAUTY (9)
	db "Jessica@"
	db 0 ; normal

	; party
	db 15, SENTRET

	db $ff ; end

; ================

	; BEAUTY (10)
	db "Rachael@"
	db 0 ; normal

	; party
	db 15, SENTRET

	db $ff ; end

; ================

	; BEAUTY (11)
	db "Angelica@"
	db 0 ; normal

	; party
	db 15, SENTRET

	db $ff ; end

; ================

	; BEAUTY (12)
	db "Kendra@"
	db 0 ; normal

	; party
	db 15, SENTRET

	db $ff ; end

; ================

	; BEAUTY (13)
	db "Veronica@"
	db 0 ; normal

	; party
	db 15, SENTRET

	db $ff ; end

; ================

	; BEAUTY (14)
	db "Julia@"
	db 0 ; normal

	; party
	db 76, PARAS
	db 77, SUNKERN
	db 78, PARASECT

	db $ff ; end

; ================

	; BEAUTY (15)
	db "Theresa@"
	db 0 ; normal

	; party
	db 15, SENTRET

	db $ff ; end

; ================

	; BEAUTY (16)
	db "Valerie@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 34, MAREEP
		db THUNDER_WAVE
		db HEADBUTT
		db LIGHT_SCREEN
		db THUNDERBOLT

	db 34, PERSIAN
		db HEADBUTT
		db BITE
		db BUBBLEBEAM
		db NONE

	db $ff ; end

; ================

	; BEAUTY (17)
	db "Olivia@"
	db 0 ; normal

	; party
	db 35, MILTANK

	db $ff ; end

; ================
; ================================


PokemaniacGroup:
; ================================
; ================

	; POKEMANIAC (1)
	db "Larry@"
	db 0 ; normal

	; party
	db 24, GLIGAR
	db 25, QUAGSIRE

	db $ff ; end

; ================

	; POKEMANIAC (2)
	db "Andrew@"
	db 0 ; normal

	; party
	db 38, GOLDUCK
	db 38, MAROWAK
	db 38, KINGLER

	db $ff ; end

; ================

	; POKEMANIAC (3)
	db "Calvin@"
	db 0 ; normal

	; party
	db 38, HITMONCHAN

	db $ff ; end

; ================

	; POKEMANIAC (4)
	db "Shane@"
	db 0 ; normal

	; party
	db 33, NIDORINO
	db 33, NIDORINA
	db 34, MR__MIME

	db $ff ; end

; ================

	; POKEMANIAC (5)
	db "Ben@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 38, SLOWBRO, LEFTOVERS

	db $ff ; end

; ================

	; POKEMANIAC (6)
	db "Brent@"
	db 0 ; normal

	; party
	db 36, NOCTOWL
	db 36, SNEASEL
	db 37, STANTLER

	db $ff ; end

; ================

	; POKEMANIAC (7)
	db "Ron@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 35, VENONAT, QUICK_CLAW
	db 36, ARIADOS, BERRY_JUICE
	db 37, VENOMOTH, GOLD_BERRY

	db $ff ; end

; ================

	; POKEMANIAC (8)
	db "Ethan@"
	db 0 ; normal

	; party
	db 31, RHYHORN
	db 31, RHYDON

	db $ff ; end

; ================

	; POKEMANIAC (9)
	db "Brent@"
	db 0 ; normal

	; party
	db 25, KANGASKHAN

	db $ff ; end

; ================

	; POKEMANIAC (10)
	db "Brent@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 36, PORYGON
		db RECOVER
		db PSYCHIC_M
		db CONVERSION2
		db TRI_ATTACK

	db $ff ; end

; ================

	; POKEMANIAC (11)
	db "Issac@"
	db 0 ; normal

	; party

	db 30, LICKITUNG

	db $ff ; end

; ================

	; POKEMANIAC (12)
	db "Donald@"
	db 0 ; normal

	; party
	db 29, SLOWPOKE
	db 29, VULPIX

	db $ff ; end

; ================

	; POKEMANIAC (13)
	db "Zach@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 57, SLOWKING, QUICK_CLAW

	db $ff ; end

; ================

	; POKEMANIAC (14)
	db "Brent@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 41, CHANSEY
		db ROLLOUT
		db ATTRACT
		db NONE
		db SOFTBOILED

	db $ff ; end

; ================

	; POKEMANIAC (15)
	db "Miller@"
	db 0 ; normal

	; party
	db 34, NIDOKING
	db 34, NIDOQUEEN

	db $ff ; end

; ================
; ================================


GruntMGroup:
; ================================
; ================

	; GRUNTM (1)
	db "Grunt@"
	db 0 ; normal

	; party
	db 14, KOFFING

	db $ff ; end

; ================

	; GRUNTM (2)
	db "Grunt@"
	db 0 ; normal

	; party
	db 25, WOOPER
	db 23, MANKEY
	db 27, WOBBUFFET

	db $ff ; end

; ================

	; GRUNTM (3)
	db "Grunt@"
	db 0 ; normal

	; party
	db 49,HOOTHOOT
	db 51,RATICATE

	db $ff ; end

; ================

	; GRUNTM (4)
	db "Grunt@"
	db 0 ; normal

	; party
	db 51, SLUGMA
	db 51, GRIMER
	db 53, MISDREAVUS

	db $ff ; end

; ================

	; GRUNTM (5)
	db "Grunt@"
	db 0 ; normal

	; party
	db 50, TANGELA 
	db 50, MARILL
	db 50, FLAAFFY
	db 50, PERSIAN

	db $ff ; end

; ================

	; GRUNTM (6)
	db "Grunt@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 51, MACHOKE, BERSERK_GENE
	db 52, GIRAFARIG, BERSERK_GENE

	db $ff ; end

; ================

	; GRUNTM (7)
	db "Grunt@"
	db 0 ; normal

	; party
	db 51, SPINARAK
	db 51, RHYHORN
	db 52, DROWZEE
	db 53, DUNSPARCE

	db $ff ; end

; ================

	; GRUNTM (8)
	db "Grunt@"
	db 0 ; normal

	; party
	db 51, LEDYBA
	db 52, WEEZING
	db 53, YANMA

	db $ff ; end

; ================

	; GRUNTM (9)
	db "Grunt@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 54, MAROWAK, THICK_CLUB
	db 56, AZUMARILL, LEFTOVERS

	db $ff ; end

; ================

	; GRUNTM (10)
	db "Grunt@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 51, CUBONE, THICK_CLUB
	db 51, FURRET, LEFTOVERS
	db 53, HAUNTER, FOCUS_BAND

	db $ff ; end

; ================

	; GRUNTM (11)
	db "Grunt@"
	db 0 ; normal

	; party
	db 51, PSYDUCK
	db 53, PARASECT

	db $ff ; end

; ================

	; GRUNTM (12)
	db "Executive@"
	db 0 ; normal

	; party
	db 33, HOUNDOUR

	db $ff ; end

; ================

	; GRUNTM (13)
	db "Grunt@"
	db 0 ; normal

	; party
	db 53, PHANPY

	db $ff ; end

; ================

	; GRUNTM (14)
	db "Grunt@"
	db 0 ; normal

	; party
	db 51, NIDORAN_M
	db 51, NIDORAN_F
	db 53, NIDORINA
	db 53, NIDORINO

	db $ff ; end

; ================

	; GRUNTM (15)
	db "Grunt@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 53, WOBBUFFET, GOLD_BERRY
	db 55, STEELIX, LEFTOVERS

	db $ff ; end

; ================

	; GRUNTM (16)
	db "Grunt@"
	db 0 ; normal

	; party
	db 37, AIPOM
	db 37, EEVEE
	db 37, SENTRET
	db 38, LICKITUNG

	db $ff ; end

; ================

	; GRUNTM (17)
	db "Grunt@"
	db 0 ; normal

	; party
	db 35, ZUBAT
	db 36, GOLBAT
	db 37, CROBAT

	db $ff ; end

; ================

	; GRUNTM (18)
	db "Grunt@"
	db 0 ; normal

	; party
	db 36, ONIX
	db 37, STEELIX

	db $ff ; end

; ================

	; GRUNTM (19)
	db "Grunt@"
	db 0 ; normal

	; party
	db 37, GRIMER
	db 38, QUAGSIRE

	db $ff ; end

; ================

	; GRUNTM (20)
	db "Grunt@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 37, SPINARAK, FOCUS_BAND
	db 38, DROWZEE, FOCUS_BAND

	db $ff ; end

; ================

	; GRUNTM (21)
	db "Grunt@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 37, RATTATA, FOCUS_BAND
	db 38, SLUGMA, FOCUS_BAND

	db $ff ; end

; ================

	; GRUNTM (22)
	db "Executive@"
	db 0 ; normal

	; party
	db 36, GOLBAT

	db $ff ; end

; ================

	; GRUNTM (23)
	db "Executive@"
	db 0 ; normal

	; party
	db 30, KOFFING

	db $ff ; end

; ================

	; GRUNTM (24)
	db "Grunt@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 52, AIPOM, BERSERK_GENE
	db 54, XATU, BRIGHTPOWDER
	db 56, FORRETRESS, BERSERK_GENE

	db $ff ; end

; ================

	; GRUNTM (25)
	db "Grunt@"
	db 0 ; normal

	; party
	db 52, KOFFING
	db 54, MUK

	db $ff ; end

; ================

	; GRUNTM (26)
	db "Grunt@"
	db 0 ; normal

	; party
	db 15, RATTATA
	db 15, RATTATA

	db $ff ; end

; ================

	; GRUNTM (27)
	db "Executive@"
	db 0 ; normal

	; party
	db 22, ZUBAT

	db $ff ; end

; ================

	; GRUNTM (28)
	db "Grunt@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 38,SUDOWOODO, FOCUS_BAND
	db 38,DUNSPARCE, BERRY_JUICE

	db $ff ; end

; ================

	; GRUNTM (29)
	db "Grunt@"
	db 0 ; normal

	; party
	db 25, HOUNDOUR
	db 23, EKANS
	db 27, FURRET

	db $ff ; end

; ================

	; GRUNTM (30)
	db "Grunt@"
	db 0 ; normal

	; party
	db 25, GOLBAT
	db 25, GOLBAT
	db 30, ARBOK

	db $ff ; end

; ================

	; GRUNTM (31)
	db "Grunt@"
	db 0 ; normal

	; party
	db 82, MISDREAVUS
	db 83, PORYGON2
	db 84, SKARMORY
	db 85, CROBAT

	db $ff ; end

; ================

; 32
	db "Grunt@"
	db 0
	db 12, RATTATA
	db 12, KOFFING
	db $ff

; 33
	db "Grunt@"
	db 0
	db 12, ZUBAT
	db 14, GRIMER
	db 12, RATTATA
	db $ff

; 34
	db "Grunt@"
	db 0
	db 12, ZUBAT
	db 12, EKANS
	db $ff

; 35
	db "Grunt@"
	db 0
	db 13, RATTATA
	db 13, ZUBAT
	db $ff

; 36
	db "Grunt@"
	db 0
	db 15, EKANS
	db 15, ZUBAT
	db $ff

; 37
	db "Grunt@"
	db 0
	db 17, MACHOP
	db 17, DROWZEE
	db $ff

; ================================

GentlemanGroup:
; ================================
; ================

	; GENTLEMAN (1)
	db "Preston@"
	db 0 ; normal

	; party
	db 46, ELECTABUZZ

	db $ff ; end

; ================

	; GENTLEMAN (2)
	db "Edward@"
	db 0 ; normal

	; party
	db 33, PERSIAN

	db $ff ; end

; ================

	; GENTLEMAN (3)
	db "Gregory@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 72, AMPHAROS, KINGS_ROCK

	db $ff ; end

; ================

	; GENTLEMAN (4)
	db "Virgil@"
	db 0 ; normal

	; party
	db 20, PONYTA

	db $ff ; end

; ================

	; GENTLEMAN (5)
	db "Alfred@"
	db 0 ; normal

	; party
	db 44, QUILAVA

	db $ff ; end

	db "Hugo@"
	db 0
	db 18, POLIWAG
	db 18, HORSEA
	db $ff

	db "Jasper@"
	db 0
	db 18, BELLSPROUT
	db 18, ODDISH
	db $ff

	db "Darian@"
	db 0
	db 18, GROWLITHE
	db 18, VULPIX
	db $ff

	db "Dirk@"
	db 0
	db 18, VOLTORB
	db 18, MAGNEMITE
	db $ff

	db "ARTHUR@"
	db 0
	db 19, NIDORAN_M
	db 19, NIDORAN_F
	db $ff

	db "THOMAS@"
	db (1 << TRAINERTYPE_NICKNAME)
	db 18, GROWLITHE, "FIDO@"
	db 18, GROWLITHE, "MAX@"
	db $ff

	db "BROOKS@"
	db (1 << TRAINERTYPE_ITEM)
	db 23, PIKACHU, LIGHT_BALL
	db $ff

	db "LAMAR@"
	db 0
	db 17, GROWLITHE
	db 17, PONYTA
	db $ff
; ================
; ================================


SkierGroup:
; ================================
; ================

	; SKIER (1)
	db "Roxanne@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 44, DELIBIRD
		db ICE_BEAM
		db FLY
		db TOXIC
		db PROTECT

	db $ff ; end

; ================

	; SKIER (2)
	db "Clarissa@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 43, SNEASEL, FOCUS_BAND

	db $ff ; end

; ================
; ================================


TeacherGroup:
; ================================
; ================

	; TEACHER (1)
	db "Colette@"
	db 0 ; normal

	; party
	db 77, JYNX

	db $ff ; end

; ================

	; TEACHER (2)
	db "Hillary@"
	db 0 ; normal

	; party
	db 77, MACHAMP

	db $ff ; end

; ================

	; TEACHER (3)
	db "Shirley@"
	db 0 ; normal

	; party
	db 35, JIGGLYPUFF

	db $ff ; end

; ================
; ================================


SabrinaGroup:
; ================================
; ================

	; SABRINA (1)
	db "Sabrina@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 76, ESPEON
		db SAND_ATTACK
		db QUICK_ATTACK
		db SWIFT
		db PSYCHIC_M

	db 76, MR__MIME
		db BARRIER
		db REFLECT
		db BATON_PASS
		db PSYCHIC_M

	db 79, ALAKAZAM
		db RECOVER
		db FUTURE_SIGHT
		db PSYCHIC_M
		db REFLECT

	db 77, JYNX
		db PSYCHIC_M
		db ICE_BEAM
		db LIGHT_SCREEN
		db SING

	db 78, XATU
		db FUTURE_SIGHT
		db WING_ATTACK
		db PSYCHIC_M
		db RECOVER

	db 80, EXEGGUTOR
		db SEED_BOMB
		db PSYCHIC_M
		db LEECH_SEED
		db SYNTHESIS

	db $ff ; end

; ================
; ================================


BugCatcherGroup:
; ================================
; ================

	; BUG_CATCHER (1)
	db "Don@"
	db 0

	; party
	db 20, LEDYBA
	db 21, SPINARAK
	db 23, LEDIAN

	db $ff ; end

; ================

	; BUG_CATCHER (2)
	db "Rob@"
	db 0 ; normal

	; party
	db 32, BEEDRILL
	db 32, BUTTERFREE

	db $ff ; end

; ================

	; BUG_CATCHER (3)
	db "Ed@"
	db 0 ; normal

	; party
	db 30, BEEDRILL
	db 30, BEEDRILL
	db 30, BEEDRILL

	db $ff ; end

; ================

	; BUG_CATCHER (4)
	db "Wade@"
	db 0 ; normal

	; party
	db 20, PINECO
	db 20, HOPPIP
	db 22, PINECO
	db 23, ARIADOS

	db $ff ; end

; ================

	; BUG_CATCHER (5)
	db "Benny@"
	db 0 ; normal

	; party
	db 26, SHUCKLE
	db 25, PARASECT
	db 27, PINSIR

	db $ff ; end

; ================

	; BUG_CATCHER (6)
	db "Al@"
	db 0 ; normal

	; party
	db 26, PINECO
	db 25, PARAS
	db 25, VENONAT
	db 28, YANMA

	db $ff ; end

; ================

	; BUG_CATCHER (7)
	db "Josh@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 27, LEDIAN
		db DYNAMICPUNCH
		db ICE_PUNCH
		db THUNDERPUNCH
		db NONE

	db 27, ARIADOS
		db SLUDGE_BOMB
		db PROTECT
		db DISABLE
		db DIG

	db $ff ; end

; ================

	; BUG_CATCHER (8)
	db "Arnie@"
	db 0 ; normal

	; party
	db 28, SCYTHER
	db 30, YANMA

	db $ff ; end

; ================

	; BUG_CATCHER (9)
	db "Ken@"
	db 0 ; normal

	; party
	db 30, ARIADOS
	db 32, PINSIR

	db $ff ; end

; ================

	; BUG_CATCHER (10)
	db "Wade@"
	db 0 ; normal

	; party
	db 30, PINECO
	db 31, ARIADOS
	db 32, SKIPLOOM

	db $ff ; end

; ================

	; BUG_CATCHER (11)
	db "Wade@"
	db 0 ; normal

	; party
	db 40, PINECO
	db 41, ARIADOS
	db 42, JUMPLUFF

	db $ff ; end

; ================

	; BUG_CATCHER (12)
	db "Doug@"
	db 0 ; normal

	; party
	db 34, ARIADOS

	db $ff ; end

; ================

	; BUG_CATCHER (13)
	db "Arnie@"
	db 0 ; normal

	; party
	db 39, PARAS
	db 41, YANMA
	db 43, SCYTHER

	db $ff ; end

; ================

	; BUG_CATCHER (14)
	db "Arnie@"
	db 0 ; normal

	; party

	db 60, VENONAT
	db 60, YANMA
	db 60, PARASECT
	db 60, SCYTHER

	db $ff ; end

; ================

	; BUG_CATCHER (15)
	db "Wade@"
	db 0 ; normal

	; party

	db 60, FORRETRESS
	db 61, ARIADOS
	db 62, JUMPLUFF

	db $ff ; end

; ================

	; BUG_CATCHER (16)
	db "Wade@"
	db 0 ; normal

	; party

	db 80, FORRETRESS
	db 82, BUTTERFREE
	db 83, ARIADOS
	db 82, BEEDRILL
	db 83, JUMPLUFF

	db $ff ; end

; ================

	; BUG_CATCHER (17)
	db "Arnie@"
	db 0 ; normal

	; party

	db 80, YANMA
	db 80, PARASECT
	db 80, SCYTHER
	db 80, VENOMOTH

	db $ff ; end

; ================

	; BUG_CATCHER (18)
	db "Arnie@"
	db 0 ; normal

	; party

	db 95, YANMA
	db 95, VENOMOTH
	db 95, PARASECT
	db 95, SCIZOR

	db $ff ; end

; ================

	; BUG_CATCHER (19)
	db "Wayne@"
	db 0 ; normal

	; party
	db 26, FARFETCH_D
	db 27, HERACROSS

	db $ff ; end

	db "Rick@"
	db 0
	db 6, WEEDLE
	db 6, CATERPIE
	db $ff

	db "Doug@"
	db 0
	db 7, WEEDLE
	db 7, KAKUNA
	db 7, WEEDLE
	db $ff

	db "Chuck@"
	db 0
	db 7, CATERPIE
	db 7, METAPOD
	db 7, CATERPIE
	db $ff

	db "Sammy@"
	db 0
	db 9, WEEDLE
	db $ff

	db "Greg@"
	db 0
	db 9, WEEDLE
	db 9, KAKUNA
	db 9, CATERPIE
	db 9, METAPOD
	db $ff

	db "Colton@"
	db 0
	db 10, CATERPIE
	db 10, WEEDLE
	db 10, CATERPIE
	db $ff

	db "James@"
	db 0
	db 11, CATERPIE
	db 11, METAPOD
	db $ff

; ================

	db "Kent@"
	db 0
	db 11, WEEDLE
	db 11, KAKUNA
	db $ff

	db "Robby@"
	db 0
	db 10, CATERPIE
	db 12, METAPOD
	db 10, CATERPIE
	db $ff

	db "Cale@"
	db 0
	db 10, CATERPIE
	db 10, WEEDLE
	db 11, METAPOD
	db 11, KAKUNA
	db $ff

	db "Keigo@"
	db 0
	db 16, WEEDLE
	db 16, CATERPIE
	db 18, WEEDLE
	db $ff

	db "Elijah@"
	db 0
	db 20, BUTTERFREE
	db $ff

; ================
; ================================


FisherGroup:
; ================================
; ================

	; FISHER (1)
	db "Justin@"
	db 0 ; normal

	; party
	db 20,REMORAID
	db 20,GOLDEEN
	db 22,REMORAID
	db 25,OCTILLERY

	db $ff ; end

; ================

	; FISHER (2)
	db "Ralph@"
	db 0 ; normal

	; party
	db 25, GOLDEEN

	db $ff ; end

; ================

	; FISHER (3)
	db "Arnold@"
	db 0 ; normal

	; party
	db 34, TENTACRUEL

	db $ff ; end

; ================

	; FISHER (4)
	db "Kyle@"
	db 0 ; normal

	; party
	db 78, HORSEA
	db 79, KRABBY
	db 80, SEADRA

	db $ff ; end

; ================

	; FISHER (5)
	db "Henry@"
	db 0 ; normal

	; party
	db 23, WARTORTLE

	db $ff ; end

; ================

	; FISHER (6)
	db "Marvin@"
	db 0 ; normal

	; party
	db 10, MAGIKARP
	db 10, GYARADOS
	db 15, MAGIKARP
	db 15, GYARADOS

	db $ff ; end

; ================

	; FISHER (7)
	db "Tully@"
	db 0 ; normal

	; party
	db 34, POLIWHIRL
	db 34, SEAKING

	db $ff ; end

; ================

	; FISHER (8)
	db "Andre@"
	db 0 ; normal

	; party
	db 38, GYARADOS

	db $ff ; end

; ================

	; FISHER (9)
	db "Raymond@"
	db 0 ; normal

	; party
	db 35, MAGIKARP
	db 40, MAGIKARP
	db 45, MAGIKARP
	db 37, FERALIGATR

	db $ff ; end

; ================

	; FISHER (10)
	db "Wilton@"
	db 0 ; normal

	; party
	db 55, POLIWAG
	db 56, POLIWHIRL
	db 57, POLITOED

	db $ff ; end

; ================

	; FISHER (11)
	db "Edgar@"
	db 0 ; normal

	; party

	db 56, QWILFISH
	db 56, OCTILLERY

	db $ff ; end

; ================

	; FISHER (12)
	db "Jonah@"
	db 0 ; normal

	; party
	db 25, SHELLDER
	db 29, OCTILLERY
	db 25, REMORAID
	db 29, CLOYSTER

	db $ff ; end

; ================

	; FISHER (13)
	db "Martin@"
	db 0 ; normal

	; party
	db 80, KINGLER

	db $ff ; end

; ================

	; FISHER (14)
	db "Stephen@"
	db 0 ; normal

	; party
	db 79, GASTLY
	db 80, HAUNTER

	db $ff ; end

; ================

	; FISHER (15)
	db "Barney@"
	db 0 ; normal

	; party
	db 60, GYARADOS
	db 70, GYARADOS
	db 80, GYARADOS

	db $ff ; end

; ================

	; FISHER (16)
	db "Ralph@"
	db 0 ; normal

	; party
	db 35, GOLDEEN

	db $ff ; end

; ================

	; FISHER (17)
	db "Ralph@"
	db 0 ; normal

	; party
	db 42, GOLDEEN
	db 44, SEAKING

	db $ff ; end

; ================

	; FISHER (18)
	db "Tully@"
	db 0 ; normal

	; party
	db 44, MARILL
	db 45, POLIWHIRL
	db 46, SEAKING

	db $ff ; end

; ================

	; FISHER (19)
	db "Tully@"
	db 0 ; normal

	; party
	db 80, POLIWRATH
	db 81, SEAKING
	db 82, AZUMARILL

	db $ff ; end

; ================

	; FISHER (20)
	db "Wilton@"
	db 0 ; normal

	; party
	db 80, POLIWAG
	db 81, POLIWHIRL
	db 82, POLITOED

	db $ff ; end

; ================

	; FISHER (21)
	db "Scott@"
	db 0 ; normal

	; party
	db 58, SEAKING
	db 60, GOLDUCK
	db 62, BLASTOISE

	db $ff ; end

; ================

	; FISHER (22)
	db "Wilton@"
	db 0 ; normal

	; party

	db 94, POLIWAG
	db 95, POLIWHIRL
	db 96, POLITOED
	db 97, POLIWRATH

	db $ff ; end

; ================

	; FISHER (23)
	db "Ralph@"
	db 0 ; normal

	; party
	db 62, WARTORTLE
	db 64, SEAKING

	db $ff ; end

; ================

	; FISHER (24)
	db "Ralph@"
	db 0 ; normal

	; party

	db 82, SEAKING
	db 84, BLASTOISE


	db $ff ; end

; ================

	; FISHER (25)
	db "Tully@"
	db 0 ; normal

	; party

	db 95, SEAKING
	db 95, AZUMARILL
	db 95, POLITOED

	db $ff ; end

	db "DALE@"
	db 0
	db 17, GOLDEEN
	db 19, GOLDEEN
	db 17, TENTACOOL
	db $ff

	db "BARNY@"
	db 0
	db 17, TENTACOOL
	db 17, STARYU
	db 17, SHELLDER
	db $ff

; ================
; ================================


SwimmerMGroup:
; ================================
; ================

	; SWIMMERM (1)
	db "Harold@"
	db 0 ; normal

	; party
	db 32, REMORAID
	db 30, SEADRA

	db $ff ; end

; ================

	; SWIMMERM (2)
	db "Simon@"
	db 0 ; normal

	; party
	db 45, HORSEA
	db 46, AZUMARILL

	db $ff ; end

; ================

	; SWIMMERM (3)
	db "Randall@"
	db 0 ; normal

	; party
	db 44, MANKEY
	db 45, AIPOM
	db 46, SQUIRTLE

	db $ff ; end

; ================

	; SWIMMERM (4)
	db "Charlie@"
	db 0 ; normal

	; party
	db 21, SHELLDER
	db 19, TENTACOOL
	db 19, TENTACRUEL

	db $ff ; end

; ================

	; SWIMMERM (5)
	db "George@"
	db 0 ; normal

	; party
	db 45, REMORAID
	db 45, MARILL
	db 45, HORSEA
	db 45, CHINCHOU

	db $ff ; end

; ================

	; SWIMMERM (6)
	db "Berke@"
	db 0 ; normal

	; party
	db 47, LANTURN

	db $ff ; end

; ================

	; SWIMMERM (7)
	db "Kirk@"
	db 0 ; normal

	; party
	db 47, PIDGEOT
	db 47, QUAGSIRE
	
	db $ff ; end

; ================

	; SWIMMERM (8)
	db "Mathew@"
	db 0 ; normal

	; party
	db 47, OCTILLERY

	db $ff ; end

; ================

	; SWIMMERM (9)
	db "Hal@"
	db 0 ; normal

	; party
	db 24, SEEL
	db 25, DEWGONG
	db 24, SEEL

	db $ff ; end

; ================

	; SWIMMERM (10)
	db "Paton@"
	db 0 ; normal

	; party
	db 26, PILOSWINE
	db 26, PILOSWINE

	db $ff ; end

; ================

	; SWIMMERM (11)
	db "Daryl@"
	db 0 ; normal

	; party
	db 24, SHELLDER
	db 25, CLOYSTER
	db 24, SHELLDER

	db $ff ; end

; ================

	; SWIMMERM (12)
	db "Walter@"
	db 0 ; normal

	; party
	db 15, HORSEA
	db 15, HORSEA
	db 20, SEADRA

	db $ff ; end

; ================

	; SWIMMERM (13)
	db "Tony@"
	db 0 ; normal

	; party
	db 13, STARYU
	db 18, STARMIE
	db 16, HORSEA

	db $ff ; end

; ================

	; SWIMMERM (14)
	db "Jerome@"
	db 0 ; normal

	; party
	db 26, SEADRA
	db 28, TENTACOOL
	db 30, TENTACRUEL
	db 28, GOLDEEN

	db $ff ; end

; ================

	; SWIMMERM (15)
	db "Tucker@"
	db 0 ; normal

	; party
	db 30, SHELLDER
	db 34, CLOYSTER

	db $ff ; end

; ================

	; SWIMMERM (16)
	db "Rick@"
	db 0 ; normal

	; party
	db 13, STARYU
	db 18, STARMIE
	db 16, HORSEA

	db $ff ; end

; ================

	; SWIMMERM (17)
	db "Cameron@"
	db 0 ; normal

	; party
	db 34, MARILL

	db $ff ; end

; ================

	; SWIMMERM (18)
	db "Seth@"
	db 0 ; normal

	; party
	db 29, QUAGSIRE
	db 29, OCTILLERY
	db 32, QUAGSIRE

	db $ff ; end

; ================

	; SWIMMERM (19)
	db "James@"
	db 0 ; normal

	; party
	db 13, STARYU
	db 18, STARMIE
	db 16, HORSEA

	db $ff ; end

; ================

	; SWIMMERM (20)
	db "Lewis@"
	db 0 ; normal

	; party
	db 13, STARYU
	db 18, STARMIE
	db 16, HORSEA

	db $ff ; end

; ================

	; SWIMMERM (21)
	db "Parker@"
	db 0 ; normal

	; party
	db 32, HORSEA
	db 32, HORSEA
	db 35, SEADRA

	db $ff ; end

; ================
	; SWIMMERM (21)
	db "Parker@"
	db 0 ; normal

	; party
	db 16, HORSEA
	db 16, SHELLDER

	db $ff ; end

; ================================


SwimmerFGroup:
; ================================
; ================

	; SWIMMERF (1)
	db "Elaine@"
	db 0 ; normal

	; party
	db 46, QWILFISH

	db $ff ; end

; ================

	; SWIMMERF (2)
	db "Paula@"
	db 0 ; normal

	; party
	db 46, SEADRA

	db $ff ; end

; ================

	; SWIMMERF (3)
	db "Kaylee@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 43, CHINCHOU, FOCUS_BAND
	db 45, CHINCHOU, FOCUS_BAND
	db 47, CHINCHOU, FOCUS_BAND

	db $ff ; end

; ================

	; SWIMMERF (4)
	db "Susie@"
	db 0 ; normal

	; party

	db 47, SEADRA

	db $ff ; end

; ================

	; SWIMMERF (5)
	db "Denise@"
	db 0 ; normal

	; party
	db 47, MANTINE

	db $ff ; end

; ================

	; SWIMMERF (6)
	db "Kara@"
	db 0 ; normal

	; party
	db 47, CORSOLA
	
	db $ff ; end

; ================

	; SWIMMERF (7)
	db "Wendy@"
	db 0 ; normal

	; party

	db 47, STARYU

	db $ff ; end

; ================

	; SWIMMERF (8)
	db "Lisa@"
	db 0 ; normal

	; party
	db 28, JYNX

	db $ff ; end

; ================

	; SWIMMERF (9)
	db "Jill@"
	db 0 ; normal

	; party
	db 28, DEWGONG

	db $ff ; end

; ================

	; SWIMMERF (10)
	db "Mary@"
	db 0 ; normal

	; party
	db 20, SEAKING

	db $ff ; end

; ================

	; SWIMMERF (11)
	db "Katie@"
	db 0 ; normal

	; party
	db 33, DEWGONG

	db $ff ; end

; ================

	; SWIMMERF (12)
	db "Dawn@"
	db 0 ; normal

	; party
	db 34, SEAKING

	db $ff ; end

; ================

	; SWIMMERF (13)
	db "Tara@"
	db 0 ; normal

	; party
	db 20, SEAKING

	db $ff ; end

; ================

	; SWIMMERF (14)
	db "Nicole@"
	db 0 ; normal

	; party
	db 29, MARILL
	db 29, MARILL
	db 32, LAPRAS

	db $ff ; end

; ================

	; SWIMMERF (15)
	db "Lori@"
	db 0 ; normal

	; party
	db 32, STARMIE
	db 32, STARMIE

	db $ff ; end

; ================

	; SWIMMERF (16)
	db "Jody@"
	db 0 ; normal

	; party
	db 20, SEAKING

	db $ff ; end

; ================

	; SWIMMERF (17)
	db "Nikki@"
	db 0 ; normal

	; party
	db 28, SEEL
	db 28, SEEL
	db 28, SEEL
	db 28, DEWGONG

	db $ff ; end

; ================

	; SWIMMERF (18)
	db "Diana@"
	db 0 ; normal

	; party
	db 37, GOLDUCK

	db $ff ; end

; ================

	; SWIMMERF (19)
	db "Briana@"
	db 0 ; normal

	; party
	db 35, SEAKING
	db 35, SEAKING

	db $ff ; end

; ================

	db "Diana@"
	db 0
	db 19, GOLDEEN
	db $ff
; ================================


SailorGroup:
; ================================
; ================

	; SAILOR (1)
	db "Eugene@"
	db 0 ; normal

	; party
	db 34, ODDISH
	db 35, TANGELA
	db 36, EXEGGCUTE

	db $ff ; end

; ================

	; SAILOR (2)
	db "Huey@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 43, VOLTORB
		db EXPLOSION
		db NONE
		db NONE
		db NONE
	db 44, ELECTRODE
		db RAIN_DANCE
		db THUNDER
		db EXPLOSION
		db NONE

	db $ff ; end

; ================

	; SAILOR (3)
	db "Terrell@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 44, GROWLITHE, CHARCOAL
	db 46, SMEARGLE, FOCUS_BAND

	db $ff ; end

; ================

	; SAILOR (4)
	db "Kent@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 45, SLOWPOKE
		db ZAP_CANNON
		db FLAMETHROWER
		db PSYCHIC_M
		db ICE_BEAM
	
	db 45, KRABBY
		db CRABHAMMER
		db FISSURE
		db ROCK_SMASH
		db ATTRACT

	db $ff ; end

; ================

	; SAILOR (5)
	db "Ernest@"
	db 0 ; normal

	; party
	db 44, REMORAID
	db 46, REMORAID
	db 48, REMORAID

	db $ff ; end

; ================

	; SAILOR (6)
	db "Jeff@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 70, RATICATE, PINK_BOW

	db $ff ; end

; ================

	; SAILOR (7)
	db "Garrett@"
	db 0 ; normal

	; party
	db 34, KINGLER

	db $ff ; end

; ================

	; SAILOR (8)
	db "Kenneth@"
	db 0 ; normal

	; party
	db 28, MACHOP
	db 28, MACHOP
	db 28, POLIWRATH
	db 28, MACHOP

	db $ff ; end

; ================

	; SAILOR (9)
	db "Stanly@"
	db 0 ; normal

	; party
	db 68, MACHOP
	db 69, PSYDUCK
	db 70, MACHOKE

	db $ff ; end

; ================

	; SAILOR (10)
	db "Harry@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 24, SENTRET
		db CUT
		db DEFENSE_CURL
		db FORESIGHT
		db NONE
	db 24, CROCONAW
		db SCARY_FACE
		db SCRATCH
		db WATER_GUN
		db LEER

	db $ff ; end

; ================

	; SAILOR (11)
	db "Huey@"
	db 0 ; normal

	; party
	db 61, VOLTORB
	db 63, ELECTRODE

	db $ff ; end

; ================

	; SAILOR (12)
	db "Huey@"
	db 0 ; normal

	; party
	db 81, VOLTORB
	db 83, ELECTRODE

	db $ff ; end

; ================

	; SAILOR (13)
	db "Huey@"
	db 0 ; normal

	; party

	db 94, VOLTORB
	db 96, ELECTRODE

	db $ff ; end

; ================

	db "TREVOR@"
	db 0
	db 17, MACHOP
	db 17, TENTACOOL
	db $ff

	db "EDMOND@"
	db 0
	db 18, MACHOP
	db 18, SHELLDER
	db $ff

	db "PHILLIP@"
	db 0
	db 20, MACHOP
	db $ff

	db "HUEY@"
	db 0
	db 18, TENTACOOL
	db 18, STARYU
	db $ff

	db "DYLAN@"
	db 0
	db 17, HORSEA
	db 18, HORSEA
	db 19, HORSEA
	db $ff

	db "DUNCAN@"
	db 0
	db 17, HORSEA
	db 19, SHELLDER
	db 17, TENTACOOL
	db $ff

	db "LEONARD@"
	db 0
	db 21, SHELLDER
	db $ff
; ================================


SuperNerdGroup:
; ================================
; ================

	; SUPER_NERD (1)
	db "Stan@"
	db 0 ; normal

	; party
	db 20, GRIMER

	db $ff ; end

; ================

	; SUPER_NERD (2)
	db "Eric@"
	db 0 ; normal

	; party
	db 30, PORYGON

	db $ff ; end

; ================

	; SUPER_NERD (3)
	db "Gregg@"
	db 0 ; normal

	; party
	db 20, MAGNEMITE
	db 20, MAGNEMITE
	db 20, MAGNEMITE

	db $ff ; end

; ================

	; SUPER_NERD (4)
	db "Jay@"
	db 0 ; normal

	; party
	db 22, KOFFING
	db 22, KOFFING

	db $ff ; end

; ================

	; SUPER_NERD (5)
	db "Dave@"
	db 0 ; normal

	; party
	db 24, DITTO

	db $ff ; end

; ================

	; SUPER_NERD (6)
	db "Sam@"
	db 0 ; normal

	; party
	db 70, GRIMER
	db 73, MUK

	db $ff ; end

; ================

	; SUPER_NERD (7)
	db "Tom@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 70, GASTLY, BRIGHTPOWDER
	db 71, WIGGLYTUFF, PINK_BOW
	db 72, KADABRA, FOCUS_BAND
	db 73, HAUNTER, BRIGHTPOWDER

	db $ff ; end

; ================

	; SUPER_NERD (8)
	db "Pat@"
	db 0 ; normal

	; party
	db 36, PORYGON

	db $ff ; end

; ================

	; SUPER_NERD (9)
	db "Shawn@"
	db 0 ; normal

	; party
	db 31, MAGNEMITE
	db 33, MUK
	db 31, MAGNEMITE

	db $ff ; end

; ================

	; SUPER_NERD (10)
	db "Teru@"
	db 0 ; normal

	; party
	db 29, MAGNEMITE
	db 29, VOLTORB

	db $ff ; end

; ================

	; SUPER_NERD (11)
	db "Russ@"
	db 0 ; normal

	; party
	db 27, MAGNEMITE
	db 27, MAGNEMITE
	db 27, MAGNEMITE

	db $ff ; end

; ================

	; SUPER_NERD (12)
	db "Norton@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 30, PORYGON
		db CONVERSION
		db CONVERSION2
		db RECOVER
		db TRI_ATTACK

	db $ff ; end

; ================

	; SUPER_NERD (13)
	db "Hugh@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 60, MAGCARGO
		db STRENGTH
		db FLAMETHROWER
		db REST
		db ACID_ARMOR

	db 60, FERALIGATR
		db WATERFALL
		db SCARY_FACE
		db SCREECH
		db ICE_PUNCH

	db $ff ; end

; ================

	; SUPER_NERD (14)
	db "Markus@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 33, PORYGON
		db RAIN_DANCE
		db THUNDER
		db CONVERSION
		db SWIFT

	db 35, STARMIE
		db SURF
		db CONFUSION
		db MINIMIZE
		db RECOVER

	db $ff ; end

; ================

	; SUPER_NERD (15)
	db "Miguel@"
	db 0 ; normal

	; party
	db 68, MUK
	db 68, ELECTRODE
	db 68, WEEZING
	db 70, OMASTAR
	db 70, KABUTOPS

	db $ff ; end

; ================

	db "Jovan@"
	db 0
	db 11, MAGNEMITE
	db 11, VOLTORB
	db $ff

	db "Miguel@"
	db 0
	db 12, GRIMER
	db 12, VOLTORB
	db 12, KOFFING
	db $ff
; ================================


Rival2Group:
; ================================
; ================

	; RIVAL2 (1)
	db "?@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 80, SNEASEL
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK
		db FURY_CUTTER

	db 81, GOLBAT
		db LEECH_LIFE
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 80, MAGNETON
		db THUNDERSHOCK
		db SONICBOOM
		db THUNDER_WAVE
		db SWIFT

	db 83, GENGAR
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL
		db CONFUSE_RAY

	db 83, ALAKAZAM
		db DISABLE
		db RECOVER
		db FUTURE_SIGHT
		db PSYCHIC_M

	db 85, MEGANIUM
		db RAZOR_LEAF
		db POISONPOWDER
		db BODY_SLAM
		db LIGHT_SCREEN

	db $ff ; end

; ================

	; RIVAL2 (2)
	db "?@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 80, SNEASEL
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK
		db FURY_CUTTER

	db 81, GOLBAT
		db LEECH_LIFE
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 80, MAGNETON
		db THUNDERSHOCK
		db SONICBOOM
		db THUNDER_WAVE
		db SWIFT

	db 83, GENGAR
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL
		db CONFUSE_RAY

	db 83, ALAKAZAM
		db DISABLE
		db RECOVER
		db FUTURE_SIGHT
		db PSYCHIC_M

	db 85, TYPHLOSION
		db SMOKESCREEN
		db QUICK_ATTACK
		db FLAME_WHEEL
		db SWIFT

	db $ff ; end

; ================

	; RIVAL2 (3)
	db "?@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 80, SNEASEL
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK
		db FURY_CUTTER

	db 81, GOLBAT
		db LEECH_LIFE
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 80, MAGNETON
		db THUNDERSHOCK
		db SONICBOOM
		db THUNDER_WAVE
		db SWIFT

	db 83, GENGAR
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL
		db CONFUSE_RAY

	db 83, ALAKAZAM
		db DISABLE
		db RECOVER
		db FUTURE_SIGHT
		db PSYCHIC_M

	db 85, FERALIGATR
		db RAGE
		db WATER_GUN
		db SCARY_FACE
		db SLASH

	db $ff ; end

; ================

	; RIVAL2 (4)
	db "?@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, SNEASEL
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK
		db FURY_CUTTER

	db 100, CROBAT
		db TOXIC
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 100, MAGNETON
		db THUNDER
		db SONICBOOM
		db THUNDER_WAVE
		db SWIFT

	db 100, GENGAR
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL
		db CONFUSE_RAY

	db 100, ALAKAZAM
		db RECOVER
		db FUTURE_SIGHT
		db PSYCHIC_M
		db REFLECT

	db 100, MEGANIUM
		db GIGA_DRAIN
		db BODY_SLAM
		db LIGHT_SCREEN
		db SAFEGUARD

	db $ff ; end

; ================

	; RIVAL2 (5)
	db "?@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, SNEASEL
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK
		db FURY_CUTTER

	db 100, CROBAT
		db TOXIC
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 100, MAGNETON
		db THUNDER
		db SONICBOOM
		db THUNDER_WAVE
		db SWIFT

	db 100, GENGAR
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL
		db CONFUSE_RAY

	db 100, ALAKAZAM
		db RECOVER
		db FUTURE_SIGHT
		db PSYCHIC_M
		db REFLECT

	db 100, TYPHLOSION
		db SMOKESCREEN
		db QUICK_ATTACK
		db FIRE_BLAST
		db SWIFT

	db $ff ; end

; ================

	; RIVAL2 (6)
	db "?@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, SNEASEL
		db QUICK_ATTACK
		db SCREECH
		db FAINT_ATTACK
		db FURY_CUTTER

	db 100, CROBAT
		db TOXIC
		db BITE
		db CONFUSE_RAY
		db WING_ATTACK

	db 100, MAGNETON
		db THUNDER
		db SONICBOOM
		db THUNDER_WAVE
		db SWIFT

	db 100, GENGAR
		db MEAN_LOOK
		db CURSE
		db SHADOW_BALL
		db CONFUSE_RAY

	db 100, ALAKAZAM
		db RECOVER
		db FUTURE_SIGHT
		db PSYCHIC_M
		db REFLECT

	db 100, FERALIGATR
		db SURF
		db RAIN_DANCE
		db SLASH
		db SCREECH

	db $ff ; end

; ================
; ================================


GuitaristGroup:
; ================================
; ================

	; GUITARIST (1)
	db "Clyde@"
	db 0 ; normal

	; party
	db 34, ELECTABUZZ

	db $ff ; end

; ================

	; GUITARIST (2)
	db "Vincent@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 70, MAGNEMITE, BRIGHTPOWDER
	db 71, PIKACHU, LIGHT_BALL
	db 72, FLAAFFY, KINGS_ROCK

	db $ff ; end

	db "Bernie@"
	db 0
	db 18, MAGNEMITE
	db 18, MAGNEMITE
	db 20, MAGNETON
	db $ff

	db "Braxton@"
	db 0
	db 21, MAGNEMITE
	db $ff

; ================
; ================================


HikerGroup:
; ================================
; ================

	; HIKER (1)
	db "Anthony@"
	db 0 ; normal

	; party
	db 25,STANTLER
	db 26,CYNDAQUIL

	db $ff ; end

; ================

	; HIKER (2)
	db "Russell@"
	db 0 ; normal

	; party
	db 23, TYROGUE
	db 23, SWINUB
	db 23, LARVITAR

	db $ff ; end

; ================

	; HIKER (3)
	db "Phillip@"
	db 0 ; normal

	; party
	db 36, SHUCKLE
	db 37, PUPITAR
	db 38, RHYDON

	db $ff ; end

; ================

	; HIKER (4)
	db "Leonard@"
	db 0 ; normal

	; party
	db 38, GEODUDE
	db 38, RHYHORN

	db $ff ; end

; ================

	; HIKER (5)
	db "Anthony@"
	db 0 ; normal

	; party
	db 30,STANTLER
	db 32,CYNDAQUIL
	
	db $ff ; end

; ================

	; HIKER (6)
	db "Benjamin@"
	db 0 ; normal

	; party
	db 33, GOLBAT
	db 33, ONIX
	db 35, PRIMEAPE

	db $ff ; end

; ================

	; HIKER (7)
	db "Erik@"
	db 0 ; normal

	; party
	db 55, GEODUDE
	db 56, SHUCKLE
	db 57, GLIGAR

	db $ff ; end

; ================

	; HIKER (8)
	db "Michael@"
	db 0 ; normal

	; party
	db 56, SLUGMA
	db 57, CROBAT
	db 58, LARVITAR

	db $ff ; end

; ================

	; HIKER (9)
	db "Parry@"
	db 0 ; normal

	; party
	db 80, ONIX
	db 82, STANTLER
	db 80, SWINUB
	db 82, SANDSLASH

	db $ff ; end

; ================

	; HIKER (10)
	db "Timothy@"
	db 0 ; normal

	; party

	db 60, DONPHAN

	db $ff ; end

; ================

	; HIKER (11)
	db "Bailey@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 43, NIDORAN_F, FOCUS_BAND
	db 45, TYROGUE, FOCUS_BAND
	db 43, NIDORAN_M, FOCUS_BAND
	db 45, SANDSHREW, FOCUS_BAND

	db $ff ; end

; ================

	; HIKER (12)
	db "Anthony@"
	db 0 ; normal

	; party
	db 41, STANTLER
	db 41, QUILAVA

	db $ff ; end

; ================

	; HIKER (13)
	db "Tim@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 82, SANDSHREW, QUICK_CLAW
	db 83, MAROWAK, THICK_CLUB

	db $ff ; end

; ================

	; HIKER (14)
	db "Noland@"
	db 0 ; normal

	; party
	db 68, SUDOWOODO
	db 70, DONPHAN

	db $ff ; end

; ================

	; HIKER (15)
	db "Sidney@"
	db 0 ; normal

	; party
	db 82, DIGLETT
	db 83, RHYDON

	db $ff ; end

; ================

	; HIKER (16)
	db "Kenny@"
	db 0 ; normal

	; party
	db 78, MUK
	db 79, SANDSLASH

	db $ff ; end

; ================

	; HIKER (17)
	db "Jim@"
	db 0 ; normal

	; party
	db 81, ONIX
	db 82, GOLBAT

	db $ff ; end

; ================

	; HIKER (18)
	db "Daniel@"
	db 0 ; normal

	; party
	db 26,SHUCKLE

	db $ff ; end

; ================

	; HIKER (19)
	db "Parry@"
	db 0 ; normal

	; party

	db 94, STANTLER
	db 94, SANDSLASH
	db 96, PILOSWINE
	db 96, STEELIX

	db $ff ; end

; ================

	; HIKER (20)
	db "Parry@"
	db 0 ; normal

	; party
	db 56, STANTLER
	db 58, SANDSLASH

	db $ff ; end

; ================

	; HIKER (21)
	db "Anthony@"
	db 0 ; normal

	; party
	db 61, STANTLER
	db 63, ONIX
	db 65, QUILAVA

	db $ff ; end

; ================

	; HIKER (22)
	db "Anthony@"
	db 0 ; normal

	; party

	db 80, GYARADOS
	db 85, STEELIX
	db 90, TYPHLOSION

	db $ff ; end

; ================

	db "Marcos@"
	db 0
	db 10, GEODUDE
	db 10, GEODUDE
	db 12, ONIX
	db $ff

	db "Frank@"
	db 0
	db 15, MACHOP
	db 15, GEODUDE
	db $ff

	db "Wayne@"
	db 0
	db 17, ONIX
	db $ff

	db "Nob@"
	db 0
	db 13, GEODUDE
	db 14, GEODUDE
	db 15, GEODUDE
	db 16, MACHOP
	db $ff
; ================================


BikerGroup:
; ================================
; ================

	; BIKER (1)
	db "Benny@"
	db 0 ; normal

	; party
	db 20, KOFFING
	db 20, KOFFING
	db 20, KOFFING

	db $ff ; end

; ================

	; BIKER (2)
	db "Kazu@"
	db 0 ; normal

	; party
	db 20, KOFFING
	db 20, KOFFING
	db 20, KOFFING

	db $ff ; end

; ================

	; BIKER (3)
	db "Dwayne@"
	db 0 ; normal

	; party
	db 70, FARFETCH_D
	db 70, GLOOM
	db 70, RATICATE
	db 70, CHARMELEON

	db $ff ; end

; ================

	; BIKER (4)
	db "Harris@"
	db 0 ; normal

	; party
	db 71, FLAREON
	db 73, KABUTO

	db $ff ; end

; ================

	; BIKER (5)
	db "Zeke@"
	db 0 ; normal

	; party
	db 75, OMANYTE

	db $ff ; end

; ================

	; BIKER (6)
	db "Charles@"
	db 0 ; normal

	; party
	db 74, MAGMAR
	db 74, SNORLAX

	db $ff ; end

; ================

	; BIKER (7)
	db "Riley@"
	db (1 << TRAINERTYPE_NICKNAME)

	; party
	db 75, BEEDRILL, "Stinger@"

	db $ff ; end

; ================

	; BIKER (8)
	db "Joel@"
	db 0 ; normal

	; party
	db 74, SNUBBULL
	db 75, TAUROS

	db $ff ; end

; ================

	; BIKER (9)
	db "Glenn@"
	db 0 ; normal

	; party
	db 74, EKANS
	db 75, RATICATE

	db $ff ; end

; ================
; ================================


BlaineGroup:
; ================================
; ================

	; BLAINE (1)
	db "Blaine@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 85, MAGCARGO
		db CURSE
		db TOXIC
		db FLAMETHROWER
		db ROCK_SLIDE

	db 85, MAGMAR
		db THUNDERPUNCH
		db FIRE_PUNCH
		db SUNNY_DAY
		db CONFUSE_RAY

	db 90, RAPIDASH
		db QUICK_ATTACK
		db FIRE_SPIN
		db FURY_ATTACK
		db FIRE_BLAST

	db 88, NINETALES
		db FIRE_SPIN
		db FLAMETHROWER
		db FIRE_BLAST
		db QUICK_ATTACK

	db 89, CHARIZARD
		db FLY
		db FLAMETHROWER
		db SLASH
		db AGILITY

	db 89, ARCANINE
		db EXTREMESPEED
		db CRUNCH
		db TAKE_DOWN
		db FLAMETHROWER

	db $ff ; end

; ================
; ================================


BurglarGroup:
; ================================
; ================

	; BURGLAR (1)
	db "Duncan@"
	db 0 ; normal

	; party
	db 50, STARYU
	db 52, SKIPLOOM
	db 54, MAGMAR

	db $ff ; end

; ================

	; BURGLAR (2)
	db "Eddie@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 54, SHUCKLE, LEFTOVERS

	db $ff ; end

; ================

	; BURGLAR (3)
	db "Corey@"
	db 0 ; normal

	; party
	db 25, KOFFING
	db 28, MAGMAR
	db 25, KOFFING
	db 30, KOFFING

	db $ff ; end

; ================

	; BURGLAR (4)
	db "Simon@"
	db 0 ; normal

	; party
	db 27, VULPIX

	db $ff ; end

; ================

	; BURGLAR (5)
	db "Simon@"
	db 0 ; normal

	; party
	db 43, KOFFING
	db 43, GRIMER
	db 43, VULPIX

	db $ff ; end

; ================

	; BURGLAR (6)
	db "Simon@"
	db 0 ; normal

	; party
	db 54, WEEZING
	db 54, MUK
	db 54, GROWLITHE
	db 54, HOUNDOUR
	db 54, NINETALES

	db $ff ; end

; ================

	; BURGLAR (7)
	db "Simon@"
	db 0 ; normal

	; party
	db 70, HOUNDOOM
	db 71, WEEZING
	db 72, MUK
	db 73, ARCANINE
	db 74, NINETALES

	db $ff ; end

; ================

	; BURGLAR (8)
	db "Simon@"
	db 0 ; normal

	; party
	db 81, HOUNDOOM
	db 82, WEEZING
	db 83, MUK
	db 84, ARCANINE
	db 85, NINETALES

	db $ff ; end

; ================

	; BURGLAR (9)
	db "Simon@"
	db 0 ; normal

	; party
	db 95, MURKROW
	db 96, HOUNDOOM
	db 96, WEEZING
	db 96, MUK
	db 96, ARCANINE
	db 100, NINETALES

	db $ff ; end

; ================
; ================================


FirebreatherGroup:
; ================================
; ================

	; FIREBREATHER (1)
	db "Otis@"
	db 0 ; normal

	; party
	db 29, MAGMAR
	db 32, WEEZING
	db 29, MAGMAR

	db $ff ; end

; ================

	; FIREBREATHER (2)
	db "Dick@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 33, SLUGMA, LEFTOVERS
	db 35, MAGMAR, MIRACLEBERRY

	db $ff ; end

; ================

	; FIREBREATHER (3)
	db "Ned@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 33, PONYTA, GOLD_BERRY
	db 33, KOFFING, LEFTOVERS
	db 34, HOUNDOUR, FOCUS_BAND

	db $ff ; end

; ================

	; FIREBREATHER (4)
	db "Burt@"
	db 0 ; normal

	; party
	db 32, KOFFING
	db 32, SLUGMA

	db $ff ; end

; ================

	; FIREBREATHER (5)
	db "Bill@"
	db 0 ; normal

	; party
	db 23,SLUGMA
	db 25,HOUNDOUR

	db $ff ; end

; ================

	; FIREBREATHER (6)
	db "Walt@"
	db 0 ; normal

	; party
	db 30, GROWLITHE
	db 30, HOUNDOOM

	db $ff ; end

; ================

	; FIREBREATHER (7)
	db "Ray@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 26, SLUGMA
		db FIRE_BLAST
		db SUNNY_DAY
		db 0 ;YAWN
		db PROTECT

	db $ff ; end

; ================

	; FIREBREATHER (8)
	db "Lyle@"
	db 0 ; normal

	; party
	db 68, SLUGMA
	db 69, HOUNDOUR
	db 70, QUILAVA

	db $ff ; end

; ================
; ================================


JugglerGroup:
; ================================
; ================

	; JUGGLER (1)
	db "Irwin@"
	db 0 ; normal

	; party
	db 29, ABRA
	db 29, NIDORAN_M
	db 29, SHELLDER
	db 29, NIDORAN_M
	db 29, PIKACHU
	
	db $ff ; end

; ================

	; JUGGLER (2)
	db "Fritz@"
	db 0 ; normal

	; party
	db 68, DUNSPARCE
	db 69, ARIADOS
	db 70, MR__MIME

	db $ff ; end

; ================

	; JUGGLER (3)
	db "Horton@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 72, VOLTORB, FOCUS_BAND
	db 72, VOLTORB, FOCUS_BAND
	db 72, VOLTORB, FOCUS_BAND

	db $ff ; end

; ================
;
	; JUGGLER (4)
;	db "Irwin@"
;	db 0 ; normal
;
;	db 29, ABRA
;	db 29, NIDORAN_M
;	db 29, SHELLDER
;	db 29, NIDORAN_M
;	db 29, PIKACHU
;
;	db $ff ; end
;
; ================
;
	; JUGGLER (5)
;	db "Irwin@"
;	db 0 ; normal
;
	; party
;	
;	db 29, ABRA
;	db 29, NIDORAN_M
;	db 29, SHELLDER
;	db 29, NIDORAN_M
;	db 29, PIKACHU
;
;	db $ff ; end
;
; ================
;
	; JUGGLER (6)
;	db "Irwin@"
;	db 0 ; normal
;
	; party
;
;	db 29, ABRA
;	db 29, NIDORAN_M
;	db 29, SHELLDER
;	db 29, NIDORAN_M
;	db 29, PIKACHU
;
;	db $ff ; end
;
; ================
; ================================


BlackbeltGroup:
; ================================
; ================

	; BLACKBELT_T (1)
	db "Kenji@"
	db 0 ; normal

	; party
	db 80, HITMONLEE
	db 84, HERACROSS

	db $ff ; end

; ================

	; BLACKBELT_T (2)
	db "Yoshi@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 49, HITMONLEE, BLACKBELT

	db $ff ; end

; ================

	; BLACKBELT_T (3)
	db "Kenji@"
	db 0 ; normal

	; party

	db 94, PRIMEAPE
	db 95, HITMONCHAN
	db 94, MACHAMP
	db 95, HITMONLEE
	db 97, HERACROSS
	db 99, HITMONTOP

	db $ff ; end

; ================

	; BLACKBELT_T (4)
	db "Lao@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 49, HITMONCHAN, BLACKBELT

	db $ff ; end

; ================

	; BLACKBELT_T (5)
	db "Nob@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 47, MACHOP, BLACKBELT
	db 49, MACHOKE, BLACKBELT

	db $ff ; end

; ================

	; BLACKBELT_T (6)
	db "Kiyo@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 65, TYROGUE, BRIGHTPOWDER
	db 70, HITMONLEE, BLACKBELT
	db 70, HITMONCHAN, BLACKBELT
	db 75, HITMONTOP, BLACKBELT

	db $ff ; end

; ================

	; BLACKBELT_T (7)
	db "Lung@"
	db 0 ; normal

	; party
	db 50, TYROGUE
	db 50, HITMONTOP

	db $ff ; end

; ================

	; BLACKBELT_T (8)
	db "Kenji@"
	db 0 ; normal

	; party
	db 60, HERACROSS

	db $ff ; end

; ================

	; BLACKBELT_T (9)
	db "Wai@"
	db 0 ; normal

	; party
	db 30, MACHOKE
	db 32, MACHOKE
	db 34, MACHOKE

	db $ff ; end

; ================
; ================================


ExecutiveMGroup:
; ================================
; ================

	; EXECUTIVEM (1)
	db "Executive@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 56, GOLDUCK, BERSERK_GENE
	db 58, HOUNDOOM, MIRACLEBERRY
	db 60, EXEGGUTOR, LEFTOVERS
	db 62, URSARING, MINT_BERRY

	db $ff ; end

; ================

	; EXECUTIVEM (2)
	db "Executive@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 54, SNEASEL, BERSERK_GENE
	db 56, GOLBAT, LEFTOVERS
	db 58, UMBREON, BERSERK_GENE

	db $ff ; end

; ================

	; EXECUTIVEM (3)
	db "Executive@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	
	db 50, MURKROW, BERSERK_GENE
	db 52, MR__MIME, GOLD_BERRY
	db 54, LICKITUNG, BERSERK_GENE
	db 56, QUAGSIRE, LEFTOVERS

	db $ff ; end

; ================

	; EXECUTIVEM (4)
	db "Executive@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 39, PSYDUCK, GOLD_BERRY
	db 41, EXEGGCUTE, MIRACLEBERRY
	db 43, HOUNDOOM, KINGS_ROCK
	db 46, URSARING, LEFTOVERS

	db $ff ; end

; ================

	db "Executive@" ; 5
	db (1 << TRAINERTYPE_ITEM)
	db 16, RATICATE, GOLD_BERRY
	db $ff
; ================================


PsychicGroup:
; ================================
; ================

	; PSYCHIC_T (1)
	db "Nathan@"
	db 0 ; normal

	; party
	db 45, UNOWN

	db $ff ; end

; ================

	; PSYCHIC_T (2)
	db "Franklin@"
	db 0 ; normal

	; party
	db 73, EXEGGUTOR
	db 73, WOBBUFFET
	db 74, KADABRA
	db 75, GIRAFARIG

	db $ff ; end

; ================

	; PSYCHIC_T (3)
	db "Herman@"
	db 0 ; normal

	; party
	db 81, HYPNO

	db $ff ; end

; ================

	; PSYCHIC_T (4)
	db "Fidel@"
	db 0 ; normal

	; party
	db 80, DROWZEE
	db 81, XATU

	db $ff ; end

; ================

	; PSYCHIC_T (5)
	db "Greg@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 34, XATU, LEFTOVERS

	db $ff ; end

; ================

	; PSYCHIC_T (6)
	db "Norman@"
	db 0 ; normal

	; party

	db 35, ESPEON
	db 35, GIRAFARIG

	db $ff ; end

; ================

	; PSYCHIC_T (7)
	db "Mark@"
	db 0 ; normal

	; party

	db 29, WOBBUFFET 
	db 31, NATU
	db 33, HYPNO

	db $ff ; end

; ================

	; PSYCHIC_T (8)
	db "Phil@"
	db 0 ; normal

	; party

	db 55, HYPNO
	db 57, ESPEON

	db $ff ; end

; ================

	; PSYCHIC_T (9)
	db "Richard@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 63, ALAKAZAM, BRIGHTPOWDER

	db $ff ; end

; ================

	; PSYCHIC_T (10)
	db "Gilbert@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 58, EXEGGCUTE, LEFTOVERS
	db 59, GIRAFARIG, KINGS_ROCK
	db 60, KADABRA, FOCUS_BAND

	db $ff ; end

; ================

	; PSYCHIC_T (11)
	db "Jared@"
	db 0 ; normal

	; party
	db 74, UNOWN
	db 74, UNOWN
	db 74, UNOWN
	db 74, UNOWN
	db 74, UNOWN
	db 74, UNOWN

	db $ff ; end

; ================

	; PSYCHIC_T (12)
	db "Rodney@"
	db 0 ; normal

	; party
	db 29, DROWZEE
	db 33, HYPNO

	db $ff ; end

; ================
; ================================


PicnickerGroup:
; ================================
; ================

	; PICNICKER (1)
	db "Liz@"
	db 0 ; normal

	; party
	db 22,NATU
	db 22,TOTODILE

	db $ff ; end

; ================

	; PICNICKER (2)
	db "Gina@"
	db 0 ; normal

	; party
	db 28, HOPPIP
	db 28, GLOOM
	db 28, CHIKORITA

	db $ff ; end

; ================

	; PICNICKER (3)
	db "Brooke@"
	db 0 ; normal

	; party

	db 31, BAYLEEF

	db $ff ; end

; ================

	; PICNICKER (4)
	db "Kim@"
	db 0 ; normal

	; party
	db 29, SUNFLORA
	db 30, BELLOSSOM

	db $ff ; end

; ================

	; PICNICKER (5)
	db "Cindy@"
	db 0 ; normal

	; party
	db 82, NIDOQUEEN

	db $ff ; end

; ================

	; PICNICKER (6)
	db "Hope@"
	db 0 ; normal

	; party
	db 34, FLAAFFY

	db $ff ; end

; ================

	; PICNICKER (7)
	db "Sharon@"
	db 0 ; normal

	; party
	db 31, FURRET
	db 33, RAPIDASH

	db $ff ; end

; ================

	; PICNICKER (8)
	db "Debra@"
	db 0 ; normal

	; party
	db 68, LEDIAN
	db 69, FURRET
	db 70, CROBAT

	db $ff ; end

; ================

	; PICNICKER (9)
	db "Gina@"
	db 0 ; normal

	; party
	db 41, HOPPIP
	db 41, GLOOM
	db 41, CHIKORITA

	db $ff ; end

; ================

	; PICNICKER (10)
	db "Erin@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 43, SMOOCHUM, FOCUS_BAND
	db 43, ELEKID, FOCUS_BAND
	db 43, MAGBY, FOCUS_BAND

	db $ff ; end

; ================

	; PICNICKER (11)
	db "Liz@"
	db 0 ; normal

	; party
	db 31, NATU
	db 31, TOTODILE

	db $ff ; end

; ================

	; PICNICKER (12)
	db "Liz@"
	db 0 ; normal

	; party
	db 41, NATU
	db 41, CROCONAW

	db $ff ; end

; ================

	; PICNICKER (13)
	db "Heidi@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 81, MAGNEMITE, LEFTOVERS
	db 82, PIKACHU, LIGHT_BALL
	db 83, JOLTEON, BRIGHTPOWDER

	db $ff ; end

; ================

	; PICNICKER (14)
	db "Edna@"
	db 0 ; normal

	; party
	db 82, PORYGON
	db 83, KOFFING

	db $ff ; end

; ================

	; PICNICKER (15)
	db "Gina@"
	db 0 ; normal

	; party
	db 60, GLOOM
	db 61, BAYLEEF
	db 62, JUMPLUFF

	db $ff ; end

; ================

	; PICNICKER (16)
	db "Tiffany@"
	db 0 ; normal

	; party

	db 65, XATU

	db $ff ; end

; ================

	; PICNICKER (17)
	db "Tiffany@"
	db 0 ; normal

	; party

	db 83, XATU

	db $ff ; end

; ================

	; PICNICKER (18)
	db "Erin@"
	db 0 ; normal

	; party
	db 83, SMOOCHUM
	db 83, ELEKID
	db 83, MAGBY

	db $ff ; end

; ================

	; PICNICKER (19)
	db "Tanya@"
	db 0 ; normal

	; party
	db 78, EXEGGUTOR

	db $ff ; end

; ================

	; PICNICKER (20)
	db "Tiffany@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 38, XATU, BERRY_JUICE
	
	db $ff ; end

; ================

	; PICNICKER (21)
	db "Erin@"
	db 0 ; normal

	; party

	db 96, JYNX
	db 96, ELECTABUZZ
	db 96, MAGMAR

	db $ff ; end

; ================

	; PICNICKER (22)
	db "Liz@"
	db 0 ; normal

	; party
	db 60, NATU
	db 61, CROCONAW
	db 62, XATU

	db $ff ; end

; ================

	; PICNICKER (23)
	db "Liz@"
	db 0 ; normal

	; party

	db 80, NATU
	db 81, XATU
	db 82, FERALIGATR

	db $ff ; end

; ================

	; PICNICKER (24)
	db "Gina@"
	db 0 ; normal

	; party
	db 80, BAYLEEF
	db 81, JUMPLUFF
	db 82, VILEPLUME

	db $ff ; end

; ================

	; PICNICKER (25)
	db "Gina@"
	db 0 ; normal

	; party

	db 95, JUMPLUFF
	db 95, VILEPLUME
	db 95, MEGANIUM

	db $ff ; end

; ================

	; PICNICKER (26)
	db "Tiffany@"
	db 0 ; normal

	; party

	db 98, XATU

	db $ff ; end

	db "Kelsey@"
	db (1 << TRAINERTYPE_NICKNAME)
	db 15, NIDORAN_M, "Needles@"
	db 15, NIDORAN_F, "Princess@"
	db $ff
; ================
	db "Nancy@"
	db 0
	db 16, RATTATA
	db 16, PIKACHU
	db $ff

	db "Izzy@"
	db (1 << TRAINERTYPE_NICKNAME)
	db 16, PIDGEY, "Hopsy@"
	db 16, PIDGEY, "Pecksy@"
	db 16, PIDGEY, "Flapsy@"
	db $ff
; ================================


CamperGroup:
; ================================
; ================

	; CAMPER (1)
	db "Roland@"
	db 0 ; normal

	; party
	db 21, MARILL
	db 22, AIPOM
	db 21, WOOPER
	db 23, AZUMARILL

	db $ff ; end

; ================

	; CAMPER (2)
	db "Todd@"
	db 0 ; normal

	; party
	db 27, POLIWAG
	db 29, MANTINE

	db $ff ; end

; ================

	; CAMPER (3)
	db "Ivan@"
	db 0 ; normal

	; party
	db 29, MACHOP
	db 31, SKIPLOOM
	db 31, DUGTRIO

	db $ff ; end

; ================

	; CAMPER (4)
	db "Elliot@"
	db 0 ; normal

	; party
	db 30, MAREEP
	db 29, AZUMARILL

	db $ff ; end

; ================

	; CAMPER (5)
	db "Barry@"
	db 0 ; normal

	; party
	db 82, NIDOKING

	db $ff ; end

; ================

	; CAMPER (6)
	db "Lloyd@"
	db 0 ; normal

	; party
	db 34, NIDOKING

	db $ff ; end

; ================

	; CAMPER (7)
	db "Dean@"
	db 0 ; normal

	; party
	db 82, MEOWTH
	db 83, RAICHU

	db $ff ; end

; ================

	; CAMPER (8)
	db "Sid@"
	db 0 ; normal

	; party
	db 82, NIDORINA
	db 82, NIDORINO
	db 83, DUGTRIO

	db $ff ; end

; ================

	; CAMPER (9)
	db "Harvey@"
	db 0 ; normal

	; party
	db 15, NIDORINO

	db $ff ; end

; ================

	; CAMPER (10)
	db "Dale@"
	db 0 ; normal

	; party
	db 15, NIDORINO

	db $ff ; end

; ================

	; CAMPER (11)
	db "Ted@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 45, HOOTHOOT, FOCUS_BAND
	db 45, TEDDIURSA, FOCUS_BAND

	db $ff ; end

; ================

	; CAMPER (12)
	db "Todd@"
	db 0 ; normal

	; party
	db 50, POLIWAG
	db 50, MANTINE

	db $ff ; end

; ================

	; CAMPER (13)
	db "Todd@"
	db 0 ; normal

	; party
	db 59, MAREEP
	db 61, POLIWHIRL
	db 63, MANTINE

	db $ff ; end

; ================

	; CAMPER (14)
	db "Thomas@"
	db 0 ; normal

	; party
	db 33, GRAVELER
	db 36, GRAVELER
	db 40, GOLBAT
	db 42, GOLDUCK

	db $ff ; end

; ================

	; CAMPER (15)
	db "Leroy@"
	db 0 ; normal

	; party
	db 33, GRAVELER
	db 36, GRAVELER
	db 40, GOLBAT
	db 42, GOLDUCK

	db $ff ; end

; ================

	; CAMPER (16)
	db "David@"
	db 0 ; normal

	; party
	db 33, GRAVELER
	db 36, GRAVELER
	db 40, GOLBAT
	db 42, GOLDUCK

	db $ff ; end

; ================

	; CAMPER (17)
	db "John@"
	db 0 ; normal

	; party
	db 33, GRAVELER
	db 36, GRAVELER
	db 40, GOLBAT
	db 42, GOLDUCK

	db $ff ; end

; ================

	; CAMPER (18)
	db "Jerry@"
	db 0 ; normal

	; party
	db 37, SANDSLASH

	db $ff ; end

; ================

	; CAMPER (19)
	db "Spencer@"
	db 0 ; normal

	; party
	db 34, NATU
	db 35, PARASECT
	db 36, FURRET

	db $ff ; end

; ================

	; CAMPER (20)
	db "Todd@"
	db 0 ; normal

	; party
	db 80, FLAAFFY
	db 81, MANTINE
	db 82, POLIWRATH

	db $ff ; end

; ================

	; CAMPER (21)
	db "Todd@"
	db 0 ; normal

	; party

	db 95, MANTINE
	db 95, POLIWRATH
	db 95, AMPHAROS

	db $ff ; end

; ================

	; CAMPER (22)
	db "Quentin@"
	db 0 ; normal

	; party
	
	db 57, JUMPLUFF
	db 57, TAUROS
	db 57, SUDOWOODO

	db $ff ; end

; ================

	db "Jerry@"
	db 0

	db 11, DIGLETT
	db 11, SANDSHREW
	db $ff

	db "Ethan@"
	db 0
	db 18, MANKEY
	db $ff

	db "Shane@"
	db 0
	db 14, RATTATA
	db 14, EKANS
	db $ff

	db "Flint@"
	db (1 << TRAINERTYPE_NICKNAME | 1 << TRAINERTYPE_ITEM)
	db 14, RATTATA, BERRY, "Ratman@"
	db 14, EKANS, BERRY, "Python@"
	db $ff

	db "Ricky@"
	db 0
	db 20, SQUIRTLE
	db $ff

	db "Jeff@"
	db 0
	db 16, SPEAROW
	db 17, RATICATE
	db $ff
; ================================


ExecutiveFGroup:
; ================================
; ================

	; EXECUTIVEF (1)
	db "Executive@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 55, DONPHAN, BERSERK_GENE
	db 57, VILEPLUME, LEFTOVERS
	db 59, GRANBULL, BERSERK_GENE

	db $ff ; end

; ================

	; EXECUTIVEF (2)
	db "Executive@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 38, GLIGAR, LEFTOVERS
	db 40, GLOOM, MIRACLEBERRY
	db 42, GRANBULL, KINGS_ROCK

	db $ff ; end

; ================
; ================================


SageGroup:
; ================================
; ================

	; SAGE (1)
	db "Chow@"
	db 0 ; normal

	; party
	db 20, BELLSPROUT
	db 20, HOUNDOUR
	db 22, BELLSPROUT

	db $ff ; end

; ================

	; SAGE (2)
	db "Nico@"
	db 0 ; normal

	; party
	db 20, BELLSPROUT
	db 20, ZUBAT
	db 22, BELLSPROUT

	db $ff ; end

; ================

	; SAGE (3)
	db "Jin@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 22, BELLSPROUT
		db SLUDGE_BOMB
		db SLEEP_POWDER
		db GROWTH
		db SWAGGER
	
	db $ff ; end

; ================

	; SAGE (4)
	db "Troy@"
	db 0 ; normal

	; party
	db 20, BELLSPROUT
	db 20, HOOTHOOT
	db 20, MISDREAVUS
	db 20, ODDISH

	db $ff ; end

; ================

	; SAGE (5)
	db "Jeffrey@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 38, SNEASEL, GOLD_BERRY

	db $ff ; end

; ================

	; SAGE (6)
	db "Ping@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 34, HOUNDOUR
		db SUNNY_DAY
		db FLAMETHROWER
		db 0
		db 0
	db 34, HOUNDOUR
		db SOLARBEAM
		db FIRE_BLAST
		db 0
		db 0
	db 36, HOUNDOOM
		db BODY_SLAM
		db BITE
		db SPITE
		db PROTECT
		
	db $ff ; end

; ================

	; SAGE (7)
	db "Edmond@"
	db 0 ; normal

	; party
	db 20, BELLSPROUT
	db 20, HOOTHOOT
	db 22, BELLSPROUT

	db $ff ; end

; ================

	; SAGE (8)
	db "Neal@"
	db 0 ; normal

	; party
	db 22, WEEPINBELL

	db $ff ; end

; ================

	; SAGE (9)
	db "Li@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 22, BELLSPROUT
		db SUNNY_DAY
		db SYNTHESIS
		db SOLARBEAM
		db SLEEP_POWDER
	db 23, NOCTOWL
		db HYPNOSIS
		db NIGHTMARE
		db WING_ATTACK
		db SUPERSONIC
	db 24, WEEPINBELL
		db SWORDS_DANCE
		db LEECH_LIFE
		db VINE_WHIP
		db SLEEP_POWDER

	db $ff ; end

; ================

	; SAGE (10)
	db "Gaku@"
	db 0 ; normal

	; party
	db 58, JYNX
	db 60, FLAREON

	db $ff ; end

; ================

	; SAGE (11)
	db "Masa@"
	db 0 ; normal

	; party
	db 58, MAGMAR
	db 60, JOLTEON

	db $ff ; end

; ================

	; SAGE (12)
	db "Koji@"
	db 0 ; normal

	; party
	db 58, ELECTABUZZ
	db 60, VAPOREON

	db $ff ; end

; ================
; ================================


MediumGroup:
; ================================
; ================

	; MEDIUM (1)
	db "Martha@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 38, UMBREON, LEFTOVERS
	
	db $ff ; end

; ================

	; MEDIUM (2)
	db "Grace@"
	db 0 ; normal

	; party
	db 32, MURKROW
	db 37, MURKROW

	db $ff ; end

; ================

	; MEDIUM (3)
	db "Bethany@"
	db 0 ; normal

	; party
	db 25, HAUNTER

	db $ff ; end

; ================

	; MEDIUM (4)
	db "Margret@"
	db 0 ; normal

	; party
	db 25, HAUNTER

	db $ff ; end

; ================

	; MEDIUM (5)
	db "Ethel@"
	db 0 ; normal

	; party
	db 25, HAUNTER

	db $ff ; end

; ================

	; MEDIUM (6)
	db "Rebecca@"
	db 0 ; normal

	; party
	db 73, DROWZEE
	db 75, HYPNO

	db $ff ; end

; ================

	; MEDIUM (7)
	db "Doris@"
	db 0 ; normal

	; party
	db 73, SLOWPOKE
	db 74, SLOWBRO
	db 75, SLOWKING

	db $ff ; end

; ================
; ================================


BoarderGroup:
; ================================
; ================

	; BOARDER (1)
	db "Ronald@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 40, SEEL, MINT_BERRY
	db 42, DEWGONG, LEFTOVERS

	db $ff ; end

; ================

	; BOARDER (2)
	db "Brad@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 40, SWINUB, BRIGHTPOWDER
	db 42, PILOSWINE, LEFTOVERS

	db $ff ; end

; ================

	; BOARDER (3)
	db "Douglas@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 41, SHELLDER, FOCUS_BAND
	db 42, SMOOCHUM, BRIGHTPOWDER
	db 43, CLOYSTER, LEFTOVERS

	db $ff ; end

; ================
; ================================


PokefanMGroup:
; ================================
; ================

	; POKEFANM (1)
	db "William@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 30, SKARMORY, GOLD_BERRY

	db $ff ; end

; ================

	; POKEFANM (2)
	db "Derek@"
	db 0 ; normal

	; party
	db 35, PONYTA
	db 36, STANTLER
	db 37, TAUROS

	db $ff ; end

; ================

	; POKEFANM (3)
	db "Robert@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 82, CUBONE, THICK_CLUB

	db $ff ; end

; ================

	; POKEFANM (4)
	db "Joshua@"
	db (1 << TRAINERTYPE_MOVES)

	; party
	db 79, TENTACRUEL
		db WATERFALL
		db SURF
		db HIDDEN_POWER
		db 0

	db 78, GRAVELER
		db STRENGTH
		db DOUBLE_EDGE
		db ROCK_THROW
		db 0

	db 77, VILEPLUME
		db PETAL_DANCE
		db SLUDGE_BOMB
		db SLEEP_POWDER
		db GIGA_DRAIN

	db 80, AZUMARILL
		db ROLLOUT
		db STRENGTH
		db SURF
		db ROCK_SMASH

	db $ff ; end

; ================

	; POKEFANM (5)
	db "Carter@"
	db 0 ; normal

	; party
	db 78, PSYDUCK
	db 78, PIDGEOTTO
	db 78, PERSIAN

	db $ff ; end

; ================

	; POKEFANM (6)
	db "Trevor@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 78, BUTTERFREE, LEFTOVERS

	db $ff ; end

; ================

	; POKEFANM (7)
	db "Brandon@"
	db 0 ; normal

	; party
	db 28, CLEFFA
	db 28, SMOOCHUM
	db 28, PICHU
	db 28, IGGLYBUFF
	db 28, MAGBY
	db 28, ELEKID

	db $ff ; end

; ================

	; POKEFANM (8)
	db "Jeremy@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 28, MEOWTH, BERRY
	db 28, MEOWTH, BERRY
	db 28, MEOWTH, BERRY

	db $ff ; end

; ================

	; POKEFANM (9)
	db "Colin@"
	db 0 ; normal

	; party
	db 80, DELIBIRD

	db $ff ; end

; ================

	; POKEFANM (10)
	db "Derek@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 19, PIKACHU, BERRY

	db $ff ; end

; ================

	; POKEFANM (11)
	db "Derek@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 36, PIKACHU, BERRY

	db $ff ; end

; ================

	; POKEFANM (12)
	db "Alex@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 100, MAGIKARP, FOCUS_BAND

	db $ff ; end

; ================

	; POKEFANM (13)
	db "Rex@"
	db 0 ; normal

	; party
	db 70, PONYTA

	db $ff ; end

; ================

	; POKEFANM (14)
	db "Allan@"
	db 0 ; normal

	; party
	db 70, BELLSPROUT

	db $ff ; end

; ================
; ================================


KimonoGirlGroup:
; ================================
; ================

	; KIMONO_GIRL (1)
	db "Naoko@"
	db 0 ; normal

	; party
	db 20, SKIPLOOM
	db 20, VULPIX
	db 18, SKIPLOOM

	db $ff ; end

; ================

	; KIMONO_GIRL (2)
	db "Naoko@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 34, FLAREON, QUICK_CLAW

	db $ff ; end

; ================

	; KIMONO_GIRL (3)
	db "Sayo@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 34, ESPEON, GOLD_BERRY

	db $ff ; end

; ================

	; KIMONO_GIRL (4)
	db "Zuki@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 34, UMBREON, MIRACLEBERRY

	db $ff ; end

; ================

	; KIMONO_GIRL (5)
	db "Kuni@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 34, VAPOREON, LEFTOVERS

	db $ff ; end

; ================

	; KIMONO_GIRL (6)
	db "Miki@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 34, JOLTEON, KINGS_ROCK

	db $ff ; end

; ================
; ================================


TwinsGroup:
; ================================
; ================

	; TWINS (1)
	db "AMY & May@"
	db 0 ; normal

	; party
	db 25, SPINARAK
	db 25, LEDYBA

	db $ff ; end

; ================

	; TWINS (2)
	db "ANN & Anne@"
	db 0 ; normal
	
	; party
	db 31, TEDDIURSA
	db 31, PHANPY

	db $ff ; end

; ================

	; TWINS (3)
	db "ANN & Anne@"
	db 0 ; normal
	
	; party
	db 31, PHANPY
	db 31, TEDDIURSA

	db $ff ; end

; ================

	; TWINS (4)
	db "AMY & May@"
	db 0 ; normal

	; party
	db 25, LEDYBA
	db 25, SPINARAK

	db $ff ; end

; ================

	; TWINS (5)
	db "JO & Zoe@"
	db 0 ; normal

	; party
	db 77, MEGANIUM
	db 77, SUNFLORA

	db $ff ; end

; ================

	; TWINS (6)
	db "JO & Zoe@"
	db 0 ; normal

	; party
	db 77, SUNFLORA
	db 77, MEGANIUM

	db $ff ; end

; ================

	; TWINS (7)
	db "MEG & Peg@"
	db 0 ; normal

	; party
	db 69, WOOPER
	db 69, MARILL

	db $ff ; end

; ================

	; TWINS (8)
	db "MEG & Peg@"
	db 0 ; normal

	; party
	db 69, MARILL
	db 69, WOOPER

	db $ff ; end

; ================

	; TWINS (9)
	db "LEA & Pia@"
	db 0 ; normal

	; party

	db 60, SEADRA
	db 60, DRAGONAIR

	db $ff ; end

; ================

	; TWINS (10)
	db "LEA & Pia@"
	db 0 ; normal

	; party

	db 60, DRAGONAIR
	db 60, SEADRA
	
	db $ff ; end

; ================
; ================================


PokefanFGroup:
; ================================
; ================

	; POKEFANF (1)
	db "Beverly@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 30, KANGASKHAN, GOLD_BERRY

	db $ff ; end

; ================

	; POKEFANF (2)
	db "Ruth@"
	db (1 << TRAINERTYPE_NICKNAME)

	; party
	db 35, AMPHAROS, "Zappy@"

	db $ff ; end

; ================

	; POKEFANF (3)
	db "Beverly@"
	db 0 ; normal

	; party
	db 45, KANGASKHAN

	db $ff ; end

; ================

	; POKEFANF (4)
	db "Beverly@"
	db 0 ; normal

	; party
	db 60, KANGASKHAN

	db $ff ; end

; ================

	; POKEFANF (5)
	db "Georgia@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 23, SENTRET, BERRY
	db 23, SENTRET, BERRY
	db 23, SENTRET, BERRY
	db 28, FURRET, BERRY
	db 23, SENTRET, BERRY

	db $ff ; end

; ================

	; POKEFANF (6)
	db "Jaime@"
	db 0 ; normal

	; party
	db 35, MEOWTH

	db $ff ; end

; ================
; ================================




RedGroup:
; ================================
; ================

	; RED (1)
	db "<RED>@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_NICKNAME)

	; party

	db 100, SLOWBRO, "AAbbABCabb@"
		db SURF
		db STRENGTH
		db AMNESIA
		db PSYCHIC_M

	db 100, VENOMOTH, " Rrrriiiih@"
		db STUN_SPORE
		db PSYBEAM
		db SLEEP_POWDER
		db PSYCHIC_M

	db 100, CLOYSTER, "IIII--??(U@"
		db SURF
		db CLAMP
		db AURORA_BEAM
		db DOUBLE_TEAM

	db 100, DRAGONITE, "AAA--××<MN><MN><MN>@"
		db WRAP
		db STRENGTH
		db HYPER_BEAM
		db SLAM

	db 100, ZAPDOS, "(ssjj <MN>..,@"
		db DRILL_PECK
		db THUNDER
		db SKY_ATTACK
		db DOUBLE_TEAM

	db 100, VICTREEBEL, "RRQPO:<PK><PK><PK><PK>@"
		db RAZOR_LEAF
		db WRAP
		db CUT
		db SLEEP_POWDER

	db $ff ; end

	; RED (2)

	db "RED@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_NICKNAME)

	; party

	db 100, PIDGEOT, "aaabaaajss@"
		db MIRROR_MOVE
		db SAND_ATTACK
		db QUICK_ATTACK
		db SKY_ATTACK

	db 100, LAPRAS, "AIIIIIIRRR@"
		db MIST
		db BODY_SLAM
		db SURF
		db STRENGTH

	db 100, VENOMOTH, "AATTVVV@"
		db DISABLE
		db POISONPOWDER
		db LEECH_LIFE
		db STUN_SPORE

	db 100, ZAPDOS, "AA-j@"
		db THUNDERSHOCK
		db DRILL_PECK
		db TAKE_DOWN
		db THUNDER

	db 100, NIDOKING, "AAAAAAAAAA@"
		db SURF
		db POISON_STING
		db STRENGTH
		db FURY_ATTACK

	db 100, OMASTAR, "OMASTAR@"
		db HYDRO_PUMP
		db WITHDRAW
		db SURF
		db HORN_ATTACK

	db $ff

; ================
; ================================


BlueGroup:
; ================================
; ================

	; BLUE (1)
	db "Blue@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, SANDSLASH
		db EARTHQUAKE
		db FISSURE
		db SLASH
		db DIG

	db 100, ALAKAZAM
		db DISABLE
		db RECOVER
		db PSYCHIC_M
		db REFLECT

	db 100, EXEGGUTOR
		db SUNNY_DAY
		db LEECH_SEED
		db SEED_BOMB
		db SOLARBEAM

	db 100, NINETALES
		db FLAMETHROWER
		db FIRE_BLAST
		db QUICK_ATTACK
		db EARTHQUAKE

	db 100, MAGNETON
		db THUNDER
		db THUNDERBOLT
		db MIND_READER
		db THUNDER_WAVE

	db 100, VAPOREON
		db ROAR
		db HYDRO_PUMP
		db AURORA_BEAM
		db SURF

	db $ff ; end

	; BLUE (2)
	db "Blue@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, SANDSLASH
		db EARTHQUAKE
		db FISSURE
		db SLASH
		db DIG

	db 100, ALAKAZAM
		db DISABLE
		db RECOVER
		db PSYCHIC_M
		db REFLECT

	db 100, EXEGGUTOR
		db SUNNY_DAY
		db LEECH_SEED
		db SEED_BOMB
		db SOLARBEAM

	db 100, CLOYSTER
		db ICE_BEAM
		db SURF
		db SPIKE_CANNON
		db CLAMP

	db 100, MAGNETON
		db THUNDER
		db THUNDERBOLT
		db MIND_READER
		db THUNDER_WAVE

	db 100, FLAREON
		db ROAR
		db FLAMETHROWER
		db DIG
		db FIRE_BLAST

	db $ff ; end

	; BLUE (3)
	db "Blue@"
	db (1 << TRAINERTYPE_MOVES)

	; party

	db 100, SANDSLASH
		db EARTHQUAKE
		db FISSURE
		db SLASH
		db DIG

	db 100, ALAKAZAM
		db DISABLE
		db RECOVER
		db PSYCHIC_M
		db REFLECT

	db 100, EXEGGUTOR
		db SUNNY_DAY
		db LEECH_SEED
		db SEED_BOMB
		db SOLARBEAM

	db 100, CLOYSTER
		db ICE_BEAM
		db SURF
		db SPIKE_CANNON
		db CLAMP

	db 100, NINETALES
		db FLAMETHROWER
		db FIRE_BLAST
		db QUICK_ATTACK
		db EARTHQUAKE

	db 100, JOLTEON
		db ROAR
		db THUNDER
		db THUNDERBOLT
		db BITE

	db $ff ; end

; ================
; ================================


OfficerGroup:
; ================================
; ================

	; OFFICER (1)
	db "Keith@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 28, GRANBULL, KINGS_ROCK

	db $ff ; end

; ================

	; OFFICER (2)
	db "Dirk@"
	db 0 ; normal

	; party
	db 30, GROWLITHE
	db 30, URSARING

	db $ff ; end

; ================
; ================================


GruntFGroup:
; ================================
; ================

	; GRUNTF (1)
	db "Grunt@"
	db 0 ; normal

	; party
	db 25, SENTRET
	db 23, DIGLETT
	db 27, HOUNDOOM

	db $ff ; end

; ================

	; GRUNTF (2)
	db "Grunt@"
	db (1 << TRAINERTYPE_ITEM)

	; party
	db 53, ARBOK, LEFTOVERS

	db $ff ; end

; ================

	; GRUNTF (3)
	db "Grunt@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM)

	; party
	db 54, AMPHAROS, BERSERK_GENE
		db THUNDERPUNCH
		db THUNDER_WAVE
		db HEADBUTT
		db IRON_TAIL

	db $ff ; end

; ================

	; GRUNTF (4)
	db "Grunt@"
	db (1 << TRAINERTYPE_MOVES) | (1 << TRAINERTYPE_ITEM)

	; party
	db 54, GLIGAR, BERSERK_GENE
		db BATON_PASS
		db EARTHQUAKE
		db WING_ATTACK
		db SCREECH

	db 57, RAICHU, BERSERK_GENE
		db EXTREMESPEED
		db SPARK
		db DIZZY_PUNCH
		db REVERSAL

	db $ff ; end

; ================

	; GRUNTF (5)
	db "Grunt@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 37, ODDISH, LEFTOVERS
	db 39, SNUBBULL, KINGS_ROCK

	db $ff ; end

	db "Grunt@" ; 6
	db 0
	db 11, SANDSHREW
	db 11, RATTATA
	db 11, ZUBAT
	db $ff

; ================
; ================================


MysticalmanGroup:
; ================================
; ================

	; MYSTICALMAN (1)
	db "Eusine@"
	db (1 << TRAINERTYPE_ITEM)

	; party

	db 50, SKARMORY, LEFTOVERS
	db 50, HAUNTER, BRIGHTPOWDER
	db 50, PORYGON2, PINK_BOW

	db $ff ; end

; ================
; ================================
