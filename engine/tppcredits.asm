SECTION "TPPCredits", ROMX;, BANK[CREDITS]

LOGO_DELAY      EQU 300
LOGO_DELAY_POST EQU 300
LOGO_CHAOS_MOD  EQU 12
LOGO_CHAOS_LAST EQU 10
MAIN_CHAOS_RATE EQU 15
SCROLLER_DELAY  EQU 200
SPRITE_X        EQU $7C
SPRITE_Y        EQU $74
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
	
TPPCredits_LogoSceneInit::
	
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
	ld hl, VTiles0
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
	
TPPCredits_LogoScene::
	call ClearCommandChaos
	ld a, LOGO_CHAOS_MOD
	ld [TC_ChaosRateMod], a
	ld a, ((LOGO_DELAY + 544) / LOGO_CHAOS_MOD) + LOGO_CHAOS_LAST
	ld [TC_ChaosRate], a
	ld bc, LOGO_DELAY

.loop_delay
	push bc
	call UpdateCommandChaos_Logo
	call TC_DelayFrame
	ld a, [TC_ChaosRateMod]
	dec a
	ld [TC_ChaosRateMod], a
	and a
	jr nz, .skipmod_delay
	ld a, [TC_ChaosRate]
	dec a
	ld [TC_ChaosRate], a
	ld a, LOGO_CHAOS_MOD
	ld [TC_ChaosRateMod], a
.skipmod_delay
	pop bc
	dec bc
	ld a, b
	or c
	jr nz, .loop_delay
.loop_scroll
	ld c, 4
.loop_scroll2
	push bc
	call UpdateCommandChaos_Logo
	call TC_DelayFrame
	ld a, [TC_ChaosRateMod]
	dec a
	ld [TC_ChaosRateMod], a
	and a
	jr nz, .skipmod_scroll
	ld a, [TC_ChaosRate]
	dec a
	ld [TC_ChaosRate], a
	ld a, LOGO_CHAOS_MOD
	ld [TC_ChaosRateMod], a
.skipmod_scroll
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
	call TC_DelayFrame
	pop bc
	dec bc
	ld a, b
	or c
	jr nz, .loop_delay_post
	ld hl, UpdateCommandChaos_Logo
	ld a, l
	ld [TC_FadeUpdateAddr], a
	ld a, h
	ld [TC_FadeUpdateAddr + 1], a
	call Fade2White
	
TPPCredits_MainSceneInit::
	call TC_DelayFrame
	call DisableLCD
	call DoubleSpeed
	call ClearTileMap
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld [rSCX], a
	ld [rSCY], a
	ld [rIF], a
	ld a, $9b
	ld [hBGMapAddress + 1], a
	ld a, 1 ; don't let the other intterupts mess with our trick
	ld [rIE], a
	
; copy commands
	ld hl, CommandsGFX
	ld de, VTiles0 + $c80
	ld bc, CommandsGFXEnd - CommandsGFX
	call CopyBytes
	
; copy underscore
	ld hl, UnderscoreGFX
	ld de, VTiles1 + $640
	ld bc, UnderscoreGFXEnd - UnderscoreGFX
	ld a, BANK(UnderscoreGFX)
	call FarCopyBytesDouble

; copy strips
	ld hl, StripGFX
	ld de, VTiles2
	ld bc, StripGFXEnd - StripGFX
	ld a, BANK(StripGFX)
	call FarCopyBytesDouble
	ld hl, StripTiles
	ld de, VBGMap0 + $140
	call DecodeWLE
	ld a, 1
	ld [rVBK], a
	ld hl, VBGMap0 + $140
	ld bc, 32 * 7
	ld a, 1
	call ByteFill
	xor a
	ld [rVBK], a
	ld [TC_CreditsPos], a
	xor a
	ld hl, OBPals + 8 * 7
	ld bc, 6
	call ByteFill
	ld a, $ff
	ld [OBPals + 62], a
	ld a, $7f
	ld [OBPals + 63], a
	
; init pokepic sprites
	ld hl, TC_Sprites + 3
	ld bc, 4
	ld d, 16
	ld a, $80 ; pal 0 behind bg
.loop
	ld [hl], a
	add hl, bc
	dec d
	jr nz, .loop
	ld d, 16
	inc a ; pal 1 behind bg
.loop2
	ld [hl], a
	add hl, bc
	dec d
	jr nz, .loop2
	xor a
	ld hl, TC_Sprites + (32 * 4)
	ld bc, 8 * 4
	call ByteFill
	
	ld a, $20
	ld [hBGMapAddress], a
	ld a, $9a
	ld [hBGMapAddress + 1], a
	
