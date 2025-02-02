
_AnimateTileset:: ; fc000
; Iterate over a given pointer array of
; animation functions (one per frame).

; Typically in wra1, vra0

	ld a, [TilesetAnim]
	ld e, a
	ld a, [TilesetAnim + 1]
	ld d, a

	ld a, [hTileAnimFrame]
	ld l, a
	inc a
	ld [hTileAnimFrame], a

	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de

; 2-byte parameter
; All functions take input de.
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl

; Function address
	ld a, [hli]
	ld h, [hl]
	ld l, a

	jp [hl]
; fc01b


Tileset00Anim: ; 0xfc01b
Tileset02Anim: ; 0xfc01b
	dw $9140, AnimateWaterTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  TileAnimationPalette
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateFlowerTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  NextTileFrame8
	dw NULL,  DoneTileAnimation

Tileset03Anim: ; 0xfc01b
;	   param, function
	dw $9140, AnimateWaterTile
	dw NULL,  SafariFountainAnim4
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  TileAnimationPalette
	; dw NULL,  SafariFountainAnim3
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateKantoFlowerTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  NextTileFrame8
	dw NULL,  DoneTileAnimation
; 0xfc047

Tileset25Anim: ; 0xfc047
;	   param, function
	dw $9140, AnimateWaterTile
	dw NULL,  WaitTileAnimation
	dw $95f0, AnimateFountain
	dw NULL,  WaitTileAnimation
	dw NULL,  TileAnimationPalette
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateFlowerTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  NextTileFrame8
	dw NULL,  DoneTileAnimation
; 0xfc073

Tileset31Anim: ; 0xfc073
;	   param, function
	dw NULL,  ForestTreeLeftAnimation
	dw NULL,  ForestTreeRightAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  ForestTreeLeftAnimation2
	dw NULL,  ForestTreeRightAnimation2
	dw NULL,  AnimateFlowerTile
	dw $9140, AnimateWaterTile
	dw NULL,  TileAnimationPalette
	dw NULL,  NextTileFrame8
	dw NULL,  DoneTileAnimation
; 0xfc0a3

Tileset01Anim: ; 0xfc0a3
;	   param, function
	dw $9140, AnimateWaterTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  TileAnimationPalette
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateFlowerTile
	dw WhirlpoolFrames1, AnimateWhirlpoolTile
	dw WhirlpoolFrames2, AnimateWhirlpoolTile
	dw WhirlpoolFrames3, AnimateWhirlpoolTile
	dw WhirlpoolFrames4, AnimateWhirlpoolTile
	dw NULL,  WaitTileAnimation
	dw NULL,  NextTileFrame8
	dw NULL,  DoneTileAnimation
; 0xfc0d7

TilesetAnimfc0d7: ; 0xfc0d7
;	   param, function
	dw $9030, WriteTileToBuffer
	dw wcf41, ScrollTileRightLeft
	dw $9030, WriteTileFromBuffer
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateFlowerTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation
; 0xfc103

TilesetAnimfc103: ; 0xfc103
;	   param, function
	dw $9140, WriteTileToBuffer
	dw wcf41, ScrollTileRightLeft
	dw $9140, WriteTileFromBuffer
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation
; 0xfc12f

Tileset09Anim: ; 0xfc12f
Tileset42Anim:
;	   param, function
	dw $9140, AnimateWaterTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  TileAnimationPalette
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  NextTileFrame8
	dw NULL,  DoneTileAnimation
; 0xfc15f

Tileset15Anim: ; 0xfc15f
Tileset41Anim:
;	   param, function
	dw NULL,  SafariFountainAnim2
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  SafariFountainAnim1
	dw NULL,  WaitTileAnimation
	dw NULL,  NextTileFrame8
	dw NULL,  DoneTileAnimation
; 0xfc17f

TilesetAnimfc17f: ; 0xfc17f
;	   param, function
	dw $9530, WriteTileToBuffer
	dw wcf41, ScrollTileDown
	dw wcf41, ScrollTileDown
	dw $9530, WriteTileFromBuffer
	dw $9030, WriteTileToBuffer
	dw wcf41, ScrollTileRightLeft
	dw $9030, WriteTileFromBuffer
	dw $9530, WriteTileToBuffer
	dw wcf41, ScrollTileDown
	dw wcf41, ScrollTileDown
	dw $9530, WriteTileFromBuffer
	dw NULL,  DoneTileAnimation
