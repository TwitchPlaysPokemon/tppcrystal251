


SECTION "TPPCredits", ROMX;, BANK[CREDITS]

	const_def

	const ROM_HACK_DIRECTOR
	const TPP_SCRIPTING
	const TPP_MUSIC
	const TPP_ART
	const PIKALAXALT
	const PROJECTREVOTPP
	const LIGHTNINGXCE
	const ERACLITO
	const FROGGESTSPIRIT
	const DEKUNUKEM
	const PADZ
	const TRAINERTIMMY

const_value SET -7
	const TPP_CREDITS_THEEND
	const TPP_CREDITS_WAIT2
	const TPP_CREDITS_MUSIC
	const TPP_CREDITS_CLEAR
	const TPP_CREDITS_SCENE
	const TPP_CREDITS_WAIT
	const TPP_CREDITS_END


PlayTPPCredits_109847:: ; 109847
	bit 6, b
	ld a, $0
	jr z, .asm_10984f
	ld a, $40
.asm_10984f
	ld [wcf63], a

	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

	call WhiteBGMap
	call ClearTileMap
	call ClearSprites

	ld hl, wca00
	ld c, $80
	ld de, $ff00

.asm_10986a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	dec c
	jr nz, .asm_10986a

	ld de,TPPCreditsBorderGFX
	ld hl, $9200
	lb bc, BANK(TPPCreditsBorderGFX), $09
	call Request2bpp

	ld de, TehUrnGFX
	ld hl, $9400
	lb bc, BANK(TehUrnGFX), $10
	call Request2bpp

	ld a, $ff
	ld [wcf64], a
	xor a
	ld [wcf65], a

	call TPPFunction109bca
	ld e, l
	ld d, h
	ld hl, VTiles2
	lb bc, BANK(TPPCreditsMonsGFX), $10
	call Request2bpp

	call TPPFunction109a95
	xor a
	ld [wcf66], a

	ld hl, LYOverrides
	ld bc, $100
	xor a
	call ByteFill

	ld a, rSCX - $ff00
	ld [hLCDStatCustom], a

	call GetTPPCreditsPalette
	call Function32f9
	ld a, [hVBlank]
	push af
	ld a, $5
	ld [hVBlank], a
	ld a, $1
	ld [$ffaa], a
	xor a
	ld [hBGMapMode], a
	ld [TPPCreditsPos], a
	ld [wcd21], a
	ld [TPPCreditsTimer], a

.asm_1098de
	call TPPFunction109908
	call TPPFunction1098fd
	jr nz, .asm_1098ee

	call TPPFunction109926
	call DelayFrame
	jr .asm_1098de

.asm_1098ee
	call WhiteBGMap
	xor a
	ld [hLCDStatCustom], a
	ld [hBGMapAddress], a
	pop af
	ld [hVBlank], a
	pop af
	ld [rSVBK], a
	ret
; 1098fd

TPPFunction1098fd: ; 1098fd
	ld a, [hJoypadDown]
	and $1
	ret z
	ld a, [wcf63]
	bit 7, a
	ret
; 109908

TPPFunction109908: ; 109908
	ld a, [hJoypadDown]
	and $2
	ret z
	ld a, [wcf63]
	bit 6, a
	ret z
	ld hl, TPPCreditsPos
	ld a, [hli]
	cp $d
	jr nc, .asm_10991e
	ld a, [hli]
	and a
	ret z

.asm_10991e
	ld hl, TPPCreditsTimer
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret
; 109926

TPPFunction109926: ; 109926
	ld a, [wcf63]
	and $f
	ld e, a
	ld d, 0
	ld hl, TPPJumptable_109937
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 109937


TPPJumptable_109937: ; 109937 (42:5937)
	dw ParseTPPCredits
	dw TPPFunction109951
	dw TPPFunction109951
	dw TPPFunction10995e
	dw TPPFunction109964
	dw TPPFunction10997b
	dw TPPFunction109986
	dw TPPFunction109951
	dw TPPFunction109951
	dw TPPFunction109951
	dw TPPFunction109964
	dw TPPFunction10997b
	dw TPPFunction109956


TPPFunction109951: ; 109951 (42:5951)
	ld hl, wcf63
	inc [hl]
	ret

