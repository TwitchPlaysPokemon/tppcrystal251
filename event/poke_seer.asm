
SpecialPokeSeer: ; 4f0bc
	ld hl, .Intro
	call PrintText
	call YesNoBox
	jr c, .cancel
	ld hl, .Which
	call PrintText
	call Functiona36

	ld b, $6
	callba Function50000
	jr c, .cancel

	ld a, [CurPartySpecies]
	cp EGG
	jr z, .egg

	call IsAPokemon
	jr c, .no_mon

	call ReadDVs
	call JudgePokemon
	ret

.cancel
	ld hl, .Cancel
	call PrintText
	ret

.no_mon
	ret

.egg
	ld hl, .Egg
	call PrintText
	ret
; 4f0ee

.Intro
	text "I'm the STATS"
	line "JUDGE."

	para "I can reveal the"
	line "hidden potential"
	cont "of your #MON."

	para "Want me to judge"
	line "one of your #-"
	cont "MON?"
	done

.Which
	text "Which #MON"
	line "should I judge?"
	done
.Cancel
	text "Oh, okay. Come"
	line "again sometime."
	done
.Egg
	text "I can't judge an"
	line "EGG."
	done

ReadDVs:
	ld a, PartyMon1DVs - PartyMon1
	call GetPartyParamLocation
	ld a, [hli]
	ld d, a
	ld a, [hl]
	ld e, a
	ld hl, wd002
; HP
	ld a, d
	and $10
	srl a
	ld b, a
	ld a, d
	and $1
	add a
	add a
	or b
	ld b, a
	ld a, e
	and $10
	swap a
	add a
	or b
	ld b, a
	ld a, e
	and $1
	or b
	ld [hli], a
; Attack
	ld a, d
	and $f0
	swap a
	ld [hli], a
; Defense
	ld a, d
	and $f
	ld [hli], a
; Speed
	ld a, e
	and $f0
	swap a
	ld [hli], a
; Special
	ld a, e
	and $f
	ld [hl], a
	ret

JudgePokemon:
	ld hl, .InitJudge
	call PrintText
	call Functiona36
	call GetDVTotal
	push bc
	call JudgeDVTotal
	ld hl, .Incidentally
	call PrintText
	call Functiona36
	
	pop bc
	ld a, b
	and a
	jr z, .skip_maxdv
	cp 75
	jr z, .skip_maxdv
	call GetMaxDV
	push bc
	call InformMaxDVs
	pop bc
	call JudgeMaxDV
	ld hl, .Conclude
	call PrintText
	call Functiona36
	call GetMinDV
	call InformMinDVs
.skip_maxdv
	ld hl, .Finish
	call PrintText
	ret

.InitJudge
	text "Let's see", $56
	line $56, " ", $56, " ", $56
	done

.Incidentally
	text "Incidentally<...>"
	done

.Conclude
	text "That's how I judge"
	line "it."
	done

.Finish
	text "Come again some-"
	line "time."
	done

GetDVTotal:
	ld hl, wd002
	ld b, 0
	ld c, 5
.loop
	ld a, [hli]
	add b
	ld b, a
	dec c
	jr nz, .loop
	ret

JudgeDVTotal:
	ld a, b
	; max dv total is 5 * 15 = 75
	and a
	ld hl, .AbsoluteWorst
	jr z, .okay
	cp 20
	ld hl, .Poor
	jr c, .okay
	cp 35
	ld hl, .Unremarkable
	jr c, .okay
	cp 50
	ld hl, .Decent
	jr c, .okay
	cp 75
	ld hl, .Strong
	jr c, .okay
	ld hl, .Perfect
.okay
	call PrintText
	call Functiona36
	ret

.AbsoluteWorst
	text "Oh my! Your #-"
	line "MON has so little"
	cont "potential!"

	para "I've never seen a"
	line "#MON so weak!"
	done
.Poor
	text "Your #MON"
	line "seems to be lac-"
	cont "king in potential."
	done

.Unremarkable
	text "Your #MON's"
	line "potential is"
	cont "unremarkable."
	done

.Decent
	text "Your #MON seems"
	line "to be decent"
	cont "overall."
	done

.Strong
	text "Your #MON seems"
	line "to be spectacular"
	cont "overall."
	done

.Perfect
	text "I don't even need"
	line "to look closely"

	para "to see your #-"
	line "MON's perfection!"
	done

GetMaxDV:
	ld hl, wd002
	ld b, 0
	ld c, 5
.loop
	ld a, [hli]
	cp b
	jr c, .skip
	ld b, a
.skip
	dec c
	jr nz, .loop
	; We found the max value, now let's get which ones are equal.
	ld hl, wd002
	ld c, 5
	ld d, 0
.loop2
	srl d
	ld a, [hli]
	cp b
	jr nz, .skip2
	ld a, $10
	or d
	ld d, a
.skip2
	dec c
	jr nz, .loop2
	ret

InformMaxDVs:
	ld c, 5
	ld b, 0
