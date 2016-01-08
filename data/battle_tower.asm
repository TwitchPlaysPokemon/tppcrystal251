NUM_BATTLE_TOWER_MONS EQU 167

Function1f8000: ; 1f8000 generatres mon and trainer and stores them in wram. full structure is, from BT_OTTrainer, 11 bytes of trainer data (name and class), 177 bytes for 3 mons and 36 bytes of ????
	ld a, [rSVBK] ; changes have removed the mons in "battle" and inputted directly into OTPartyMons instead
	push af
	ld a, $3
	ld [rSVBK], a
	xor a
	ld hl, BT_OTTrainer 
	ld bc, $00e0
	call ByteFill ; fill 340 bytes with 0 from d100
	ld a, $ff
	ld [wd10c], a ; set 3 variables to ff
	ld [wd147], a
	ld [wd182], a
	ld de, BT_OTTrainer
	ld a, [hRandomAdd] 
	ld b, a
.asm_1f8022
	call Random
	ld a, [hRandomAdd] ; load 2 random numbers and add them
	add b
	ld b, a
IF DEF(CRYSTAL11)
	and $7f ; if 1.1 use numbers 0-69, else use numbers 0-20
	cp 70
ELSE
	and $1f
	cp 21
ENDC
	jr nc, .asm_1f8022 ; loop until good random number
	ld b, a
	ld a, $1
	call GetSRAMBank
	ld c, $7
	ld hl, sBTTrainers
.asm_1f803a
	ld a, [hli]
	cp b ; if b = be48, try again
	jr z, .asm_1f8022
	dec c
	jr nz, .asm_1f803a ; check 7 slots
	ld hl, sBTTrainers
	ld a, [sNrOfBeatenBattleTowerTrainers]
	ld c, a
	ld a, b
	ld b, 0
	add hl, bc ; fill slot $be46 with the random number
	ld [hl], a
	call CloseSRAM
	push af ; store the random number
	ld hl, BattleTowerTrainers ; list of trainer names and classes
	ld bc, 11
	call AddNTimes ; go down to selected trainer
		; ld bc, 11 no the copy is part of the next function
		; call CopyBytes ; copy the data into BT_OTTrainer
	call Function1f8081 ; set-up trainer with random mons
	pop af ; random number used for trainer
	ld hl, BattleTowerTrainerData
	ld bc, $0024
	call AddNTimes ; ?????
	ld bc, $0024
	ld de, BT_OTTrainerData
.asm_1f8070
	ld a, BANK(BattleTowerTrainerData)
	call GetFarByte
	ld [de], a ; load ??? into de
	inc hl
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .asm_1f8070 ; loop 24 times
	pop af
	ld [rSVBK], a
	ret
; 1f8081

Function1f8081:
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a

	push hl
	ld hl, OTPartyData
	ld bc, OTPartyDataEnd - OTPartyData
	xor a
	call ByteFill ;fill OTparty with 0
	pop hl

	ld de, OTPlayerName
	call .CopyName ; load name from trainer data into OTPlayerName, and end with a @, doesn't move hl
	ld de, OTPartyMonOT
	ld a, [PartyCount]
.loop1
	push af
	call .CopyName ;fill OT data
	pop af
	dec a
	jr nz, .loop1

	ld bc, 10 ;go down to trainer class and enter it
	add hl, bc
	ld a, [hl]
	ld [OtherTrainerClass], a

	ld hl, wd002
	ld a, [PartyCount]
	ld [hli], a ;load part count into buffer
	inc a
	push hl ;store wd003 on the stack
	ld c, a
	ld b, 0
	ld a, -1
	call ByteFill ;fill wd003 with partycount+1
	pop hl
	ld a, [wd002]
	ld c, a
.loop2
	push bc ;c = partycount
	push hl ; = wd003
	ld hl, TempMon
	ld bc, $30
	xor a
	call ByteFill ;empty tempmon
.loop3
	call Random
	cp NUM_BATTLE_TOWER_MONS ;loop until less then battle tower mons, put number into c
	jr nc, .loop3
	ld c, a
	push hl ;end of tempmon
	ld hl, wd002
	ld b, [hl] ;b = partycount
	inc hl
.loop4
	ld a, [hli]
	cp -1
	jr z, .pop_continue ;check if the same as previous selected mons
	cp c
	jr z, .pop_resample 
	dec b
	jr nz, .loop4
	jr .pop_continue

.pop_resample ;call another if same mon picked twice
	pop hl
	jr .loop3

