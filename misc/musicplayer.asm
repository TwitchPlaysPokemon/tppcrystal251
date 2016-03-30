;Written by Sanqui, v2 by Pigu

MusicTestGFX:
INCBIN "gfx/misc/music_test.2bpp"
MusicTestOAMGFX:
INCBIN "gfx/misc/music_test_oam.2bpp"
NarrowFontGFX:
INCBIN "gfx/misc/font_narrow.w64.1bpp"
MPPals:
	RGB 5, 6, 8
    RGB 0, 0, 0
    RGB 0, 0, 0
    RGB 31, 31, 31
	RGB 31, 31, 31
    RGB 7, 31, 7
    RGB 7, 7, 31
    RGB 31, 7, 7
	RGB 8, 3, 3
    RGB 31, 7, 7
	RGB 0, 0, 0
	RGB 31, 27, 27
    RGB 3, 3, 8
    RGB 7, 7, 31
    RGB 0, 0, 0
	RGB 27, 27, 31
    RGB 3, 8, 3
    RGB 7, 31, 7
	RGB 0, 0, 0
    RGB 27, 31, 27
    RGB 8, 8, 3
    RGB 31, 31, 7
	RGB 0, 0, 0
	RGB 31, 31, 27
	RGB 2, 2, 3
    RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 31, 30, 5
	RGB 30, 5, 12
    RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
MPPalsEnd
NotePals:
    RGB 31, 31, 31
    RGB 31, 31, 31
    RGB 31, 31, 31
    RGB 0, 0, 0
NotePalsEnd

placestring_: MACRO
    hlcoord \1, \2
    ld de, \3
    call PlaceString
    ENDM

jbutton: MACRO
	ld a, [hJoyPressed]
	and \1
	jp nz, \2 ; TODO jx
    ENDM

printbit: MACRO
    ld hl, \1
    bit \2, [hl]
    decoord \3, \4
    jr z, .notset\@
    ld a, \5
    ld [de], a
    jr .end\@
.notset\@
    ld a, \6
    ld [de], a
.end\@
    inc de
    ENDM

textbox: MACRO
    hlcoord \1, \2
    ld bc, ( (\4-\2) << 8) + (\3-\1)
    call TextBox
    ENDM
	
copy: MACRO
	ld hl, \1
	ld de, \2
	ld bc, \3
	call CopyBytes
	ENDM

fill: MACRO
	ld a, \1
	ld hl, \2
	ld bc, \3
	call ByteFill
	ENDM

MPLoadPalette:
	ld a, [rSVBK]
	push af

	ld a, 5
	ld [rSVBK], a
	
	copy MPPals, BGPals, MPPalsEnd-MPPals
	copy NotePals, OBPals, NotePalsEnd-NotePals

	pop af
	ld [rSVBK], a

; Request palette update
	ld a, 1
	ld [hCGBPalUpdate], a
	ret

MusicPlayer::
	ld de, MUSIC_NONE
	call PlayMusic
	;call WhiteBGMap
	;di
	;call DoubleSpeed
	;xor a
	;ld [rIF], a
	;ld a, $f
	;ld [rIE], a
	;ei
	ld a, [rSVBK]
	push af
	ld a, 4
	ld [rSVBK], a
	copy TileMap, wMPTileMapBackup, TileMapEnd - TileMap
	pop af
	ld [rSVBK], a
	call ClearTileMap
	hlcoord 6, 5
	ld de, LoadingText
	call PlaceString
	xor a
	ld [hBGMapThird], a
	call DelayFrame
	
	ld b, BANK(MusicTestGFX) ;load the gfx
	ld c, 128
	ld de, MusicTestGFX
	ld hl, VTiles1
	ld a, 1
	ld [rVBK], a
	call Request2bpp
	xor a
	ld [rVBK], a
	ld b, BANK(MusicTestOAMGFX) ;load the gfx
	ld c, 9
	ld de, MusicTestOAMGFX
	ld hl, VTiles0
	call Request2bpp

    call DelayFrame
	call MPLoadPalette
	ld hl, rLCDC
	set 7, [hl]
	ei

	call ClearSprites

	ld hl, Options2
	set 7, [hl]
	ld a, [rSVBK]
	ld [hMPTmp], a
	ld a, 4
	ld [rSVBK], a
	
	fill 0, wMPFlags, wMPInitClearEnd - wMPFlags
	ld a, $a0
	ld [wNoteTile], a
	ld a, $80
	ld [wNoteMask], a
	ld hl, wMPFlags
	set 0, [hl]
	set 2, [hl]

MPlayerTilemap:

	copy NoteOAM, Sprites + 4, NoteOAMEnd - NoteOAM
	call DelayFrame

	ld a, [rLCDC]
	ld [hMPTmp3], a	
	call DisableLCD
	ld a, $63
	ld [rLCDC], a
	xor a
	ld d, a
	ld bc, 32*12
	ld hl, VBGMap0
.loopi
	ld a, d
	ld [hli], a
	inc d
	dec bc
	ld a, b
	or c
	jr nz, .loopi
	ld hl, VBGMap1
	ld de, MPTilemap
	ld b, (MPTilemapEnd - MPTilemap)/20
.mptilemaploop
	push bc
	ld c, 20
.mptilemaploop2
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .mptilemaploop2
	ld bc, 12
	add hl, bc
	pop bc
	dec b
	jr nz, .mptilemaploop
	fill 0, VTiles1, $1000
	ld a, 1
	ld [rVBK], a
	ld hl, VBGMap0
	ld bc, 256
	call ByteFill
	fill 9, VBGMap0 + $100, 128
	fill 8, VBGMap1, 192
	fill 0, VTiles2, $800
	ld a, 10 ; ch1
	ld hl, VBGMap1 + $80
	ld [hli], a
	ld [hli], a
	ld [hli], a
	inc a ; ch2
	ld [hli], a
	ld [hli], a
	ld [hli], a
	inc a ; ch3
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	inc a ; ch4
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld hl, VBGMap1 + $a0
	inc a ; mpname
	rept 8
	ld [hli], a
	endr
	inc a ; selection
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld hl, VBGMap1 + $b0
	ld a, 10
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	xor a
	ld [rVBK], a
	ld a, $60
	ld [hWY], a
	ld [rWY], a
	di
	ld a, $10 ; VBlank
	ld [rSTAT], a
	xor a
	ld [rIF], a
	ld a, 2 ; LCD
	ld [rIE], a
	ei
	call EnableLCD
	
	ld a, [wSongSelection]
	and a ;let's see if a song is currently selected
	jr z, .getsong
	jp .redraw