; 0xfc1af

TilesetAnimfc1af: ; 0xfc1af
;	   param, function
	dw $9540, WriteTileToBuffer
	dw wcf41, ScrollTileDown
	dw wcf41, ScrollTileDown
	dw $9540, WriteTileFromBuffer
	dw NULL,  WaitTileAnimation
	dw $9030, WriteTileToBuffer
	dw wcf41, ScrollTileRightLeft
	dw $9030, WriteTileFromBuffer
	dw NULL,  WaitTileAnimation
	dw $9540, WriteTileToBuffer
	dw wcf41, ScrollTileDown
	dw wcf41, ScrollTileDown
	dw $9540, WriteTileFromBuffer
	dw NULL,  DoneTileAnimation
; 0xfc1e7

Tileset24Anim: ; 0xfc1e7
Tileset30Anim: ; 0xfc1e7
Tileset39Anim: ; 0xfc1e7
Tileset43Anim: ; 0xfc1e7
;	   param, function
	dw $9140, WriteTileToBuffer
	dw NULL,  Functionfc71e
	dw wcf41, ScrollTileRightLeft
	dw NULL,  Functionfc71e
	dw $9140, WriteTileFromBuffer
	dw NULL,  Functionfc71e
	dw NULL,  TileAnimationPalette
	dw NULL,  Functionfc71e
	dw $9400, WriteTileToBuffer
	dw NULL,  Functionfc71e
	dw wcf41, ScrollTileDown
	dw NULL,  Functionfc71e
	dw wcf41, ScrollTileDown
	dw NULL,  Functionfc71e
	dw wcf41, ScrollTileDown
	dw NULL,  Functionfc71e
	dw $9400, WriteTileFromBuffer
	dw NULL,  Functionfc71e
	dw NULL,  DoneTileAnimation
; 0xfc233

Tileset29Anim: ; 0xfc233
;	   param, function
	dw $9350, WriteTileToBuffer
	dw NULL,  Functionfc71e
	dw wcf41, ScrollTileRightLeft
	dw NULL,  Functionfc71e
	dw $9350, WriteTileFromBuffer
	dw NULL,  Functionfc71e
	dw NULL,  TileAnimationPalette
	dw NULL,  Functionfc71e
	dw $9310, WriteTileToBuffer
	dw NULL,  Functionfc71e
	dw wcf41, ScrollTileDown
	dw NULL,  Functionfc71e
	dw wcf41, ScrollTileDown
	dw NULL,  Functionfc71e
	dw wcf41, ScrollTileDown
	dw NULL,  Functionfc71e
	dw $9310, WriteTileFromBuffer
	dw NULL,  Functionfc71e
	dw NULL,  DoneTileAnimation
; 0xfc27f

Tileset23Anim: ; 0xfc27f
;	   param, function
	dw SproutPillarTilePointer9,  AnimateSproutPillarTile
	dw SproutPillarTilePointer10, AnimateSproutPillarTile
	dw SproutPillarTilePointer7,  AnimateSproutPillarTile
	dw SproutPillarTilePointer8,  AnimateSproutPillarTile
	dw SproutPillarTilePointer5,  AnimateSproutPillarTile
	dw SproutPillarTilePointer6,  AnimateSproutPillarTile
	dw SproutPillarTilePointer3,  AnimateSproutPillarTile
	dw SproutPillarTilePointer4,  AnimateSproutPillarTile
	dw SproutPillarTilePointer1,  AnimateSproutPillarTile
	dw SproutPillarTilePointer2,  AnimateSproutPillarTile
	dw NULL,  NextTileFrame
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation
; 0xfc2bf

TilesetAnimfc2bf: ; 0xfc2bf
	dw $94f0, WriteTileToBuffer
	dw wcf41, ScrollTileRightLeft
	dw $94f0, WriteTileFromBuffer
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation
; 0xfc2e7

