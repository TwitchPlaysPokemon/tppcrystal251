SECTION "TPPCredits", ROMX;, BANK[CREDITS]

LOGO_DELAY      EQU 300
LOGO_DELAY_POST EQU 300
SCROLLER_DELAY  EQU 200
C_TC_DRAW       EQU 0
C_TC_TITLE      EQU 1
C_TC_SUBTITLE   EQU 2

tc_draw: MACRO
	db C_TC_DRAW
	dw \1
ENDM

tc_title: MACRO
	db C_TC_TITLE
	dw \1
ENDM

tc_subtitle: MACRO
	db C_TC_SUBTITLE
	dw \1
ENDM

TPPCredits::
	call Fade2Black
	;ld de, MUSIC_TPP_CREDITS
	;call PlayMusic
	xor a
	ld [hLCDStatCustom], a
	ld a, 1 ; VBlank1
	ld [hVBlank], a
	ld a, $70
	ld [hSCY], a
	
; -- logo scene init --
	
; clear the bottom attributes
	
	xor a
	ld hl, AttrMap
	ld bc, AttrMapEnd - AttrMap
	call ByteFill
	ld a, $9a ; clear the bottom
	ld [hBGMapAddress + 1], a
	ld a, 2
	ld [hBGMapMode], a
	ld c, 4
	call DelayFrames
	
; prepare logo attributes

; lines 3-4
	ld hl, AttrMap + SCREEN_WIDTH * 1
	ld bc, SCREEN_WIDTH * 2
	ld a, $a
	call ByteFill
; line 5
	ld hl, AttrMap + SCREEN_WIDTH * 3
	ld bc, SCREEN_WIDTH
	ld a, $b
	call ByteFill
; line 6
	ld hl, AttrMap + SCREEN_WIDTH * 4
	ld bc, SCREEN_WIDTH
	ld a, $c
	call ByteFill
; line 7
	ld hl, AttrMap + SCREEN_WIDTH * 5
	ld bc, SCREEN_WIDTH
	ld a, $d
	call ByteFill
; lines 8-9
	ld hl, AttrMap + SCREEN_WIDTH * 6
	ld bc, SCREEN_WIDTH * 2
	ld a, $e
	call ByteFill
	
; TWITCH PLAYS
	ld hl, AttrMap + 1
	ld bc, $0011
	ld a, $9
	call ByteFill

; 'CRYSTAL VERSION'
	ld hl, AttrMap + SCREEN_WIDTH * 7 + 4
	ld bc, $000d ; length of version text
	ld a, $9
	call ByteFill
	
	ld a, $98
	ld [hBGMapAddress + 1], a
	ld c, 4
	call DelayFrames
	
; clear the bottom tiles
	
	ld a, $9a
	ld [hBGMapAddress + 1], a
	call ClearTileMap
	ld a, $98
	ld [hBGMapAddress + 1], a
	xor a
	ld [hBGMapMode], a
	
; Decompress and copy logo
	ld a, 1
	ld [rVBK], a
	ld hl, TitleLogoGFX
	ld de, $d600
	ld a, BANK(TitleLogoGFX)
	call FarDecompress
	ld de, $d600
	ld hl, VTiles1
	lb bc, BANK(TPPCredits), $8B
	call Request2bpp
	
; Copy Twitch Plays
	ld de, TitleTPPGFX
	ld hl, VTiles2 + $100
	lb bc, BANK(TitleTPPGFX), $9
	call Request2bpp
	
; Copy udlrab
	ld de, CommandsGFX
	ld hl, VTiles2 + $200
	lb bc, BANK(CommandsGFX), $8
	call Request2bpp
	xor a
	ld [rVBK], a
	
; Draw Pokemon logo
	hlcoord 0, 1
	lb bc, 7, 20
	ld a, $80
	call TC_DrawGraphic
	
; Draw Twitch Plays
	hlcoord 1, 0
	lb bc, 1, 5
	ld a, $10
	call TC_DrawGraphic
	hlcoord $e, 0
	lb bc, 1, 4
	ld a, $15
	call TC_DrawGraphic
	