.getsong ;get the current song
	ld a, 1
	jp .redraw
.loop
	ld a, [wMPFlags]
	bit 0, a
    call nz, RenderWaveform
	call UpdateVisualIntensity
	call DrawNotes
	call DelayFrame_MP
	
	call GetJoypad
	jbutton B_BUTTON, .exit
	jbutton D_LEFT, .left
	jbutton D_RIGHT, .right
	jbutton D_DOWN, .down
	jbutton D_UP, .up
	jbutton A_BUTTON, .a
	jbutton SELECT, .select
	jbutton START, .start
	
    jr .loop
.left
    ld a, [wSongSelection]
    dec a
    jr nz, .redraw
    ld a, NUM_MUSIC-1
    jr .redraw
.right
    ld a, [wSongSelection]
    inc a
    cp a, NUM_MUSIC
    jr nz, .redraw
    ld a, 1
    jr .redraw
.down
    ld a, [wSongSelection]
    sub a, 10
	jr z, .zerofix
    jr nc, .redraw
.zerofix
    ld a, NUM_MUSIC-1
    jr .redraw
.up
    ld a, [wSongSelection]
    add a, 10
    cp a, NUM_MUSIC
    jr c, .redraw
    ld a, 1
    jr .redraw
.select
    xor a
    call SongSelector
    jp MPlayerTilemap
.redraw	
    ld [wSongSelection], a
    
	; old function had more than one VBlank printing, slowing down the music
	;ld a, " "
	;hlcoord 5, 2
	;ld bc, 3
	;call ByteFill
	;hlcoord 0, 3
	;ld bc, 60
	;call ByteFill
	;hlcoord 0, 8
	;ld bc, 90
	;call ByteFill
	;hlcoord 5, 2
	ld hl, wSelectorChars + 4
	ld [hl], "@"
	dec hl
	ld [hl], " "
	dec hl
	ld [hl], " "
	dec hl
	ld [hl], " "
	dec hl
	ld [hl], $e5
	inc hl
	ld de, wSongSelection
	ld bc, $0103
	call PrintNum
	ld hl, wSelectorChars
	ld de, wSelectorGFX
	call RenderNarrowText
	;call DrawSongInfo
	ld hl, wMPFlags
	set 1, [hl] ; song info redraw occurred
	jp .loop
	
.a
	fill 0, wC1Vol, wMPInitClearEnd - wC1Vol
	ld hl, wMPFlags
	set 0, [hl]
	ld de, MUSIC_NONE
	call PlayMusic
	ld a, [wSongSelection]
	ld e, a
	ld d, 0
	call PlayMusic
	fill $ff, wChLastNotes, 6
	jp .loop

.start
	xor a
	ld [wChannelSelector], a
	hlcoord 0, 12
	ld a, $ee
	ld [hl], a
	jp .songEditorLoop
	
.songEditorLoop
	ld a, [wMPFlags]
	bit 0, a
    call nz, RenderWaveform
	call UpdateVisualIntensity
	call DrawNotes
	call DelayFrame_MP
	
	ld a, [wChangingPitch]
	and a
	jr nz, .changingPitch
	call GetJoypad
	jbutton D_LEFT, .songEditorleft
	jbutton D_RIGHT, .songEditorright
	jbutton A_BUTTON, .songEditora
	jbutton B_BUTTON, .songEditorb
	jbutton D_UP, .songEditorup
	jbutton D_DOWN, .songEditordown
	jbutton SELECT, .songEditorselect
	
	ld a, 2
	ld [hBGMapThird], a ; prioritize refreshing the note display
	jr .songEditorLoop
.changingPitch
	call GetJoypad
	jbutton D_LEFT, .ChangingPitchleft
	jbutton D_RIGHT, .ChangingPitchright
	jbutton A_BUTTON, .ChangingPitchb
	jbutton B_BUTTON, .ChangingPitchb
	ld a, 2
	ld [hBGMapThird], a ; prioritize refreshing the note display
	jr .songEditorLoop
	

.songEditorleft
	call .channelSelectorloadhl
	ld a, $7f
	ld [hl], a
	ld a, [wChannelSelector]
	dec a
	cp -1
	jr nz, .noOverflow
	ld a, 5
.noOverflow
	ld [wChannelSelector], a
	call .channelSelectorloadhl
	ld [hl], a
	jp .songEditorLoop

.songEditorright
	call .channelSelectorloadhl
	ld a, $7f
	ld [hl], a
	ld a, [wChannelSelector]
	inc a
	cp 6
	jr nz, .noOverflow2
	xor a
.noOverflow2
	ld [wChannelSelector], a
	call .channelSelectorloadhl
	ld [hl], a
	jp .songEditorLoop

.songEditora
	ld a, [wChannelSelector]
	cp 4
	jr z, .niteToggle
	cp 5
	jr z, .changePitch
	ld c, a
	ld b, 0
	ld hl, wChannelSelectorSwitches
	add hl, bc
	ld a, [hl]
	xor 1
	ld [hl], a
    
	jp .songEditorLoop
.niteToggle
	ld a, [GBPrinter]
	xor 4
	ld [GBPrinter], a
	ld a, [wSongSelection]
	ld e, a
	ld d, 0
	callba PlayMusic2
	hlcoord 16, 1
	xor a
	ld [hBGMapThird], a
	call DelayFrame_MP
	jp .songEditorLoop
.changePitch
    ld a, 1
    ld [wChangingPitch], a
	hlcoord 16, 2
	ld a, $ec
	ld [hl], a
	xor a
	ld [hBGMapThird], a
	call DelayFrame_MP
	jp .songEditorLoop
	
.songEditorup
    ld a, [wChannelSelector]
    cp 2
    jp nz, .songEditorLoop
    ld a, [Channel3+$0f]
    dec a
    ld b, a
    and $0f
    cp $0f
    jr z, .waveunderflow
    ld a, b
    jr .changed