.loop
	srl d
	jr nc, .next
	push de
	push bc
	ld a, 5
	sub c
	add a
	ld e, a
	ld d, 0
	ld hl, .StatNames
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, StringBuffer1
.loop1
	ld a, [hli]
	ld [de], a
	cp "@"
	jr z, .done1
	inc de
	jr .loop1
.done1
	ld a, b
	add a
	ld e, a
	ld d, 0
	ld hl, .WhichStatTexts
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	call Functiona36
	pop bc
	pop de
	inc b
.next
	dec c
	jr nz, .loop
	ret

.StatNames
	dw .hp
	dw .atk
	dw .def
	dw .spd
	dw .spc
.hp
	db "HP@"
.atk
	db "ATTACK@"
.def
	db "DEFENSE@"
.spd
	db "SPEED@"
.spc
	db "SPECIAL@"

.WhichStatTexts
	dw .FirstStatText
	dw .SecondStatText
	dw .ThirdStatText
	dw .FourthStatText
	dw .FifthStatText

.FirstStatText
	text "Its greatest po-"
	line "tential lies in"
	cont "its @"
	TX_RAM StringBuffer1
	text "."
	done

.SecondStatText
	text "Its @"
	TX_RAM StringBuffer1
	text " is"
	line "equally good."
	done

.ThirdStatText
	text "Its @"
	TX_RAM StringBuffer1
	text " is"
	line "also impressive."
	done

.FourthStatText
	text "Its @"
	TX_RAM StringBuffer1
	text " is"
	line "good as well."
	done

.FifthStatText
	text "Well, its @"
	TX_RAM StringBuffer1
	text ""
	line "is worth mention-"
	cont "ing also."
	done

JudgeMaxDV:
	ld a, b
	cp 7
	ld hl, .Decent
	jr c, .okay
	cp 12
	ld hl, .Good
	jr c, .okay
	cp 15
	ld hl, .Fantastic
	jr c, .okay
	ld hl, .Perfect
.okay
	call PrintText
	call Functiona36
	ret

.Decent
	text "It has rather"
	line "decent stats, I'd"
	cont "say."
	done
.Good
	text "It's definitely"
	line "got some good"
	cont "stats."
	done
.Fantastic
	text "This #MON has"
	line "some pretty fan-"
	cont "tastic stats."
	done
.Perfect
	text "Stats like those<...>"
	line "They simply can't"
	cont "be beat!"
	done

GetMinDV:
	ld hl, wd002
	ld b, 15
	ld c, 5
.loop
	ld a, [hli]
	cp b
	jr nc, .skip
	ld b, a
.skip
	dec c
	jr nz, .loop
	; We found the max value, now let's get which ones are equal.
	ld hl, wd002
	ld c, 5
	ld d, 0
.loop2
	srl d
	ld a, [hli]
	cp b
	jr nz, .skip2
	ld a, $10
	or d
	ld d, a
.skip2
	dec c
	jr nz, .loop2
	ret

InformMinDVs:
	ld c, 5
	ld b, 0
.loop
	srl d
	jr nc, .next
	push de
	push bc
	ld a, 5
	sub c
	add a
	ld e, a
	ld d, 0
	ld hl, .StatNames
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, StringBuffer1
.loop1
	ld a, [hli]
	ld [de], a
	cp "@"
	jr z, .done1
	inc de
	jr .loop1
.done1
	ld a, b
	add a
	ld e, a
	ld d, 0
	ld hl, .WhichStatTexts
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	call Functiona36
	pop bc
	pop de
	inc b
.next
	dec c
	jr nz, .loop
	ret

.StatNames
	dw .hp
	dw .atk
	dw .def
	dw .spd
	dw .spc
.hp
	db "HP@"
.atk
	db "ATTACK@"
.def
	db "DEFENSE@"
.spd
	db "SPEED@"
.spc
	db "SPECIAL@"

.WhichStatTexts
	dw .FirstStatText
	dw .SecondStatText
	dw .ThirdStatText
	dw .FourthStatText
	dw .FifthStatText

.FirstStatText
	text "But its @"
	TX_RAM StringBuffer1
	text "<...>"
	line "It's pretty dis-"
	cont "mal, you know?"
	done

.SecondStatText
	text "And its @"
	TX_RAM StringBuffer1
	text ""
	line "is pretty disap-"
	cont "pointing, too."
	done

.ThirdStatText
	text "I'm afraid its"
	line "@"
	TX_RAM StringBuffer1
	text "is pretty"
	cont "bad, too<...>"
	done

.FourthStatText
	text "I'm not too happy"
	line "with its @"
	TX_RAM StringBuffer1
	text ""
	cont "either."
	done

.FifthStatText
	text "Well, its @"
	TX_RAM StringBuffer1
	text ""
	line "is nothing to brag"
	cont "about, that's for"
	cont "sure."
	done

GetCaughtGender: ; 4f301
	ld hl, MON_CAUGHTGENDER
	add hl, bc

	ld a, [hl]
	and $7f
	jr z, .genderless
	cp $7f
	jr z, .genderless

	ld a, [hl]
	and $80
	jr nz, .male
	ld c, 1
	ret

.male
	ld c, 2
	ret

.genderless
	ld c, 0
	ret
; 4f31c