TPPCredits_MainScene::
	ld a, [TC_CreditsPos]
	ld hl, TPPCreditsList
	ld bc, 3
	call AddNTimes
	ld a, [hli]
	cp $ff
	jr z, .end
	push hl
	ld hl, TC_MainSceneFuncList
	jp JumpTable
.end
.todo
	call TC_DelayFrame
	jr .todo
	
TC_MainSceneFuncList:
	dw TC_Main_Draw
	dw TC_Main_Title
	dw TC_Main_Subtitle
	
TC_Main_Draw::
	call DisableLCD
	call ClearCommandChaos
	pop hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a ; lz pointer
	push hl
	ld h, d
	ld l, e
	ld de, VTiles1
	ld a, 1
	ld [rVBK], a
	call Decompress
	pop hl
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	ld h, d
	ld l, e
	ld de, VBGMap0
	call DecodeWLE ; attr map
	xor a
	ld [rVBK], a
	pop hl
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	ld h, d
	ld l, e
	ld de, VBGMap0
	call DecodeWLE ; tile map
	pop hl
	ld a, [hli]
	push hl
	ld h, [hl]
	ld l, a
	ld de, Unkn1Pals
	ld bc, 8 * 10
	call CopyBytes
	pop hl
	inc hl
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a ; sprite lz pointer
	push hl
	ld h, d
	ld l, e
	ld de, VTiles0
	call Decompress
	pop hl
	ld a, [hli]
	ld [TC_CurBGSpeed], a
	ld a, [hli]
	ld [TC_CurSprSpeed], a
	ld a, [hli]
	ld [TC_CurStripWidth], a
	xor a
	ld [TC_CurStripXPos], a
	ld [TC_CurSubtitlePos], a
	inc a
	ld [TC_CurBGSpeedCount], a
	ld [TC_CurSprSpeedCount], a
	ld a, 3
	ld [TC_CurSprPos], a
	ld a, $ff
	ld [TC_CurStripSpeed], a
	ld [TC_CurStripSpeedCount], a
	push hl
	call ClearCreditsBox_NoLCD
	call EnableLCD
	ld a, MAIN_CHAOS_RATE
	ld [TC_ChaosRate], a
	ld hl, UpdateCommandChaos_MainIn
	ld a, l
	ld [TC_FadeUpdateAddr], a
	ld a, h
	ld [TC_FadeUpdateAddr + 1], a
	call RelativeFade
	pop hl
	ld a, [hl]
	ld [TC_CurStripSpeed], a
	ld a, 1
	ld [TC_CurStripSpeedCount], a
	ld b, 60
.loop_delay
	push bc
	call UpdateCommandChaos_Main
	call TC_DelayFrame
	pop bc
	dec b
	jr nz, .loop_delay
	ld a, [TC_CreditsPos]
	inc a
	ld [TC_CreditsPos], a
	jp TPPCredits_MainScene
	
TC_Main_Title:
	pop hl
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	call InitTransitionIn1
	ld a, 1
	call DoScrollerTransition
	ld b, SCROLLER_DELAY
.loop_delay
	push bc
	call UpdateCommandChaos_Main
	call TC_DelayFrame
	pop bc
	dec b
	jr nz, .loop_delay
	pop hl
	ld a, [hl]
	cp C_TC_DRAW
	jr z, .doout
	cp C_TC_TITLE
	jr nz, .skip
	ld a, 4
	call DoScrollerTransition
	call ClearCreditsBox
	jr .skip
.doout
	ld a, 4
	call DoScrollerTransition
	call ClearCreditsBox
	ld hl, UpdateCommandChaos_Main
	ld a, l
	ld [TC_FadeUpdateAddr], a
	ld a, h
	ld [TC_FadeUpdateAddr + 1], a
	call Fade2White
.skip
	xor a
	ld [TC_CurSubtitlePos], a
	ld a, [TC_CreditsPos]
	inc a
	ld [TC_CreditsPos], a
	jp TPPCredits_MainScene
	
TC_Main_Subtitle:
	pop hl
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	ld a, [TC_CurSubtitlePos]
	and a
	jr nz, .bottom
	call InitTransitionIn2
	ld a, 2
	jr .dotrans
.bottom
	call InitTransitionIn3
	ld a, 3
.dotrans
	call DoScrollerTransition
	ld b, SCROLLER_DELAY