.songEditordown
    ld a, [wChannelSelector]
    cp 2
    jp nz, .songEditorLoop
    ld a, [Channel3+$0f]
    inc a
    ld b, a
    and $0f
    jr z, .waveoverflow
    ld a, b
    jr .changed
.waveunderflow
    ld a, [Channel3+$0f]
    and $f0
    add $e
    jr .changed
.waveoverflow
    ld a, [Channel3+$0f]
    and $f0
.changed
    ld [Channel3+$0f], a
    ld [$c293], a
	jp .songEditorLoop
    
    

.songEditorselect
.songEditorb
	call .channelSelectorloadhl
	ld a, $7f
	ld [hl], a
	jp .loop

.channelSelectorloadhl
	ld a, [wChannelSelector]
	cp 4
	jr z, .channelSelectorloadhlnite
	cp 5
	jr z, .channelSelectorloadhlpitch
	ld c, 5
	call SimpleMultiply
	hlcoord 0, 12
	add l
	ld l, a
	ld a, $ee
	ret nc
	inc h
	ret
.channelSelectorloadhlnite
	hlcoord 15, 1
	ld a, $ed
	ret
.channelSelectorloadhlpitch
	hlcoord 16, 2
	ld a, $ed
	ret

.exit
	ld hl, Options2
	res 7, [hl]
	call DisableLCD
	; get the font gfx back
	ld hl, Font
	ld de, VTiles1
	ld bc, FontEnd - Font
	ld a, BANK(Font)
	call FarCopyBytesDouble
	; get the option screen back
	xor a
	ld [hSCX], a
	ld [rSCX], a
	ld a, 5
	ld [rSVBK], a
	copy Unkn1Pals, BGPals, $80
	call ForceUpdateCGBPals
	ld a, 4
	ld [rSVBK], a
	copy wMPTileMapBackup, TileMap, TileMapEnd - TileMap
	ld hl, wMPTileMapBackup
	ld de, VBGMap0
	ld b, 18
.exloop
	ld c, 20
.exloop2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .exloop2
	push hl
	ld hl, 12
	add hl, de
	ld d, h
	ld e, l
	pop hl
	dec b
	jr nz, .exloop
	ld a, 1
	ld [rVBK], a
	fill 7, VBGMap0, 32 * 18
	xor a
	ld [rVBK], a
	call Functione5f
    call ClearSprites
    ;call NormalSpeed
	call EnableLCD
    xor a
    ld [hVBlank], a ; VBlank0
	ld a, [hMPTmp3]
    ld [rLCDC], a
	ld a, $90
	ld [hWY], a
	di
	ld a, 8 ; normal HBlank int
	ld [rSTAT], a
    xor a
    ld [rIF], a
    ld a, $f
    ld [rIE], a
    ei
    ld a, [hMPTmp]
    ld [rSVBK], a
    ret

.ChangingPitchleft
    ld a, [wTranspositionInterval]
    dec a
    jr .ChangingPitchChangePitch
.ChangingPitchright
    ld a, [wTranspositionInterval]
    inc a
.ChangingPitchChangePitch
    ld [wTranspositionInterval], a
    ld de, EmptyPitch
	hlcoord 17, 2
	call PlaceString
	ld a, [wTranspositionInterval]
    and a
    jr nz, .nonzero
	xor a
	ld [hBGMapThird], a
	call DelayFrame_MP
	jp .songEditorLoop
    
.nonzero
    bit 7, a
    jr nz, .negative
	hlcoord 17, 2
	ld a, $c5
	ld [hl], a
	ld bc, $0103
    ld de, wTranspositionInterval
	call PrintNum
	xor a
	ld [hBGMapThird], a
	call DelayFrame_MP
	jp .songEditorLoop
.negative
    xor $ff
    inc a
    ld de, wTmp
    ld [de], a
	hlcoord 17, 2
	ld a, "-"
	ld [hl], a
	ld bc, $0103
	call PrintNum
	xor a
	ld [hBGMapThird], a
	call DelayFrame_MP
	jp .songEditorLoop
	
.ChangingPitchb
    xor a
    ld [wChangingPitch], a
	hlcoord 16, 2
	ld a, $ed
	ld [hl], a
	xor a
	ld [hBGMapThird], a
	call DelayFrame_MP
	jp .songEditorLoop

RenderWaveform:
	fill 0, wWaveformTmpGFX, 64

    ld hl, wWaveformTmpGFX
    ld de, wWaveformTmp
    ld bc, $1080

.drawloop
	ld a, [de]
	inc de
	push de
	push hl
	ld d, 8
	ld e, a
	swap a
	rrca
	cpl
	and 7
	jr z, .draw
.seek
	inc hl
	inc hl
	dec d
	dec a
	jr nz, .seek
.draw
	ld a, [hl]
	or c
	ld [hli], a
	ld a, [hl]
	or c
	ld [hli], a
	dec d
	jr z, .done
.drawl
	ld a, [hl]
	or c
	ld [hli], a
	inc hl
	dec d
	jr nz, .drawl
.done
	pop hl
	push hl
	srl c
	ld d, 8
	ld a, e
	rrca
	cpl
	and 7
	jr z, .draw2
.seek2
	inc hl
	inc hl
	dec d
	dec a
	jr nz, .seek2
.draw2
	ld a, [hl]
	or c
	ld [hli], a
	ld a, [hl]
	or c
	ld [hli], a
	dec d
	jr z, .done2
.drawl2
	ld a, [hl]
	or c
	ld [hli], a
	inc hl
	dec d
	jr nz, .drawl2
.done2
	pop hl
	srl c
	jr nc, .nonewblock
	ld de, $10
	add hl, de
	ld c, $80
.nonewblock
	pop de
	dec b
	jr nz, .drawloop
	ret

DrawNotes:
    ld a, 0
    ld [wTmpCh], a
    call DrawNote
    ld a, 1
    ld [wTmpCh], a
    call DrawNote
    ld a, 2
    ld [wTmpCh], a
    jp DrawNote

DrawNote:
	ld a, [wMutedChannels]
	ld b, a
	ld a, [wTmpCh]
	and a
	jr z, .skipshift