TPPFunction109956: ; 109956 (42:5956)
	ld hl, wcf63
	ld a, [hl]
	and $f0
	ld [hl], a
	ret

TPPFunction10995e: ; 10995e (42:595e)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	jp TPPFunction109951

TPPFunction109964: ; 109964 (42:5964)
	call TPPFunction109bca
	ld a, l
	ld [Requested2bppSource], a
	ld a, h
	ld [Requested2bppSource + 1], a
	ld a, $0
	ld [Requested2bppDest], a
	ld a, $90
	ld [Requested2bppDest + 1], a
	jr TPPFunction10997b

TPPFunction10997b: ; 10997b (42:597b)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	ld a, $8
	ld [Requested2bpp], a
	jp TPPFunction109951

TPPFunction109986: ; 109986 (42:5986)
	ld a, [rLY] ; $ff00+$44
	cp $30
	jr c, TPPFunction109986
	ld a, [wcf66]
	dec a
	dec a
	ld [wcf66], a
	ld hl, LYOverrides + $1f
	call TPPFunction1099a3
	ld hl, LYOverrides + $87
	call TPPFunction1099a3
	jp TPPFunction109951

TPPFunction1099a3: ; 1099a3 (42:59a3)
	ld c, $8
.asm_1099a5
	ld [hli], a
	dec c
	jr nz, .asm_1099a5
	ret
; 1099aa


ParseTPPCredits: ; 1099aa
	ld hl, wcf63
	bit 7, [hl]
	jp nz, .done
	
; Wait until the timer has run out to parse the next command.
	ld hl, TPPCreditsTimer
	ld a, [hl]
	and a
	jr z, .parse
	
; One tick has passed.
	dec [hl]
	jp .done
	
.parse
; First, let's clear the current text display,
; starting from line 5.
	xor a
	ld [$ffd4], a
	hlcoord 0, 5
	ld bc, 20 * 12
	ld a, " "
	call ByteFill
	
; Then read the script.
	
.loop
	call .get
	
; Commands:
	cp TPP_CREDITS_END
	jp z, .end
	cp TPP_CREDITS_WAIT
	jr z, .wait
	cp TPP_CREDITS_SCENE
	jr z, .scene
	cp TPP_CREDITS_CLEAR
	jr z, .clear
	cp TPP_CREDITS_MUSIC
	jr z, .music
	cp TPP_CREDITS_WAIT2
	jr z, .wait2
	cp TPP_CREDITS_THEEND
	jr z, .theend
	
; If it's not a command, it's a string identifier.
	
	push af
	ld e, a
	ld d, 0
	ld hl, TPPCreditsStrings
	add hl, de
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop af
	
; Strings spanning multiple lines have special cases.
	
	cp COPYRIGHT
	jr z, .copyright
	
	cp STAFF
	jr c, .staff
	
; The rest start from line 6.

	hlcoord 0, 6
	jr .print
	
.copyright
	hlcoord 2, 6
	jr .print
	
.staff
	hlcoord 0, 6
	
.print
; Print strings spaced every two lines.
	call .get
	ld bc, 20 * 2
	call AddNTimes
	call PlaceString
	jr .loop
	
.theend
; Display "The End" graphic.
	call TPPFunction109c11
	jr .loop
	
.scene
; Update the scene number and corresponding palette.
	call .get
	ld [wcf65], a ; scene
	xor a
	ld [wcf64], a ; frame
	call GetTPPCreditsPalette
	call Function32f9 ; update hw pal registers
	jr .loop
	
.clear
; Clear the banner.
	ld a, $ff
	ld [wcf64], a ; frame
	jr .loop
	
.music
; Play the credits music.
	ld de, MUSIC_CREDITS
	push de
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	pop de
	call PlayMusic
	jp .loop
	
.wait2
; Wait for some amount of ticks.
	call .get
	ld [TPPCreditsTimer], a
	jr .done
	
.wait
; Wait for some amount of ticks, and do something else.
	call .get
	ld [TPPCreditsTimer], a
	
	xor a
	ld [$ffd5], a
	ld a, 1
	ld [$ffd4], a
	
.done
	jp TPPFunction109951
	