.loop_delay
	push bc
	call UpdateCommandChaos_Main
	call TC_DelayFrame
	pop bc
	dec b
	jr nz, .loop_delay
	pop hl
	ld a, [hl]
	cp C_TC_DRAW
	jr z, .doout
	cp C_TC_TITLE
	jr z, .dotitle
	cp C_TC_SUBTITLE
	jr nz, .skip
	ld a, [TC_CurSubtitlePos]
	inc a
	ld [TC_CurSubtitlePos], a
	cp 2
	jr nz, .skip
	xor a
	ld [TC_CurSubtitlePos], a
	ld a, 5
	call DoScrollerTransition
	ld a, $7f
	ld hl, TileMap + SCREEN_WIDTH * 3
	ld bc, SCREEN_WIDTH * 3
	call ByteFill
	call UpdateCreditsBox
	jr .skip
.doout
	ld a, 4
	call DoScrollerTransition
	call ClearCreditsBox
	ld hl, UpdateCommandChaos_Main
	ld a, l
	ld [TC_FadeUpdateAddr], a
	ld a, h
	ld [TC_FadeUpdateAddr + 1], a
	call Fade2White
	jr .skip
.dotitle
	ld a, 4
	call DoScrollerTransition
	call ClearCreditsBox
.skip
	ld a, [TC_CreditsPos]
	inc a
	ld [TC_CreditsPos], a
	jp TPPCredits_MainScene
	
ClearCreditsBox_NoLCD:
	ld a, $7f
	ld hl, $9a40
	ld bc, 32 * 5
	call ByteFill
	ld a, $7f
	ld hl, TileMap + SCREEN_WIDTH
	ld bc, SCREEN_WIDTH * 5
	jp ByteFill
	
ClearCreditsBox:
	ld a, $7f
	ld hl, TileMap + SCREEN_WIDTH
	ld bc, SCREEN_WIDTH * 5
	call ByteFill
	
UpdateCreditsBox:
	ld a, 1
	ld [hBGMapMode], a
	xor a
	ld [hBGMapThird], a
	call UpdateCommandChaos_Main
	call TC_DelayFrame
	xor a
	ld [hBGMapMode], a
	ret
	
InitTransitionIn1:
	hlcoord 1, 1
	call PlaceString 
	; TODO
	ret
	
InitTransitionIn2:
	hlcoord 1, 3
	call PlaceString 
	; TODO
	ret
	
InitTransitionIn3:
	hlcoord 1, 5
	call PlaceString 
	; TODO
	ret
	
DoScrollerTransition:
; 1 = top row in
; 2 = middle row in
; 3 = bottom row in
; 4 = all out
; 5 = all except top out
	ld [TC_ScrollerStateReq], a
	call UpdateCreditsBox
	ld a, [TC_ScrollerStateReq]
	ld [TC_ScrollerState], a
.loop
	call UpdateCommandChaos_Main
	call TC_DelayFrame
	;ld a, [TC_ScrollerState]
	;and a
	;jr nz, .loop ; not done yet
	ret
	
ClearCommandChaos:
	call ClearSprites
	xor a
	ld hl, TC_CommandChaosTable
	ld bc, 40
	call ByteFill
	ld a, $ff
	ld [TC_CommandChaosTableEnd], a
	ld a, 1
	ld [TC_ChaosTimer], a
	ret
	
UpdateCommandChaos_Logo:
; VBlank1 didn't cover RNG function so this needs to be manually called
	call Random
	ld a, [TC_ChaosTimer]
	dec a
	ld [TC_ChaosTimer], a
	and a
	jp nz, .skip
	ld a, [TC_ChaosRate]
	ld [TC_ChaosTimer], a
	ld de, TC_CommandChaosTable
	ld hl, Sprites
.seek
	ld a, [de]
	and a
	jr nz, .skipseek
	ld a, 1
	ld [de], a
	ld a, 160
	ld [hli], a ; start y position
	ld a, [hRandomSub]
	and $7f ; 0-127
	ld b, a
	ld a, [hRandomAdd]
	and $1f ; 0-31
	add b   ; 0-158
	add 5
	ld [hli], a ; start x position
	ld a, [hRandomAdd]
	swap a
	ld b, 0
	rrca
	rl b
	rrca
	rl b   ; 0-3
	and $3 ; 0-3
	add b  ; 0-6
	ld [hli], a ; tile no.
	ld a, $8a ; pal 2 bank 1 behind bg
	ld [hl], a ; attributes
	jr .skip
.skipseek
	cp $ff
	jr z, .skip ; table is full now
	inc de
	ld bc, 4
	add hl, bc
	jr .seek
.skip
	ld de, TC_CommandChaosTable
	ld hl, Sprites
	ld bc, 4
.updateloop
	ld a, [de]
	and a
	jr z, .skipupdate
	cp $ff
	ret z ; every commands is updated
	dec [hl]
	cp 8
	jr nz, .skipupdate
	xor a
	ld [de], a