.shiftloop
	srl b
	dec a
	jr nz, .shiftloop
.skipshift
	srl b
	jr c, .nonote
	ld a, [wTmpCh]
	add a
	ld c, a
	ld b, 0
	ld hl, wC1Vol
	add hl, bc
	ld a, [hl]
	and a
	jr z, .nonote
; get the note from tone frequency
; e = ⌊96.5-12*log₂(k/Freq("C1")/(2048-[wCxFreq]))⌋
;   = ⌊96.5-12*(log₂(k/Freq("C1"))-log₂(2048-[wCxFreq]))⌋
; k = 131072 when wTmpCh != 2
; k =  65536 when wTmpCh =  2
; Freq("C1") is 32.7032Hz in A440
	ld hl, wC1Freq
	add hl, bc
	ld a, [hli]
	cpl
	ld c, a
	ld a, [hl]
	cpl
	ld b, a ; -1-[wCxFreq]
	ld hl, 2049
	add hl, bc ; 2048-[wCxFreq]
	ld a, h
	and a
	ld a, l
	jr nz, .skip0check
	cp 1
	jr z, .logshiftdone
	jr c, .nonote
.skip0check
	ld bc, 0
	ld d, c
.logshiftloop
	srl h
	rr l
	rr c
	inc d
	ld a, h
	and a
	jr nz, .logshiftloop
	ld a, l
	cp 1
	jr nz, .logshiftloop
.logshiftdone
	ld hl, LogTable
	add hl, bc
	ld a, [hl]
	cpl
	ld e, a
	ld a, d
	cpl
	ld d, a ; -1-log₂(2048-[wCxFreq])
	ld a, [wTmpCh]
	cp 2
	ld hl, $bf8 ; log₂(65536/Freq("C1"))+1
	jr z, .ch3
	ld hl, $cf8 ; log₂(131072/Freq("C1"))+1
.ch3
	add hl, de ; log₂(k/Freq("C1"))-log₂(2048-[wCxFreq])
	ld b, h
	ld c, l
	add hl, hl
	add hl, bc
	add hl, hl
	add hl, hl ; 12*(log₂(k/Freq("C1"))-log₂(2048-[wCxFreq]))
	ld a, h
	cpl
	ld b, a
	ld a, l
	cpl
	ld c, a ; -1-12*(log₂(k/Freq("C1"))-log₂(2048-[wCxFreq]))
	ld hl, $6180 ; 97.5
	add hl, bc
	ld e, h ; ⌊96.5-12*(log₂(k/Freq("C1"))-log₂(2048-[wCxFreq]))⌋
	ld a, [wTmpCh]
	add a
	ld c, a
	ld b, 0
	ld hl, wChLastNotes
	add hl, bc
	ld a, e
	srl a
	srl a
	and $fe
	ld [hli], a
	ld a, e
	and 7
	sla a
	ld [hli], a
	ret
.nonote
	ld a, [wTmpCh]
	add a
	ld c, a
	ld b, 0
	ld hl, wChLastNotes
	add hl, bc
	ld a, $ff
	ld [hli], a
	ld [hl], a
	ret

UpdateVisualIntensity:
    ld hl, wVolTimer
    ld a, [hl]
    add 32
    ld [hl], a
.loop
	push hl
; update NR10 freq mod
	ld a, [wNR10Sub]
	and a
	jr z, .nofreqmod
	dec a
	ld [wNR10Sub], a
	jr nz, .nofreqmod
	ld a, [SoundInput]
	ld d, a
	swap a
	and 7
	ld [wNR10Sub], a
	ld a, 7
	and d
	ld e, a
	ld a, [wC1Freq]
	ld l, a
	ld c, a
	ld a, [wC1Freq + 1]
	ld h, a
	ld b, a
	ld a, e
	and a
	jr z, .skipshift
.shiftloop
	srl b
	rr c
	dec e
	jr nz, .shiftloop
.skipshift
	bit 3, d
	jr z, .inc
	ld a, c
	cpl
	ld c, a
	ld a, b
	cpl
	ld b, a
	inc c
	jr nz, .noincb
	inc b
.noincb
	add hl, bc
	ld a, h
	cp 2048 / $100
	jr c, .noovf
	ld hl, 0
	jr .noovf
.inc
	add hl, bc
	jr nc, .noovf
	ld hl, 2047
.noovf
	ld a, l
	ld [wC1Freq], a
	ld a, h
	ld [wC1Freq + 1], a
.nofreqmod
	ld hl, wC1Vol
	ld e, 4
.updateChannels
    inc hl
    ld a, [hl]
	and a
    jr z, .nextChannel2
	dec a
	ld [hl], a
    jr nz, .nextChannel2
	push hl
	ld a, 4
	sub e
	ld hl, Channel1Intensity
	ld bc, Channel2 - Channel1
	call AddNTimes
	ld a, [hl]
	pop hl
    ld b, a
	and 7
	add a
	ld [hld], a
	bit 3, b
	jr nz, .inc2
	ld a, [hl]
	and a
	jr z, .nextChannel
	dec [hl]
	jr .nextChannel
.inc2
	ld a, [hl]
	cp $f
	jr z, .nextChannel
	inc [hl]
.nextChannel
    inc hl
.nextChannel2
    inc hl
    dec e
    jr nz, .updateChannels
	pop hl
	ld a, [hl]
    sub 15
    ld [hl], a
	cp 15
	jp nc, .loop
	ret

GetSongInfo:
    ld a, [wSongSelection]
    ld b, a
	ld c, 0
    ld hl, SongInfo
.loop
	ld a, [hl]
    cp -1
    jr z, .noname
	inc c
    ld a, c
    cp b
    jr z, .found
.loop2
    ld a, [hli]
	cp "@"
	jr z, .nextline
    jr .loop2
.found
    xor a
    ret
.nextline
	inc hl
	inc hl
	inc hl
	jr .loop
.noname
    scf
    ret