Tileset40Anim:
	dw $9310, AnimateSpinnerNE_40
	dw $9300, AnimateSpinnerSE_40
	dw $9210, AnimateSpinnerNW_40
	dw $9200, AnimateSpinnerSW_40
	dw $9140, AnimateWaterTile
	dw NULL,  SafariFountainAnim5
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  TileAnimationPalette
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  NextTileFrame8
	dw NULL,  DoneTileAnimation

Tileset17Anim:
	dw $9040, AnimateSpinnerNE
	dw $9050, AnimateSpinnerSE
	dw $9060, AnimateSpinnerNW
	dw $9070, AnimateSpinnerSW
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  NextTileFrame8
	dw NULL,  DoneTileAnimation


AnimateSpinnerNE_40:
	ld a, 0
	jr AnimateSpinner_40
AnimateSpinnerSE_40:
	ld a, 1
	jr AnimateSpinner_40
AnimateSpinnerNW_40:
	ld a, 2
	jr AnimateSpinner_40
AnimateSpinnerSW_40:
	ld a, 3
	jr AnimateSpinner_40

AnimateSpinnerNE:
	ld a, 0
	jr AnimateSpinner
AnimateSpinnerSE:
	ld a, 1
	jr AnimateSpinner
AnimateSpinnerNW:
	ld a, 2
	jr AnimateSpinner
AnimateSpinnerSW:
	ld a, 3
;	jr AnimateSpinner

AnimateSpinner:
	push af
	ld a, 1
	ld [rVBK], a
	pop af

AnimateSpinner_40:
	ld hl, [sp+0]
	ld b, h
	ld c, l

	ld hl, .frames
	and a
	jr z, .aite
.loop
	push af
	ld a, $10 * 8
	add l
	ld l, a
	jr nc, .ok
	inc h
.ok
	pop af
	dec a
	jr nz, .loop
.aite

	ld a, [TileAnimationTimer]
	; cp 3
	; jr c, .ok3
	; add 2
.ok3
	swap a ; * 16
	add l
	ld l, a
	jr nc, .ok2
	inc h
.ok2

	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.frames
INCBIN "gfx/tilesets/spinner/ne.2bpp"
INCBIN "gfx/tilesets/spinner/se.2bpp"
INCBIN "gfx/tilesets/spinner/nw.2bpp"
INCBIN "gfx/tilesets/spinner/sw.2bpp"
Tileset21Anim: ; 0xfc2e7
;	   param, function
	dw NULL,  PokeComCenter_FlickerScreen
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation

Tileset04Anim: ; 0xfc2e7
Tileset05Anim: ; 0xfc2e7
Tileset06Anim: ; 0xfc2e7
Tileset07Anim: ; 0xfc2e7
Tileset08Anim: ; 0xfc2e7
Tileset10Anim: ; 0xfc2e7
Tileset11Anim: ; 0xfc2e7
Tileset12Anim: ; 0xfc2e7
Tileset13Anim: ; 0xfc2e7
Tileset14Anim: ; 0xfc2e7
Tileset16Anim: ; 0xfc2e7
Tileset18Anim: ; 0xfc2e7
Tileset19Anim: ; 0xfc2e7
Tileset20Anim: ; 0xfc2e7
Tileset22Anim: ; 0xfc2e7
Tileset26Anim: ; 0xfc2e7
Tileset27Anim: ; 0xfc2e7
Tileset28Anim: ; 0xfc2e7
Tileset32Anim: ; 0xfc2e7
Tileset33Anim: ; 0xfc2e7
Tileset34Anim: ; 0xfc2e7
Tileset35Anim: ; 0xfc2e7
Tileset36Anim: ; 0xfc2e7
Tileset37Anim:
Tileset38Anim:
;	   param, function
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation
; 0xfc2fb

; SpinTiles_Next:
	; ld a, [TileAnimationTimer]
	; inc a
	; mod 8
	; ld [TileAnimationTimer], a

DoneTileAnimation: ; fc2fb
; Reset the animation command loop.
	xor a
	ld [hTileAnimFrame], a

WaitTileAnimation: ; fc2fe
; Do nothing this frame.
	ret
; fc2ff

NextTileFrame8: ; fc2ff
	ld a, [TileAnimationTimer]
	inc a
	and a, 7
	ld [TileAnimationTimer], a
	ret