; Draw texts
	hlcoord 11 - _VERLEN, 8
	ld de, TCText_Version
	call PlaceString
	hlcoord 4, 11
	ld de, TCText_Credits
	call PlaceString
	ld a, 1
	ld [hBGMapMode], a
	ld c, 4
	call DelayFrames
	xor a
	ld [hBGMapMode], a
	
; Update palette colors
	ld hl, TitleScreenPalettes
	ld de, Unkn1Pals
	ld bc, $0080
	ld a, BANK(TitleScreenPalettes)
	call FarCopyBytes
	ld hl, TitleScreenPalettes
	ld de, BGPals
	ld bc, $0080
	ld a, BANK(TitleScreenPalettes)
	call FarCopyBytes
	ld a, 1
	ld [hCGBPalUpdate], a
	
TPPCredits_LogoScene
	; TODO: init command chaos
	ld bc, LOGO_DELAY

.loop_delay
	push bc
	call UpdateCommandChaos_Logo
	call DelayFrame
	pop bc
	dec bc
	ld a, b
	or c
	jr nz, .loop_delay
.loop_scroll
	ld c, 3
.loop_scroll2
	push bc
	call UpdateCommandChaos_Logo
	call DelayFrame
	pop bc
	dec c
	jr nz, .loop_scroll2
	ld a, [hSCY]
	inc a
	ld [hSCY], a
	cp $f8
	jr nz, .loop_scroll
	ld bc, LOGO_DELAY_POST
.loop_delay_post
	push bc
	call UpdateCommandChaos_Logo
	call DelayFrame
	pop bc
	dec bc
	ld a, b
	or c
	jr nz, .loop_delay_post
	call Fade2White
.todo
	call DelayFrame
	jr .todo
	
UpdateCommandChaos_Logo:
	; TODO
	ret
	
TC_DrawGraphic:
	push bc
	push hl
.loop2
	ld [hli], a
	inc a
	dec c
	jr nz, .loop2
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, TC_DrawGraphic
	ret
	
Fade2Black:
; fade all BGPs until it's pitch black
	ld e, 32
.loop
	; credits is currently in WRAM bank 5 so it's safe to do this
	ld hl, BGPals
	ld d, 32
.loop2
	ld a, [hl]
	and $1f
	jr z, .skip
	dec a
.skip
	ld c, a
	inc hl
	ld a, [hld]
	and $3
	ld b, a
	ld a, [hl]
	and $e0
	or b
	jr z, .skip2
	and $e0
	sub $20
	jr nc, .skip2
	dec b
.skip2
	or c
	ld [hli], a
	ld a, [hl]
	and $7c
	jr z, .skip3
	sub $4
.skip3
	or b
	ld [hli], a
	dec d
	jr nz, .loop2
	ld a, 1
	ld [hCGBPalUpdate], a
	call DelayFrame
	call DelayFrame
	dec e
	jr nz, .loop
	ret
	
Fade2White:
; fade all BGPs until it's white
	ld e, 32
.loop
	ld hl, BGPals
	ld d, 32
.loop2
	ld a, [hl]
	and $1f
	cp $1f
	jr z, .skip
	inc a
.skip
	ld c, a
	inc hl
	ld a, [hld]
	and $3
	ld b, a
	ld a, [hl]
	and $e0
	or b
	cp $e3
	jr z, .skip2
	and $e0
	add $20
	jr nc, .skip2
	inc b
.skip2
	or c
	ld [hli], a
	ld a, [hl]
	and $7c
	cp $7c
	jr z, .skip3
	add $4
.skip3
	or b
	ld [hli], a
	dec d
	jr nz, .loop2
	ld a, 1
	ld [hCGBPalUpdate], a
	call DelayFrame
	dec e
	jr nz, .loop
	ret
	
DecodeWLE:
; Walle Length Encoding decoder
	ld c, 0
	ld b, [hl]
	xor a
	sla b
	rla
	sla b
	rla
	push hl
	ld hl, .functable
	jp JumpTable
	
.functable
	dw .literal
	dw .repeat
	dw .increment
	dw .end
	
.literal
	pop hl
	ld a, [hli]
	and $3f
	ld b, a
.loopl
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .loopl
	ld c, a
	jr DecodeWLE