DrawSongInfo:
    ld a, [wSongSelection]
    call GetSongInfo
    ret c ; no data
    
    push hl
    pop de
    ;hlcoord 0, 4
	hlcoord 0, 10
    call PlaceString
	inc de
	push de
	call GetSongOrigin
    hlcoord 0, 11
    call PlaceString
	pop de
    inc de
	;push de
	;call GetSongArtist
    ;hlcoord 0, 8
    ;call PlaceString
	;pop de
    inc de
	;push de
	;call GetSongArtist2
    ;hlcoord 0, 11
    ;call PlaceString
	;pop de
    ret

GetSongOrigin:
    ld a, [de]
    ld b, a
    ld hl, Origin
.loop
    ld a, [hli]
    cp -1
    jr z, .noname
    cp b
    jr nz, .loop
    push hl
    pop de
    ret
.noname
	ld de, BlankName
    ret

GetSongArtist:
    ld a, [de]
    ld b, a
    ld hl, Artist
.loop
    ld a, [hli]
    cp -1
    jr z, .noname
    cp b
    jr nz, .loop
    push hl
    pop de
    ret
.noname
	ld de, BlankName
    ret

GetSongArtist2:
    ld a, [de]
    ld b, a
    ld hl, Artist
.loop
    ld a, [hli]
    cp -1
    jr z, .noname
    cp b
    jr nz, .loop
    push hl
	ld de, Additional
	hlcoord 0, 10
    call PlaceString
    pop de
    ret
.noname
	ld de, BlankName
    ret
    
PER_PAGE EQU 15

SongSelector:
	ld bc, MPKeymapEnd-MPKeymap
	ld hl, MPKeymap
	decoord 0, 17
	call CopyBytes
	ld a, " "
	hlcoord 0, 0
	ld bc, 340
	call ByteFill
    call ClearSprites
    hlcoord 0, 0
    ld de, MusicListText
    call PlaceString
    textbox 0, 1, $12, $10
    hlcoord 0, 9
    ld [hl], $eb
    ld a, [wSongSelection]
    ld [wSelectorTop], a ; backup, in case of B button
    cp 8
    jr nc, .noOverflow
    ld b, a
    ld a, NUM_MUSIC - 1
    add b
.noOverflow
    sub 7
    ld [wSongSelection], a
    call UpdateSelectorNames
.loop
    call DelayFrame_MP
	call GetJoypad
	jbutton A_BUTTON, .a
	jbutton B_BUTTON, .exit
	jbutton D_DOWN, .down
	jbutton D_UP, .up
	jbutton D_LEFT, .left
	jbutton D_RIGHT, .right
    jr .loop
.a
    ld a, [wSongSelection]
    cp NUM_MUSIC - 7
    jr c, .noOverflow2
    sub NUM_MUSIC - 8
    jr .finish
.noOverflow2
    add 7
.finish
    ld [wSongSelection], a
    ld e, a
    ld d, 0
    callba PlayMusic2
    ret
.down
    ld a, [wSongSelection]
    inc a
    cp NUM_MUSIC
    jr c, .noOverflowD
    ld a, 1
.noOverflowD
    ld [wSongSelection], a
    call UpdateSelectorNames
    jr .loop
.up
    ld a, [wSongSelection]
    dec a
    cp 0
    jr nz, .noOverflowU
    ld a, NUM_MUSIC - 1
.noOverflowU
    ld [wSongSelection], a
    call UpdateSelectorNames
    jr .loop
.left
    ld a, [wSongSelection]
    sub 10
    jr nc, .noOverflowL
    ld a, NUM_MUSIC - 1
.noOverflowL
    ld [wSongSelection], a
    call UpdateSelectorNames
    jp .loop
.right
    ld a, [wSongSelection]
    add 10
    cp NUM_MUSIC
    jr c, .noOverflowR
    ld a, 1
.noOverflowR
    ld [wSongSelection], a
    call UpdateSelectorNames
    jp .loop
.exit
    ld a, [wSelectorTop]
    ld [wSongSelection], a
    ret
    

UpdateSelectorNames:
    call GetSongInfo
    ld a, [wSongSelection]
    ld c, a
    ld b, 0
    push hl
    pop de
.loop
    hlcoord 1, 2
    ld a, c
    ld [wSelectorCur], a
    push bc
    ld a, b
    ld bc, $0014
    call AddNTimes
    call MPLPlaceString
    inc de
    inc de
    inc de
    inc de
    pop bc
    inc b
    inc c
    ld a, c
    cp NUM_MUSIC
    jr c, .noOverflow
    ld c, 1
    ld de, SongInfo
.noOverflow
    ld a, b
    cp PER_PAGE
    jr nz, .loop
    ret
    
MPLPlaceString:
    push hl
    ld a, " "
    ld hl, StringBuffer2
    ld bc, 3
    call ByteFill
    ld hl, StringBuffer2
    push de
    ld de, wSelectorCur
    ld bc, $103
    call PrintNum
    pop de
    ld [hl], "│"
    inc hl
    ld b, 0
.loop
    ld a, [de]
    ld [hl], a
    cp "@"
    jr nz, .next
    ld [hl], " "
    dec de
.next
    inc hl
    inc de
    inc b
    ld a, b
    cp 14
    jr c, .loop
    ld a, [de]
    cp "@"
    jr nz, .notend
    ld [hl], a
    jr .last
.notend
    dec hl
    ld [hl], "<...>"
    inc hl
    ld [hl], "@"
.loop2
    inc de
    ld a, [de]
    cp "@"
    jr nz, .loop2
.last
    pop hl
    push de
    ld de, StringBuffer2
    call PlaceString
    pop de
    ret
	
RenderNarrowText:
; render 1bpp graphics of a narrow text of hl to de
; only work with character $7f-$ff
	ld b, 0 ; left/right indicator
	ld a, d
	ld [hTmpd], a
	ld a, e
	ld [hTmpe], a
.getcharloop
	ld a, [hli]
	cp "@"
	jp z, .end
	cp $7f
	jr c, .getcharloop
	jr nz, .notspace
	ld a, $bf
.notspace
	sub $80
	bit 0, b
	jr nz, .right
	ld d, a
	set 0, b
	jr .getcharloop
.right
	call .process
	jr .getcharloop
.process
	res 0, b
	srl a
	ld e, a
	ld a, 1
	jr c, .rodd
	xor a