; fc309


ScrollTileRightLeft: ; fc309
; Scroll right for 4 ticks, then left for 4 ticks.
	ld a, [TileAnimationTimer]
	inc a
	and 7
	ld [TileAnimationTimer], a
	and 4
	jr nz, ScrollTileLeft
	jr ScrollTileRight
; fc318

ScrollTileUpDown: ; fc318
; Scroll up for 4 ticks, then down for 4 ticks.
	ld a, [TileAnimationTimer]
	inc a
	and 7
	ld [TileAnimationTimer], a
	and 4
	jr nz, ScrollTileDown
	jr ScrollTileUp
; fc327

ScrollTileLeft: ; fc327
	ld h, d
	ld l, e
	ld c, 4
.loop
	rept 4
	ld a, [hl]
	rlca
	ld [hli], a
	endr
	dec c
	jr nz, .loop
	ret
; fc33b

ScrollTileRight: ; fc33b
	ld h, d
	ld l, e
	ld c, 4
.loop
	rept 4
	ld a, [hl]
	rrca
	ld [hli], a
	endr
	dec c
	jr nz, .loop
	ret
; fc34f

ScrollTileUp: ; fc34f
	ld h, d
	ld l, e
	ld d, [hl]
	inc hl
	ld e, [hl]
	ld bc, $e
	add hl, bc
	ld a, 4
.loop
	ld c, [hl]
	ld [hl], e
	dec hl
	ld b, [hl]
	ld [hl], d
	dec hl
	ld e, [hl]
	ld [hl], c
	dec hl
	ld d, [hl]
	ld [hl], b
	dec hl
	dec a
	jr nz, .loop
	ret
; fc36a

ScrollTileDown: ; fc36a
	ld h, d
	ld l, e
	ld de, $e
	push hl
	add hl, de
	ld d, [hl]
	inc hl
	ld e, [hl]
	pop hl
	ld a, 4
.loop
	ld b, [hl]
	ld [hl], d
	inc hl
	ld c, [hl]
	ld [hl], e
	inc hl
	ld d, [hl]
	ld [hl], b
	inc hl
	ld e, [hl]
	ld [hl], c
	inc hl
	dec a
	jr nz, .loop
	ret
; fc387


AnimateFountain: ; fc387
	ld hl, [sp+0]
	ld b, h
	ld c, l
	ld hl, .frames
	ld a, [TileAnimationTimer]
	and 7
	add a
	add l
	ld l, a
	jr nc, .asm_fc399
	inc h

.asm_fc399
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.frames
	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame1

.frame1 INCBIN "gfx/tilesets/fountain/1.2bpp"
.frame2 INCBIN "gfx/tilesets/fountain/2.2bpp"
.frame3 INCBIN "gfx/tilesets/fountain/3.2bpp"
.frame4 INCBIN "gfx/tilesets/fountain/4.2bpp"
.frame5 INCBIN "gfx/tilesets/fountain/5.2bpp"
; fc402


AnimateWaterTile: ; fc402
; Draw a water tile for the current frame in VRAM tile at de.

; Save sp in bc (see WriteTile).
	ld hl, [sp+0]
	ld b, h
	ld c, l

	ld a, [TileAnimationTimer]

; 4 tile graphics, updated every other frame.
	and 3 << 1

; 2 x 8 = 16 bytes per tile
	add a
	add a
	add a

	add WaterTileFrames % $100
	ld l, a
	ld a, 0
	adc WaterTileFrames / $100
	ld h, a

; Stack now points to the start of the tile for this frame.
	ld sp, hl

	ld l, e
	ld h, d

	jp WriteTile
; fc41c

WaterTileFrames: ; fc41c
	INCBIN "gfx/tilesets/water.2bpp"
; fc45c


ForestTreeLeftAnimation: ; fc45c
	ld hl, [sp+0]
	ld b, h
	ld c, l

; Only during the Celebi event.
	ld a, [wdbf3]
	bit 2, a
	jr nz, .asm_fc46c
	ld hl, ForestTreeLeftFrames
	jr .asm_fc47d