.skipupdate
	inc de
	add hl, bc
	jr .updateloop
	
UpdateCommandChaos_MainIn:
	ld a, [TC_CurStripWidth]
	dec a
	ld [TC_CurStripWidth], a
UpdateCommandChaos_Main:
	call Random
	ld a, [TC_ChaosTimer]
	dec a
	ld [TC_ChaosTimer], a
	and a
	jp nz, .skip
	ld a, MAIN_CHAOS_RATE
	ld [TC_ChaosTimer], a
	ld de, TC_CommandChaosTable
	ld hl, Sprites
.seek
	ld a, [de]
	and a
	jr nz, .skipseek
	ld a, [hRandomAdd]
	swap a
	rrca
	rrca
	and $3 ; 0-3
	ld c, a
	inc a  ; 1-4
	ld [de], a
	ld a, [hRandomAdd]
	and $3f ; 0-63
	ld b, a
	ld a, [hRandomSub]
	and $f  ; 0-15
	add b   ; 0-78
	add 10
	ld [hli], a ; start y position
	bit 1, c
	ld a, 168
	jr nz, .reverse
	xor a
.reverse
	ld [hli], a ; start x position
	ld a, [hRandomAdd]
	swap a
	ld b, 0
	rrca
	rl b
	rrca
	rl b   ; 0-3
	and $3 ; 0-3
	add b  ; 0-6
	add $c8
	ld [hli], a ; tile no.
	ld a, 7     ; pal 7 bank 0 above bg
	ld [hl], a  ; attributes
	jr .skip
.skipseek
	cp $ff
	jr z, .skip ; table is full now
	inc de
	ld bc, 4
	add hl, bc
	jr .seek
.skip
	ld de, TC_CommandChaosTable
	ld hl, Sprites + 1
	ld bc, 4
.updateloop
	ld a, [de]
	and a
	jr z, .skipupdate
	cp $ff
	jp z, UpdatePokepic ; every commands is updated
	cp 3
	jr c, .add
	dec [hl]
	jr z, .set0
	cp 4
	jr nz, .skipupdate
	dec [hl]
	jr z, .set0
	jr .skipupdate
.add
	inc [hl]
	cp 2
	jr nz, .done
	inc [hl]
.done
	ld a, 168
	cp [hl]
	jr nc, .skipupdate
.set0
	xor a
	ld [de], a
.skipupdate
	inc de
	add hl, bc
	jr .updateloop
	
UpdatePokepic::
	ld a, [TC_CurSprSpeedCount]
	dec a
	ld [TC_CurSprSpeedCount], a
	jr nz, StripTrick_Main
	ld a, [TC_CurSprSpeed]
	ld [TC_CurSprSpeedCount], a
	ld a, [TC_CurSprPos]
	inc a
	and $3
	ld [TC_CurSprPos], a
	add a ; 2
	add a ; 4
	add a ; 8
	add a ; 16
	ld b, a
	add 64
	ld c, a
	ld hl, TC_Sprites
	ld d, SPRITE_Y
.loop
	ld e, SPRITE_X
.loop2
	res 6, l
	ld [hl], d
	set 6, l
	ld [hl], d
	inc l
	ld [hl], e
	res 6, l
	ld [hl], e
	inc l
	ld [hl], b
	set 6, l
	ld [hl], c
	inc l
	inc l
	inc b
	inc c
	ld a, 8
	add e
	ld e, a
	cp SPRITE_X + 32
	jr nz, .loop2
	ld a, 8
	add d
	ld d, a
	cp SPRITE_Y + 32
	jr nz, .loop
	
StripTrick_Main::
; update bg scrolling
	ld a, [hSCX]
	ld d, a
	ld a, [TC_CurBGSpeed]
	and a
	jr z, .inc2bg
	ld a, [TC_CurBGSpeedCount]
	dec a
	jr nz, .skipldbg
	ld a, d
	inc a
	ld [hSCX], a
	ld a, [TC_CurBGSpeed]
.skipldbg
	ld [TC_CurBGSpeedCount], a
	jr .donemodbg
.inc2bg
	ld a, d
	add 2
	ld [hSCX], a
.donemodbg
; update strips
	ld a, [TC_CurStripWidth]
	ld c, a
	ld b, 0
	ld hl, StripBounds
	add hl, bc
	ld a, [TC_CurStripXPos]
	cp [hl]
	jr c, .nosub
	sub [hl]
.nosub
	ld d, a
	ld a, [TC_CurStripSpeed]
	and a
	jr z, .inc2
	ld a, [TC_CurStripSpeedCount]
	dec a
	jr nz, .skipld
	ld a, d
	inc a
	ld [TC_CurStripXPos], a
	ld a, [TC_CurStripSpeed]
