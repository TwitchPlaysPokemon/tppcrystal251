wEnemyMoveStructAnimation = 0xc608 -- 1 bytes
wEnemyMoveStructEffect = 0xc609 -- 1 bytes
wEnemyMoveStructPower = 0xc60a -- 1 bytes
wEnemyMoveStructType = 0xc60b -- 1 bytes
wEnemyMoveStructAccuracy = 0xc60c -- 1 bytes
wEnemyMoveStructPP = 0xc60d -- 1 bytes
wEnemyMoveStructEffectChance = 0xc60e -- 1 bytes
wPlayerMoveStructAnimation = 0xc60f -- 1 bytes
wPlayerMoveStructEffect = 0xc610 -- 1 bytes
wPlayerMoveStructPower = 0xc611 -- 1 bytes
wPlayerMoveStructType = 0xc612 -- 1 bytes
wPlayerMoveStructAccuracy = 0xc613 -- 1 bytes
wPlayerMoveStructPP = 0xc614 -- 1 bytes
wPlayerMoveStructEffectChance = 0xc615 -- 1 bytes

EnemyMonNick = 0xc616 -- 11 bytes
BattleMonNick = 0xc621 -- 11 bytes

BattleMonSpecies = 0xc62c -- 1 bytes
BattleMonItem = 0xc62d -- 1 bytes
BattleMonMoves = 0xc62e -- 4 bytes
BattleMonDVs = 0xc632 -- 2 bytes
BattleMonPP = 0xc634 -- 4 bytes
BattleMonHappiness = 0xc638 -- 1 bytes
BattleMonLevel = 0xc639 -- 1 bytes
BattleMonStatus = 0xc63a -- 2 bytes
BattleMonHP = 0xc63c -- 2 bytes
BattleMonMaxHP = 0xc63e -- 2 bytes
BattleMonAttack = 0xc640 -- 2 bytes
BattleMonDefense = 0xc642 -- 2 bytes
BattleMonSpeed = 0xc644 -- 2 bytes
BattleMonSpclAtk = 0xc646 -- 2 bytes
BattleMonSpclDef = 0xc648 -- 2 bytes
BattleMonType1 = 0xc64a -- 1 bytes
BattleMonType2 = 0xc64b -- 1 bytes


wWildMon = 0xc64e -- 1 bytes
wEnemyTrainerItem1 = 0xc650 -- 1 bytes
wEnemyTrainerItem2 = 0xc651 -- 1 bytes
wEnemyTrainerBaseReward = 0xc652 -- 1 bytes
wEnemyTrainerAIFlags = 0xc653 -- 3 bytes
OTName = 0xc656 -- 11 bytes


CurOTMon = 0xc663 -- 1 bytes

wBattleParticipantsNotFainted = 0xc664 -- 1 bytes
-- Bit array.  Bits 0 - 5 correspond to party members 1 - 6.
-- Bit set if the mon appears in battle.
-- Bit cleared if the mon faints.
-- Backed up if the enemy switches.
-- All bits cleared if the enemy faints.

TypeModifier = 0xc665 -- 1 bytes
-- >10: super-effective
--  10: normal
-- <10: not very effective
-- bit 7: stab

CriticalHit = 0xc666 -- 1 bytes
-- 0 if not critical
-- 1 for a critical hit
-- 2 for a OHKO

AttackMissed = 0xc667 -- 1 bytes
-- nonzero for a miss

PlayerSubStatus1 = 0xc668 -- 1 bytes
-- bit
-- 7 attract
-- 6 encore
-- 5 endure
-- 4 perish song
-- 3 identified
-- 2 protect
-- 1 curse
-- 0 nightmare
PlayerSubStatus2 = 0xc669 -- 1 bytes
-- bit
-- 7
-- 6
-- 5
-- 4
-- 3
-- 2
-- 1
-- 0 curled
PlayerSubStatus3 = 0xc66a -- 1 bytes
-- bit
-- 7 confused
-- 6 flying
-- 5 underground
-- 4 charged
-- 3 flinch
-- 2
-- 1 rollout
-- 0 bide
PlayerSubStatus4 = 0xc66b -- 1 bytes
-- bit
-- 7 leech seed
-- 6 rage
-- 5 recharge
-- 4 substitute
-- 3
-- 2 focus energy
-- 1 mist
-- 0 bide: unleashed energy
PlayerSubStatus5 = 0xc66c -- 1 bytes
-- bit
-- 7 cant run
-- 6 destiny bond
-- 5 lock-on
-- 4 encore
-- 3 transformed
-- 2
-- 1
-- 0 toxic

