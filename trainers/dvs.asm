GetTrainerDVs: ; 270c4
; Return the DVs of OtherTrainerClass in bc

	push hl
	ld a, [OtherTrainerClass]
	cp BABA
	jr nz, .okay
	ld a, [EnemyMonSpecies]
	cp GYARADOS
	jr z, .dada
	ld a, [OtherTrainerClass]
.okay
	cp PSYCHIC_T
	jr nz, .okay2
	ld a, [OtherTrainerID]
	cp 1
	jr z, .PsychicNathan
	cp 11
	jr z, .PsychicJared
	ld a, [OtherTrainerClass]
.okay2
	dec a
	ld c, a
	ld b, 0

	ld hl, TrainerClassDVs
	add hl, bc
	add hl, bc

	ld a, [hli]
	ld b, a
	ld c, [hl]

	pop hl
	ret
; 270d6

.dada
	ld bc, $daaa
	pop hl
	ret

.PsychicNathan
	ld bc, $7215
	pop hl
	ret

.PsychicJared
	ld a, [CurPartyMon]
	add a
	ld c, a
	ld b, 0
	ld hl, .JaredDVs
	add hl, bc
	ld b, [hl]
	inc hl
	ld c, [hl]
	pop hl
	ret

.JaredDVs
	db $78, $9f
	db $f2, $6e
	db $ab, $23
	db $f9, $b2
	db $1a, $38
	db $21, $d2

TrainerClassDVs: ; 270d6
	;  Atk  Spd
	;  Def  Spc
	db $9A, $77 ; falkner
	db $88, $88 ; bugsy
	db $98, $88 ; whitney
	db $98, $88 ; morty
	db $98, $88 ; pryce
	db $98, $88 ; jasmine
	db $98, $88 ; chuck
	db $7C, $DD ; clair
	db $DD, $DD ; rival1
	db $DD, $DD ; pokemon prof
	db $DC, $DD ; will
	db $DC, $DD ; cal
	db $DC, $DD ; bruno
	db $7F, $DF ; karen
	db $DC, $DD ; koga
	db $DC, $DD ; champion
	db $98, $88 ; brock
	db $78, $88 ; misty
	db $98, $88 ; lt surge
	db $98, $88 ; scientist
	db $78, $88 ; erika
	db $98, $88 ; youngster
	db $98, $88 ; schoolboy
	db $98, $88 ; bird keeper
	db $58, $88 ; lass
	db $98, $88 ; janine
	db $D8, $C8 ; cooltrainerm
	db $7C, $C8 ; cooltrainerf
	db $69, $C8 ; beauty
	db $98, $88 ; pokemaniac
	db $D8, $A8 ; gruntm
	db $98, $88 ; gentleman
	db $98, $88 ; skier
	db $68, $88 ; teacher
	db $7D, $87 ; sabrina
	db $98, $88 ; bug catcher
	db $98, $88 ; fisher
	db $98, $88 ; swimmerm
	db $78, $88 ; swimmerf
	db $98, $88 ; sailor
	db $98, $88 ; super nerd
	db $98, $88 ; rival2
	db $98, $88 ; guitarist
	db $A8, $88 ; hiker
	db $98, $88 ; biker
	db $98, $88 ; blaine
	db $98, $88 ; burglar
	db $98, $88 ; firebreather
	db $98, $88 ; juggler
	db $98, $88 ; blackbelt
	db $D8, $A8 ; executivem
	db $98, $88 ; psychic
	db $6A, $A8 ; picnicker
	db $98, $88 ; camper
	db $7E, $A8 ; executivef
	db $98, $88 ; sage
	db $78, $88 ; medium
	db $98, $88 ; boarder
	db $98, $88 ; pokefanm
	db $68, $8A ; kimono girl
	db $68, $A8 ; twins
	db $6D, $88 ; pokefanf
	db $FD, $DE ; red
	db $9D, $DD ; blue
	db $98, $88 ; officer
	db $7E, $A8 ; gruntf
	db $aa, $aa ; mysticalman
	db $88, $98 ; bill
	db $DD, $DD ; elm
	db $DD, $DD ; tppPc
	db $D8, $C8 ; Giovanni
	db $D8, $C8 ; coolsibs
	db $DD, $DD ; rivalrb
	db $DD, $DD ; rivalrb
	db $98, $88 ; brockrb
	db $78, $88 ; mistyrb
	db $DD, $DD ; baba
; 2715c