.rodd
	srl d
	rla
	push hl
	push bc
	ld h, 0
	ld l, d
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, NarrowFontGFX
	add hl, bc
	push hl
	ld h, 0
	ld l, e
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, bc
	pop bc
	push hl
	ld hl, .RenderNarrowTextTable
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hTmpd]
	ld d, a
	ld a, [hTmpe]
	ld e, a
	jp [hl]
.return
	ld a, d
	ld [hTmpd], a
	ld a, e
	ld [hTmpe], a
	pop bc
	pop hl
	ret
.end
	bit 0, b
	ret z
	ld a, $bf-$80
	jp .process
	
.RenderNarrowTextTable
	dw .NT_Right0Left0
	dw .NT_Right0Left1
	dw .NT_Right1Left0
	dw .NT_Right1Left1
	
; hl = right
; bc = left
	
.NT_Right0Left0
	pop hl
	rept 8
	push de
	ld a, [bc]
	inc bc
	and $f0
	ld d, a
	ld a, [hli]
	swap a
	and $f
	add d
	pop de
	ld [de], a
	inc de
	endr
	jp .return
	
.NT_Right0Left1
	pop hl
	rept 8
	push de
	ld a, [bc]
	inc bc
	swap a
	and $f0
	ld d, a
	ld a, [hli]
	swap a
	and $f
	add d
	pop de
	ld [de], a
	inc de
	endr
	jp .return
	
.NT_Right1Left0
	pop hl
	rept 8
	push de
	ld a, [bc]
	inc bc
	and $f0
	ld d, a
	ld a, [hli]
	and $f
	add d
	pop de
	ld [de], a
	inc de
	endr
	jp .return
	
.NT_Right1Left1
	pop hl
	rept 8
	push de
	ld a, [bc]
	inc bc
	swap a
	and $f0
	ld d, a
	ld a, [hli]
	and $f
	add d
	pop de
	ld [de], a
	inc de
	endr
	jp .return
	
DelayFrame_MP:
; music player VBlank routine
	halt
	; TODO
	ld a, [hSCX]
	ld [rSCX], a
	ld a, [wNoteTile]
	ld c, a
	ld b, 0
	sla c
	rl b
; note display clear if requested
	ld a, [wMPFlags]
	bit 2, a
	jr z, .noclear
	push bc
	ld hl, VTiles2
	add hl, bc
	ld bc, $1f0
	xor a
	call .clr
	ld de, $f000
	add hl, de
	call .clr
	ld a, 1
	ld [rVBK], a
	xor a
	call .clr
	ld [rVBK], a
	ld hl, wMPFlags
	res 2, [hl]
	set 3, [hl]
	pop bc
; note display draw
.noclear
; ch1
	ld a, [wChLastNotes]
	cp $ff
	jr z, .drawch2
	call .getidx
	ld a, [wChLastNotes + 1]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wNoteMask]
	or [hl]
	ld [hli], a
	ld a, [wNoteMask]
	or [hl]
	ld [hl], a
	xor a
	ld [rVBK], a
.drawch2
	ld a, [wChLastNotes + 2]
	cp $ff
	jr z, .drawch3
	call .getidx
	ld a, [wChLastNotes + 3]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wNoteMask]
	or [hl]
	and [hl]
	ld [hli], a
	ld a, [wNoteMask]
	or [hl]
	ld [hl], a
	xor a
	ld [rVBK], a
.drawch3
	ld a, [wChLastNotes + 4]
	cp $ff
	jr z, .drawduty
	call .getidx
	ld a, [wChLastNotes + 5]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wNoteMask]
	or [hl]
	ld [hli], a
	ld a, [wNoteMask]
	or [hl]
	and [hl]
	ld [hl], a
	xor a
	ld [rVBK], a
.drawduty
; ch1-2 duty
	ld a, [wC1Duty]
	add $cc
	ld [VBGMap1 + $82], a
	ld a, [wC2Duty]
	add $cc
	ld [VBGMap1 + $85], a
; ch4 noise set
	ld a, [MusicNoiseSampleSet]
	add $da
	ld [VBGMap1 + $91], a
; visual intensities
	ld a, [wC1Vol]
	add $e8
	ld [VBGMap1 + $b0], a
	ld a, [wC2Vol]
	add $e8
	ld [VBGMap1 + $b1], a
	ld a, [wC3Vol]
	add $e8
	ld [VBGMap1 + $b2], a
	ld a, [wC4Vol]
	add $e8
	ld [VBGMap1 + $b3], a
	ld a, [wMutedChannels]
	ld hl, VBGMap1 + $b0
	rept 4
	rrca
	jr nc, .no\@
	ld [hl], $f9
.no\@
	inc hl
	endr
; wave gfx copy if requested
	ld a, [wMPFlags]
	bit 0, a
	jr z, .nowavecpy
	bit 3, a
	jr nz, .noinfocpy
	ld a, 4
	ld [Requested2bpp], a
	ld a, wWaveformTmpGFX % $100
	ld [Requested2bppSource], a
	ld a, wWaveformTmpGFX / $100
	ld [Requested2bppSource + 1], a
	ld a, $a0
	ld [Requested2bppDest], a
	ld a, $8b
	ld [Requested2bppDest + 1], a
	ld a, 1
	ld [rVBK], a
	call _Serve2bppRequest
	xor a
	ld [rVBK], a
	ld hl, wMPFlags
	res 0, [hl]
.nowavecpy
	ld a, [wMPFlags]
	bit 1, a
	jr z, .noinfocpy
	ld a, 2
	ld [Requested1bpp], a
	ld a, wSelectorGFX % $100
	ld [Requested1bppSource], a
	ld a, wSelectorGFX / $100
	ld [Requested1bppSource + 1], a
	ld a, $60
	ld [Requested1bppDest], a
	ld a, $8e
	ld [Requested1bppDest + 1], a
	ld a, 1
	ld [rVBK], a
	call _Serve1bppRequest
	xor a
	ld [rVBK], a
	ld hl, wMPFlags
	res 1, [hl]
.noinfocpy
; all vblank copies done
	ld hl, wMPFlags
	res 3, [hl]
	ld a, [hSCX]
	inc a
	ld [hSCX], a
	ld a, [wNoteMask]
	rrca
	jr nc, .noc
	ld a, [wNoteTile]
	add $8
	ld [wNoteTile], a
	set 2, [hl]
	ld a, $80