EnemySubStatus1 = 0xc66d -- 1 bytes
-- see PlayerSubStatus1
EnemySubStatus2 = 0xc66e -- 1 bytes
-- see PlayerSubStatus2
EnemySubStatus3 = 0xc66f -- 1 bytes
-- see PlayerSubStatus3
EnemySubStatus4 = 0xc670 -- 1 bytes
-- see PlayerSubStatus4
EnemySubStatus5 = 0xc671 -- 1 bytes
-- see PlayerSubStatus5

PlayerRolloutCount = 0xc672 -- 1 bytes
PlayerConfuseCount = 0xc673 -- 1 bytes
PlayerToxicCount = 0xc674 -- 1 bytes
PlayerDisableCount = 0xc675 -- 1 bytes
PlayerEncoreCount = 0xc676 -- 1 bytes
PlayerPerishCount = 0xc677 -- 1 bytes
PlayerFuryCutterCount = 0xc678 -- 1 bytes
PlayerProtectCount = 0xc679 -- 1 bytes

EnemyRolloutCount = 0xc67a -- 1 bytes
EnemyConfuseCount = 0xc67b -- 1 bytes
EnemyToxicCount = 0xc67c -- 1 bytes
EnemyDisableCount = 0xc67d -- 1 bytes
EnemyEncoreCount = 0xc67e -- 1 bytes
EnemyPerishCount = 0xc67f -- 1 bytes
EnemyFuryCutterCount = 0xc680 -- 1 bytes
EnemyProtectCount = 0xc681 -- 1 bytes

PlayerDamageTaken = 0xc682 -- 2 bytes
EnemyDamageTaken = 0xc684 -- 2 bytes

wBattleReward = 0xc686 -- 3 bytes
wPresentPower = 0xc689 -- 1 bytes
BattleScriptBuffer = 0xc68a -- 40 bytes

BattleScriptBufferLoc = 0xc6b2 -- 2 bytes

wTurnEnded = 0xc6b4 -- 1 bytes

PlayerStats = 0xc6b6 -- 10 bytes
EnemyStats = 0xc6c1 -- 10 bytes

-- 07 neutral
PlayerAtkLevel = 0xc6cc -- 1 bytes
PlayerDefLevel = 0xc6cd -- 1 bytes
PlayerSpdLevel = 0xc6ce -- 1 bytes
PlayerSAtkLevel = 0xc6cf -- 1 bytes

PlayerSDefLevel = 0xc6d0 -- 1 bytes
PlayerAccLevel = 0xc6d1 -- 1 bytes
PlayerEvaLevel = 0xc6d2 -- 1 bytes
-- c6d3

-- 07 neutral
EnemyAtkLevel = 0xc6d4 -- 1 bytes
EnemyDefLevel = 0xc6d5 -- 1 bytes
EnemySpdLevel = 0xc6d6 -- 1 bytes
EnemySAtkLevel = 0xc6d7 -- 1 bytes
EnemySDefLevel = 0xc6d8 -- 1 bytes
EnemyAccLevel = 0xc6d9 -- 1 bytes
EnemyEvaLevel = 0xc6da -- 1 bytes

EnemyTurnsTaken = 0xc6dc -- 1 bytes
PlayerTurnsTaken = 0xc6dd -- 1 bytes


PlayerSubstituteHP = 0xc6df -- 1 bytes
EnemySubstituteHP = 0xc6e0 -- 1 bytes

wUnusedPlayerLockedMove = 0xc6e1 -- 1 bytes
CurPlayerMove = 0xc6e3 -- 1 bytes
CurEnemyMove = 0xc6e4 -- 1 bytes

LinkBattleRNCount = 0xc6e5 -- 1 bytes
-- how far through the prng stream

wEnemyItemState = 0xc6e6 -- 1 bytes
CurEnemyMoveNum = 0xc6e9 -- 1 bytes

wEnemyHPAtTimeOfPlayerSwitch = 0xc6ea -- 2 bytes
wPayDayMoney = 0xc6ec -- 3 bytes

wSafariMonAngerCount = 0xc6ef -- 1 bytes
wSafariMonEating = 0xc6f0 -- 2 bytes
wEnemyBackupDVs = 0xc6f2 -- 2 bytes used when enemy is transformed
AlreadyDisobeyed = 0xc6f4 -- 1 bytes