.skipld
	ld [TC_CurStripSpeedCount], a
	jr .donemod
.inc2
	ld a, d
	add 2
	ld [TC_CurStripXPos], a
.donemod
	ld b, 80
.wait
	ld a, [rLY]
	cp b
	jr nz, .wait
	ld a, c
	ld [rSCY], a
	ld a, d
	ld [rSCX], a
	dec c
	inc b
	ld a, 89
	cp b
	jr nz, .wait
.wait2
	ld a, [rLY]
	cp b
	jr nz, .wait2
	ld a, 48
	ld [rSCY], a
	xor a
	ld [rSCX], a
	ld a, TC_Sprites >> 8
	ld [hPushOAMAddress], a
	call $ff80
	ld a, Sprites >> 8
	ld [hPushOAMAddress], a
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
	call TC_DelayFrame
	call TC_DelayFrame
	dec e
	jr nz, .loop
	ret
	
Fade2White:
; fade all BGPs and the first 2 OBPs until it's white
	ld e, 32
.loop
	ld hl, BGPals
	ld d, 40
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
	ld a, [TC_FadeUpdateAddr]
	ld l, a
	ld a, [TC_FadeUpdateAddr + 1]
	ld h, a
	push de
	call _hl_ ; calls an attached update function
	call TC_DelayFrame
	call PushOAMAtHBlank
	pop de
	dec e
	jr nz, .loop
	ret
	
RelativeFade:
; fade from BGPals to Unkn1Pals
	ld e, 32
.loop
	ld hl, BGPals
	ld bc, Unkn1Pals
	ld d, 40
.loop2
	push de
	ld a, [hl]
	and $1f
	ld d, a
	ld a, [bc]
	and $1f
	cp d
	jr z, .skip
	jr c, .dec
	inc d
	jr .skip
.dec
	dec d
.skip
	ld a, [hli]
	ld e, a
	ld a, [hld]
	and $3
	rept 3
	sla e
	rla
	endr
	ld e, a
	push hl
	ld a, [bc]
	ld h, a
	inc bc
	ld a, [bc]
	and $3
	rept 3
	sla h
	rla
	endr
	cp e
	jr z, .skip2
	jr c, .dec2
	inc e
	jr .skip2
.dec2
	dec e
.skip2
	pop hl
	xor a
	rept 3
	srl e
	rra
	endr
	or d
	ld [hli], a
	ld a, [hl]
	and $7c
	ld d, a
	ld a, [bc]
	and $7c
	cp d
	ld a, d
	jr z, .skip3
	jr c, .dec3
	add $4
	jr .skip3
.dec3
	sub $4
.skip3
	or e
	ld [hli], a
	pop de
	inc bc
	dec d
	jr nz, .loop2
	ld a, 1
	ld [hCGBPalUpdate], a
	ld a, [TC_FadeUpdateAddr]
	ld l, a
	ld a, [TC_FadeUpdateAddr + 1]
	ld h, a
	push de
	call _hl_ ; calls an attached update function
	call TC_DelayFrame
	call PushOAMAtHBlank
	pop de
	dec e
	jp nz, .loop
	ret
	
DecodeWLE:
; Walle Length Encoding decoder
	ld c, 0
DecodeWLELoop:
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
	jr DecodeWLELoop

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
	jr DecodeWLELoop

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
	jr DecodeWLELoop

.end
	pop hl
	ret
	
PushOAMAtHBlank:
; VBlank1 won't do PushOAM if it updated palettes
	ld a, [rLY]
	cp 144
	jr c, .hblank
	cp 150
	jr nc, .hblank
; we still have time to do this in VBlank (normal speed accounted)
	jp hPushOAM
.hblank
	ld a, [rSTAT]
	and $3
	jr nz, .hblank ; wait until HBlank
	jp hPushOAM
	
TC_DelayFrame:
	call DelayFrame
; VBlank1 auto-set normal interrupts so we need to disable this
	xor a
	ld [rIF], a
	ld a, 1
	ld [rIE], a
	ret
	