.noc
	ld [wNoteMask], a
	call Joypad
	callba _UpdateSound
	ret
.clr
	rept 4
	rept 16
	ld [hli], a
	endr
	add hl, bc
	endr
	ret
.getidx
	cp $10
	jr nc, .getidx2
	cp $8
	jr nc, .getidx1
	add $90
	add b
	ld h, a
	ld l, c
	ret
.getidx1
	add $80
	add b
	ld h, a
	ld l, c
	ret
.getidx2
	add $80
	add b
	ld h, a
	ld l, c
	ld a, 1
	ld [rVBK], a
	ret
	
LogTable:
; ⌊log₂(1+(x/256))*256⌋
	db   0,   1,   2,   4,   5,   7,   8,   9,  11,  12,  14,  15,  16,  18,  19,  21
	db  22,  23,  25,  26,  27,  29,  30,  31,  33,  34,  35,  37,  38,  39,  40,  42
	db  43,  44,  46,  47,  48,  49,  51,  52,  53,  54,  56,  57,  58,  59,  61,  62
	db  63,  64,  65,  67,  68,  69,  70,  71,  73,  74,  75,  76,  77,  78,  80,  81
	db  82,  83,  84,  85,  87,  88,  89,  90,  91,  92,  93,  94,  96,  97,  98,  99
	db 100, 101, 102, 103, 104, 105, 106, 108, 109, 110, 111, 112, 113, 114, 115, 116
	db 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 131, 132, 133
	db 134, 135, 136, 137, 138, 139, 140, 140, 141, 142, 143, 144, 145, 146, 147, 148
	db 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 162, 163
	db 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 173, 174, 175, 176, 177, 178
	db 179, 180, 181, 181, 182, 183, 184, 185, 186, 187, 188, 188, 189, 190, 191, 192
	db 193, 194, 194, 195, 196, 197, 198, 199, 200, 200, 201, 202, 203, 204, 205, 205
	db 206, 207, 208, 209, 209, 210, 211, 212, 213, 214, 214, 215, 216, 217, 218, 218
	db 219, 220, 221, 222, 222, 223, 224, 225, 225, 226, 227, 228, 229, 229, 230, 231
	db 232, 232, 233, 234, 235, 235, 236, 237, 238, 239, 239, 240, 241, 242, 242, 243
	db 244, 245, 245, 246, 247, 247, 248, 249, 250, 250, 251, 252, 253, 253, 254, 255

LoadingText:
    db "LOADING<...>@"

; ┌─┐│└┘
MPTilemap:
	db $c4,$c5,$c6,$c7,$8f,$90,$91,$92,$93,$94,$95,$96,$97,$98,$99,$9a,$9b,$9c,$9d,$9e
	db $c8,$c9,$ca,$cb,$8f,$a0,$a1,$a2,$a3,$a4,$a5,$a6,$a7,$a8,$a9,$aa,$ab,$ac,$ad,$ae
	db $c0,$c1,$c2,$c3,$8f,$80,$81,$82,$83,$84,$85,$86,$87,$88,$89,$8a,$8b,$8c,$8d,$8e
	db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$b0,$b1,$b2,$b3,$b4,$b5,$b6,$b7,$b8,$b9
	db $9f,$db,$ff,$9f,$dc,$ff,$9f,$dd,$ba,$bb,$bc,$bd,$ff,$9f,$de,$be,$fa,$ff,$ff,$fb
	db $e0,$e1,$e2,$e3,$e4,$cb,$e5,$dc,$e6,$e7,$af,$be,$bf,$d8,$d9,$ff,$ff,$ff,$ff,$ff

MPTilemapEnd

MPKeymap:
	db  0,1,2,3,4,5,6,0,1,2,3,4,5,6,0,1,2,3,4,5

MPKeymapEnd
    
NoteOAM:
    db $68,$a0,$00,$00
    db $5c,$a0,$01,$00
	db $50,$a0,$02,$00
	db $44,$a0,$03,$00
	db $38,$a0,$04,$00
	db $2c,$a0,$05,$00
	db $20,$a0,$06,$00
	db $14,$a0,$07,$00
NoteOAMEnd
	
Additional:
	db $d0,$d1,$d2,$d3,$d4,$d5,$d6,$d1,$d7,$8f
AdditionalEnd

EmptyPitch: db "   @"

MusicListText:
	db $d8,$d9

BlankName:
	db " @"
