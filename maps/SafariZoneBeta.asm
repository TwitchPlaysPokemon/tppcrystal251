SafariZoneBeta_MapScriptHeader: ; 0x74474
	; trigger count
	db 0

	; callback count
	db 0
; 0x74476

SafariZoneBeta_MapEventHeader: ; 0x74476
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $17, $9, 1, GROUP_SAFARI_ZONE_FUCHSIA_GATE_BETA, MAP_SAFARI_ZONE_FUCHSIA_GATE_BETA
	warp_def $17, $a, 2, GROUP_SAFARI_ZONE_FUCHSIA_GATE_BETA, MAP_SAFARI_ZONE_FUCHSIA_GATE_BETA

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0
; 0x74486

