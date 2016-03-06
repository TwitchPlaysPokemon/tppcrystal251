CheckEVTotal:
	; hl is pointer to current EVs
	; returns c if less than max, z if equal to max
	ld de, 0
	ld b, 7
.loop
	dec b
	jr z, .check_total
	ld a, [hli]
	add e
	ld e, a
	jr nc, .loop
	inc d
	jr .loop

.check_total
	ld a, [MaxEVTotal]
	cp d
	ret c
	ret nz
	ld a, [MaxEVTotal + 1]
	cp e
	ret

GiveEVs:
; hl is pointer to current EVs
; c is which stat:
; 	0 - HP
; 	1 - Atk
; 	2 - Def
; 	3 - Speed
; 	4 - SpAtk
; 	5 - SpDef
; b is by how much
; returns carry if successful

	; Check to see if we have reached the EV total already
	push hl
	push bc
	call CheckEVTotal
	pop bc
	pop hl
	jr nc, .overflow
	; Increase the total
	ld a, e
	add b
	ld e, a
	jr nc, .loop
	inc d
.loop
	; If this puts us over the top, we need to decrease the
	; number of EV points added to the individual stat
	ld a, [MaxEVTotal]
	cp d
	jr z, .check_e
	jr nc, .okay_to_add
.check_e
	ld a, [MaxEVTotal + 1]
	cp e
	jr nc, .okay_to_add
	dec b
	dec de
	jr .loop

.okay_to_add
	; Safety check, shouldn't be necessary.
	ld a, b
	and a
	ret z
	; Get the stat to which the EV is to be added
	ld b, 0
	add hl, bc
	ld b, a
	; Don't allow any EV to exceed 252.
	ld a, [hl]
	cp 252
	jr nc, .overflow
	add b
	jr c, .max_out
	cp 253
	jr c, .load
.max_out
	ld a, 252
.load
	ld [hl], a
	scf
	ret

.overflow
	and a
	ret

MaxEVTotal:
	bigdw 510

CalcPersonalityValue:
; Calculates the 32-bit personality value
; hl is the path to the IVs, where the personality value is stored
; returns the personality value in debc
	ld bc, 0
	; HP IV: Upper 2 bits and lower 2 bits
	ld a, [hl]
	and $3
	ld c, a
	ld a, [hli]
	swap a
	and $c
	or c
	ld c, a
	; Atk IV: Upper 3 bits and bit 2
	ld a, [hl]
	and $e0
	or c
	ld c, a
	ld a, [hli]
	bit 2, a
	jr z, .skip1
	ld a, $10
	or c
	ld c, a
.skip1
	; Def IV: Upper 3 bits and bit 3
	ld a, [hl]
	and $e0
	swap a
	ld b, a
	ld a, [hli]
	bit 3, a
	jr z, .skip2
	ld a, $1
	or b
	ld b, a
.skip2
	; Speed IV: Upper 4 bits
	ld a, [hli]
	and $f0
	or b
	ld b, a
	; SpAtk IV: All 8 bits
	ld a, [hli]
	ld e, a
	; SpDef IV: All 8 bits
	ld d, [hl]
	ret

CalcPkmnStats:
; Calculates all 6 Stats of a Pkmn
; b: Take into account EVs if TRUE
; 'c' counts from 1-6 and points with 'BaseStats' to the base value
; hl is the path to the EVs
; results in $ffb5 and $ffb6 are saved in [de]

	ld c, $0
.loop
	inc c
	call CalcPkmnStatC
	ld a, [hQuotient + 1]
	ld [de], a
	inc de
	ld a, [hQuotient + 2]
	ld [de], a
	inc de
	ld a, c
	cp STAT_SDEF
	jr nz, .loop
	ret
; e17b
CalcPkmnStatC:
; 'c' is 1-6 and points to the BaseStat
; 1: HP
; 2: Attack
; 3: Defense
; 4: Speed
; 5: SpAtk
; 6: SpDef
	push hl
	push de
	push bc

	push bc
	ld d, 0
	ld a, b
	and a
	jr z, .skip_EVs
	; EV / 4
	ld b, 0
	add hl, bc
	ld a, [hl]
	srl a
	srl a
.skip_EVs
	ld e, a
	; + IV
	push bc
	ld bc, MON_IVS - MON_EVS
	add hl, bc
	ld a, [hl]
	and $1f
	add e
	ld e, a
	jr nc, .okay
	ld d, 1