.pop_continue
	pop hl ;hl = wd003
	ld a, c
	ld [hli], a ;enter random selection
	push hl ;hl = slot after current in random selection memory
	ld bc, 6
	ld hl, BattleTowerMons
	call AddNTimes ;go to correct slot in mondata
	ld de, TempMon
	ld bc, 6
	call CopyBytes ;copy into tempmon
	ld hl, TempMonLevel
	call .FindHighestPartyLevel
	ld [hl], d ;enter tempmon level
	callba Function50e47 ;calculate and enter xp
	ld hl, TempMonExp
	ld a, [hMultiplicand]
	ld [hli], a
	ld a, [hMultiplicand + 1]
	ld [hli], a
	ld a, [hMultiplicand + 2]
	ld [hli], a
	call Random
	and $7 ;rand 0-7
	ld e, a
	ld d, 0
	ld hl, .StatExps ;load in random statxp into de (note to self, revert to always max, battle tower does not need the nerf)
	add hl, de
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld c, 6 ;enter into stat xp and dvs (probably a bug as i counted 6 instead of 7)
.loop5
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	dec c
	jr nz, .loop5
	ld hl, TempMonStatExp - 1 ;last slot of regular xp?
	ld de, TempMonStats
	ld b, 1
	predef Functione167 ;fill stats
	ld de, TempMonHP
	ld hl, TempMonMaxHP
	ld bc, 2
	call CopyBytes ;copy temp hp into max
	ld hl, TempMonMoves
	ld de, TempMonPP
	predef FillPP ;enter mon PP
	ld hl, OTPartyCount
	ld a, [hl]
	push af ;push partycount
	inc [hl]
	ld c, a
	ld b, 0
	add hl, bc ;load species into OTSpecies
	ld a, [TempMonSpecies]
	ld [wd265], a
	ld [hli], a
	ld [hl], -1
	ld hl, OTPartyMon1
	ld a, c
	ld c, $30
	call AddNTimes ;go down to correct party mon
	ld d, h
	ld e, l
	ld hl, TempMon
	ld bc, $30
	call CopyBytes ;enter tempmon into OTParty
	call GetPokemonName
	pop af
	ld hl, OTPartyMonNicknames
	ld bc, NAME_LENGTH ;load mon name into nickname
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, StringBuffer1
	call .CopyName
	pop hl
	pop bc
	dec c
	jp nz, .loop2
	pop af
	ld [rSVBK], a
	ret

.CopyName ; load name from hl into de, and end with a @, then reset hl
	push hl
	ld bc, NAME_LENGTH - 1
	call CopyBytes
	ld a, "@"
	ld [de], a
	pop hl
	ret

.FindHighestPartyLevel
	push hl
	push de
	push bc
	ld a, [PartyCount]
	ld d, a
	ld hl, PartyMon1Level
	xor a
	ld e, a
	ld bc, $30
.level_loop
	ld a, [hl]
	cp e
	jr c, .no_update
	jr z, .no_update
	ld e, a
.no_update
	add hl, bc
	dec d
	jr nz, .level_loop
	ld a, e
	pop bc
	pop de
	pop hl
	ret

.StatExps
	dw 30000
	dw 33000
	dw 35000
	dw 37000
	dw 40000
	dw 43000
	dw 45000
	dw 50000

