; In link battle, the player chooses moves, not the AI.
	ld a, [InLinkBattle]
	and a
	ret nz

;Let's start
MilitaryInit:
	ld a, [wdffa] ;Checks if in military mode
	and $1
	ret z
	callab Function4000
	ld a, MILITARY_IDLE + (MILITARY_IDLE * $10)
	ld [wdff8], a
MilitaryPlayerLoop:
	ld a, [wdffa]
	res 1, a
	ld [wdffa], a
MilitaryLoop:
	call GetCommand
	cp MILITARY_IDLE
	jr z, MilitaryPlayerLoop
	cp MILITARY_ATTACK + NUM_MOVES
	jp c, GetMove
	ret

MilitaryEnemyLoop:
	ld a, [wdffa]
	set 1, a
	ld [wdffa], a
	jp MilitaryLoop
	
;Start at base (hl) then goes up by a
GetArrayPosition:
	ld bc, $0001
	call AddNTimes
	ld a, [hl]
	ret

AddressEnd:
	pop af
	ret
	
MoveAddress:
	push af
	ld hl, BattleMonMoves
	call GetMode
	jp z, AddressEnd
	ld hl, EnemyMonMoves
	jp AddressEnd
	
PPAddress:
	push af
	ld hl, BattleMonPP
	call GetMode
	jp z, AddressEnd
	ld hl, EnemyMonPP
	jp AddressEnd
	
DisableAddress:
	push af
	ld hl, DisabledMove
	call GetMode
	jp z, AddressEnd
	ld hl, EnemyDisabledMove
	jp AddressEnd

;Set the move that's going to be used	
SetMove:
	push af
	call GetMode
	jp z, .setPlayerMove
	pop af
	ld [CurEnemyMove], a
	ret
.setPlayerMove
	pop af
	ld [CurPlayerMove], a
	ret
	
;Checks if you have enough PP for this move and that it isn't disabled. If all checks out then use it. 
GetMove:
	call PPAddress
	call GetArrayPosition
	and a
	jp z, MilitaryPlayerLoop ;If you're out of PP return to the loop
	call GetCommand
	
	call MoveAddress
	call GetArrayPosition
	and a
	jp z, MilitaryPlayerLoop ;return to the loop if the move index is 0
	
	ld b, a
	call DisableAddress 
	ld a, [hl]
	cp b
	jp z, MilitaryPlayerLoop ;return to the loop if disabled
	ld a, b
	call SetMove
	jp ChangeMode

;Switches checking from player or enemy. 
ChangeMode:
	call GetMode
	jr nz, .endSegment
	jp MilitaryEnemyLoop
.endSegment;Let's execute these commands
	ld a, [wdffa]
	res 1, a
	call Function30bf
	callab Function3c5fe
	ret
	
GetCommand:
	call GetMode
	jr nz, .enemyCommand
	ld a, [wdff8]
	and $f
	ret
.enemyCommand
	push bc
	ld a, [wdff8]
	ld c, $10
	call SimpleDivide
	ld a, b
	pop bc
	ret
	
GetMode:
	ld a, [wdffa]
	and $2
	ret