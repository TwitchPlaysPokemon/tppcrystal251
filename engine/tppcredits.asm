SECTION "TPPCredits", ROMX;, BANK[CREDITS]

SCROLLER_DELAY EQU 200
C_TC_DRAW      EQU 0
C_TC_TITLE     EQU 1
C_TC_SUBTITLE  EQU 2

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
	ld a, 1 ; VBlank1
	ld [hVBlank], a
	;ld de, MUSIC_NONE
	;call PlayMusic
	; TODO
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

StripTiles: INCBIN "gfx/credits/strip_map.bin"
	
TPPCreditsBG1: ; TODO
TPPCreditsBG2: ; TODO
TPPCreditsBG3: ; TODO
TPPCreditsBG4: ; TODO
CommandsGFX: INCBIN "gfx/udlrab.1bpp"
StripGFX: INCBIN "gfx/credits/strip.1bpp"
	