Special_EnterDistrCode:
	; This function checks your party size 3 times.
	; Yeah, we're super paranoid.
	ld hl, .GreetingText
	call PrintText
	call YesNoBox
	jr c, .cancel
	ld a, [PartyCount]
	cp PARTY_LENGTH
	jr nc, .no_room
	ld hl, .SaveFirst
	call PrintText
	call YesNoBox
	jr c, .cancel
	ld hl, .Which
	call PrintText
	call Functiona36
	call .EnterDistrCode
	jr c, .congrats
	jr z, .no_room
	dec a
	jr z, .wrong_code
	ld hl, .AlreadyGotIt
	jr .error

.wrong_code
	ld hl, .WrongCode
.error
	call PrintText
	ld de, SFX_WRONG
	call PlaySFX
	call WaitSFX
	call Functiona36
	jr .cancel

.no_room
	ld hl, .NoRoom
	call PrintText
	call Functiona36
	jr .cancel

.congrats
	callba Save_NoPrompt
	ld a, [CurPartySpecies]
	ld [wd265], a
	call GetPokemonName
	ld hl, .Congrats
	call PrintText
	ld de, SFX_CAUGHT_MON
	call PlaySFX
	call WaitSFX
.cancel
	ld hl, .Cancel
	call PrintText
	ret

.EnterDistrCode:
	; Return codes
	; c: Success!!
	; nc,z: Party full
	; nc,nz,a=1: Wrong code
	; nc,nz,a=2: Already got this one
	ld a, [PartyCount]
	cp PARTY_LENGTH
	jr c, .party_length_okay
	xor a
	ret
	
.party_length_okay
	ld b, 9 ; code distro
	ld de, StringBuffer4
	callba NamingScreen
	; pack into 7 byte key
	call .Pack
	ld a, [rSVBK]
	push af
	ld a, 4
	ld [rSVBK], a
	ld hl, DistributionData
	ld a, DISTRO_MON_COUNT
.try_decrypt
	push af
	push hl
	call .Decrypt
	pop hl
	jr nc, .got_mon
	pop af
	dec a
	jr z, .invalid_code
	ld bc, DISTRO_MON_LENGTH
	add hl, bc
	jr .try_decrypt

.got_mon
	pop af
	ld a, [DecryptBuffer2]
	ld b, a
	ld a, BANK(sNumDistributedMons)
	call GetSRAMBank
	ld hl, sNumDistributedMons
	ld a, [hli]
	and a
	jr z, .okay
	ld c, a
.check_loop
	ld a, [hli]
	cp b
	jr z, .nope
	dec c
	jr nz, .check_loop
.okay
	ld [hl], b
	inc hl
	ld [hl], -1
	ld hl, sNumDistributedMons
	inc [hl]
	call CloseSRAM
	ld hl, DecryptBuffer2 + 8
	ld de, wSurvivalModeParty
	ld bc, DISTRO_MON_LENGTH - 8
	call CopyBytes
	pop af
	ld [rSVBK], a
	ld a, [wSurvivalModeParty + 8]
	ld [CurPartySpecies], a
	call .Copy
	ret c
	xor a
	ret

.nope
	; We already got this Pokemon!
	call CloseSRAM
	pop af
	ld [rSVBK], a
	ld a, 2
	and a
	ret
	
.invalid_code
	pop af
	ld [rSVBK], a
	ld a, 1
	and a
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
	ld a, [wSurvivalModeParty]
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
	ld de, wSurvivalModeParty ; species, item, moves, OT ID, dvs, level
	call .ConvertHashedMon
	ld hl, PartyMonOT
	ld de, wSurvivalModeParty + 11 ; ot name
	call .CopyName
	ld hl, PartyMonNicknames
	ld de, wSurvivalModeParty + 22 ; nickname
