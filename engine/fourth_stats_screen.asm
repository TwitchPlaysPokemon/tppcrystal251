TrainerNotes_:
	call TN_PrintToD
	call TN_PrintLocation
	call TN_PrintLV
	jp TN_PrintCharacteristics

TN_PrintToD
	ld a, [TempMonCaughtTime]
	ld hl, 0
	ld bc, .times
	sla a
	rl l
	sla a
	rl l
	dec l
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, bc
	ld d, h
	ld e, l
	hlcoord 1, 9
	jp PlaceString
	
.times:
	db "Morning@"
	db "Day    @"
	db "Night@"
	
TN_PrintLocation:
	ld de, .unknown
	ld a, [TempMonCaughtLocation]
	and $7f
	jr z, .print
	cp $7e
	jr z, .print
	ld de, .event
	cp $7f
	jr z, .print
	ld e, a
	callba GetLandmarkName
	ld de, StringBuffer1
.print
	hlcoord 1, 11
	jp PlaceString
	
.unknown
	db "Unknown Location@"
	
.event
	db "Event #MON@"
	
TN_PrintLV:
	ld a, [TempMonCaughtLevel]
	and $3f
	cp 1
	jr z, .hatched
	ld [Buffer2], a
	ld de, .metat
	hlcoord 1, 13
	call PlaceString
	ld de, Buffer2
	ld bc, $0103
	hlcoord 11, 13
	jp PrintNum
.hatched
	ld de, .egg
	hlcoord 1, 13
	jp PlaceString
	
.metat
	db "Met at Lv.   .@"
	
.egg
	db "Hatched from EGG."

TN_PrintCharacteristics:
	ld hl, TempMonDVs
	ld d, 0 ; hp
	ld a, [hl]
	and $f
	ld c, a ; def
	ld a, [hli]
	swap a
	and $f ; atk
	cp c
	ld e, 2
	ld b, c
	jr c, .atk
	ld e, 1
	ld b, a
.atk
	srl a
	rl d
	srl c
	rl d
	ld a, [hl]
	and $f
	ld c, a ; spe
	ld a, [hl]
	swap a
	and $f ; spx
	cp c
	ld l, 5
	ld h, c
	jr c, .spx
	ld l, 3
	ld h, a
.spx
	srl a
	rl d
	srl c
	rl d
	ld a, b
	cp h
	jr nc, .skip
	ld e, l
	ld b, h
.skip
	ld a, b
	cp d
	jr nc, .skiphp
	ld e, 0
	ld b, d
.skiphp
	ld a, 3
	cp e
	jr nz, .skipspx
	; since DVs don't have SpA/SpD split so we have to determine it by OT ID
	ld a, [TempMonID + 1]
	bit 0, a
	jr z, .skipspx
	inc e
.skipspx
	ld a, b
	ld c, 5
	call SimpleDivide
	ld b, a
	ld a, e
	call SimpleMultiply
	add b
	ld l, a
	ld h, 0
	ld bc, Characteristics
	add hl, hl
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	hlcoord 1, 15
	jp PlaceString

Characteristics:
	dw Chara_HP0, Chara_HP1, Chara_HP2, Chara_HP3, Chara_HP4
	dw Chara_ATK0, Chara_ATK1, Chara_ATK2, Chara_ATK3, Chara_ATK4
	dw Chara_DEF0, Chara_DEF1, Chara_DEF2, Chara_DEF3, Chara_DEF4
	dw Chara_SPA0, Chara_SPA1, Chara_SPA2, Chara_SPA3, Chara_SPA4
	dw Chara_SPD0, Chara_SPD1, Chara_SPD2, Chara_SPD3, Chara_SPD4
	dw Chara_SPE0, Chara_SPE1, Chara_SPE2, Chara_SPE3, Chara_SPE4
	
;              |                  ||
Chara_HP0:  db "Loves to eat.@"
Chara_HP1:  db "Takes plenty of     siestas.@"
Chara_HP2:  db "Nods off a lot.@"
Chara_HP3:  db "Scatters things     often.@"
Chara_HP4:  db "Likes to relax.@"

Chara_ATK0: db "Proud of its        power.@"
Chara_ATK1: db "Likes to thrash     about.@"
Chara_ATK2: db "A little quick      tempered.@"
Chara_ATK3: db "Likes to fight.@"
Chara_ATK4: db "Quick tempered.@"

Chara_DEF0: db "Sturdy body.@"
Chara_DEF1: db "Capable of taking   hits.@"
Chara_DEF2: db "Highly persistent.@"
Chara_DEF3: db "Good endurance.@"
Chara_DEF4: db "Good perseverance.@"

Chara_SPA0: db "Highly curious.@"
Chara_SPA1: db "Mischievous@"
Chara_SPA2: db "Thoroughly          cunning.@"
Chara_SPA3: db "Often lost in       thought.@"
Chara_SPA4: db "Very finicky.@"

Chara_SPD0: db "Strong willed.@"
Chara_SPD1: db "Somewhat vain.@"
Chara_SPD2: db "Strongly defiant.@"
Chara_SPD3: db "Hates to lose.@"
Chara_SPD4: db "Somewhat stubborn.@"

Chara_SPE0: db "Likes to run.@"
Chara_SPE1: db "Alert to sounds.@"
Chara_SPE2: db "Impetuous and       silly.@"
Chara_SPE3: db "Somewhat of a       clown.@"
Chara_SPE4: db "Quick to flee.@"
