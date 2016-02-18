_HostsBattleTransition::
	xor a
	ld [hBGMapMode], a
	ld de, CommandsGFX
	ld hl, VTiles1 + $580
	lb bc, BANK(CommandsGFX), 8
	call Request2bpp
	ld hl, TileMap
	ld a, VBGMap1 / $100
	ld [hBGMapAddress + 1], a
	call FillCommandChaos
	ld hl, TileMap
	ld a, (VBGMap1 + $1c0) % $100
	ld [hBGMapAddress], a
	ld a, (VBGMap1 + $1c0) / $100
	ld [hBGMapAddress + 1], a
	call FillCommandChaos
	xor a
	ld [hBGMapMode], a
	ld a, [rSVBK]
	push af
	ld a, 5
	ld [rSVBK], a
	ld hl, CommandChaosPals
	ld de, BGPals + $30
	ld bc, CommandChaosPalsEnd - CommandChaosPals
	call CopyBytes
	pop af
	ld [rSVBK], a
	ld a, 1
	ld [hCGBPalUpdate], a
	call DelayFrame
	; TODO
	xor a
	ld [hBGMapAddress], a
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	ret
	
FillCommandChaos:
	xor a
	ld [hBGMapMode], a
	ld e, (TileMapEnd - TileMap) / 5
.fillloop1
	call Random
	ld d, 5
	ld a, [hRandomAdd]
	ld b, a
	ld a, [hRandomSub]
	ld c, a
.fillloop2
	ld a, c
	and $7
	add $d8
	ld [hli], a
	rept 3
	srl b
	rr c
	endr
	dec d
	jr nz, .fillloop2
	dec e
	jr nz, .fillloop1
	ld a, 1
	ld [hBGMapMode], a
	ld c, 4
	jp DelayFrames

CommandChaosPals:
	RGB 07, 07, 07
	RGB 07, 07, 07
	RGB 07, 07, 07
	RGB 31, 31, 31
CommandChaosPalsEnd
	
_Function8c5dc:
	ld a, [OtherTrainerClass]
	and a ; Is this a trainer battle?
	jp z, Function8c673 ; If not, we don't need to be here
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	inc b
	inc c
	jr .asm_8c5f4

.asm_8c5f0
	ld a, [hl]
	or $7
	ld [hli], a
.asm_8c5f4
	dec c
	jr nz, .asm_8c5f0
	dec b
	jr nz, .asm_8c5f0
	call Function8c6b1
	hlcoord 2, 1
	ld b, $10
.asm_8c602
	push hl
	ld c, $2
.asm_8c605
	push hl
	ld a, [de]
	inc de
.asm_8c608
	and a
	jr z, .asm_8c614
	sla a
	jr nc, .asm_8c611
	ld [hl], $fe
.asm_8c611
	inc hl
	jr .asm_8c608

.asm_8c614
	pop hl
	push bc
	ld bc, $8
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_8c605
	pop hl
	push bc
	ld bc, $14
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_8c602
	ld a, [hCGB] ; $ff00+$e6
	and a
	jr nz, .asm_8c639
	ld a, $1
	ld [hBGMapMode], a ; $ff00+$d4
	call DelayFrame
	call DelayFrame
	jr Function8c673

.asm_8c639
	ld hl, Unknown_8c6a1
	ld a, [TimeOfDayPal]
	and 3
	cp 3
	jr nz, .asm_8c648
	ld hl, Unknown_8c6a9
.asm_8c648
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, $5
	ld [rSVBK], a ; $ff00+$70
	call Function8c677
	push hl
	ld de, Unkn1Pals + 8 * 7
	ld bc, $8
	call CopyBytes
	pop hl
	ld de, BGPals + 8 * 7
	ld bc, $8
	call CopyBytes
	pop af
	ld [rSVBK], a ; $ff00+$70
	ld a, $1
	ld [hCGBPalUpdate], a ; $ff00+$e5
	call DelayFrame
	call Function3238
Function8c673: ; 8c673 (23:4673)
	ld hl, wcf63
	inc [hl]
	ret
	
Function8c6b1: ; 8c6b1 (23:46b1)
	ld a, [OtherTrainerClass]
	cp RED
	jr nz, .notred
	ld a, [OtherTrainerID]
	and a
	ld de, StartTrainerBattle_AbeGraphic
	jr z, .skip
	dec a
	ld de, StartTrainerBattle_RedGraphic
	jr z, .skip
	jr .notbaba
.notred
	cp CAL
	jr nz, .notaj
	ld a, [OtherTrainerID]
	cp 4
	ld de, StartTrainerBattle_AJGraphic
	jr z, .skip
	jr .notbaba
.notaj
	cp BABA
	ld de, StartTrainerBattle_BabaGraphic
	jr z, .skip
.notbaba
	ld de, StartTrainerBattle_PokeballGraphic
.skip
	ld a, [OtherTrainerClass]
	ret
; 8c6b8 (23:46b8)

Function8c677: ; 8c677 (23:4677)
	ld de, Unkn1Pals + 8 * 7
	call Function8c698
	ld de, BGPals + 8 * 7
	call Function8c698
	ld de, Unkn2Pals + 8 * 6
	call Function8c698
	ld de, OBPals + 8 * 6
	call Function8c698
	ld de, Unkn2Pals + 8 * 7
	call Function8c698
	ld de, OBPals + 8 * 7
Function8c698: ; 8c698 (23:4698)
	push hl
	ld bc, $8
	call CopyBytes
	pop hl
	ret
; 8c6a1 (23:46a1)

StartTrainerBattle_PokeballGraphic: ; 8c6b8
	db $03, $c0
	db $0f, $f0
	db $3c, $3c
	db $30, $0c
	db $60, $06
	db $63, $c6
	db $c6, $63
	db $fc, $3f
	db $fc, $3f
	db $c6, $63
	db $63, $c6
	db $60, $06
	db $30, $0c
	db $3c, $3c
	db $0f, $f0
	db $03, $c0
; 8c6d8

StartTrainerBattle_AJGraphic:
	; TODO

StartTrainerBattle_BabaGraphic:
	; TODO

StartTrainerBattle_AbeGraphic:
	; TODO

StartTrainerBattle_RedGraphic:
	db $07, $e0
	db $18, $98
	db $20, $84
	db $20, $82
	db $70, $82
	db $4c, $85
	db $82, $e9
	db $81, $51
	db $be, $69
	db $c3, $ad
	db $82, $8b
	db $8e, $f1
	db $93, $12
	db $a6, $12
	db $49, $94
	db $30, $78
	
Unknown_8c6a1: ; 8c6a1
	RGB 31, 18, 29
	RGB 31, 11, 15
	RGB 31, 05, 05
	RGB 07, 07, 07
; 8c6a9

Unknown_8c6a9: ; 8c6a9
	RGB 31, 18, 29
	RGB 31, 05, 05
	RGB 31, 05, 05
	RGB 31, 05, 05
; 8c6b1
	