TPPCreditsList:
	tc_draw			TPPCreditsBG1List
	tc_title		.director
	tc_subtitle		  .streamer
	tc_title		.projman
	tc_subtitle		  .revo
	tc_draw			TPPCreditsBG2List
	tc_title		.programmer
	tc_subtitle		  .pikalax
	tc_subtitle		  .pigu
	tc_subtitle		  .koolboyman
	tc_subtitle		  .lightning
	tc_subtitle		  .chaos
	tc_subtitle		  .chauzu
	tc_subtitle		  .padz
	tc_draw			TPPCreditsBG3List
	tc_title		.sprite
	tc_subtitle		  .eraclito
	tc_subtitle		  .pioxys
	tc_title		.music
	tc_subtitle		  .pigu
	tc_subtitle		  .gact
	tc_title		.gameplay
	tc_subtitle		  .lightning
	tc_subtitle		  .adda
	tc_subtitle		  .ego
	tc_subtitle		  .roy
	tc_subtitle		  .danimg
	tc_subtitle		  .koolboyman
	tc_draw			TPPCreditsBG4List
	tc_title		.ai
	tc_subtitle		  .bee
	tc_title		.testers
	tc_subtitle		  .timmy
	tc_subtitle		  .eraclito
	tc_subtitle		  .chauzu
	tc_subtitle		  .chef
	tc_title		.misc
	tc_subtitle		  .walle
	tc_title		.special
	tc_subtitle		  .ninten
	tc_subtitle		  .pret
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
.misc		db "Misc.@"
.special	db "Special Thanks@"
	
.streamer	db "TwitchPlaysPokemon@"
.revo		db "ProjectRevoTPP@"
.pikalax	db "PikalaxALT@"
.pigu		db "Pigu@"
.koolboyman	db "Koolboyman@"
.lightning	db "LightningXCE@"
.chaos		db "chaos<_>lord2@"
.chauzu		db "Chauzu<_>VGC@"
.padz		db "padz@"
.eraclito	db "Eraclito@"
.pioxys		db "Pioxys@"
.adda		db "Addarash1@"
.ego		db "egobuff@"
.roy		db "Roysourking@"
.danimg		db "Danimg@"
.bee		db "beesafree@"
.timmy		db "TrainerTimmy@"
.pret		db "pret@"
.walle		db "walle303@"
.ninten		db "Nintendo@"
.gf			db "Game Freak@"
.twitch		db "Twitch@"
.you		db "and You!@"
.gact		db "GACT@"
.chef		db "The<_>Chef1337@"

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

TPPCreditsBG1List:
	dw TPPCreditsBG1
	dw TPPCreditsBG1Attrs
	dw TPPCreditsBG1Tiles
	dw TPPCreditsBG1Pals
	dw TPPCreditsSpr1
	db 5  ; scroll speed
	db 12 ; sprite speed
	db 55 ; strip initial pos
	db 1  ; strip speed

TPPCreditsBG1: INCBIN "gfx/credits/bg1.w120.2bpp.lz"
TPPCreditsSpr1: INCBIN "gfx/credits/spr1.w32.2bpp.lz"

TPPCreditsBG1Tiles:
	db $a2, $82, $6d, $80, $a3, $81, $6d, $80, $01
	db $81, $b0, $84, $b0, $84, $67, $99, $a7, $94
	db $69, $99, $a7, $94, $62, $99, $7f, $9b, $5f
	db $42, $70, $9c, $50, $70, $9d, $50, $70, $9c
	db $50, $70, $9d, $50, $70, $99, $50, $ff
	
TPPCreditsBG1Attrs:
	db $70, $0a, $50, $7f, $0b, $5f, $42, $70, $0c, $50, $70, $0d
	db $50, $7f, $0e, $5f, $42, $7f, $0f, $5f, $5f, $43, $ff
	
TPPCreditsBG1Pals:
	RGB 02, 06, 12
	RGB 02, 06, 12
	RGB 02, 06, 12
	RGB 31, 31, 31
	
	RGB 26, 15, 07
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 21, 05, 03
	
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
	
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 29, 27, 19
	RGB 03, 05, 15

	RGB 31, 31, 31
	RGB 23, 20, 10
	RGB 09, 11, 23
	RGB 00, 00, 00

TPPCreditsBG2List:
	dw TPPCreditsBG2
	dw TPPCreditsBG2Attrs
	dw TPPCreditsBG2Tiles
	dw TPPCreditsBG2Pals
	dw TPPCreditsSpr2
	db 1  ; scroll speed
	db 15 ; sprite speed
	db 37 ; strip initial pos
	db 3  ; strip speed
	
TPPCreditsBG2: INCBIN "gfx/credits/bg2.w128.2bpp.lz"
TPPCreditsSpr2: INCBIN "gfx/credits/spr2.w32.2bpp.lz"