.end
; Stop execution.
	ld hl, wcf63
	set 7, [hl]
	ld a, $20
	ld [MusicFade], a
	ld a, MUSIC_POST_CREDITS % $100
	ld [MusicFadeID], a
	ld a, MUSIC_POST_CREDITS / $100
	ld [MusicFadeIDHi], a
	ret

.get
; Get byte TPPCreditsPos from TPPCreditsScript
	push hl
	push de
	ld a, [TPPCreditsPos]
	ld e, a
	ld a, [TPPCreditsPos+1]
	ld d, a
	ld hl,TPPCreditsScript
	add hl, de
	
	inc de
	ld a, e
	ld [TPPCreditsPos], a
	ld a, d
	ld [TPPCreditsPos+1], a
	ld a, [hl]
	pop de
	pop hl
	ret
; 109a95


TPPFunction109a95: ; 109a95 (42:5a95)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	ld a, $c
	ld [hBGMapAddress], a ; $ff00+$d6
	ld a, $28
	ld hl, TileMap
	ld bc, $168
	call ByteFill
	ld a, $7f
	hlcoord 0, 4
	ld bc, $118
	call ByteFill
	hlcoord 0, 4
	ld a, $24
	call TPPFunction109b1d
	hlcoord 0, 17
	ld a, $20
	call TPPFunction109b1d
	ld hl, AttrMap
	ld bc, $50
	xor a
	call ByteFill
	hlcoord 0, 4, AttrMap
	ld bc, $14
	ld a, $1
	call ByteFill
	hlcoord 0, 5, AttrMap
	ld bc, $f0
	ld a, $2
	call ByteFill
	hlcoord 0, 17, AttrMap
	ld bc, $14
	ld a, $1
	call ByteFill
	call Function3200
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	ld [hBGMapAddress], a ; $ff00+$d6
	ld hl, TileMap
	call TPPFunction109aff
	call Function3200
	ret

TPPFunction109aff: ; 109aff (42:5aff)
	ld b, $5
.asm_109b01
	push hl
	ld de, $11
	ld c, $4
	xor a
.asm_109b08
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	inc a
	add hl, de
	dec c
	jr nz, .asm_109b08
	pop hl
	inc hl
	inc hl
	inc hl
	inc hl
	dec b
	jr nz, .asm_109b01
	ret

TPPFunction109b1d: ; 109b1d (42:5b1d)
	ld c, $5
.asm_109b1f
	push af
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	pop af
	dec c
	jr nz, .asm_109b1f
	ret

GetTPPCreditsPalette: ; 109b2c
	call .GetPalAddress
	
	push hl
	ld a, 0
	call .UpdatePals
	pop hl
	ret
	
.GetPalAddress
; Each set of palette data is 24 bytes long.
	ld a, [wcf65] ; scene
	and 3
	add a
	add a ; * 8
	add a
	ld e, a
	ld d, 0
	ld hl,TPPCreditsPalettes
	add hl, de
	add hl, de ; * 3
	add hl, de
	ret
	
.UpdatePals
; Update the first three colors in both palette buffers.
	
	push af
	push hl
	add Unkn1Pals % $100
	ld e, a
	ld a, 0
	adc Unkn1Pals / $100
	ld d, a
	ld bc, 24
	call CopyBytes
	
	pop hl
	pop af
	add BGPals % $100
	ld e, a
	ld a, 0
	adc BGPals / $100
	ld d, a
	ld bc, 24
	call CopyBytes
	ret

TPPCreditsPalettes:

; Pichu
	RGB 31, 00, 31
	RGB 31, 25, 00
	RGB 11, 14, 31
	RGB 07, 07, 07

	RGB 31, 05, 05
	RGB 11, 14, 31
	RGB 11, 14, 31
	RGB 31, 31, 31

	RGB 31, 05, 05
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 31, 31, 31

; Smoochum
	RGB 31, 31, 31
	RGB 31, 27, 00
	RGB 26, 06, 31
	RGB 07, 07, 07

	RGB 03, 13, 31
	RGB 20, 00, 24
	RGB 26, 06, 31
	RGB 31, 31, 31

	RGB 03, 13, 31
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 31, 31, 31

