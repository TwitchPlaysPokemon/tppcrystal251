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
.retry_request
	callba Function3e8d1
	ld a, BEESAFREE_SND_ASKENEMY
	jr z, .loop_back
	xor a
.loop_back
	ld hl, wMilitaryFlags
	bit MILITARY_ON, [hl]
	jr z, .okay
	or BEESAFREE_SND_ASKMILITARY
.okay
	ret z
	rst LUASerial
	ld a, [wMilitaryAndAIBattleAction]
	and $f0
	swap a
	cp 4
	jr c, .UseMove
	cp 10
	jr c, .Switch
	jr z, .retry_request
	cp 13
	jr c, .UseItem
	jr z, .Struggle
	cp 15
	jr z, .Flee
	jp .Invalid

	; and 3 ; debug
.UseMove
	push af
	ld hl, BattleMonPP
	call Mil_AI_CheckPP
	pop bc
	jr z, .Struggle
	ld a, b
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

.Struggle
	ld a, STRUGGLE
	ld [CurEnemyMove], a
	ret

.Switch
	sub 4
	ld b, a
	ld a, [wBattleMode]
	dec a
	jr z, .Invalid
	ld a, [OTPartyCount]
	cp b
	jr c, .Invalid

	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	jr nz, .Invalid

	ld a, [wc731]
	and a
	jr nz, .Invalid
	ld a, b
	ld bc, $30
	ld hl, OTPartyMon1HP
	call AddNTimes
	ld a, [hli]
	or [hl]
	jr z, .Invalid
	ret

.UseItem
	sub $d
	ld hl, wc650
	jr z, .got_ai_item
	inc hl
.got_ai_item
	ld a, [hl]
	and a
	jr z, .Invalid
	ret

.Flee
	ld a, [wBattleMode]
	dec a
	jr nz, .Invalid

	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	jr nz, .Invalid

	ld a, [wc731]
	and a
	jr nz, .Invalid
	ret

.Invalid
	ld a, BEESAFREE_SND_ASKENEMY | BEESAFREE_SND_INVALID
	jp .loop_back


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
	push af
	callba Function3e786
	pop bc
	jr z, .Struggle
	ld a, b
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
.Struggle
	xor a
	ld [wd0ec], a
	and a
	ret

.SwitchOrItem
	sub 4
	ld b, a
	ld a, [PartyCount]
	cp b
	jr c, .Invalid
	ld a, [wMilitaryItem]
	and a
	jr z, .Switch
	ld [CurItem], a

	ld a, [wLinkMode]
	and a
	jr nz, .Invalid

	ld a, [InBattleTowerBattle]
	and a
	jr nz, .Invalid
	ld hl, NumItems
	call CheckItem
	jr nc, .Invalid

	; fix this
	call Function1d6e
	callba Function10629
	ld a, 1
	ld [wd0ec], a
	callba Function3e234
	ret

.Switch
	ld a, b
	; fill this in later
	and a
	ret

.Flee
	; fill this in later
	scf
	ret
.FailFlee
	and a
	ret

.Invalid
	ld a, BEESAFREE_SND_ASKMILITARY | BEESAFREE_SND_INVALID
	rst LUASerial
	jp Military

Mil_AI_CheckPP:
	ld b, 0
	ld a, [EnemyDisableCount]
	and $f0
	swap a
	ld c, a
	ld d, 5
	dec hl
.loop
	inc hl
	dec d
	jr z, .done
	ld a, 4
	sub d
	cp c
	jr z, .loop
	ld a, [hl]
	and $3f
	or b
	ld b, a
	jr .loop
.done
	ld a, b
	and a
	ret