.asm_fc46c
	ld a, [TileAnimationTimer]
	call GetForestTreeFrame
	add a
	add a
	add a
	add ForestTreeLeftFrames % $100
	ld l, a
	ld a, 0
	adc ForestTreeLeftFrames / $100
	ld h, a

.asm_fc47d
	ld sp, hl
	ld hl, $90c0
	jp WriteTile
; fc484


ForestTreeLeftFrames: ; fc484
	INCBIN "gfx/tilesets/forest-tree/1.2bpp"
	INCBIN "gfx/tilesets/forest-tree/2.2bpp"
; fc4a4

ForestTreeRightFrames: ; fc4a4
	INCBIN "gfx/tilesets/forest-tree/3.2bpp"
	INCBIN "gfx/tilesets/forest-tree/4.2bpp"
; fc4c4


ForestTreeRightAnimation: ; fc4c4
	ld hl, [sp+0]
	ld b, h
	ld c, l

; Only during the Celebi event.
	ld a, [wdbf3]
	bit 2, a
	jr nz, .asm_fc4d4
	ld hl, ForestTreeRightFrames
	jr .asm_fc4eb

.asm_fc4d4
	ld a, [TileAnimationTimer]
	call GetForestTreeFrame
	add a
	add a
	add a
	add ForestTreeLeftFrames % $100
	ld l, a
	ld a, 0
	adc ForestTreeLeftFrames / $100
	ld h, a
	push bc
	ld bc, ForestTreeRightFrames - ForestTreeLeftFrames
	add hl, bc
	pop bc

.asm_fc4eb
	ld sp, hl
	ld hl, $90f0
	jp WriteTile
; fc4f2


ForestTreeLeftAnimation2: ; fc4f2
	ld hl, [sp+0]
	ld b, h
	ld c, l

; Only during the Celebi event.
	ld a, [wdbf3]
	bit 2, a
	jr nz, .asm_fc502
	ld hl, ForestTreeLeftFrames
	jr .asm_fc515

.asm_fc502
	ld a, [TileAnimationTimer]
	call GetForestTreeFrame
	xor 2
	add a
	add a
	add a
	add ForestTreeLeftFrames % $100
	ld l, a
	ld a, 0
	adc ForestTreeLeftFrames / $100
	ld h, a

.asm_fc515
	ld sp, hl
	ld hl, $90c0
	jp WriteTile
; fc51c


ForestTreeRightAnimation2: ; fc51c
	ld hl, [sp+0]
	ld b, h
	ld c, l

; Only during the Celebi event.
	ld a, [wdbf3]
	bit 2, a
	jr nz, .asm_fc52c
	ld hl, ForestTreeRightFrames
	jr .asm_fc545

.asm_fc52c
	ld a, [TileAnimationTimer]
	call GetForestTreeFrame
	xor 2
	add a
	add a
	add a
	add ForestTreeLeftFrames % $100
	ld l, a
	ld a, 0
	adc ForestTreeLeftFrames / $100
	ld h, a
	push bc
	ld bc, ForestTreeRightFrames - ForestTreeLeftFrames
	add hl, bc
	pop bc

.asm_fc545
	ld sp, hl
	ld hl, $90f0
	jp WriteTile
; fc54c


GetForestTreeFrame: ; fc54c
; Return 0 if a is even, or 2 if odd.
	and a
	jr z, .even
	cp 1
	jr z, .odd
	cp 2
	jr z, .even
	cp 3
	jr z, .odd
	cp 4
	jr z, .even
	cp 5
	jr z, .odd
	cp 6
	jr z, .even
.odd
	ld a, 2
	scf
	ret
.even
	xor a
	ret
; fc56d


AnimateFlowerTile: ; fc56d
; No parameters.

; Save sp in bc (see WriteTile).
	ld hl, [sp+0]
	ld b, h
	ld c, l

; Alternate tile graphic every other frame
	ld a, [TileAnimationTimer]
	and 1 << 1
	ld e, a

; CGB has different color mappings for flowers.
	ld a, [hCGB]
	and 1

	add e
	swap a ; << 4 (16 bytes)
	ld e, a
	ld d, 0
	ld hl, .Frames
	add hl, de
	ld sp, hl

	ld hl, VTiles2 + $30 ; tile 4

	jp WriteTile
; fc58c