TPPCreditsBG2Tiles:
	db $7f, $81, $5f, $42, $01, $82, $69, $80, $01, $82, $65, $80
	db $01, $82, $69, $80, $01, $82, $65, $80, $01, $85, $64, $80
	db $01, $83, $63, $80, $a2, $86, $64, $80, $a2, $84, $64, $80
	db $01, $83, $63, $80, $a2, $86, $64, $80, $03, $86, $91, $92
	db $62, $80, $a2, $88, $62, $80, $a5, $8a, $01, $80, $a4, $8f
	db $62, $80, $a2, $88, $62, $80, $a5, $8a, $01, $80, $a2, $8f
	db $b0, $93, $b0, $93, $b0, $c0, $b0, $c0
	db $a9, $a3, $62, $a3, $a4, $ac, $62, $a3
	db $a8, $a4, $62, $a3, $a4, $ac, $63, $a3, $a3, $b0, $01, $a8
	db $a3, $b3, $63, $a3, $a3, $b6, $63, $a3, $a3, $b0, $01, $a8
	db $a3, $b3, $63, $a3, $a3, $b6, $63, $a3, $a2, $b9, $62, $a8
	db $a3, $bb, $63, $a3, $a2, $be, $64, $a3, $a2, $b9, $62, $a8
	db $a3, $bb, $63, $a3, $a2, $be, $62, $a3, $ff
	
TPPCreditsBG2Attrs:
	db $7f, $0a, $81, $5f, $81, $5f, $45, $62, $0d, $6e, $0c
	db $62, $0d, $6a, $0c, $64, $0e, $62, $0d, $6a, $0c, $64, $0e
	db $62, $0d, $6e, $0c, $63, $0d, $6d, $0c, $63, $0d, $6a, $0c
	db $62, $0e, $64, $0d, $6a, $0c, $62, $0e, $64, $0d, $69, $0c
	db $01, $0f, $62, $0e, $63, $0f, $62, $0d, $65, $0f, $62, $0c
	db $62, $0f, $62, $0e, $63, $0f, $62, $0d, $65, $0f, $62, $0c
	db $63, $0f, $01, $0c, $6f, $0f, $01, $0c, $6e, $0f, $5f, $ff

TPPCreditsBG2Pals:
	RGB 03, 12, 06
	RGB 03, 12, 06
	RGB 03, 12, 06
	RGB 31, 31, 31
	
	RGB 25, 15, 19
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 06, 15, 23
	
	RGB 13, 25, 29
	RGB 13, 26, 29
	RGB 14, 26, 29
	RGB 15, 26, 28

	RGB 16, 26, 28
	RGB 16, 27, 28
	RGB 17, 27, 28
	RGB 17, 28, 27

	RGB 18, 28, 27
	RGB 14, 19, 15
	RGB 11, 16, 11
	RGB 18, 25, 09
	
	RGB 18, 28, 27
	RGB 14, 19, 15
	RGB 18, 25, 09
	RGB 11, 18, 06
	
	RGB 18, 28, 27
	RGB 14, 19, 15
	RGB 11, 16, 11
	RGB 11, 18, 06

	RGB 14, 19, 15
	RGB 11, 16, 11
	RGB 18, 25, 09
	RGB 11, 18, 06
	
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 23, 07, 02
	RGB 06, 02, 00

	RGB 31, 31, 31
	RGB 31, 09, 04
	RGB 14, 05, 01
	RGB 00, 00, 00

TPPCreditsBG3List:
	dw TPPCreditsBG3
	dw TPPCreditsBG3Attrs
	dw TPPCreditsBG3Tiles
	dw TPPCreditsBG3Pals
	dw TPPCreditsSpr3
	db 0  ; scroll speed
	db 8 ; sprite speed
	db 44 ; strip initial pos
	db 0  ; strip speed

TPPCreditsBG3: INCBIN "gfx/credits/bg3.w96.2bpp.lz"
TPPCreditsSpr3: INCBIN "gfx/credits/spr3.w32.2bpp.lz"

TPPCreditsBG3Tiles:
	db $7f, $80, $5f, $42, $7f, $81, $5f, $5f, $5f
	db $44, $66, $82, $01, $83, $67, $82, $01, $83
	db $67, $82, $01, $83, $67, $82, $02, $83, $82
	db $b0, $84, $b0, $84, $bf, $94, $9f, $82, $ff
	
TPPCreditsBG3Attrs:
	db $7f, $0f, $5f, $5f, $43, $70, $0e, $50, $70, $0d, $50, $70
	db $0c, $50, $7f, $0b, $5f, $42, $7f, $0a, $5f, $42, $ff