.repeat
	pop hl
	ld a, [hli]
	bit 5, a
	jr z, .nonewr
	ld c, [hl]
	inc hl
.nonewr
	and $1f
	ld b, a
	ld a, c
.loopr
	ld [de], a
	inc de
	dec b
	jr nz, .loopr
	jr DecodeWLE

.increment
	pop hl
	ld a, [hli]
	bit 5, a
	jr z, .nonewi
	ld c, [hl]
	inc hl
.nonewi
	and $1f
	ld b, a
	ld a, c
.loopi
	ld [de], a
	inc de
	inc a
	dec b
	jr nz, .loopi
	ld c, a
	jr DecodeWLE

.end
	pop hl
	ret
	
TPPCreditsList:
	tc_draw			TPPCreditsBG1
	tc_title		.director
	tc_subtitle		  .streamer
	tc_title		.projman
	tc_subtitle		  .revo
	tc_draw			TPPCreditsBG2
	tc_title		.programmer
	tc_subtitle		  .pikalax
	tc_subtitle		  .pigu
	tc_subtitle		  .koolboyman
	tc_subtitle		  .lightning
	tc_subtitle		  .chaos
	tc_subtitle		  .chauzu
	tc_subtitle		  .padz
	tc_draw			TPPCreditsBG3
	tc_title		.sprite
	tc_subtitle		  .eraclito
	tc_subtitle		  .pioxys
	tc_title		.music
	tc_subtitle		  .pigu
	tc_title		.gameplay
	tc_subtitle		  .lightning
	tc_subtitle		  .adda
	tc_subtitle		  .ego
	tc_subtitle		  .roy
	tc_subtitle		  .danimg
	tc_subtitle		  .koolboyman
	tc_title		.ai
	tc_subtitle		  .bee
	tc_draw			TPPCreditsBG4
	tc_title		.testers
	tc_subtitle		  .timmy
	tc_subtitle		  .eraclito
	tc_subtitle		  .chauzu
	tc_title		.disasm
	tc_subtitle		  .ii
	tc_subtitle		  .pret
	tc_subtitle		  .crystal
	tc_title		.special
	tc_subtitle		  .walle
	tc_subtitle		  .ninten
	tc_subtitle		  .gf
	tc_subtitle		  .twitch
	tc_subtitle		  .you
	db $ff
	
.director	db "Director@"
.projman	db "Project Manager@"
.programmer	db "Programmers@"
.sprite		db "Sprite Artists@"
.music		db "Music@"
.gameplay	db "Gameplay & Map@"
.ai			db "AI Design@"
.testers	db "Testers@"
.disasm		db "Original Disasm@"
.special	db "Special Thanks@"
	
.streamer	db "TwitchPlaysPokemon@"
.revo		db "ProjectRevoTPP@"
.pikalax	db "PikalaxALT@"
.pigu		db "Pigu@"
.koolboyman	db "Koolboyman@"
.lightning	db "LightningXCE@"
.chaos		db "chaos_lord2@"
.chauzu		db "Chauzu_VGC@"
.padz		db "padz@"
.eraclito	db "Eraclito@"
.pioxys		db "Pioxys@"
.adda		db "Addarash1@"
.ego		db "egobuff@"
.roy		db "Roysourking@"
.danimg		db "Danimg@"
.bee		db "beesafree@"
.timmy		db "TrainerTimmy@"
.ii			db "iimarckus@"
.pret		db "pret@"
.crystal	db "Crystal_@"
.walle		db "walle303@"
.ninten		db "Nintendo@"
.gf			db "Game Freak@"
.twitch		db "Twitch@"
.you		db "and You!@"

TCText_Version:
	db "Version ",_VERSION,"@"
	
TCText_Credits:
	db "-- Credits --@"

TextTransitionDelta:
; ∆₁[f](⌊3x²/256⌋)
	db 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1
	db 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1
	db 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2
	db 1, 1, 1, 1, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 1, 2
	db 1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1, 2, 2, 2, 2, 2
	db 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 2, 2, 2, 2, 3
	
TextTransitionIn1:
; initial position for top row transition in
	db 144, 146, 149, 151, 154, 156, 159, 162
	
TextTransitionIn2:
; initial position for middle row transition in
	db 144, 147, 149, 151, 154, 156, 158, 161
	