.Frames: ; fc58c
	INCBIN "gfx/tilesets/flower/dmg_1.2bpp"
	INCBIN "gfx/tilesets/flower/cgb_1.2bpp"
	INCBIN "gfx/tilesets/flower/dmg_2.2bpp"
	INCBIN "gfx/tilesets/flower/cgb_2.2bpp"
; fc5cc

AnimateKantoFlowerTile: ; fc56d
; No parameters.

; Save sp in bc (see WriteTile).
	ld hl, [sp+0]
	ld b, h
	ld c, l

; Alternate tile graphic every other frame
	ld a, [TileAnimationTimer]
	and $6
	ld e, a

; CGB has different color mappings for flowers.
	ld a, [hCGB]
	and 1

	add e
	swap a ; << 4 (16 bytes)
	ld e, a
	ld d, 0
	ld hl, .Frames
	add hl, de
	ld sp, hl

	ld hl, VTiles2 + $30 ; tile 4

	jp WriteTile
; fc58c

.Frames: ; fc58c
	INCBIN "gfx/tilesets/kanto_flowers/dmg_1.2bpp"
	INCBIN "gfx/tilesets/kanto_flowers/cgb_1.2bpp"
	INCBIN "gfx/tilesets/kanto_flowers/dmg_2.2bpp"
	INCBIN "gfx/tilesets/kanto_flowers/cgb_2.2bpp"
	INCBIN "gfx/tilesets/kanto_flowers/dmg_3.2bpp"
	INCBIN "gfx/tilesets/kanto_flowers/cgb_3.2bpp"
	INCBIN "gfx/tilesets/kanto_flowers/dmg_4.2bpp"
	INCBIN "gfx/tilesets/kanto_flowers/cgb_4.2bpp"
; fc5cc

SafariFountainAnim1: ; fc5cc
; Splash in the bottom-right corner of the fountain.
	ld hl, [sp+0]
	ld b, h
	ld c, l
	ld a, [TileAnimationTimer]
	and 6
	srl a
	inc a
	inc a
	and 3
	swap a
	ld e, a
	ld d, 0
	ld hl, SafariFountainFrames
	add hl, de
	ld sp, hl
	ld hl, $95b0
	jp WriteTile
; fc5eb


SafariFountainAnim2: ; fc5eb
; Splash in the top-left corner of the fountain.
	ld hl, [sp+0]
	ld b, h
	ld c, l
	ld a, [TileAnimationTimer]
	and 6
	add a
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, SafariFountainFrames
	add hl, de
	ld sp, hl
	ld hl, $9380
	jp WriteTile
; fc605


SafariFountainAnim3: ; fc5cc
; Splash in the bottom-right corner of the fountain.
	ld a, [rVBK]
	push af
	ld a, 1
	ld [rVBK], a
	call .AnimateTile
	pop af
	ld [rVBK], a
	ret
.AnimateTile:
	ld hl, [sp+0]
	ld b, h
	ld c, l
	ld a, [TileAnimationTimer]
	and 6
	srl a
	inc a
	inc a
	and 3
	swap a
	ld e, a
	ld d, 0
	ld hl, SafariFountainFrames
	add hl, de
	ld sp, hl
	ld hl, $9370
	jp WriteTile
; fc5eb

SafariFountainAnim4: ; fc5eb
; Splash in the top-left corner of the fountain.
	ld a, [rVBK]
	push af
	ld a, 1
	ld [rVBK], a
	call .AnimateTile
	pop af
	ld [rVBK], a
	ret
	
.AnimateTile:
	ld hl, [sp+0]
	ld b, h
	ld c, l
	ld a, [TileAnimationTimer]
	and 6
	add a
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, SafariFountainFrames
	add hl, de
	ld sp, hl
	ld hl, $9380
	jp WriteTile
; fc605

SafariFountainAnim5: ; fc5eb
; Splash in the top-left corner of the fountain.
	ld a, [rVBK]
	push af
	ld a, 1
	ld [rVBK], a
	call .AnimateTile
	pop af
	ld [rVBK], a
	ret
	
.AnimateTile:
	ld hl, [sp+0]
	ld b, h
	ld c, l
	ld a, [TileAnimationTimer]
	and 6
	add a
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, SafariFountainFrames
	add hl, de
	ld sp, hl
	ld hl, $9220
	jp WriteTile	

