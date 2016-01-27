UserPartyAttr:: ; 3945
	push af
	ld a, [hBattleTurn]
	and a
	jr nz, .ot
	pop af
	jr BattlePartyAttr
.ot
	pop af
	jr OTPartyAttr
; 3951


OpponentPartyAttr:: ; 3951
	push af
	ld a, [hBattleTurn]
	and a
	jr z, .ot
	pop af
	jr BattlePartyAttr
.ot
	pop af
	jr OTPartyAttr
; 395d


BattlePartyAttr:: ; 395d
; Get attribute a from the active BattleMon's party struct.
	push bc
	ld c, a
	ld b, 0
	ld hl, PartyMons
	add hl, bc
	ld a, [CurBattleMon]
	call GetPartyLocation
	pop bc
	ret
; 396d


OTPartyAttr:: ; 396d
; Get attribute a from the active EnemyMon's party struct.
	push bc
	ld c, a
	ld b, 0
	ld hl, OTPartyMon1Species
	add hl, bc
	ld a, [CurOTMon]
	call GetPartyLocation
	pop bc
	ret
; 397d


ResetDamage:: ; 397d
	xor a
	ld [CurDamage], a
	ld [CurDamage + 1], a
	ret
; 3985

SetPlayerTurn:: ; 3985
	xor a
	ld [hBattleTurn], a
	ret
; 3989

SetEnemyTurn:: ; 3989
	ld a, 1
	ld [hBattleTurn], a
	ret
; 398e


UpdateOpponentInParty:: ; 398e
	ld a, [hBattleTurn]
	and a
	jr z, UpdateEnemyMonInParty
	jr UpdateBattleMonInParty
; 3995

UpdateUserInParty:: ; 3995
	ld a, [hBattleTurn]
	and a
	jr z, UpdateBattleMonInParty
	jr UpdateEnemyMonInParty
; 399c

UpdateBattleMonInParty:: ; 399c
; Update level, status, current HP

	ld a, [CurBattleMon]

Function399f:: ; 399f
	ld hl, PartyMon1Level
	call GetPartyLocation

	ld d, h
	ld e, l
	ld hl, BattleMonLevel
	ld bc, BattleMonMaxHP - BattleMonLevel
	jp CopyBytes
; 39b0

UpdateEnemyMonInParty:: ; 39b0
; Update level, status, current HP

; No wildmons.
	ld a, [wBattleMode]
	dec a
	ret z

	ld a, [CurOTMon]
	ld hl, OTPartyMon1Level
	call GetPartyLocation

	ld d, h
	ld e, l
	ld hl, EnemyMonLevel
	ld bc, EnemyMonMaxHP - EnemyMonLevel
	jp CopyBytes
; 39c9


RefreshBattleHuds:: ; 39c9
	call UpdateBattleHuds
	ld c, 3
	call DelayFrames
	jp WaitBGMap
; 39d4

UpdateBattleHuds:: ; 39d4
	callba UpdatePlayerHUD
	callba UpdateEnemyHUD
	ret
; 39e1


GetBattleVar:: ; 39e1
; Preserves hl.
	push hl
	call GetBattleVarAddr
	pop hl
	ret
; 39e7

GetBattleVarAddr:: ; 39e7
; Get variable from pair a, depending on whose turn it is.
; There are 21 variable pairs.

	push bc

	ld hl, .battlevarpairs
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc

	ld a, [hli]
	ld h, [hl]
	ld l, a

; Enemy turn uses the second byte instead.
; This lets battle variable calls be side-neutral.
	ld a, [hBattleTurn]
	and a
	jr z, .getvar
	inc hl
	
.getvar
; var id
	ld a, [hl]
	ld c, a
	ld b, 0

	ld hl, .vars
	add hl, bc
	add hl, bc

	ld a, [hli]
	ld h, [hl]
	ld l, a
	
	ld a, [hl]
	
	pop bc
	ret

.battlevarpairs
	dw .substatus1, .substatus2, .substatus3, .substatus4, .substatus5
	dw .substatus1opp, .substatus2opp, .substatus3opp, .substatus4opp, .substatus5opp
	dw .status, .statusopp, .animation, .effect, .power, .type
	dw .curmove, .lastcounter, .lastcounteropp, .lastmove, .lastmoveopp
	dw .type1 , .type2, .type1opp , .type2opp;, .screens, .screensopp

	const_def
	const PLAYER_SUBSTATUS_1
	const ENEMY_SUBSTATUS_1
	const PLAYER_SUBSTATUS_2
	const ENEMY_SUBSTATUS_2
	const PLAYER_SUBSTATUS_3
	const ENEMY_SUBSTATUS_3
	const PLAYER_SUBSTATUS_4
	const ENEMY_SUBSTATUS_4
	const PLAYER_SUBSTATUS_5
	const ENEMY_SUBSTATUS_5
	const PLAYER_STATUS
	const ENEMY_STATUS
	const PLAYER_MOVE_ANIMATION
	const ENEMY_MOVE_ANIMATION
	const PLAYER_MOVE_EFFECT
	const ENEMY_MOVE_EFFECT
	const PLAYER_MOVE_POWER
	const ENEMY_MOVE_POWER
	const PLAYER_MOVE_TYPE
	const ENEMY_MOVE_TYPE
	const PLAYER_CUR_MOVE
	const ENEMY_CUR_MOVE
	const PLAYER_COUNTER_MOVE
	const ENEMY_COUNTER_MOVE
	const PLAYER_LAST_MOVE
	const ENEMY_LAST_MOVE
	const PLAYER_TYPE_1
	const ENEMY_TYPE_1
	const PLAYER_TYPE_2
	const ENEMY_TYPE_2
