; A little space between Joypad intterupt and ROM header that could

IF DEF(BEESAFREE)
ResetLUASerial::
	; Send 0 until 0 is received
	ld a, BEESAFREE_SND_RESET
	rst LUASerial
	cp BEESAFREE_RES_RESET
	jr nz, ResetLUASerial
	ret
	
_LUASerial:
	; Send a to an external AI computer and store the response in a
	ld b, 0
.beginning
	ld [hLSB], a
	ld a, BEESAFREE_LSC_TRANSFERRING
	ld [hLSC], a
.wait
	ld a, [hLSC]
	cp BEESAFREE_LSC_COMPLETED
	jr nz, .wait
	ld a, [hLSB]
	inc b
	cp 2
	jr z, .second
	ld [wdff8], a
	jr .beginning
.second
	ld a, [hLSB]
	ld [wdff9], a
	ret
ENDC
