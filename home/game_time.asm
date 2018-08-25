ResetGameTime:: ; 208a
	xor a
	ld [GameTimeCap], a
	ld [GameTimeHours], a
	ld [GameTimeHours + 1], a
	ld [GameTimeMinutes], a
	ld [GameTimeSeconds], a
	ld [GameTimeFrames], a
	ret
; 209e


GameTimer:: ; 209e

	nop

	ld a, [rSVBK]
	push af
	ld a, 1
	ld [rSVBK], a

	call UpdateGameTimer

	pop af
	ld [rSVBK], a
	ret
; 20ad


UpdateGameTimer:: ; 20ad
; Increment the game timer by one frame.
; The game timer is capped at 9999:59:59.00.


; Don't update if game logic is paused.
	ld a, [wc2cd]
	and a
	ret nz

; Is the timer paused?
	ld hl, GameTimerPause
	bit 0, [hl]
	ret z
	
IF DEF(NO_RTC)
	ld a, [hSeconds + 1]
	inc a
	cp 5 ; 12x faster = 2 hours/day
	jr nc, .second2
	ld [hSeconds + 1], a
	jr .gametime
.second2
	xor a
	ld [hSeconds + 1], a
	ld a, [hSeconds]
	inc a
	cp 60
	jr nc, .minute2
	ld [hSeconds], a
	jr .gametime
.minute2
	xor a
	ld [hSeconds], a
	ld a, [hMinutes]
	inc a
	cp 60
	jr nc, .hour2
	ld [hMinutes], a
	jr .gametime
.hour2
	xor a
	ld [hMinutes], a
	ld a, [hHours]
	inc a
	cp 24
	jr nc, .day2
	ld [hHours], a
	jr .gametime
.day2
	xor a
	ld [hHours], a
	ld a, [CurDay]
	inc a
	cp 7
	jr c, .week2
	xor a
.week2
	ld [CurDay], a
.gametime
ENDC

; Is the timer already capped?
	ld hl, GameTimeCap
	bit 0, [hl]
	ret nz


; +1 frame
	ld hl, GameTimeFrames
	ld a, [hl]
	inc a

	cp 60 ; frames/second
	jr nc, .second

	ld [hl], a
	ret


.second
	xor a
	ld [hl], a

; +1 second
	ld hl, GameTimeSeconds
	ld a, [hl]
	inc a

	cp 60 ; seconds/minute
	jr nc, .minute

	ld [hl], a
	ret


.minute
	xor a
	ld [hl], a

; +1 minute
	ld hl, GameTimeMinutes
	ld a, [hl]
	inc a

	cp 60 ; minutes/hour
	jr nc, .hour

	ld [hl], a
	ret


.hour
	xor a
	ld [hl], a

; +1 hour
	ld a, [GameTimeHours]
	ld h, a
	ld a, [GameTimeHours + 1]
	ld l, a
	inc hl


; Cap the timer after 10000 hours.
	ld a, h
	cp 10000 / $100
	jr c, .ok

	ld a, l
	cp 10000 % $100
	jr c, .ok

	ld hl, GameTimeCap
	set 0, [hl]

	ld a, 59 ; 9999:59:59.00
	ld [GameTimeMinutes], a
	ld [GameTimeSeconds], a
	ret


.ok
	ld a, h
	ld [GameTimeHours], a
	ld a, l
	ld [GameTimeHours + 1], a
	ret
; 210f