SafariFountainFrames: ; fc605
	INCBIN "gfx/tilesets/safari/1.2bpp"
	INCBIN "gfx/tilesets/safari/2.2bpp"
	INCBIN "gfx/tilesets/safari/3.2bpp"
	INCBIN "gfx/tilesets/safari/4.2bpp"
; fc645


AnimateSproutPillarTile: ; fc645
; Read from struct at de:
; 	Destination (VRAM)
;	Address of the first tile in the frame array

	ld hl, [sp+0]
	ld b, h
	ld c, l

	ld a, [TileAnimationTimer]
	and 7

; Get frame index a
	ld hl, .frames
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, [hl]

; Destination
	ld l, e
	ld h, d
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl

; Add the frame index to the starting address
	add [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld a, 0
	adc h
	ld h, a

	ld sp, hl
	ld l, e
	ld h, d
	jr WriteTile

.frames
	db $00, $10, $20, $30, $40, $30, $20, $10
; fc673


NextTileFrame: ; fc673
	ld hl, TileAnimationTimer
	inc [hl]
	ret
; fc678


AnimateWhirlpoolTile: ; fc678
; Update whirlpool tile using struct at de.

; Struct:
; 	VRAM address
;	Address of the first tile

; Only does one of 4 tiles at a time.

; Save sp in bc (see WriteTile).
	ld hl, [sp+0]
	ld b, h
	ld c, l

; de = VRAM address
	ld l, e
	ld h, d
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
; Tile address is now at hl.

; Get the tile for this frame.
	ld a, [TileAnimationTimer]
	and %11 ; 4 frames x2
	swap a  ; * 16 bytes per tile

	add [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld a, 0
	adc h
	ld h, a

; Stack now points to the desired frame.
	ld sp, hl

	ld l, e
	ld h, d

	jr WriteTile
; fc696


WriteTileFromBuffer: ; fc696
; Write tiledata at wcf41 to de.
; wcf41 is loaded to sp for WriteTile.

	ld hl, [sp+0]
	ld b, h
	ld c, l

	ld hl, wcf41
	ld sp, hl

	ld h, d
	ld l, e
	jr WriteTile
; fc6a2


WriteTileToBuffer: ; fc6a2
; Write tiledata de to wcf41.
; de is loaded to sp for WriteTile.

	ld hl, [sp+0]
	ld b, h
	ld c, l

	ld h, d
	ld l, e
	ld sp, hl

	ld hl, wcf41

	; fallthrough

WriteTile: ; fc6ac
; Write one 8x8 tile ($10 bytes) from sp to hl.

; Warning: sp is saved in bc so we can abuse pop.
; sp is restored to address bc. Save sp in bc before calling.

	pop de
	ld [hl], e
	inc hl
	ld [hl], d

rept 7
	pop de
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
endr

; restore sp
	ld h, b
	ld l, c
	ld sp, hl
	ret
; fc6d7


TileAnimationPalette: ; fc6d7
; Transition between color values 0-2 for color 0 in palette 3.

; No palette changes on DMG.
	ld a, [hCGB]
	and a
	ret z

; We don't want to mess with non-standard palettes.
	ld a, [rBGP] ; BGP
	cp %11100100
	ret nz

; Only update on even frames.
	ld a, [TileAnimationTimer]
	ld l, a
	and 1 ; odd
	ret nz

; Ready for BGPD input...
	ld a, %10011000 ; auto increment, index $18 (pal 3 color 0)
	ld [rBGPI], a

	ld a, [rSVBK]
	push af
	ld a, 5 ; wra5: gfx
	ld [rSVBK], a

; Update color 0 in order 0 1 2 1

	ld a, l
	and %110 ; frames 0 2 4 6

	jr z, .color0

	cp 4
	jr z, .color2

.color1
	ld hl, Unkn1Pals + $1a ; pal 3 color 1
	ld a, [hli]
	ld [rBGPD], a
	ld a, [hli]
	ld [rBGPD], a
	jr .end

.color0
	ld hl, Unkn1Pals + $18 ; pal 3 color 0
	ld a, [hli]
	ld [rBGPD], a
	ld a, [hli]
	ld [rBGPD], a
	jr .end

.color2
	ld hl, Unkn1Pals + $1c ; pal 3 color 2
	ld a, [hli]
	ld [rBGPD], a
	ld a, [hli]
	ld [rBGPD], a

.end
	pop af
	ld [rSVBK], a
	ret
; fc71e


Functionfc71e: ; fc71e
	ld a, [hCGB]
	and a
	ret z

	ld a, [rBGP]
	cp $e4
	ret nz

	ld a, [wd847]
	cp $ff
	ret nz

	ld a, [rSVBK]
	push af

	ld a, 5
	ld [rSVBK], a
	ld a, $a0
	ld [rBGPI], a
	ld a, [$ff9b]
	and 2
	jr nz, .asm_fc743
	ld hl, Unkn1Pals + $20
	jr .asm_fc746

.asm_fc743
	ld hl, Unkn1Pals + $22

.asm_fc746
	ld a, [hli]
	ld [rBGPD], a
	ld a, [hli]
	ld [rBGPD], a

	pop af
	ld [rSVBK], a
	ret
; fc750


SproutPillarTilePointer1:  dw $92d0, SproutPillarTile1
SproutPillarTilePointer2:  dw $92f0, SproutPillarTile2
SproutPillarTilePointer3:  dw $93d0, SproutPillarTile3
SproutPillarTilePointer4:  dw $93f0, SproutPillarTile4
SproutPillarTilePointer5:  dw $93c0, SproutPillarTile5
SproutPillarTilePointer6:  dw $92c0, SproutPillarTile6
SproutPillarTilePointer7:  dw $94d0, SproutPillarTile7
SproutPillarTilePointer8:  dw $94f0, SproutPillarTile8
SproutPillarTilePointer9:  dw $95d0, SproutPillarTile9
SproutPillarTilePointer10: dw $95f0, SproutPillarTile10

SproutPillarTile1:  INCBIN "gfx/tilesets/sprout-pillar/1.2bpp"
SproutPillarTile2:  INCBIN "gfx/tilesets/sprout-pillar/2.2bpp"
SproutPillarTile3:  INCBIN "gfx/tilesets/sprout-pillar/3.2bpp"
SproutPillarTile4:  INCBIN "gfx/tilesets/sprout-pillar/4.2bpp"
SproutPillarTile5:  INCBIN "gfx/tilesets/sprout-pillar/5.2bpp"
SproutPillarTile6:  INCBIN "gfx/tilesets/sprout-pillar/6.2bpp"
SproutPillarTile7:  INCBIN "gfx/tilesets/sprout-pillar/7.2bpp"
SproutPillarTile8:  INCBIN "gfx/tilesets/sprout-pillar/8.2bpp"
SproutPillarTile9:  INCBIN "gfx/tilesets/sprout-pillar/9.2bpp"
SproutPillarTile10: INCBIN "gfx/tilesets/sprout-pillar/10.2bpp"
; fca98


WhirlpoolFrames1: dw $9320, WhirlpoolTiles1
WhirlpoolFrames2: dw $9330, WhirlpoolTiles2
WhirlpoolFrames3: dw $9420, WhirlpoolTiles3
WhirlpoolFrames4: dw $9430, WhirlpoolTiles4
; fcaa8

WhirlpoolTiles1: INCBIN "gfx/tilesets/whirlpool/1.2bpp"
WhirlpoolTiles2: INCBIN "gfx/tilesets/whirlpool/2.2bpp"
WhirlpoolTiles3: INCBIN "gfx/tilesets/whirlpool/3.2bpp"
WhirlpoolTiles4: INCBIN "gfx/tilesets/whirlpool/4.2bpp"
; fcba8

PokeComCenter_FlickerScreen:
	ld a, [rVBK]
	push af
	ld a, 1
	ld [rVBK], a

	ld hl, $90e0
	ld a, $20
.loop
	push af
	and 1
	jr z, .left
	rrc [hl]
	jr .okay

.left
	rlc [hl]
.okay
	inc hl
	pop af
	dec a
	jr nz, .loop

	pop af
	ld [rVBK], a
	ret