DisabledMove = 0xc6f5 -- 1 bytes
EnemyDisabledMove = 0xc6f6 -- 1 bytes
wWhichMonFaintedFirst = 0xc6f7 -- 1 bytes

-- exists so you can't counter on switch
LastEnemyCounterMove:: ds LastPlayerCounterMove = 0xc6f9 -- 1 bytes

wEnemyMinimized = 0xc6fa -- 1 bytes

AlreadyFailed = 0xc6fb -- 1 bytes

wBattleParticipantsIncludingFainted = 0xc6fc -- 1 bytes
wDanger = 0xc6fd -- 1 bytes
wPlayerMinimized = 0xc6fe -- 1 bytes
PlayerScreens = 0xc6ff -- 1 bytes
-- bit
-- 4 reflect
-- 3 light screen
-- 2 safeguard
-- 0 spikes

EnemyScreens = 0xc700 -- 1 bytes
-- see PlayerScreens

PlayerSafeguardCount = 0xc701 -- 1 bytes
PlayerLightScreenCount = 0xc702 -- 1 bytes
PlayerReflectCount = 0xc703 -- 1 bytes

EnemySafeguardCount = 0xc705 -- 1 bytes
EnemyLightScreenCount = 0xc706 -- 1 bytes
EnemyReflectCount = 0xc707 -- 1 bytes
Weather = 0xc70a -- 1 bytes
-- 00 normal
-- 01 rain
-- 02 sun
-- 03 sandstorm
-- 04 rain stopped
-- 05 sunliight faded
-- 06 sandstorm subsided

WeatherCount = 0xc70b -- 1 bytes
-- # turns remaining

LoweredStat = 0xc70c -- 1 bytes
EffectFailed = 0xc70d -- 1 bytes
FailedMessage = 0xc70e -- 1 bytes
wEnemyGoesFirst = 0xc70f -- 1 bytes
wPlayerIsSwitching = 0xc710 -- 1 bytes
wEnemyIsSwitching = 0xc711 -- 1 bytes

PlayerUsedMoves = 0xc712 -- 4 bytes
-- add a move that has been used once by the player
-- added in order of use

wEnemyAISwitchScore = 0xc716 -- 1 bytes
wEnemySwitchMonParam = 0xc717 -- 1 bytes
wEnemySwitchMonIndex = 0xc718 -- 1 bytes
wTempLevel = 0xc719 -- 1 bytes
LastPlayerMon = 0xc71a -- 1 bytes
LastPlayerMove = 0xc71b -- 1 bytes
LastEnemyMove = 0xc71c -- 1 bytes

wPlayerFutureSightCount = 0xc71d -- 1 bytes
wEnemyFutureSightCount = 0xc71e -- 1 bytes
wGivingExperienceToExpShareHolders = 0xc71f -- 1 bytes
wBackupEnemyMonBaseStats = 0xc720 -- 5 bytes
wBackupEnemyMonCatchRate = 0xc725 -- 1 bytes
wBackupEnemyMonBaseExp = 0xc726 -- 1 bytes
wPlayerFutureSightDamage = 0xc727 -- 2 bytes
wEnemyFutureSightDamage = 0xc729 -- 2 bytes
wPlayerRageCounter = 0xc72b -- 1 bytes
wEnemyRageCounter = 0xc72c -- 1 bytes
wBeatUpHitAtLeastOnce = 0xc72d -- 1 bytes
wPlayerTrappingMove = 0xc72e -- 1 bytes
wEnemyTrappingMove = 0xc72f -- 1 bytes
wPlayerWrapCount = 0xc730 -- 1 bytes
wEnemyWrapCount = 0xc731 -- 1 bytes
wPlayerCharging = 0xc732 -- 1 bytes
wEnemyCharging = 0xc733 -- 1 bytes
BattleEnded = 0xc734 -- 1 bytes

wWildMonMoves = 0xc735 -- 4 bytes
wWildMonPP = 0xc739 -- 4 bytes
wAmuletCoin = 0xc73a -- 1 bytes
wSomeoneIsRampaging = 0xc73b -- 1 bytes
wPlayerJustGotFrozen = 0xc73c -- 1 bytes
wEnemyJustGotFrozen = 0xc73d -- 1 bytes
-- Battle RAM
