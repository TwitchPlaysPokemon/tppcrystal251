DISTRO_MON_LENGTH EQU 38 ; 8-byte repeat hash, species, item, 4 moves, 2-byte OT ID, 2-byte DVs, level, 11-byte OT name, 11-byte nickname

Special_EnterDistrCode:
	ld a, [PartyCount]
	cp PARTY_LENGTH
	jr nc, .fail
	ld b, 9 ; code distro
	ld de, StringBuffer4
	callba NamingScreen
	ld hl, StringBuffer4
	call .Decrypt ; returns to struct at wPiguHash
	ld a, [wPiguHash + 8]
	ld [CurPartySpecies], a
	call .Copy
	jr nc, .added_mon
.fail
	xor a
	ld [ScriptVar], a
	ret

.added_mon
	ld a, [CurPartySpecies]
	ld [ScriptVar], a
	ret

.Copy:
	ld hl, PartyCount
	ld a, [hl]
	cp PARTY_LENGTH
	ret nc
	ld [CurPartyMon], a
	inc a
	ld [hli], a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [wDistroMonSpecies]
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	ld [hli], a
	ld [hl], $ff
	call GetBaseData
	xor a ; PartyMon*Species
	call GetPartyParamLocation
	push hl
	ld bc, $30
	xor a
	call ByteFill
	pop hl
	ld de, wDistroMonSpecies ; species, item, moves, OT ID, dvs, level
	call .ConvertHashedMon
	ld hl, PartyMonOT
	ld de, wDistroMonOTName
	call .CopyName
	ld hl, PartyMonNicknames
	ld de, wDistroMonNickname
.CopyName:
	push hl
	ld bc, NAME_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	ld d, h
	ld e, l
	pop hl
	ld bc, NAME_LENGTH
	jp CopyBytes

.ConvertHashedMon:
	; Copy species, item, moves, and OT ID
	push hl
	ld c, PartyMon1Exp - PartyMon1
.loop1
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .loop1
	pop bc

	; Copy PP
	ld hl, PartyMon1Moves - PartyMon1
	add hl, bc
	call .CopyPP

	; Copy DVs
	ld hl, PartyMon1DVs - PartyMon1
	add hl, bc
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	inc de

	; Copy level
	ld hl, PartyMon1Level - PartyMon1
	add hl, bc
	ld a, [de]
	ld [hl], a
	inc de
	ld [CurPartyLevel], a ; for CalcPkmnStats

	; Calc stats
	push bc
	ld hl, PartyMon1MaxHP - PartyMon1
	add hl, bc
	ld d, h
	ld e, l
	ld hl, PartyMon1StatExp - PartyMon1 - 1
	add hl, bc
	ld b, 0
	predef Functione167 ; CalcPkmnStats
	pop bc

	; Copy HP
	ld hl, PartyMon1HP - PartyMon1
	add hl, bc
	ld d, h
	ld e, l
	inc hl
	inc hl
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ret

.CopyPP:
	push bc
	push de
	push hl
	ld c, NUM_MOVES
.loop2
	ld a, [hl]
	and a
	jr z, .done2
	push bc
	push hl
	ld bc, MOVE_LENGTH
	ld hl, Moves + MOVE_PP
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	pop hl
	push hl
	ld bc, PartyMon1PP - PartyMon1Moves
	add hl, bc
	ld [hl], a
	pop hl
	pop bc
	inc hl
	dec c
	jr nz .loop2
.done2
	pop hl
	pop de
	pop bc
	ret

.Decrypt:
	; Decrypt a distribution data at hl into DecryptBuffer2
	; with a key stored in hProduct. Return carry if fails.
	; Phase 1
	xor a
	ld [hTmpe], a
	ld a, hProduct % $100
	ld [hTmpd], a
	lb bc, DISTRO_MON_LENGTH, 7
	ld de, DecryptBuffer1
.decrypt_loop1
	push bc
	ld a, [hTmpe]
	add [hl]
	ld b, a
	inc hl
	ld a, [hTmpd]
	ld c, a
	ld a, [$ff00 + c]
	add b
	ld [de], a
	ld [hTmpe], a
	inc de
	inc c
	ld a, c
	pop bc
	dec c
	jr nz, .decrypt_skip1
	ld c, 7
	ld a, hProduct % $100
.decrypt_skip1
	ld [hTmpd], a
	dec b
	jr nz, .decrypt_loop1
	ld hl, DecryptBuffer1
	ld a, (hProduct + 6) % $100
	ld [hTmpd], a
	lb bc, DISTRO_MON_LENGTH, 7
	ld de, DecryptBuffer2