BattleTowerTrainers: ; 1f814e
	db "HANSON@@@@", FISHER
	db "SAWYER@@@@", POKEMANIAC
	db "MASUDA@@@@", GUITARIST
	db "NICKEL@@@@", SCIENTIST
	db "OLSON@@@@@", POKEFANM
	db "ZABOROWSKI", LASS
	db "WRIGHT@@@@", YOUNGSTER
	db "ALEXANDER@", HIKER
	db "KAWAKAMI@@", TEACHER
	db "BICKETT@@@", POKEFANM
	db "SAITO@@@@@", KIMONO_GIRL
	db "CRAWFORD@@", BOARDER
	db "DIAZ@@@@@@", PICNICKER
	db "ERICKSON@@", BIKER
	db "FAIRFIELD@", JUGGLER
	db "HUNTER@@@@", POKEFANF
	db "HILL@@@@@@", FIREBREATHER
	db "JAVIER@@@@", SWIMMERF
	db "KAUFMAN@@@", SWIMMERM
	db "LANCASTER@", SKIER
	db "McMAHILL@@", CAMPER
	db "OBRIEN@@@@", GENTLEMAN
	db "FROST@@@@@", BEAUTY
	db "MORSE@@@@@", SUPER_NERD
	db "YUFUNE@@@@", BLACKBELT_T
	db "RAJAN@@@@@", COOLTRAINERF
	db "RODRIGUEZ@", OFFICER
	db "SANTIAGO@@", PSYCHIC_T
	db "STOCK@@@@@", POKEFANM
	db "THURMAN@@@", SCIENTIST
	db "VALENTINO@", BEAUTY
	db "WAGNER@@@@", CAMPER
	db "YATES@@@@@", BIRD_KEEPER
	db "ANDREWS@@@", PICNICKER
	db "BAHN@@@@@@", POKEMANIAC
	db "MORI@@@@@@", SCIENTIST
	db "BUCKMAN@@@", SAGE
	db "COBB@@@@@@", SCHOOLBOY
	db "HUGHES@@@@", FISHER
	db "ARITA@@@@@", KIMONO_GIRL
	db "EASTON@@@@", PSYCHIC_T
	db "FREEMAN@@@", CAMPER
	db "GIESE@@@@@", LASS
	db "HATCHER@@@", GENTLEMAN
	db "JACKSON@@@", POKEFANF
	db "KAHN@@@@@@", POKEMANIAC
	db "LEONG@@@@@", YOUNGSTER
	db "MARINO@@@@", TEACHER
	db "NEWMAN@@@@", SAILOR
	db "NGUYEN@@@@", BLACKBELT_T
	db "OGDEN@@@@@", SUPER_NERD
	db "PARK@@@@@@", COOLTRAINERF
	db "RAINE@@@@@", SWIMMERM
	db "SELLS@@@@@", BIRD_KEEPER
	db "ROCKWELL@@", BOARDER
	db "THORNTON@@", LASS
	db "TURNER@@@@", OFFICER
	db "VAN DYKE@@", SKIER
	db "WALKER@@@@", SCHOOLBOY
	db "MEYER@@@@@", SWIMMERF
	db "JOHNSON@@@", YOUNGSTER
	db "ADAMS@@@@@", GUITARIST
	db "SMITH@@@@@", BUG_CATCHER
	db "TAJIRI@@@@", BUG_CATCHER
	db "BAKER@@@@@", POKEMANIAC
	db "COLLINS@@@", SCIENTIST
	db "SMART@@@@@", SUPER_NERD
	db "DYKSTRA@@@", SWIMMERF
	db "EATON@@@@@", BIKER
	db "WONG@@@@@@", FIREBREATHER
; 1f8450

