ParseExternalAI:
; In link battle, the player chooses moves, not the AI.
	ld a, [wLinkMode]
	and a
	ret nz
	ld hl, wdff8
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, BEESAFREE_SND_ASKENEMY
	ld hl, wMilitaryFlags
	bit MILITARY_ON, [hl]
	jr z, .okay
	or BEESAFREE_SND_ASKMILITARY
.okay
	rst LUASerial
	ld a, [wdff8]
	and $f0
	swap a
	cp 4
	jr c, .UseMove
	; cp 10
	; jr c, .Switch
	; jr z, .okay
	; cp 13
	; jr c, .UseItem
	; jr z, .Struggle
	; cp 15
	; jr nz, .okay
	; scf
	; ret

	and 3 ; debug
.UseMove
	ld [CurEnemyMoveNum], a
	ld c, a
	ld b, 0
	ld hl, EnemyMonMoves
	add hl, bc
	ld a, [hl]
	ld [CurEnemyMove], a
	ret

MilitaryRepeatRequest:
	ld a, BEESAFREE_SND_ASKENEMY | BEESAFREE_SND_ASKMILITARY
	rst LUASerial
Military:
; This is a dummy function until we can get a version that actually works.
	ld a, [wdff8]
	and $f
	cp 4
	jr c, .UseMove
	cp 10
	jr c, .SwitchOrItem
	; cp 13
	; jr z, .Struggle
	; cp 15
	; jr nz, MilitaryRepeatRequest
	; scf
	; ret

	and 3 ; debug
.UseMove
	ld [CurMoveNum], a
	ld c, a
	ld b, 0
	ld hl, BattleMonMoves
	add hl, bc
	ld a, [hl]
	ld [CurPlayerMove], a
	xor a
	ld [wd0ec], a
	ret

.SwitchOrItem
	ld a, [wdff9]
	and a
	jr z, .Switch
	ld [CurItem], a
	callba Function10629
	ret

.Switch
	; fill this in later
	ret