SongInfo:
    db "Title Screen@", 22, 1, 12
    db "Route 1@", 3, 1, 0
    db "Route 3@", 3, 1, 0
    db "Route 11@", 3, 1, 0
    db "Magnet Train@", 3, 8, 0
    db "Vs. Kanto Gym Leader@", 3, 1, 0
    db "Vs. Kanto Trainer@", 3, 1, 0
    db "Vs. Kanto Wild@", 3, 1, 0
    db "Pokémon Center@", 3, 1, 0
    db "Spotted! Hiker@", 3, 1, 0
    db "Spotted! Girl 1@", 3, 8, 0
    db "Spotted! Boy 1@", 3, 8, 0
    db "Heal Pokémon@", 3, 1, 0
    db "Lavender Town@", 3, $18, 0
    db "Viridian Forest@", 3, $18, 0
    db "Kanto Cave@", 3, 1, 0
    db "Follow Me!@", 3, 1, 0
    db "Game Corner@", 3, 8, 0
    db "Bicycle@", 3, 1, 0
    db "Hall of Fame@", 3, 1, 0
    db "Viridian City@", 3, 1, 0
    db "Celadon City@", 3, 1, 0
    db "Victory! Trainer@", 3, 1, 0
    db "Victory! Wild@", 3, 1, 0
    db "Victory! Champion@", 3, 1, 0
    db "Mt. Moon@", 3, 1, 0
    db "Gym@", 3, 1, 0
    db "Pallet Town@", 3, 1, 0
    db "Oak's Lab@", 3, 1, 0
    db "Professor Oak@", 3, 1, 0
    db "Rival Appears@", 3, 1, 0
    db "Rival Departure@", 3, 1, 0
    db "Surfing@", 3, 8, 0
    db "Evolution@", 3, 1, 0
    db "National Park@", 3, 8, 0
    db "Credits@", 3, 8, 0
    db "Azalea Town@", 3, 8, 0
    db "Cherrygrove City@", 3, 1, 0
    db "Spotted! Kimono Girl@", 3, 8, 0
    db "Union Cave@", 3, 1, 0
    db "Vs. Johto Wild@", 3, 1, 0
    db "Vs. Johto Trainer@", 3, 1, 0
    db "Route 30@", 3, 1, 0
    db "Ecruteak City@", 3, 8, 0
    db "Violet City@", 3, 8, 0
    db "Vs. Johto Gym Leader@", 3, 1, 0
    db "Vs. Champion@", 3, 1, 0
    db "Vs. Rival@", 3, 1, 0
    db "Vs. Rocket Grunt@", 3, 1, 0
    db "Elm's Lab@", 3, 1, 0
    db "Dark Cave@", 3, 1, 0
    db "Route 29@", 3, 1, 0
    db "Route 34@", 3, 1, 0
    db "S.S. Aqua@", 3, 8, 0
    db "Spotted! Boy 2@", 3, 1, 0
    db "Spotted! Girl 2@", 3, 1, 0
    db "Spotted! Team Rocket@", 3, 8, 0
    db "Spotted! Suspicious@", 3, 8, 0
    db "Spotted! Sage@", 3, 8, 0
    db "New Bark Town@", 3, $18, 0
    db "Goldenrod City@", 3, 1, 0
    db "Vermilion City@", 3, 1, 0
    db "Pokémon Channel@", 3, 1, 0
    db "PokéFlute@", 3, 1, 0
    db "Tin Tower@", 3, 1, 0
    db "Sprout Tower@", 3, 1, 0
    db "Burned Tower@", 3, 1, 0
    db "Olivine Lighthouse@", 3, 1, 0
    db "Route 42@", 3, 1, 0
    db "Indigo Plateau@", 3, 1, 0
    db "Route 38@", 3, 1, 0
    db "Rocket Hideout@", 3, 1, 0
    db "Dragon's Den@", 3, 1, 0
    db "Vs. Johto Wild Night@", 3, 1, 0
    db "Unown Radio@", 3, 1, 0
    db "Captured Pokémon@", 3, 1, 0
    db "Route 26@", 3, 1, 0
    db "Mom@", 3, 1, 0
    db "Victory Road@", 3, 1, 0
    db "Pokémon Lullaby@", 3, 1, 0
    db "Pokémon March@", 3, 1, 0
    db "Opening 1@", 22, 12, 0
    db "Opening 2@", 22, 1, 12
    db "Load Game@", 3, 1, 0
    db "Ruins of Alph Inside@", 3, 1, 0
    db "Team Rocket@", 3, 8, 0
    db "Dancing Hall@", 3, 8, 0
    db "Bug Contest Ranking@", 3, 8, 0
    db "Bug Contest@", 3, 1, 0
    db "Rocket Radio@", 3, 1, 0
    db "GameBoy Printer@", 3, 1, 0
    db "Post Credits@", 3, 8, 0
    db "Clair@", 4, 9, 0
    db "Mobile Adapter Menu@", 4, 9, 0
    db "Mobile Adapter@", 4, 9, 0
    db "Buena's Password@", 4, 9, 0
    db "Eusine@", 4, 9, 0
    db "Opening@", 4, 1, 0
    db "Battle Tower@", 4, 9, 0
    db "Vs. Suicune@", 4, 1, 0
    db "Battle Tower Lobby@", 4, 9, 0
    db "Mobile Center@", 4, 1, 0
    db "Cerulean City@", 1, 1, 2
	db "Cinnabar Island@", 7, 1, 2
	db "Route 24@", 7, 1, 2
	db "Shop@", 7, 8, 2
	db "Team Rocket Hideout@", 1, 1, 0
	db "Silph Company@", 1, 1, 0
	db "Mewtwo Battle@", 10, 10, 13
	db "Game Corner@", 6, $18, 2
	db "Rise of the Leech King@", 21, 11, 12
	db "Rival's Theme@", 1, 1, 0
	db "Rival's Theme (Cut)@", 1, 1, 0
	db "Trainer Battle@", 1, 1, 0
	db "Pokémon WCS Final Battle@", 8, 10, 12
	db "Oceanic Museum@", 5, 9, 1
	db "Pallet Town (Slow)@", 3, 1, 0
	db "Champion Battle@", 1, 1, 0
	db "Ho-Oh Battle@", 7, 8, 12
	db "Lugia Battle@", 7, 8, 12
	db "251 (Short Version)@", 22, 12, 0
    db -1
	
Origin:
	db 01, "Pokémon Red & Blue@"
	db 02, "Pokémon Yellow@"
	db 03, "Pokémon Gold & Silver@"
	db 04, "Pokémon Crystal@"
	db 05, "Pokémon Ruby & Sapphire@"
	db 06, "Pokémon Diamond & Pearl@"
	db 07, "Pokémon HeartGold & SoulSilver@"
	db 08, "Pokémon Black & White@"
	db 09, "Pokémon Black 2 & White 2@"
	db 10, "Pokémon X & Y@"
	db 11, "Pokémon Prism@"
	db 12, "Pokémon TCG@"
	db 13, "Pokémon TCG 2@"
	db 14, "Pokémon Pinball@"
	db 20, "Tales of TPP Deluxe@"
	db 21, "Dream Red@"
	db 22, "Pokémon Crystal Anniversary@"
	db -1
	
Artist:
	db $01, "Junichi Masuda@"
	db $02, "FroggestSpirit@"
	db $03, "LevusBevus@"
	db $04, "GRonnoc@"
	db $05, "Cat333Pokémon@"
	db $06, "Ichiro Shimakura@"
	db $07, "Danny-E 33@"
	db $08, "Go Ichinose@"
	db $09, "Morikazu Aoki@"
	db $0a, "Shota Kageyama"
	db $0b, "Church of the Helix Choir@"
	db $0c, "Pigu@"
	db $0d, "Pigu, GACT@"
	db $18, "Junichi Masuda, Go Ichinose@"
	db -1