BattleTowerMons: ; 1f8450

	db GLIGAR
	db LEFTOVERS
	db DIG, FLY, TOXIC, 0

	db GLIGAR
	db MINT_BERRY
	db THIEF, REST, 0,0

	db MILTANK
	db LEFTOVERS
	db BODY_SLAM, EARTHQUAKE, CURSE, MILK_DRINK

	db AIPOM ; 5
	db FOCUS_BAND
	db RETURN, DYNAMICPUNCH, AGILITY, BATON_PASS

	db DELIBIRD
	db FOCUS_BAND
	db SPIKES, BLIZZARD, FLY, PRESENT

	db VENUSAUR
	db MIRACLE_SEED
	db SEED_BOMB, SLEEP_POWDER, ANCIENTPOWER, SLUDGE

	db VENUSAUR
	db MYSTERYBERRY
	db GIGA_DRAIN, LEECH_SEED, SYNTHESIS, SLUDGE_BOMB

	db CHARIZARD
	db CHARCOAL
	db FIRE_PUNCH, BELLY_DRUM, EARTHQUAKE, OUTRAGE

	db CHARIZARD 
	db LEFTOVERS
	db FLAMETHROWER, FLY, TOXIC, PROTECT

	db BLASTOISE ; 5
	db LEFTOVERS
	db HYDRO_PUMP, ZAP_CANNON, FLASH_CANNON, MIRROR_COAT

	db BLASTOISE
		db MYSTIC_WATER
		db CURSE, AQUA_JET, WATERFALL, BODY_SLAM

	db BUTTERFREE
		db SHARP_BEAK
		db BUG_BUZZ, GUST, SLEEP_POWDER, MORNING_SUN

	db BUTTERFREE
		db LEFTOVERS
		db AIR_SLASH, PSYBEAM, STUN_SPORE, SUPERSONIC

	db BEEDRILL
	db SCOPE_LENS
		db FOCUS_ENERGY, POISON_JAB, TWINEEDLE, DRILL_RUN

	db BEEDRILL ; 10
		db FOCUS_BAND
		db HORN_DRILL, MEGAHORN, DOUBLE_TEAM, BATON_PASS

	db PIDGEOT
		db SHARP_BEAK
		db AIR_SLASH, DOUBLE_EDGE, HEAT_WAVE, AGILITY

	db PIDGEOT
		db FOCUS_BAND
		db SKY_ATTACK, SUBMISSION, MIRROR_MOVE, FAINT_ATTACK

	db RATICATE
		db PINK_BOW
		db HYPER_FANG, FLAME_WHEEL, SHARPEN, CRUNCH

	db RATICATE 
		db QUICK_CLAW
		db SUPER_FANG, BITE, ATTRACT, BODY_SLAM

	db FEAROW ; 15
		db BRIGHTPOWDER
		db AGILITY, SKY_ATTACK, TRI_ATTACK, MUD_SLAP

	db FEAROW
		db KINGS_ROCK
		db DRILL_PECK, DRILL_RUN, TAKE_DOWN, PURSUIT

	db KINGDRA
	db BITTER_BERRY
	db OUTRAGE, WATERFALL, DISABLE, ICY_WIND

	db KINGDRA
	db MYSTIC_WATER
	db OCTAZOOKA, DRAGON_PULSE, AURORA_BEAM, FOCUS_ENERGY

	db ARBOK 
	db POISON_BARB
	db POISON_JAB, ROCK_SLIDE, BITE, GLARE

	db ARBOK ; 20
	db BRIGHTPOWDER
	db FISSURE, GUNK_SHOT, BODY_SLAM, SUBSTITUTE

	db PIKACHU
	db LIGHT_BALL
	db THUNDERBOLT, SURF, PETAL_DANCE, NASTY_PLOT

	db RAICHU
	db MIRACLEBERRY
	db THUNDER, SURF, RAIN_DANCE, SING

	db RAICHU
	db MAGNET
	db WILD_CHARGE, EXTREMESPEED, DIZZY_PUNCH, THUNDER_WAVE

	db SANDSLASH 
	db LEFTOVERS
	db EARTHQUAKE, COUNTER, POISON_JAB, SANDSTORM

	db SANDSLASH ; 25
	db QUICK_CLAW
	db DIG, ENDURE, FLAIL, ROCK_SLIDE

	db NIDOQUEEN
	db BRIGHTPOWDER
	db POISON_JAB, EARTHQUAKE, MOONLIGHT, SWEET_KISS

	db NIDOQUEEN
	db BRIGHTPOWDER
	db EARTH_POWER, FIRE_BLAST, ICE_PUNCH, LOVELY_KISS

	db NIDOKING
	db KINGS_ROCK
	db EARTH_POWER, POISON_JAB, ICY_WIND, HORN_DRILL

	db NIDOKING 
	db SCOPE_LENS
	db DRILL_RUN, FOCUS_ENERGY, SLUDGE_BOMB, SHADOW_CLAW

	db CLEFABLE ; 30
	db MIRACLEBERRY
	db MOONBLAST, FLAMETHROWER, THUNDER_WAVE, METRONOME

	db CLEFABLE
	db MYSTERYBERRY
	db DIZZY_PUNCH, CURSE, HEAL_BELL, MOONLIGHT

	db NINETALES
	db CHARCOAL
	db HEAT_WAVE, SOLARBEAM, SUNNY_DAY, HYPNOSIS

	db NINETALES
	db MIRACLEBERRY
	db NASTY_PLOT, FIRE_BLAST, DARK_PULSE, DAZZLINGLEAM

	db WIGGLYTUFF 
	db FOCUS_BAND
	db ATTRACT, PAIN_SPLIT, TRI_ATTACK, DAZZLINGLEAM

	db WIGGLYTUFF ; 35
	db LEFTOVERS
	db PLAY_ROUGH, BODY_SLAM, FIRE_PUNCH, CURSE

	db CROBAT
	db SHARP_BEAK
	db SKY_ATTACK, CONFUSE_RAY, SLUDGE_BOMB, GIGA_DRAIN

	db CROBAT
	db LEFTOVERS
	db FLY, TOXIC, HEAT_WAVE, ZEN_HEADBUTT

	db VILEPLUME
	db GOLD_BERRY
	db MOONBLAST, LEECH_SEED, SLUDGE_BOMB, SLEEP_POWDER

	db VILEPLUME 
	db MIRACLE_SEED
	db SOLARBEAM, SUNNY_DAY, SYNTHESIS, POISON_JAB

	db BELLOSSOM ; 40
	db BITTER_BERRY
	db PETAL_DANCE, MOONLIGHT, SLUDGE_BOMB, STUN_SPORE

	db BELLOSSOM
	db QUICK_CLAW
	db SWORDS_DANCE, SEED_BOMB, ENDURE, FLAIL

	db PARASECT
	db SILVERPOWDER
	db SPORE, SEED_BOMB, PIN_MISSILE, AGILITY

	db PARASECT
	db BRIGHTPOWDER
	db SPORE, SUBSTITUTE, FURY_CUTTER, LEECH_SEED

	db VENOMOTH 
	db SILVERPOWDER
	db BUG_BUZZ, SLUDGE, AGILITY, BATON_PASS

	db VENOMOTH ; 45
	db POISON_BARB
	db STUN_SPORE, GIGA_DRAIN, SLUDGE_BOMB, DOUBLE_TEAM

	db DUGTRIO
	db FOCUS_BAND
	db REVERSAL, EARTHQUAKE, SCREECH, FISSURE

	db DUGTRIO
	db KINGS_ROCK
	db MAGNITUDE, BODY_SLAM, SHADOW_CLAW, SANDSTORM

	db PERSIAN
	db FOCUS_BAND
	db HEADBUTT, PLAY_ROUGH, SWAGGER, SUBSTITUTE

	db PERSIAN 
	db PINK_BOW
	db NASTY_PLOT, SWIFT, BUBBLEBEAM, DARK_PULSE

	db GOLDUCK ; 50
	db MYSTIC_WATER
	db HYDRO_PUMP, TRI_ATTACK, PETAL_DANCE, NASTY_PLOT

	db GOLDUCK
	db GOLD_BERRY
	db MEDITATE, WATERFALL, CROSS_CHOP, ZEN_HEADBUTT 

	db PRIMEAPE
	db SCOPE_LENS
	db CROSS_CHOP, POISON_JAB, ROCK_SLIDE, FOCUS_ENERGY

	db PRIMEAPE
	db QUICK_CLAW
	db CROSS_CHOP,REVERSAL, ENDURE, FORESIGHT 

	db ARCANINE 
	db CHARCOAL
	db FLAMETHROWER, EXTREMESPEED, ROAR, CRUNCH

	db ARCANINE ; 55
	db LEFTOVERS
	db FLARE_BLITZ, WILD_CHARGE, MORNING_SUN, WILLOWISP

	db POLIWRATH
	db QUICK_CLAW
	db HYDRO_PUMP, MIND_READER, DYNAMICPUNCH, SEISMIC_TOSS

	db POLIWRATH
	db GOLD_BERRY
	db BELLY_DRUM, HYPNOSIS, WATERFALL, SUBMISSION

	db POLITOED
	db LEFTOVERS
	db GROWTH, LOVELY_KISS, SURF, PSYBEAM

	db POLITOED 
	db BRIGHTPOWDER
	db PERISH_SONG, SWAGGER, WHIRLPOOL, PSYWAVE

	db ALAKAZAM ; 60
	db TWISTEDSPOON
	db PSYBEAM, FOCUS_BLAST, SHADOW_BALL, REFLECT

	db ALAKAZAM
	db LEFTOVERS
	db PSYCHIC_M, DAZZLINGLEAM, SUBSTITUTE, ENCORE

	db MACHAMP
	db BLACKBELT
	db ROLLING_KICK, ROCK_SLIDE, SCARY_FACE, ICE_PUNCH

	db MACHAMP
	db BLACKBELT
	db VITAL_THROW, METRONOME, FISSURE, LIGHT_SCREEN

	db VICTREEBEL 
	db SCOPE_LENS
	db SWORDS_DANCE, RAZOR_LEAF, SLEEP_POWDER, PIN_MISSILE

	db VICTREEBEL ; 65
	db MIRACLE_SEED
	db SWEET_KISS, GROWTH, GIGA_DRAIN, SLUDGE_BOMB

	db TENTACRUEL
	db KINGS_ROCK
	db CONFUSE_RAY, SLUDGE, SPIKES, SURF

	db TENTACRUEL
	db NO_ITEM
	db MIRROR_COAT, SCREECH, POISON_JAB, THIEF

	db GOLEM
	db LEFTOVERS
	db DEFENSE_CURL, ROLLOUT, EARTHQUAKE, COUNTER

	db GOLEM 
	db QUICK_CLAW
	db EXPLOSION, ROCK_SLIDE, DIG, SEISMIC_TOSS

	db RAPIDASH ; 70
	db KINGS_ROCK
	db FLARE_BLITZ, DRILL_RUN, WILD_CHARGE, HORN_DRILL

	db RAPIDASH
	db CHARCOAL
	db FLAME_WHEEL, ATTRACT, STOMP, MORNING_SUN

	db SLOWBRO
	db MINT_BERRY
	db BUBBLEBEAM, FUTURE_SIGHT, AMNESIA, REST

	db SLOWBRO
	db MYSTIC_WATER
	db BELLY_DRUM, THUNDER_WAVE, ZEN_HEADBUTT, WATERFALL

	db SLOWKING 
	db MINT_BERRY
	db NASTY_PLOT, HYDRO_PUMP, FLAMETHROWER, PSYCHIC_M

	db SLOWKING ; 75
	db MIRACLEBERRY
	db COUNTER, SURF, TRI_ATTACK, ICE_BEAM

	db MAGNETON
	db MINT_BERRY
	db MIND_READER, ZAP_CANNON, FLASH_CANNON, REST

	db MAGNETON
	db LEFTOVERS
	db AGILITY, METAL_SOUND, THUNDERBOLT, FLASH_CANNON

	db FARFETCH_D
	db STICK
	db SWORDS_DANCE, SLASH, QUICK_ATTACK, IRON_TAIL

	db FARFETCH_D
	db STICK
	db SKY_ATTACK, HEAT_WAVE, POISON_JAB, AGILITY

	db DODRIO ; 80
	db LEFTOVERS
	db THRASH, DRILL_PECK, SLEEP_TALK, REST

	db DODRIO
	db PINK_BOW
	db AGILITY, ENDURE, FLAIL, FLY

	db DEWGONG
	db FOCUS_BAND
	db REST, SLEEP_TALK, SHEER_COLD, HORN_DRILL

	db DEWGONG
	db MYSTIC_WATER
	db CURSE, AQUA_JET, DRILL_RUN, BLIZZARD

	db MUK 
	db POISON_BARB
	db MINIMIZE, ACID_ARMOR, SLUDGE, SELFDESTRUCT

	db MUK ; 85
	db LEFTOVERS
	db SCARY_FACE, DARK_PULSE, GUNK_SHOT, GIGA_DRAIN

	db CLOYSTER
	db NEVERMELTICE
	db SPIKES, EXPLOSION, AURORA_BEAM, BUBBLEBEAM

	db CLOYSTER
	db MYSTIC_WATER
	db TWINEEDLE, IRON_DEFENSE, HYDRO_PUMP, PROTECT

	db GENGAR
	db LEFTOVERS
	db SHADOW_BALL, DAZZLINGLEAM, DISABLE, SUBSTITUTE

	db GENGAR 
	db LEFTOVERS
	db HYPNOSIS, EXPLOSION, SHADOW_BALL, FOCUS_BLAST

	db GENGAR ; 90
	db LEFTOVERS
	db HYPNOSIS, EXPLOSION, SHADOW_BALL, FOCUS_BLAST

	db STEELIX
	db METAL_COAT
	db CURSE, ROAR, EARTHQUAKE, IRON_TAIL

	db STEELIX
	db QUICK_CLAW
	db SCREECH, DIG, EXPLOSION, ROCK_SLIDE

	db HYPNO
	db TWISTEDSPOON
	db HYPNOSIS, NASTY_PLOT, PSYCHIC_M, DAZZLINGLEAM

	db HYPNO 
	db LEFTOVERS
	db FUTURE_SIGHT, SUBSTITUTE, SWAGGER, THUNDER_WAVE

	db KINGLER ; 95
	db KINGS_ROCK
	db SWORDS_DANCE, AGILITY, CRABHAMMER, X_SCISSOR

	db KINGLER
	db BRIGHTPOWDER
	db AMNESIA, FISSURE, MUD_SLAP, CRABHAMMER

	db ELECTRODE
	db FOCUS_BAND
	db MIRROR_COAT, THUNDERBOLT, EXPLOSION, SWIFT

	db ELECTRODE
	db LEFTOVERS
	db RAIN_DANCE, THUNDER, LIGHT_SCREEN, FLASH_CANNON

	db EXEGGUTOR 
	db MIRACLE_SEED
	db SLEEP_POWDER, DREAM_EATER, GIGA_DRAIN, ANCIENTPOWER

	db EXEGGUTOR ; 100
	db LEFTOVERS
	db SLUDGE_BOMB, LEECH_SEED, PSYCHIC_M, PROTECT

	db MAROWAK
	db THICK_CLUB
	db CURSE, BONEMERANG, THRASH, ICE_PUNCH

	db MAROWAK
	db THICK_CLUB
	db EARTHQUAKE, IRON_HEAD, ROCK_SLIDE, SCARY_FACE

	db HITMONLEE
	db BLACKBELT
	db MEDITATE, HI_JUMP_KICK, MEGA_KICK, FORESIGHT

	db HITMONLEE 
	db NO_ITEM
	db BODY_SLAM, ENDURE, REVERSAL, THIEF

	db HITMONCHAN ; 105
	db BLACKBELT
	db CURSE, ICE_PUNCH, FIRE_PUNCH, MACH_PUNCH

	db HITMONCHAN
	db LEFTOVERS
	db MIND_READER, DYNAMICPUNCH, BODY_SLAM, THUNDERPUNCH

	db HITMONTOP
	db BLACKBELT
	db AGILITY, ROLLOUT, ROLLING_KICK, DRILL_RUN 

	db HITMONTOP
	db GOLD_BERRY
	db COUNTER, MACH_PUNCH, MEGA_KICK, PURSUIT

	db LICKITUNG 
	db LEFTOVERS
	db REST, SLEEP_TALK, BODY_SLAM, CURSE

	db LICKITUNG ; 110
	db BRIGHTPOWDER
	db ICE_BEAM, HYPER_BEAM, SHADOW_BALL, MUD_SLAP

	db WEEZING
	db MIRACLEBERRY
	db WILLOWISP, PAIN_SPLIT, SLUDGE, PSYBEAM

	db WEEZING
	db FOCUS_BAND
	db DESTINY_BOND, HAZE, SLUDGE_BOMB, FIRE_BLAST

	db RHYDON
	db LEFTOVERS
	db DRILL_RUN, MEGAHORN, COUNTER, IRON_TAIL

	db RHYDON 
	db HARD_STONE
	db SCARY_FACE, ROCK_SLIDE, HORN_DRILL, CRUNCH

	db CHANSEY ; 115
	db LUCKY_PUNCH
	db TRI_ATTACK, SOFTBOILED, SHADOW_BALL, PSYCHIC_M

	db BLISSEY
	db LEFTOVERS
	db COUNTER, PROTECT, METRONOME, BUBBLEBEAM

	db BLISSEY
	db HARD_STONE
	db DEFENSE_CURL, ROLLOUT, THUNDER_WAVE, PSYWAVE

	db TANGELA
	db MYSTERYBERRY
	db ANCIENTPOWER, SLEEP_POWDER, LEECH_SEED, GIGA_DRAIN

	db TANGELA 
	db MYSTERYBERRY
	db REFLECT, TOXIC, PAIN_SPLIT, GIGA_DRAIN

	db KANGASKHAN ; 120
	db PINK_BOW
	db RETURN, DIZZY_PUNCH, FORESIGHT, DYNAMICPUNCH

	db KANGASKHAN
	db BITTER_BERRY
	db ATTRACT, BODY_SLAM, SUBMISSION, FAINT_ATTACK

	db KINGDRA
	db BITTER_BERRY
	db OUTRAGE, OCTAZOOKA, DISABLE, ICY_WIND

	db KINGDRA
	db DRAGON_FANG
	db DRAGON_PULSE, WATERFALL, AGILITY, ICE_BEAM

	db SEAKING 
	db MIRACLEBERRY
	db SWORDS_DANCE, WATERFALL, DRILL_RUN, LOVELY_KISS

	db SEAKING ; 125
	db MYSTIC_WATER
	db AGILITY, HYDRO_PUMP, HORN_DRILL, MEGAHORN

	db STARMIE
	db KINGS_ROCK
	db HYDRO_PUMP, PSYCHIC_M, THUNDERBOLT, MINIMIZE

	db STARMIE
	db LEFTOVERS
	db RECOVER, SURF, ICE_BEAM, THUNDER_WAVE

	db MR__MIME
	db QUICK_CLAW
	db BARRIER, BATON_PASS, MOONBLAST, PSYCHIC_M

	db MR__MIME 
	db GOLD_BERRY
	db FUTURE_SIGHT, DAZZLINGLEAM, NASTY_PLOT, HYPNOSIS

	db SCYTHER ; 130
	db SCOPE_LENS
	db X_SCISSOR, WING_ATTACK, SLASH, SWORDS_DANCE

	db SCIZOR
	db METAL_COAT
	db X_SCISSOR, IRON_HEAD, REVERSAL, AGILITY

	db SCIZOR
	db SILVERPOWDER
	db FURY_CUTTER, COUNTER, STEEL_WING, LIGHT_SCREEN

	db JYNX
	db BRIGHTPOWDER
	db LOVELY_KISS, SUBSTITUTE, NASTY_PLOT, ICE_BEAM

	db JYNX
	db NEVERMELTICE
	db ICY_WIND, PSYCHIC_M, FOCUS_BLAST, METRONOME

	db ELECTABUZZ ; 135
	db MAGNET
	db MEDITATE, WILD_CHARGE, CROSS_CHOP, FIRE_PUNCH

	db ELECTABUZZ
	db FOCUS_BAND
	db THUNDERBOLT, PSYCHIC_M, SWAGGER, DOUBLE_TEAM

	db MAGMAR
	db CHARCOAL
	db FLAMETHROWER, THUNDERPUNCH, CONFUSE_RAY, MUD_SLAP

	db MAGMAR
	db MIRACLEBERRY
	db FIRE_BLAST, SUNNY_DAY, SOLARBEAM, ATTRACT

	db PINSIR 
	db PINK_BOW
	db SWORDS_DANCE, QUICK_ATTACK, X_SCISSOR, EARTHQUAKE

	db PINSIR ; 140
	db LEFTOVERS
	db IRON_DEFENSE, FISSURE, FURY_CUTTER, ROCK_THROW

	db TAUROS
	db MINT_BERRY
	db REST, DOUBLE_EDGE, ROCK_SLIDE, IRON_HEAD

	db TAUROS
	db KINGS_ROCK
	db THRASH, OUTRAGE, HORN_DRILL, ZEN_HEADBUTT

	db GYARADOS
	db CHARCOAL
	db WATERFALL, FLAMETHROWER, THUNDERBOLT, HYPER_BEAM

	db GYARADOS
	db MYSTIC_WATER
	db HYDRO_PUMP, BODY_SLAM, EARTHQUAKE, CRUNCH

	db LAPRAS ; 145
	db LEFTOVERS
	db PERISH_SONG, CONFUSE_RAY, SAFEGUARD, AURORA_BEAM

	db LAPRAS
	db MINT_BERRY
	db CURSE, REST, WATERFALL, SHEER_COLD

	db DITTO
	db METAL_POWDER
	db TRANSFORM, 0, 0, 0

	db VAPOREON
	db MYSTIC_WATER
	db BUBBLEBEAM, ICY_WIND, ACID_ARMOR, REST

	db VAPOREON 
	db MIRACLEBERRY
	db GROWTH, HYDRO_PUMP, AURORA_BEAM, SHADOW_BALL

	db JOLTEON ; 150
	db METAL_COAT
	db IRON_HEAD, THUNDERBOLT, CHARM, THUNDER_WAVE

	db JOLTEON
	db LEFTOVERS
	db AGILITY, BATON_PASS, THUNDER, SHADOW_BALL

	db FLAREON
	db LEFTOVERS
	db CURSE, FLARE_BLITZ, REST, SLEEP_TALK 

	db FLAREON
	db CHARCOAL
	db CURSE, FLARE_BLITZ, QUICK_ATTACK, IRON_TAIL

	db ESPEON 
	db LEFTOVERS
	db GROWTH, BATON_PASS, PSYCHIC, DAZZLINGLEAM

	db ESPEON ; 155
	db TWISTEDSPOON
	db PSYBEAM, FUTURE_SIGHT, CHARM, SUBSTITUTE

	db UMBREON
	db LEFTOVERS
	db TOXIC, DOUBLE_TEAM, CONFUSE_RAY, DARK_PULSE

	db UMBREON
	db BLACKGLASSES
	db SCREECH, PURSUIT, DIG, MOONLIGHT

	db PORYGON2
	db LEFTOVERS
	db CONVERSION2, MIND_READER, ZAP_CANNON, BLIZZARD

	db PORYGON2 
	db QUICK_CLAW
	db CONVERSION, RECOVER, TRI_ATTACK, SHADOW_BALL

	db OMASTAR ; 160
	db MYSTIC_WATER
	db ROCK_POLISH, HYDRO_PUMP, EARTH_POWER, ROCK_SLIDE

	db OMASTAR
	db QUICK_CLAW
	db SPIKES, ICY_WIND, HYDRO_PUMP, SWAGGER

	db KABUTOPS 
	db MYSTIC_WATER
	db SWORDS_DANCE, AQUA_JET, ROCK_SLIDE, FURY_CUTTER

	db KABUTOPS
	db QUICK_CLAW
	db RAPID_SPIN, WATERFALL, ATTRACT, ANCIENTPOWER

	db AERODACTYL
	db FOCUS_BAND
	db SKY_ATTACK, PURSUIT, EARTHQUAKE, STEEL_WING

	db AERODACTYL ; 165
	db SCOPE_LENS
	db ROCK_SLIDE, IRON_HEAD, FLY, BITE

	db SNORLAX
	db PINK_BOW
	db SELFDESTRUCT, BODY_SLAM, EARTHQUAKE, FIRE_BLAST

	db SNORLAX
	db LEFTOVERS
	db BELLY_DRUM, DOUBLE_EDGE, SEED_BOMB, CRUNCH