TPPCreditsBG3Pals:
	RGB 12, 04, 05
	RGB 12, 04, 05
	RGB 12, 04, 05
	RGB 31, 31, 31
	
	RGB 12, 26, 18
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 10, 15, 04
	
	RGB 18, 25, 10
	RGB 11, 19, 10
	RGB 10, 17, 10
	RGB 11, 15, 11

	RGB 18, 25, 10
	RGB 29, 23, 17
	RGB 12, 21, 10
	RGB 00, 00, 00

	RGB 27, 24, 19
	RGB 28, 24, 19
	RGB 29, 24, 18
	RGB 29, 23, 18
	
	RGB 25, 24, 21
	RGB 26, 24, 21
	RGB 26, 24, 20
	RGB 27, 24, 20
	
	RGB 22, 25, 23
	RGB 23, 25, 22
	RGB 24, 25, 22
	RGB 25, 25, 22

	RGB 18, 27, 26
	RGB 19, 26, 26
	RGB 20, 26, 25
	RGB 22, 26, 24
	
	RGB 31, 31, 31
	RGB 28, 25, 08
	RGB 23, 09, 07
	RGB 18, 03, 09

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 29, 10, 06
	RGB 00, 00, 00
	
TPPCreditsBG4List:
	dw TPPCreditsBG4
	dw TPPCreditsBG4Attrs
	dw TPPCreditsBG4Tiles
	dw TPPCreditsBG4Pals
	dw TPPCreditsSpr4
	db 3  ; scroll speed
	db 10 ; sprite speed
	db 49 ; strip initial pos
	db 0  ; strip speed
	
TPPCreditsBG4: INCBIN "gfx/credits/bg4.w128.2bpp.lz"
TPPCreditsSpr4: INCBIN "gfx/credits/spr4.w32.2bpp.lz"

TPPCreditsBG4Tiles:
	db $02, $80, $82, $62, $80, $03, $83, $80, $84, $65, $80, $01
	db $85, $63, $80, $01, $86, $63, $80, $05, $87, $80, $88, $80
	db $89, $62, $80, $01, $8a, $63, $80, $01, $8b, $62, $81, $01
	db $8c, $64, $81, $05, $8d, $8e, $81, $a2, $a3, $62, $81, $01
	db $8f, $68, $81, $01, $90, $72, $81, $a2, $a4, $66, $81, $03
	db $91, $81, $92, $64, $81, $01, $8d, $63, $81, $05, $94, $93
	db $81, $81, $94, $64, $81, $05, $95, $81, $96, $81, $a6, $a2
	db $80, $07, $81, $90, $81, $97, $81, $81, $98, $67, $81, $01
	db $99, $64, $81, $03, $9a, $81, $9b, $a3, $a7, $04, $81, $9c
	db $81, $81, $a3, $aa, $03, $81, $81, $9d, $65, $81, $02, $9e
	db $81, $a3, $ad, $06, $9f, $81, $81, $a0, $81, $a1, $bf, $b0
	db $9f, $9f, $9f, $9f, $85, $ff
	
TPPCreditsBG4Attrs:
	db $7f, $0a, $5f, $41, $81, $5f, $81, $5f, $81, $5f, $81, $5f
	db $81, $5f, $5f, $5f, $5f, $43, $ff

TPPCreditsBG4Pals:
	RGB 08, 04, 12
	RGB 08, 04, 12
	RGB 08, 04, 12
	RGB 31, 31, 31
	
	RGB 25, 25, 15
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 20, 25, 25
	
	RGB 31, 31, 31
	RGB 31, 30, 15
	RGB 04, 04, 10
	RGB 03, 03, 07

	RGB 26, 26, 29
	RGB 31, 30, 15
	RGB 05, 05, 14
	RGB 03, 03, 07

	RGB 22, 22, 27
	RGB 31, 30, 15
	RGB 06, 06, 16
	RGB 03, 03, 07
	
	RGB 17, 17, 25
	RGB 31, 30, 15
	RGB 07, 07, 17
	RGB 03, 03, 07
	
	RGB 05, 05, 23
	RGB 31, 30, 15
	RGB 08, 08, 20
	RGB 03, 03, 07

	RGB 05, 05, 23
	RGB 31, 30, 15
	RGB 09, 09, 24
	RGB 03, 03, 07
	
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 29, 27, 14
	RGB 05, 14, 24

	RGB 31, 31, 31
	RGB 10, 19, 26
	RGB 28, 09, 04
	RGB 00, 00, 00

CommandsGFX: INCBIN "gfx/udlrab.2bpp"
CommandsGFXEnd
UnderscoreGFX: INCBIN "gfx/credits/underscore.1bpp"
UnderscoreGFXEnd
StripGFX: INCBIN "gfx/credits/strip.1bpp"
StripGFXEnd
StripTiles: INCBIN "gfx/credits/strip_map.wle"
	
