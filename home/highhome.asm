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
	; set the wram bank to 1 so the script can read battle data correctly
	push bc
	ld b, a
	ld a, [rSVBK]
	push af
	ld a, 1
	ld [rSVBK], a
	ld a, b
	ld [hLSB], a
	ld a, BEESAFREE_LSC_TRANSFERRING
	ld [hLSC], a
.wait
	ld a, [hLSC]
	cp BEESAFREE_LSC_COMPLETED
	jr nz, .wait
	pop af
	ld [rSVBK], a
	ld a, [hLSB]
	pop bc
	ret
ENDC