;	const PLAYER_SCREENS
;	const ENEMY_SCREENS

;                       player                     enemy
.substatus1     db PLAYER_SUBSTATUS_1,    ENEMY_SUBSTATUS_1
.substatus1opp  db ENEMY_SUBSTATUS_1,     PLAYER_SUBSTATUS_1
.substatus2     db PLAYER_SUBSTATUS_2,    ENEMY_SUBSTATUS_2
.substatus2opp  db ENEMY_SUBSTATUS_2,     PLAYER_SUBSTATUS_2
.substatus3     db PLAYER_SUBSTATUS_3,    ENEMY_SUBSTATUS_3
.substatus3opp  db ENEMY_SUBSTATUS_3,     PLAYER_SUBSTATUS_3
.substatus4     db PLAYER_SUBSTATUS_4,    ENEMY_SUBSTATUS_4
.substatus4opp  db ENEMY_SUBSTATUS_4,     PLAYER_SUBSTATUS_4
.substatus5     db PLAYER_SUBSTATUS_5,    ENEMY_SUBSTATUS_5
.substatus5opp  db ENEMY_SUBSTATUS_5,     PLAYER_SUBSTATUS_5
.status         db PLAYER_STATUS,         ENEMY_STATUS
.statusopp      db ENEMY_STATUS,          PLAYER_STATUS
.animation      db PLAYER_MOVE_ANIMATION, ENEMY_MOVE_ANIMATION
.effect         db PLAYER_MOVE_EFFECT,    ENEMY_MOVE_EFFECT
.power          db PLAYER_MOVE_POWER,     ENEMY_MOVE_POWER
.type           db PLAYER_MOVE_TYPE,      ENEMY_MOVE_TYPE
.curmove        db PLAYER_CUR_MOVE,       ENEMY_CUR_MOVE
.lastcounter    db PLAYER_COUNTER_MOVE,   ENEMY_COUNTER_MOVE
.lastcounteropp db ENEMY_COUNTER_MOVE,    PLAYER_COUNTER_MOVE
.lastmove       db PLAYER_LAST_MOVE,      ENEMY_LAST_MOVE
.lastmoveopp    db ENEMY_LAST_MOVE,       PLAYER_LAST_MOVE
.type1			db PLAYER_TYPE_1,		  ENEMY_TYPE_1
.type1opp		db ENEMY_TYPE_1,		  PLAYER_TYPE_1
.type2			db PLAYER_TYPE_2,		  ENEMY_TYPE_2
.type2opp		db ENEMY_TYPE_2,		  PLAYER_TYPE_2
;.screens		db PLAYER_SCREENS,		  ENEMY_SCREENS
;.screensopp		db ENEMY_SCREENS,		  PLAYER_SCREENS


.vars
	dw PlayerSubStatus1,           EnemySubStatus1
	dw PlayerSubStatus2,           EnemySubStatus2
	dw PlayerSubStatus3,           EnemySubStatus3
	dw PlayerSubStatus4,           EnemySubStatus4
	dw PlayerSubStatus5,           EnemySubStatus5
	dw BattleMonStatus,            EnemyMonStatus
	dw wPlayerMoveStructAnimation, wEnemyMoveStructAnimation
	dw wPlayerMoveStructEffect,    wEnemyMoveStructEffect
	dw wPlayerMoveStructPower,     wEnemyMoveStructPower
	dw wPlayerMoveStructType,      wEnemyMoveStructType
	dw CurPlayerMove,              CurEnemyMove
	dw LastEnemyCounterMove,       LastPlayerCounterMove
	dw LastPlayerMove,             LastEnemyMove
	dw BattleMonType1,			   EnemyMonType1
	dw BattleMonType2,			   EnemyMonType2
;	dw PlayerScreens,				EnemyScreens
;	dw EnemyScreens,				PlayerScreens

; 3a90


Function3a90:: ; 3a90
	inc hl
	ld a, [hROMBank]
	push af
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld [hROMBank], a
	ld [MBC3RomBank], a
	ld a, e
	ld l, a
	ld a, d
	ld h, a
	ld de, wd00c
	ld bc, $0028
	call CopyBytes
	pop af
	ld [hROMBank], a
	ld [MBC3RomBank], a
	ret
; 3ab2


MobileTextBorder:: ; 3ab2

CELL_PHONE_TOP    EQU $5e
CELL_PHONE_BOTTOM EQU $5f

	; For mobile link battles only.
	;ld a, [wLinkMode]
	;cp 4
	scf
	ret c

	; Draw a cell phone icon at the
	; top right corner of the border.
	;hlcoord 19, 12
	;ld [hl], CELL_PHONE_TOP
	;hlcoord 19, 13
	;ld [hl], CELL_PHONE_BOTTOM
	;ret
; 3ac3


BattleTextBox:: ; 3ac3
; Open a textbox and print text at hl.
	push hl
	call SpeechTextBox
	call MobileTextBorder
	call Function1ad2
	call Function321c
	pop hl
	call PrintTextBoxText
	ret
; 3ad5


StdBattleTextBox:: ; 3ad5
; Open a textbox and print battle text at 20:hl.

GLOBAL BattleText

	ld a, [hROMBank]
	push af

	ld a, BANK(BattleText)
	rst Bankswitch

	call BattleTextBox

	pop af
	rst Bankswitch
	ret
; 3ae1
