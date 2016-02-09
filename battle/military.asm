ParseExternalAI:
; In link battle, the player chooses moves, not the AI.
	ld a, [wLinkMode]
	and a
	ret nz
	ld hl, wMilitaryAndAIBattleAction
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, BEESAFREE_SND_ASKENEMY
.loop_back
	ld hl, wMilitaryFlags
	bit MILITARY_ON, [hl]
	jr z, .okay
	or BEESAFREE_SND_ASKMILITARY
.okay
	rst LUASerial
	ld a, [wMilitaryAndAIBattleAction]
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
	and a
	jr z, .Invalid
	ld [CurEnemyMove], a
	ld bc, EnemyMonPP - EnemyMonMoves
	add hl, bc
	ld a, [hl]
	and $3f
	jr z, .Invalid
	ld a, [CurEnemyMove]
	ld b, a
	ld a, [EnemyDisabledMove]
	cp b
	jr z, .Invalid
	ret
.Invalid
	ld a, BEESAFREE_SND_ASKENEMY | BEESAFREE_SND_INVALID
	jr .loop_back

Military:
; This is a dummy function until we can get a version that actually works.
	ld a, [wMilitaryAndAIBattleAction]
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
	jr z, .Invalid
	ld [CurPlayerMove], a
	and a
	ld bc, BattleMonPP - BattleMonMoves
	add hl, bc
	ld a, [hl]
	and $3f
	jr z, .Invalid
	ld a, [CurPlayerMove]
	ld b, a
	ld a, [DisabledMove]
	cp b
	jr z, .Invalid
	xor a
	ld [wd0ec], a
	ret
.Invalid
	ld a, BEESAFREE_SND_ASKMILITARY | BEESAFREE_SND_INVALID
	rst LUASerial
	jr Military

.SwitchOrItem
	ld a, [wMilitaryItem]
	and a
	jr z, .Switch
	ld [CurItem], a
	; fix this
	callba Function10629
	ret

.Switch
	; fill this in later
	ret

