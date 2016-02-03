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
	; TODO
	ret
	
TPPCreditsList:
	tc_draw			TPPCreditsBG1
	tc_title		.director
	tc_subtitle		  .streamer
	tc_tltle		.projman
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
	
StripTiles: INCBIN "gfx/credits/strip_map.bin"
	
TPPCreditsBG1: ; TODO
TPPCreditsBG2: ; TODO
TPPCreditsBG3: ; TODO
TPPCreditsBG4: ; TODO
CommandsGFX: INCBIN "gfx/udlrab.1bpp"
StripGFX: INCBIN "gfx/credits/strip.1bpp"
	