.decrypt_loop2
	push bc
	ld a, [hTmpe]
	sub [hl]
	ld b, a
	inc hl
	ld a, [hTmpd]
	ld c, a
	ld a, [$ff00 + c]
	cpl
	add b
	inc a
	ld [de], a
	ld [hTmpe], a
	inc de
	dec c
	ld a, c
	pop bc
	dec c
	jr nz, .decrypt_skip2
	ld c, 7
	ld a, (hProduct + 6) % $100
.decrypt_skip2
	ld [hTmpd], a
	dec b
	jr nz, .decrypt_loop2
	; Phase 2
	lb bc, 7, hProduct % $100
.decrypt_loop3
	ld a, b
	rra
	ld hl, DecryptBuffer2
	ld de, DecryptBuffer2 + DISTRO_MON_LENGTH
	jr c, .decrypt_odd1
	ld hl, DecryptBuffer1
	ld de, DecryptBuffer1 + DISTRO_MON_LENGTH
.decrypt_odd1
	push bc
	ld a, [$ff00 + c]
	swap a
	and $f
	add 1 ; 1 - 16
	ld b, a
.decrypt_loop4
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .decrypt_loop4
	pop bc
	push bc
	ld a, b
	rra
	ld de, DecryptBuffer1
	jr c, .decrypt_odd2
	ld de, DecryptBuffer2
.decrypt_odd2
	ld a, [$ff00 + c]
	and $f
	add 2 ; 2 - 17
	ld b, a
	ld c, a
	xor a
.decrypt_loop5
	push af
	push bc
	push hl
.decrypt_loop6
	push af
	ld a, [hl]
	ld [de], a
	inc de
	pop af
	ld b, 0
	add hl, bc
	add c
	cp DISTRO_MON_LENGTH
	jr c, .decrypt_loop6
	pop hl
	pop bc
	pop af
	inc a
	inc hl
	dec b
	jr nz, .decrypt_loop5
	pop bc
	inc c
	dec b
	jr nz, .decrypt_loop3
	; Phase 3
	ld hl, .decrypt_olden
	ld c, hProduct + 7
	ld b, 5
.decrypt_loop6
	ld a, [hli]
	ld [$ff00 + c], a
	inc c
	dec b
	jr nz, .decrypt_loop6
	ld hl, DecryptBuffer1
	ld de, DISTRO_MON_LENGTH - 2
	ld a, hProduct % $100
	ld [hTmpd], a
	ld a, (hProduct + 7) % $100
	ld [hTmpe], a
	ld b, DISTRO_MON_LENGTH / 2
.decrypt_loop7
	ld a, [hli]
	push hl
	add hl, de
	dec de
	dec de
	xor [hl]
	call .decrypt_xor
	pop hl
	push hl
	push de
	ld de, DecryptBuffer2 - DecryptBuffer1 - 1
	add hl, de
	ld [hl], a
	pop de
	pop hl
	ld de,
	dec b
	jr nz, .decrypt_loop7
	ld de, DecryptBuffer2 + (DISTRO_MON_LENGTH / 2)
	ld b, DISTRO_MON_LENGTH / 2
.decrypt_loop8
	ld a, [hl]
	push de
	ld de, 0 - (DISTRO_MON_LENGTH / 2)
	add hl, de
	xor [hl]
	ld de, (DISTRO_MON_LENGTH / 2) + 1
	add hl, de
	call .decrypt_xor
	pop de
	ld [de], a
	inc de
	dec b
	jr nz, .decrypt_loop8
	; Identity check
	ld hl, DecryptBuffer2
	ld a, [hli]
	ld c, a
	ld b, 7
.decrypt_loop9
	ld a, [hli]
	cp c
	jr nz, .decrypt_invalid
	dec b
	jr nz, .decrypt_loop9
	xor a ; clear carry flag
	ret

.decrypt_invalid
	scf
	ret

.decrypt_xor
	push af
	ld a, [hTmpd]
	ld c, a
	inc a
	cp (hProduct + 7) % $100
	jr nz, .decrypt_skipx1
	ld a, hProduct % $100
.decrypt_skipx1
	ld [hTmpd], a
	ld a, [$ff00 + c]
	ld c, a
	pop af
	xor c
	push af
	ld a, [hTmpe]
	ld c, a
	inc a
	cp (hProduct + 12) % $100
	jr nz, .decrypt_skipx2
	ld a, (hProduct + 7) % $100
.decrypt_skipx2
	ld [hTmpe], a
	ld a, [$ff00 + c]
	ld c, a
	pop af
	xor c
	ret

.decrypt_olden
	db "OLDEN"

DistributionData: INCBIN "data/distribution.bin"
