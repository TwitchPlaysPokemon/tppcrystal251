SetSeenAndCaughtMon:: ; 3380
	push af
	ld c, a
	ld hl, PokedexCaught
	ld b, SET_FLAG
	call PokedexFlagAction
	pop af
	; fallthrough
; 338b

SetSeenMon:: ; 338b
	ld c, a
	ld hl, PokedexSeen
	ld b, SET_FLAG
	jr PokedexFlagAction
; 3393

CheckCaughtMon:: ; 3393
	ld c, a
	ld hl, PokedexCaught
	ld b, CHECK_FLAG
	jr PokedexFlagAction
; 339b

CheckSeenMon:: ; 339b   Return the status of the mon in C's flag in a, put 2 in b and the flag location in hl
	ld c, a
	ld hl, PokedexSeen
	ld b, CHECK_FLAG 
	; fallthrough
; 33a1

PokedexFlagAction:: ; 33a1
	ld d, 0
	predef FlagPredef ; what's the difference between predef and call?
	ld a, c ; redundent?
	and a ;set zero flag besed on returned flag
	ret
; 33ab