TextTransitionIn3:
; initial position for bottom row transition in
	db 144, 145, 147, 149, 151, 153, 155, 157
	
StripBounds:
	db   2,   6,  10,  16,  20,  24,  30,  34
	db  38,  44,  48,  52,  58,  62,  66,  72
	db  76,  80,  86,  90,  94, 100, 104, 108
	db 114, 118, 122, 126, 132, 136, 140, 146
	db 150, 154, 160, 164, 168, 174, 178, 182
	db 188, 192, 196, 202, 206, 210, 216, 220
	db 224, 230, 234, 238, 244, 248, 252,   0
	
; Tiles and attributes are encoded in WLE

TPPCreditsBG1: INCBIN "gfx/credits/bg1.w120.2bpp.lz"

TPPCreditsBG1Tiles:
	db $a2, $02, $6d, $00, $a3, $02, $6d, $00, $01
	db $01, $b0, $04, $b0, $04, $67, $19, $a7, $14
	db $69, $19, $a7, $14, $62, $19, $7f, $1b, $5f
	db $42, $70, $1c, $50, $70, $1d, $50, $70, $1c
	db $50, $70, $1d, $50, $70, $19, $50, $ff
	
TPPCreditsBG1Attrs:
	db $70, $0a, $50, $7f, $0b, $5f, $42, $70, $0c, $50
	db $70, $0d, $50, $7f, $0e, $5f, $7f, $0f, $5f, $ff
	
TPPCreditsBG1Pals:
	RGB 30, 30, 22
	RGB 24, 24, 19
	RGB 23, 23, 20
	RGB 19, 23, 21

	RGB 30, 29, 20
	RGB 23, 23, 18
	RGB 21, 22, 20
	RGB 18, 22, 21

	RGB 18, 21, 21
	RGB 18, 21, 20
	RGB 18, 20, 20
	RGB 17, 20, 20

	RGB 17, 20, 19
	RGB 17, 19, 19
	RGB 16, 19, 19
	RGB 16, 18, 18

	RGB 15, 18, 18
	RGB 14, 17, 18
	RGB 14, 16, 17
	RGB 13, 15, 17

	RGB 12, 14, 16
	RGB 11, 13, 15
	RGB 11, 12, 15
	RGB 10, 12, 15
	
TPPCreditsBG2: ; TODO

TPPCreditsBG3: INCBIN "gfx/credits/bg3.w96.2bpp.lz"

TPPCreditsBG3Tiles:
	db $7f, $00, $5f, $42, $7f, $01, $5f, $5f, $5f
	db $44, $66, $02, $01, $03, $67, $02, $01, $03
	db $67, $02, $01, $03, $67, $02, $02, $03, $02
	db $b0, $04, $b0, $04, $bf, $14, $9f, $82, $ff
	
TPPCreditsBG3Attrs:
	db $7f, $0f, $5f, $5f, $43, $70, $0e, $50, $70, $0d, $50, $70
	db $0c, $50, $7f, $0b, $5f, $42, $7f, $0a, $5f, $42, $ff

TPPCreditsBG3Pals:
	RGB 11, 15, 11
	RGB 10, 17, 10
	RGB 11, 19, 10
	RGB 18, 25, 10

	RGB 00, 00, 00
	RGB 12, 21, 10
	RGB 29, 23, 17
	RGB 18, 25, 10

	RGB 29, 23, 18
	RGB 29, 24, 18
	RGB 28, 24, 19
	RGB 27, 24, 19

	RGB 27, 24, 20
	RGB 26, 24, 20
	RGB 26, 24, 21
	RGB 25, 24, 21

	RGB 25, 25, 22
	RGB 24, 25, 22
	RGB 23, 25, 22
	RGB 22, 25, 23

	RGB 22, 26, 24
	RGB 20, 26, 25
	RGB 19, 26, 26
	RGB 18, 27, 26
	
TPPCreditsBG4: ; TODO
CommandsGFX: INCBIN "gfx/udlrab.1bpp"
StripGFX: INCBIN "gfx/credits/strip.1bpp"
StripTiles: INCBIN "gfx/credits/strip_map.wle"
	