.okay
	; + 2 * base
	ld hl, BaseStats - 1
	pop bc
	add hl, bc
	ld a, [hl]
	sla a
	jr nc, .okay2
	inc d
.okay2
	add e
	jr nc, .okay3
	inc d
.okay3
	; * level
	ld [hMultiplicand + 2], a
	ld a, d
	ld [hMultiplicand + 1], a
	xor a
	ld [hMultiplicand], a
	ld a, [CurPartyLevel]
	ld [hMultiplier], a
	call Multiply
	; / 100
	ld a, [hProduct + 1]
	ld [hDividend + 0], a
	ld a, [hProduct + 2]
	ld [hDividend + 1], a
	ld a, [hProduct + 3]
	ld [hDividend + 2], a
	ld a, 100
	ld [hDivisor], a
	ld b, 3
	call Divide
	; HP is calculated differently form other stats
	pop bc
	ld a, c
	cp 1
	jr z, .calc_hp
	; + 5
	ld a, [hQuotient + 2]
	add 5
	ld [hQuotient + 2], a
	ld a, [hQuotient + 1]
	adc 0
	ld [hQuotient + 1], a
	; Compute nature's effect
	call CalcNature
	ld a, [hQuotient]
	call CalcNatureEffectOnStatC
	; * effect (9, 10, or 11)
	ld a, e
	ld [hMultiplier], a
	call Multiply
	; / 10
	ld a, [hProduct + 1]
	ld [hDividend + 0], a
	ld a, [hProduct + 2]
	ld [hDividend + 1], a
	ld a, [hProduct + 3]
	ld [hDividend + 2], a
	ld a, 10
	ld [hDivisor], a
	ld b, 3
	call Divide
	jr .done
	
.calc_hp
	; + level + 10
	; Assume level cannot be more than 100.
	ld a, [CurPartyLevel]
	add 10
	ld b, a
	ld a, [hQuotient + 2]
	add b
	ld [hQuotient + 2], a
	ld a, [hQuotient + 1]
	adc 0
	ld [hQuotient + 1], a
.done
	pop bc
	pop de
	pop hl
	ret
	
CalcNature:
	; Calc nature while preserving math registers
	ld a, [hDividend + 3]
	push af
	ld a, [hDividend + 2]
	push af
	ld a, [hDividend + 1]
	push af
	ld a, [hDividend + 0]
	push af

	call _CalcNature

	pop af
	ld [hDividend + 0], a
	pop af
	ld [hDividend + 1], a
	pop af
	ld [hDividend + 2], a
	pop af
	ld [hDividend + 3], a
	ret

_CalcNature:
	; Preserves registers. Returns nature in hQuotient.
	push hl
	push bc
	push de
	call CalcPersonalityValue
	ld a, d
	ld [hDividend + 0], a
	ld a, e
	ld [hDividend + 1], a
	ld a, b
	ld [hDividend + 2], a
	ld a, c
	ld [hDividend + 3], a
	ld a, 25
	ld [hQuotient], a
	ld b, 4
	call Divide
	pop de
	pop bc
	pop hl
	ret

CalcNatureEffectOnStatC:
	; Stat c (2-6), nature a (0-24)
	; Returns multiplier in e.
	; 10 = 1.0
	;  9 = 0.9
	; 11 = 1.1
	ld d, c
	dec d
	dec d
	ld c, 5
	call SimpleDivide ; mod 5 in a, // 5 in b
	; remainder increases
	ld e, 10
	cp d
	jr nz, .skip
	inc e
.skip
	; quotient decreases
	ld a, b
	cp d
	ret nz
	dec e
	ret

CalcShininess:
	; returns carry if shiny
	push hl
	call CalcPersonalityValue
	pop hl
	push bc
	ld bc, MON_ID - MON_IVS
	add hl, bc
	pop bc
	ld a, [hli]
	xor b
	xor d
	ret nz
	ld a, [hl]
	xor c
	xor e
	cp 16
	ret

GetMonAbility:
	; Base data loaded
	; path to IVs in HL
	ld de, 4
	add hl, de
	ld a, [hl]
	and $1
	ld e, a
	ld hl, BaseAbilities
	add hl, de
	ld a, [hl]
	ret

CalcMonGender:
	; Base data loaded
	; path to IVs in HL
	call CalcPersonalityValue
	ld a, [BaseGender]
	cp $ff
	jr z, .genderless
	and a
	jr z, .male
	cp $fe
	jr z, .female
	cp c
	jr c, .male
.female
	xor a
	ret

.male
	ld a, 1
	and a
	ret

.genderless
	scf
	ret