.CopyName:
	push hl
	ld bc, NAME_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	ld d, h
	ld e, l
	pop hl
	ld bc, NAME_LENGTH
	call CopyBytes
	scf
	ret

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
	jr nz, .loop2
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
	ld a, [hTmpd]
	ld c, a
	ld a, [$ff00+c]
	ld b, a
	ld a, [hli]
	add b
	ld [de], a
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
	ld a, [hTmpd]
	ld c, a
	ld a, [$ff00+c]
	ld b, a
	ld a, [hli]
	sub b
	ld [de], a
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
	ld a, [$ff00+c]
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
	ld a, [$ff00+c]
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
	ld c, hProduct + 7 - $ff00
	ld b, 5
.decrypt_loop7
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .decrypt_loop7
	ld hl, DecryptBuffer1
	ld de, DISTRO_MON_LENGTH - 2
	ld a, hProduct % $100
	ld [hTmpd], a
	ld a, (hProduct + 7) % $100
	ld [hTmpe], a
	ld b, DISTRO_MON_LENGTH / 2
.decrypt_loop8
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
	dec b
	jr nz, .decrypt_loop8
	ld de, DecryptBuffer2 + (DISTRO_MON_LENGTH / 2)
	ld b, DISTRO_MON_LENGTH / 2
.decrypt_loop9
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
	jr nz, .decrypt_loop9
	; Identity check
	ld hl, DecryptBuffer2
	ld a, [hli]
	ld c, a
	ld b, 7
.decrypt_loop10
	ld a, [hli]
	cp c
	jr nz, .decrypt_invalid
	dec b
	jr nz, .decrypt_loop10
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
	ld a, [$ff00+c]
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
	ld a, [$ff00+c]
	ld c, a
	pop af
	xor c
	ret

.Pack
	ld hl, StringBuffer4
	ld b, 8
.pack_loop1
	ld a, [hl]
	cp "@"
	jr z, .pack_skip1
	cp " "
	jr nz, .pack_notspace
	ld a, $bf
.pack_notspace
	ld [hli], a
	dec b
	jr nz, .pack_loop1
	jr .pack_skip2
.pack_skip1
	ld a, $cf
.pack_loop2
	ld [hli], a
	dec b
	jr nz, .pack_loop2
.pack_skip2
	ld hl, StringBuffer4
	ld b, 7
	ld c, hProduct % $100
	ld de, 7
	ld a, [hli]
	sla a
.pack_loop3
	push bc
	ld b, 8
	ld d, 0
.pack_loop4
	sla a
	rl d
	dec e
	jr nz, .pack_skip3
	ld a, [hli]
	sla a
	ld e, 7
.pack_skip3
	dec b
	jr nz, .pack_loop4
	pop bc
	push af
	ld a, d
	ld [$ff00+c], a
	pop af
	inc c
	dec b
	jr nz, .pack_loop3
	ret

.decrypt_olden
	db "OLDEN"

.GreetingText:
	text "Hello! Welcome to"
	line "#COM CENTER"
	cont "TRADE CORNER."

	para "You can receive"
	line "unique #MON"

	para "if you have a"
	line "special code."

	para "Would you like to"
	line "enter a code?"
	done

.SaveFirst:
	text "When you receive"
	line "your #MON,"

	para "your game will be"
	line "saved. Okay?"
	done

.Which:
	text "Please enter the"
	line "code."
	done

.NoRoom:
	text "I'm sorry."

	para "You have no room"
	line "in your party to"
	cont "accept this gift."

	para "Please make room"
	line "and come back."
	done

.WrongCode:
	text "I'm sorry."

	para "The code you gave"
	line "me does not match"
	cont "our records."

	para "Please double-"
	line "check your code"
	cont "and try again."
	done

.AlreadyGotIt:
	text "I'm sorry."

	para "You have already"
	line "received this"
	cont "gift."

	para "You may not re-"
	line "ceive another."
	done

.Congrats:
	text "Thank you!"

	para "Here is your"
	line "#MON!"

	para "<PLAYER> received"
	line "a @"
	TX_RAM StringBuffer1
	text "!"
	done

.Cancel:
	text "We hope to see you"
	line "again!"
	done

DistributionData:
rept DISTRO_MON_COUNT * DISTRO_MON_LENGTH
	db 0
endr
; INCBIN "data/distribution.bin"