; Ditto
	RGB 31, 31, 31
	RGB 23, 12, 28
	RGB 31, 22, 00
	RGB 07, 07, 07

	RGB 03, 20, 00
	RGB 31, 22, 00
	RGB 31, 22, 00
	RGB 31, 31, 31

	RGB 03, 20, 00
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 31, 31, 31

; Igglybuff
	RGB 31, 31, 31
	RGB 31, 10, 31
	RGB 31, 00, 09
	RGB 07, 07, 07

	RGB 31, 14, 00
	RGB 31, 00, 09
	RGB 31, 00, 09
	RGB 31, 31, 31

	RGB 31, 14, 00
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
; 109bca

TPPFunction109bca: ; 109bca (42:5bca)
	ld hl, wcf64
	ld a, [hl]
	cp $ff
	jr z, .asm_109bed

	and 3
	ld e, a
	inc a
	and 3
	ld [hl], a
	ld a, [wcf65]
	and 3
	add a
	add a
	add e
	add a
	ld e, a
	ld d, 0
	ld hl,TPPCreditsMonsFrames
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

.asm_109bed
	ld hl, wca00
	ret
; 109bf1 (42:5bf1)
TPPCreditsMonsFrames: ; 109bf1
	dw CreditsPichuGFX
	dw CreditsPichuGFX     + $100
	dw CreditsPichuGFX     + $200
	dw CreditsPichuGFX     + $300
	dw CreditsSmoochumGFX
	dw CreditsSmoochumGFX  + $100
	dw CreditsSmoochumGFX  + $200
	dw CreditsSmoochumGFX  + $300
	dw CreditsDittoGFX
	dw CreditsDittoGFX     + $100
	dw CreditsDittoGFX     + $200
	dw CreditsDittoGFX     + $300
	dw CreditsIgglybuffGFX
	dw CreditsIgglybuffGFX + $100
	dw CreditsIgglybuffGFX + $200
	dw CreditsIgglybuffGFX + $300
; 109c11

TPPFunction109c11: ; 109c11 (42:5c11)
	ld a, $40
	hlcoord 6, 9
	call TPPFunction109c1c
	hlcoord 6, 10

TPPFunction109c1c: ; 109c1c (42:5c1c)
	ld c, $8
.asm_109c1e
	ld [hli], a
	inc a
	dec c
	jr nz, .asm_109c1e
	ret
; 109c24 (42:5c24)

TPPCreditsBorderGFX:    INCBIN "gfx/credits/border.w72.2bpp"
TPPCreditsMonsGFX:TPPCreditsPichuGFX:     INCBIN "gfx/credits/pichu.w32.2bpp"TPPCreditsSmoochumGFX:  INCBIN "gfx/credits/smoochum.w32.2bpp"TPPCreditsDittoGFX:     INCBIN "gfx/credits/ditto.w32.2bpp"TPPCreditsIgglybuffGFX: INCBIN "gfx/credits/igglybuff.w32.2bpp"

TPPCreditsScript: ; 10acb4

; Incomplete
	db TPP_CREDITS_END
; 10ae13




TPPCreditsStrings:
	dw .RomHackDirector
	dw .Scripting
	dw .Music
	dw .Art
	dw .PikalaxALT
	dw .ProjectRevoTPP
	dw .LightningXCE
	dw .Eraclito
	dw .FroggestSpirit
	dw .DekuNukem
	dw .padz
	dw .TrainerTimmy
	
.RomHackDirector:     db " ROM HACK DIRECTOR@"
.Scripting:           db "      SCRIPTING@"
.Music:               db "        MUSIC@"
.Art:                 db "         ART@"
.PikalaxALT:          db "     PIKALAXALT@"
.ProjectRevoTPP:      db "   PROJECTREVOTPP"
                    next "  AKA ELITEANAX17@"
.LightningXCE:        db "    LIGHTNINGXCE@"
.Eraclito:            db "      ERACLITO@"
.FroggestSpirit:      db "   FROGGESTSPIRIT@"
.DekuNukem:           db "  TWITCH_PLAYS_3DS"
                    next "   AKA DEKUNUKEM@"
.padz:                db "        PADZ@"
.TrainerTimmy:        db "    TRAINERTIMMY@"

