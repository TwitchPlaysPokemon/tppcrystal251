Moves: ; 41afb
; Characteristics of each move.

move: MACRO
	db \1 ; animation
	db \2 ; effect
	db \3 ; power
	dn \4, \5 ; type
	db \6 percent ; accuracy
	db \7 ; pp
	db \8 percent ; effect chance
ENDM

	move POUND,        EFFECT_NORMAL_HIT,         40, PHYSICAL, NORMAL,   100, 35,   0
	move KARATE_CHOP,  EFFECT_NORMAL_HIT,         50, PHYSICAL, FIGHTING, 100, 25,   0
	move DOUBLESLAP,   EFFECT_MULTI_HIT,          15, PHYSICAL, FAIRY_T,   85, 10,   0 ; EFFECT_MULTI_HIT can be made to continue attacking after breaking Substitute
	move MEGA_PUNCH,   EFFECT_NORMAL_HIT,         80, PHYSICAL, NORMAL,    85, 20,   0
	move PAY_DAY,      EFFECT_PAY_DAY,            40, PHYSICAL, NORMAL,   100, 20,   0
	move FIRE_PUNCH,   EFFECT_BURN_HIT,           75, PHYSICAL, FIRE,     100, 15,  10
	move ICE_PUNCH,    EFFECT_FREEZE_HIT,         75, PHYSICAL, ICE,      100, 15,  10
	move THUNDERPUNCH, EFFECT_PARALYZE_HIT,       75, PHYSICAL, ELECTRIC, 100, 15,  10
	move SCRATCH,      EFFECT_NORMAL_HIT,         40, PHYSICAL, NORMAL,   100, 35,   0
	move SWORDS_DANCE, EFFECT_ATTACK_UP_2,         0, STATUS,   NORMAL,   100, 20,   0
	move CUT,          EFFECT_NORMAL_HIT,         50, PHYSICAL, NORMAL,    95, 30,   0
	move GUST,         EFFECT_GUST,               40, SPECIAL,  FLYING,   100, 35,   0
	move WING_ATTACK,  EFFECT_NORMAL_HIT,         60, PHYSICAL, FLYING,   100, 35,   0
	move WHIRLWIND,    EFFECT_WHIRLWIND,           0, STATUS,   NORMAL,   100, 20,   0
	move FLY,          EFFECT_FLY,                90, PHYSICAL, FLYING,    95, 15,   0
	move VINE_WHIP,    EFFECT_NORMAL_HIT,         45, PHYSICAL, GRASS,    100, 25,   0
	move STOMP,        EFFECT_STOMP,              65, PHYSICAL, NORMAL,   100, 20,  30
	move DOUBLE_KICK,  EFFECT_DOUBLE_HIT,         30, PHYSICAL, FIGHTING, 100, 30,   0 ; EFFECT_DOUBLE_HIT could be changed to continue after breaking sub
	move MEGA_KICK,    EFFECT_NORMAL_HIT,        120, PHYSICAL, NORMAL,    75,  5,   0
	move ROLLING_KICK, EFFECT_FLINCH_HIT,         60, PHYSICAL, FIGHTING,  85, 15,  30
	move SAND_ATTACK,  EFFECT_ACCURACY_DOWN,       0, STATUS,   GROUND,   100, 15,   0
	move HEADBUTT,     EFFECT_FLINCH_HIT,         70, PHYSICAL, NORMAL,   100, 15,  30
	move HORN_ATTACK,  EFFECT_NORMAL_HIT,         65, PHYSICAL, NORMAL,   100, 25,   0
	move FURY_ATTACK,  EFFECT_MULTI_HIT,          15, PHYSICAL, NORMAL,    85, 20,   0 ; EFFECT_MULTI_HIT can be made to continue attacking after breaking Substitute
	move HORN_DRILL,   EFFECT_OHKO,                1, PHYSICAL, NORMAL,    30,  5,   0
	move TACKLE,       EFFECT_NORMAL_HIT,         50, PHYSICAL, NORMAL,   100, 35,   0
	move BODY_SLAM,    EFFECT_PARALYZE_HIT,       85, PHYSICAL, NORMAL,   100, 15,  30
	move WRAP,         EFFECT_BIND,               15, PHYSICAL, NORMAL,    85, 20,   0 ; EFFECT_BIND should last 4-5 turns, do 1/8 damage
	move TAKE_DOWN,    EFFECT_RECOIL_HIT,         90, PHYSICAL, NORMAL,    85, 20,   0
	move THRASH,       EFFECT_RAMPAGE,           120, PHYSICAL, NORMAL,   100, 10,   0
	move DOUBLE_EDGE,  EFFECT_RECOIL_HIT,        120, PHYSICAL, NORMAL,   100, 15,   0
	move TAIL_WHIP,    EFFECT_DEFENSE_DOWN,        0, STATUS,   NORMAL,   100, 30,   0
	move POISON_STING, EFFECT_POISON_HIT,         15, PHYSICAL, POISON,   100, 35,  30
	move TWINEEDLE,    EFFECT_TWINEEDLE,          25, PHYSICAL, BUG,      100, 20,  20
	move PIN_MISSILE,  EFFECT_MULTI_HIT,          25, PHYSICAL, BUG,       95, 20,   0 ; EFFECT_MULTI_HIT can be made to continue attacking after breaking Substitute
	move LEER,         EFFECT_DEFENSE_DOWN,        0, STATUS,   NORMAL,   100, 30,   0
	move BITE,         EFFECT_FLINCH_HIT,         60, PHYSICAL, DARK,     100, 25,  30
	move GROWL,        EFFECT_ATTACK_DOWN,         0, STATUS,   NORMAL,   100, 40,   0
	move ROAR,         EFFECT_WHIRLWIND,           0, STATUS,   NORMAL,   100, 20,   0
	move SING,         EFFECT_SLEEP,               0, STATUS,   NORMAL,    55, 15,   0
	move SUPERSONIC,   EFFECT_CONFUSE,             0, STATUS,   NORMAL,    55, 20,   0
	move SONICBOOM,    EFFECT_STATIC_DAMAGE,      20, SPECIAL,  NORMAL,    90, 20,   0
	move DISABLE,      EFFECT_DISABLE,             0, STATUS,   NORMAL,   100, 20,   0 ; EFFECT_DISABLE to always last 4 turns
	move ACID,         EFFECT_DEFENSE_DOWN_HIT,   40, SPECIAL,  POISON,   100, 30,  10 ; gen 6 special defense drop not defense
	move EMBER,        EFFECT_BURN_HIT,           40, SPECIAL,  FIRE,     100, 25,  10
	move FLAMETHROWER, EFFECT_BURN_HIT,           95, SPECIAL,  FIRE,     100, 15,  10
	move MIST,         EFFECT_MIST,                0, STATUS,   ICE,      100, 30,   0
	move WATER_GUN,    EFFECT_NORMAL_HIT,         50, SPECIAL,  WATER,    100, 25,   0 ; small buff to keep it better than Bubble
	move HYDRO_PUMP,   EFFECT_NORMAL_HIT,        120, SPECIAL,  WATER,     80,  5,   0
	move SURF,         EFFECT_NORMAL_HIT,        100, SPECIAL,  WATER,    100, 15,   0
	move ICE_BEAM,     EFFECT_FREEZE_HIT,         95, SPECIAL,  ICE,      100, 10,  10
	move BLIZZARD,     EFFECT_FREEZE_HIT,        120, SPECIAL,  ICE,       70,  5,  10
	move PSYBEAM,      EFFECT_CONFUSE_HIT,        65, SPECIAL,  PSYCHIC,  100, 20,  10
	move BUBBLEBEAM,   EFFECT_SPEED_DOWN_HIT,     65, SPECIAL,  WATER,    100, 20,  10
	move AURORA_BEAM,  EFFECT_ATTACK_DOWN_HIT,    65, SPECIAL,  ICE,      100, 20,  10
	move HYPER_BEAM,   EFFECT_HYPER_BEAM,        150, SPECIAL,  NORMAL,    90,  5,   0
	move PECK,         EFFECT_NORMAL_HIT,         35, PHYSICAL, FLYING,   100, 35,   0
	move DRILL_PECK,   EFFECT_NORMAL_HIT,         80, PHYSICAL, FLYING,   100, 20,   0
	move SUBMISSION,   EFFECT_RECOIL_HIT,         80, PHYSICAL, FIGHTING,  80, 25,   0
	move COUNTER,      EFFECT_COUNTER,             1, PHYSICAL, FIGHTING, 100, 20,   0
	move SEISMIC_TOSS, EFFECT_LEVEL_DAMAGE,        1, PHYSICAL, FIGHTING, 100, 20,   0
	move STRENGTH,     EFFECT_NORMAL_HIT,         80, PHYSICAL, NORMAL,   100, 15,   0
	move ABSORB,       EFFECT_LEECH_HIT,          20, SPECIAL,  GRASS,    100, 25,   0
	move MEGA_DRAIN,   EFFECT_LEECH_HIT,          40, SPECIAL,  GRASS,    100, 15,   0
	move LEECH_SEED,   EFFECT_LEECH_SEED,          0, STATUS,   GRASS,     90, 10,   0
	move GROWTH,       EFFECT_SP_ATK_UP,           0, STATUS,   NORMAL,   100, 20,   0 ; create new Growth effect? Increases atk and sp atk by +1, +2 if sun is up
	move RAZOR_LEAF,   EFFECT_NORMAL_HIT,         55, PHYSICAL, GRASS,     95, 25,   0
	move SOLARBEAM,    EFFECT_SOLARBEAM,         120, SPECIAL,  GRASS,    100, 10,   0
	move POISONPOWDER, EFFECT_POISON,              0, STATUS,   POISON,    75, 35,   0
	move STUN_SPORE,   EFFECT_PARALYZE,            0, STATUS,   GRASS,     75, 30,   0
	move SLEEP_POWDER, EFFECT_SLEEP,               0, STATUS,   GRASS,     75, 15,   0
	move PETAL_DANCE,  EFFECT_RAMPAGE,           120, SPECIAL,  GRASS,    100, 10,   0
	move STRING_SHOT,  EFFECT_SPEED_DOWN_2,        0, STATUS,   BUG,       95, 40,   0
	move DRAGON_RAGE,  EFFECT_STATIC_DAMAGE,      40, SPECIAL,  DRAGON,   100, 10,   0
	move FIRE_SPIN,    EFFECT_BIND,               35, SPECIAL,  FIRE,      85, 15,   0 ; EFFECT_BIND should last 4-5 turns, do 1/8 damage
	move THUNDERSHOCK, EFFECT_PARALYZE_HIT,       40, SPECIAL,  ELECTRIC, 100, 30,  10
	move THUNDERBOLT,  EFFECT_PARALYZE_HIT,       95, SPECIAL,  ELECTRIC, 100, 15,  10
	move THUNDER_WAVE, EFFECT_PARALYZE,            0, STATUS,   ELECTRIC, 100, 20,   0
	move THUNDER,      EFFECT_THUNDER,           120, SPECIAL,  ELECTRIC,  70, 10,  30
	move ROCK_THROW,   EFFECT_NORMAL_HIT,         50, PHYSICAL, ROCK,      90, 15,   0
	move EARTHQUAKE,   EFFECT_EARTHQUAKE,        100, PHYSICAL, GROUND,   100, 10,   0
	move FISSURE,      EFFECT_OHKO,                1, PHYSICAL, GROUND,    30,  5,   0
	move DIG,          EFFECT_FLY,                80, PHYSICAL, GROUND,   100, 10,   0
	move TOXIC,        EFFECT_TOXIC,               0, STATUS,   POISON,    90, 10,   0
	move CONFUSION,    EFFECT_CONFUSE_HIT,        50, SPECIAL,  PSYCHIC,  100, 25,  10
	move PSYCHIC_M,    EFFECT_SP_DEF_DOWN_HIT,    90, SPECIAL,  PSYCHIC,  100, 10,  10
	move HYPNOSIS,     EFFECT_SLEEP,               0, STATUS,   PSYCHIC,   70, 20,   0
	move MEDITATE,     EFFECT_ATTACK_UP,           0, STATUS,   PSYCHIC,  100, 40,   0
	move AGILITY,      EFFECT_SPEED_UP_2,          0, STATUS,   PSYCHIC,  100, 30,   0
	move QUICK_ATTACK, EFFECT_PRIORITY_HIT,       40, PHYSICAL, NORMAL,   100, 30,   0
	move RAGE,         EFFECT_RAGE,               20, PHYSICAL, NORMAL,   100, 20,   0 ; EFFECT_RAGE possibly make Rage attack boosts normal + attack boosts
	move TELEPORT,     EFFECT_TELEPORT,            0, STATUS,   PSYCHIC,  100, 20,   0
	move NIGHT_SHADE,  EFFECT_LEVEL_DAMAGE,        1, STATUS,   GHOST,    100, 15,   0 
	move MIMIC,        EFFECT_MIMIC,               0, STATUS,   NORMAL,   100, 10,   0 ; EFFECT_MIMIC possibly change so mimiced move has max pp instead of 5
	move SCREECH,      EFFECT_DEFENSE_DOWN_2,      0, STATUS,   NORMAL,    85, 40,   0
	move DOUBLE_TEAM,  EFFECT_EVASION_UP,          0, STATUS,   NORMAL,   100, 15,   0
	move RECOVER,      EFFECT_HEAL,                0, STATUS,   NORMAL,   100, 10,   0
	move HARDEN,       EFFECT_DEFENSE_UP,          0, STATUS,   NORMAL,   100, 30,   0
	move MINIMIZE,     EFFECT_EVASION_UP_2,        0, STATUS,   NORMAL,   100, 20,   0
	move SMOKESCREEN,  EFFECT_ACCURACY_DOWN,       0, STATUS,   NORMAL,   100, 20,   0
	move CONFUSE_RAY,  EFFECT_CONFUSE,             0, STATUS,   GHOST,    100, 10,   0
	move WITHDRAW,     EFFECT_DEFENSE_UP,          0, STATUS,   WATER,    100, 40,   0
	move DEFENSE_CURL, EFFECT_DEFENSE_CURL,        0, STATUS,   NORMAL,   100, 40,   0
	move BARRIER,      EFFECT_DEFENSE_UP_2,        0, STATUS,   PSYCHIC,  100, 30,   0
	move LIGHT_SCREEN, EFFECT_LIGHT_SCREEN,        0, STATUS,   PSYCHIC,  100, 30,   0
	move HAZE,         EFFECT_HAZE,                0, STATUS,   ICE,      100, 30,   0
	move REFLECT,      EFFECT_REFLECT,             0, STATUS,   PSYCHIC,  100, 20,   0
	move FOCUS_ENERGY, EFFECT_FOCUS_ENERGY,        0, STATUS,   NORMAL,   100, 30,   0 ; EFFECT_FOCUS_ENERGY increase critical hit ratio by two stages instead of one
	move BIDE,         EFFECT_BIDE,                0, PHYSICAL, NORMAL,   100, 10,   0 ; EFFECT_BIDE add priority and possibly make it hit ghost
	move METRONOME,    EFFECT_METRONOME,           0, STATUS,   NORMAL,   100, 10,   0
	move MIRROR_MOVE,  EFFECT_MIRROR_MOVE,         0, STATUS,   FLYING,   100, 20,   0
	move SELFDESTRUCT, EFFECT_EXPLOSION,         200, PHYSICAL, NORMAL,   100,  5,   0
	move LICK,         EFFECT_PARALYZE_HIT,       30, PHYSICAL, GHOST,    100, 30,  30
	move SLUDGE,       EFFECT_POISON_HIT,         65, SPECIAL,  POISON,   100, 20,  30
	move BONE_CLUB,    EFFECT_FLINCH_HIT,         65, PHYSICAL, GROUND,    85, 20,  10
	move FIRE_BLAST,   EFFECT_BURN_HIT,          120, SPECIAL,  FIRE,      85,  5,  10
	move WATERFALL,    EFFECT_FLINCH_HIT,         80, PHYSICAL, WATER,    100, 15,  20
	move CLAMP,        EFFECT_BIND,               35, PHYSICAL, WATER,     85, 15,   0 ; EFFECT_BIND should last 4-5 turns, do 1/8 damage
	move SWIFT,        EFFECT_ALWAYS_HIT,         60, SPECIAL,  NORMAL,   100, 20,   0
	move SPIKE_CANNON, EFFECT_MULTI_HIT,          20, PHYSICAL, NORMAL,   100, 15,   0 ; EFFECT_MULTI_HIT can be made to continue attacking after breaking Substitute
	move AMNESIA,      EFFECT_SP_DEF_UP_2,         0, STATUS,   PSYCHIC,  100, 20,   0 
	move KINESIS,      EFFECT_ACCURACY_DOWN,       0, STATUS,   PSYCHIC,   80, 15,   0 ; ****** POSSIBLE REMOVAL
	move SOFTBOILED,   EFFECT_HEAL,                0, STATUS,   NORMAL,   100, 10,   0
	move HI_JUMP_KICK, EFFECT_JUMP_KICK,         130, PHYSICAL, FIGHTING,  90, 10,   0 ; EFFECT_JUMP_KICK crash damage 50%
	move GLARE,        EFFECT_PARALYZE,            0, STATUS,   NORMAL,   100, 30,   0
	move DREAM_EATER,  EFFECT_DREAM_EATER,       100, SPECIAL,  PSYCHIC,  100, 15,   0
	move POISON_GAS,   EFFECT_POISON,              0, STATUS,   POISON,    90, 40,   0
	move LEECH_LIFE,   EFFECT_LEECH_HIT,          35, PHYSICAL, BUG,      100, 15,   0 ; small buff to make useful early game
	move LOVELY_KISS,  EFFECT_SLEEP,               0, STATUS,   NORMAL,    75, 10,   0
	move SKY_ATTACK,   EFFECT_SKY_ATTACK,        140, PHYSICAL, FLYING,    90,  5,   0 ; EFFECT_SKY_ATTACK add flinch effect; it has 30% chance to flinch
	move TRANSFORM,    EFFECT_TRANSFORM,           0, STATUS,   NORMAL,   100, 10,   0
	move BUBBLE,       EFFECT_SPEED_DOWN_HIT,     40, SPECIAL,  WATER,    100, 30,  10
	move DIZZY_PUNCH,  EFFECT_CONFUSE_HIT,        70, PHYSICAL, FAIRY_T,  100, 10,  20 ; retconned to fairy type
	move SPORE,        EFFECT_SLEEP,               0, STATUS,   GRASS,    100, 15,   0
	move FLASH,        EFFECT_ACCURACY_DOWN,       0, STATUS,   NORMAL,   100, 20,   0
	move PSYWAVE,      EFFECT_PSYWAVE,             1, SPECIAL,  PSYCHIC,  100, 15,   0
	move SPLASH,       EFFECT_SPLASH,              0, STATUS,   NORMAL,   100, 40,   0
	move ACID_ARMOR,   EFFECT_DEFENSE_UP_2,        0, STATUS,   POISON,   100, 20,   0
	move CRABHAMMER,   EFFECT_NORMAL_HIT,        100, PHYSICAL, WATER,     90, 10,   0
	move EXPLOSION,    EFFECT_EXPLOSION,         250, PHYSICAL, NORMAL,   100,  5,   0
	move BONEMERANG,   EFFECT_DOUBLE_HIT,         50, PHYSICAL, GROUND,    90, 10,   0 ; EFFECT_DOUBLE_HIT could be changed to continue after breaking sub
	move REST,         EFFECT_HEAL,                0, STATUS,   PSYCHIC,  100, 10,   0
	move ROCK_SLIDE,   EFFECT_FLINCH_HIT,         75, PHYSICAL, ROCK,      90, 10,  30
	move HYPER_FANG,   EFFECT_FLINCH_HIT,         80, PHYSICAL, NORMAL,    90, 15,  10
	move SHARPEN,      EFFECT_ATTACK_UP,           0, STATUS,   NORMAL,   100, 30,   0
	move CONVERSION,   EFFECT_CONVERSION,          0, STATUS,   NORMAL,   100, 30,   0
	move TRI_ATTACK,   EFFECT_TRI_ATTACK,         80, SPECIAL,  NORMAL,   100, 10,  20
	move SUPER_FANG,   EFFECT_SUPER_FANG,          1, PHYSICAL, NORMAL,    90, 10,   0
	move SLASH,        EFFECT_NORMAL_HIT,         70, PHYSICAL, NORMAL,   100, 20,   0
	move SUBSTITUTE,   EFFECT_SUBSTITUTE,          0, STATUS,   NORMAL,   100, 10,   0
	move STRUGGLE,     EFFECT_RECOIL_HIT,         50, PHYSICAL, NORMAL,   100,  1,   0 ; could create a new effect to make Struggle lose 1/4 HP per attack
; New to Gen 2
	move SKETCH,       EFFECT_SKETCH,              0, STATUS,   NORMAL,   100,  1,   0
	move THIEF,        EFFECT_THIEF,              60, PHYSICAL, DARK,     100, 25, 100
	move MIND_READER,  EFFECT_LOCK_ON,             0, STATUS,   NORMAL,   100,  5,   0
	move NIGHTMARE,    EFFECT_NIGHTMARE,           0, STATUS,   GHOST,    100, 15,   0
	move FLAME_WHEEL,  EFFECT_FLAME_WHEEL,        60, PHYSICAL, FIRE,     100, 25,  10
	move CURSE,        EFFECT_CURSE,               0, STATUS,   CURSE_T,  100, 10,   0 ; EFFECT_CURSE can add that Curse deals damage even on turns the opponent is knocked out
	move FLAIL,        EFFECT_REVERSAL,            1, PHYSICAL, NORMAL,   100, 15,   0
	move CONVERSION2,  EFFECT_CONVERSION2,         0, STATUS,   NORMAL,   100, 30,   0
	move AEROBLAST,    EFFECT_NORMAL_HIT,        100, SPECIAL,  FLYING,    95,  5,   0
	move COTTON_SPORE, EFFECT_SPEED_DOWN_2,        0, STATUS,   GRASS,    100, 40,   0
	move REVERSAL,     EFFECT_REVERSAL,            1, PHYSICAL, FIGHTING, 100, 15,   0
	move SPITE,        EFFECT_SPITE,               0, STATUS,   GHOST,    100, 10,   0 ; EFFECT_SPITE can be changed to always remove 4 PP instead of 1-5
	move POWDER_SNOW,  EFFECT_FREEZE_HIT,         40, SPECIAL,  ICE,      100, 25,  10
	move PROTECT,      EFFECT_PROTECT,             0, STATUS,   NORMAL,   100, 10,   0
	move MACH_PUNCH,   EFFECT_PRIORITY_HIT,       40, PHYSICAL, FIGHTING, 100, 30,   0
	move SCARY_FACE,   EFFECT_SPEED_DOWN_2,        0, STATUS,   NORMAL,   100, 10,   0
	move FAINT_ATTACK, EFFECT_ALWAYS_HIT,         60, PHYSICAL, DARK,     100, 20,   0
	move SWEET_KISS,   EFFECT_CONFUSE,             0, FAIRY_T,  NORMAL,    75, 10,   0
	move BELLY_DRUM,   EFFECT_BELLY_DRUM,          0, STATUS,   NORMAL,   100, 10,   0
	move SLUDGE_BOMB,  EFFECT_POISON_HIT,         90, SPECIAL,  POISON,   100, 10,  30
	move MUD_SLAP,     EFFECT_ACCURACY_DOWN_HIT,  20, SPECIAL,  GROUND,   100, 10, 100
	move OCTAZOOKA,    EFFECT_ACCURACY_DOWN_HIT,  65, SPECIAL,  WATER,     85, 10,  50
	move SPIKES,       EFFECT_SPIKES,              0, STATUS,   GROUND,   100, 20,   0 ; EFFECT_SPIKES could be made stackable; 1 layer does 1/8, 2 layers does 1/6, 3 layers does 1/4
	move ZAP_CANNON,   EFFECT_PARALYZE_HIT,      120, SPECIAL,  ELECTRIC,  50,  5, 100
	move FORESIGHT,    EFFECT_FORESIGHT,           0, STATUS,   NORMAL,   100, 40,   0
	move DESTINY_BOND, EFFECT_DESTINY_BOND,        0, STATUS,   GHOST,    100,  5,   0
	move PERISH_SONG,  EFFECT_PERISH_SONG,         0, STATUS,   NORMAL,   100,  5,   0
	move ICY_WIND,     EFFECT_SPEED_DOWN_HIT,     55, SPECIAL,  ICE,       95, 15, 100
	move OUTRAGE,      EFFECT_RAMPAGE,           120, PHYSICAL, DRAGON,   100, 10,   0
	move SANDSTORM,    EFFECT_SANDSTORM,           0, STATUS,   ROCK,     100, 10,   0 ; EFFECT_SANDSTORM could add a 50% sp def increase for Rock mons
	move GIGA_DRAIN,   EFFECT_LEECH_HIT,          75, SPECIAL,  GRASS,    100, 10,   0
	move ENDURE,       EFFECT_ENDURE,              0, STATUS,   NORMAL,   100, 10,   0
	move CHARM,        EFFECT_ATTACK_DOWN_2,       0, STATUS,   FAIRY_T,  100, 20,   0
	move ROLLOUT,      EFFECT_ROLLOUT,            30, PHYSICAL, ROCK,      90, 20,   0
	move FALSE_SWIPE,  EFFECT_FALSE_SWIPE,        40, PHYSICAL, NORMAL,   100, 40,   0
	move SWAGGER,      EFFECT_SWAGGER,             0, STATUS,   NORMAL,    90, 15, 100
	move MILK_DRINK,   EFFECT_HEAL,                0, STATUS,   NORMAL,   100, 10,   0
	move SPARK,        EFFECT_PARALYZE_HIT,       65, PHYSICAL, ELECTRIC, 100, 20,  30
	move FURY_CUTTER,  EFFECT_FURY_CUTTER,        40, PHYSICAL, BUG,       95, 20,   0 ; EFFECT_FURY_CUTTER needs to somehow be capped at 160
	move STEEL_WING,   EFFECT_STEEL_WING,         70, PHYSICAL, STEEL,     90, 25,  10
	move MEAN_LOOK,    EFFECT_MEAN_LOOK,           0, STATUS,   NORMAL,   100,  5,   0
	move ATTRACT,      EFFECT_ATTRACT,             0, STATUS,   NORMAL,   100, 15,   0
	move SLEEP_TALK,   EFFECT_SLEEP_TALK,          0, STATUS,   NORMAL,   100, 10,   0
	move HEAL_BELL,    EFFECT_HEAL_BELL,           0, STATUS,   NORMAL,   100,  5,   0
	move RETURN,       EFFECT_RETURN,              1, PHYSICAL, NORMAL,   100, 20,   0
	move PRESENT,      EFFECT_PRESENT,             1, PHYSICAL, NORMAL,    90, 15,   0
	move SAFEGUARD,    EFFECT_SAFEGUARD,           0, STATUS,   NORMAL,   100, 25,   0
	move PAIN_SPLIT,   EFFECT_PAIN_SPLIT,          0, STATUS,   NORMAL,   100, 20,   0
	move SACRED_FIRE,  EFFECT_SACRED_FIRE,       100, PHYSICAL, FIRE,      95,  5,  50
	move MAGNITUDE,    EFFECT_MAGNITUDE,           1, PHYSICAL, GROUND,   100, 30,   0
	move DYNAMICPUNCH, EFFECT_CONFUSE_HIT,       100, PHYSICAL, FIGHTING,  50,  5, 100
	move MEGAHORN,     EFFECT_NORMAL_HIT,        120, PHYSICAL, BUG,       85, 10,   0
	move DRAGONBREATH, EFFECT_PARALYZE_HIT,       60, SPECIAL,  DRAGON,   100, 20,  30
	move BATON_PASS,   EFFECT_BATON_PASS,          0, STATUS,   NORMAL,   100, 40,   0
	move ENCORE,       EFFECT_ENCORE,              0, STATUS,   NORMAL,   100,  5,   0
	move PURSUIT,      EFFECT_PURSUIT,            40, PHYSICAL, DARK,     100, 20,   0
	move RAPID_SPIN,   EFFECT_RAPID_SPIN,         20, PHYSICAL, NORMAL,   100, 40,   0
	move IRON_TAIL,    EFFECT_DEFENSE_DOWN_HIT,  100, PHYSICAL, STEEL,     75, 15,  30
	move METAL_CLAW,   EFFECT_METAL_CLAW,         50, PHYSICAL, STEEL,     95, 35,  10
	move VITAL_THROW,  EFFECT_ALWAYS_HIT,         70, PHYSICAL, FIGHTING, 100, 10,   0
	move MORNING_SUN,  EFFECT_MORNING_SUN,         0, STATUS,   NORMAL,   100,  5,   0
	move SYNTHESIS,    EFFECT_SYNTHESIS,           0, STATUS,   GRASS,    100,  5,   0
	move MOONLIGHT,    EFFECT_MOONLIGHT,           0, STATUS,   NORMAL,   100,  5,   0
	move HIDDEN_POWER, EFFECT_HIDDEN_POWER,        1, SPECIAL,  NORMAL,   100, 15,   0
	move CROSS_CHOP,   EFFECT_NORMAL_HIT,        100, PHYSICAL, FIGHTING,  80,  5,   0
	move TWISTER,      EFFECT_TWISTER,            40, SPECIAL,  DRAGON,   100, 20,  20
	move RAIN_DANCE,   EFFECT_RAIN_DANCE,          0, STATUS,   WATER,     90,  5,   0
	move SUNNY_DAY,    EFFECT_SUNNY_DAY,           0, STATUS,   FIRE,      90,  5,   0
	move CRUNCH,       EFFECT_DEF_DOWN_HIT,       80, PHYSICAL, DARK,     100, 15,  20
	move MIRROR_COAT,  EFFECT_MIRROR_COAT,         1, SPECIAL,  PSYCHIC,  100, 20,   0 
	move EXTREMESPEED, EFFECT_PRIORITY_HIT,       80, PHYSICAL, NORMAL,   100,  5,   0 ; +2 priority now, would require new effect
	move ANCIENTPOWER, EFFECT_ANCIENTPOWER,       60, SPECIAL,  ROCK,     100,  5,  10
	move SHADOW_BALL,  EFFECT_SP_DEF_DOWN_HIT,    80, SPECIAL,  GHOST,    100, 15,  20
	move FUTURE_SIGHT, EFFECT_FUTURE_SIGHT,      120, SPECIAL,  PSYCHIC,  100, 10,   0 ; EFFECT_FUTURE_SIGHT now works as normal Psychic-type attack, gets stab and accounts for weaknesses
	move ROCK_SMASH,   EFFECT_DEFENSE_DOWN_HIT,   40, PHYSICAL, FIGHTING, 100, 15,  50
	move WHIRLPOOL,    EFFECT_BIND,               35, SPECIAL,  WATER,     85, 15,   0 ; EFFECT_BIND should last 4-5 turns, do 1/8 damage 
; New to tppCrystal
	move MOONBLAST,    EFFECT_SP_DEF_DOWN_HIT,    95, SPECIAL,  FAIRY_T,  100, 15,  30
	move PLAY_ROUGH,   EFFECT_ATTACK_DOWN_HIT,    90, PHYSICAL, FAIRY_T,   90, 10,  10
	move SHEER_COLD,   EFFECT_OHKO,                1, SPECIAL,  ICE,       30,  5,   0
	move FLASH_CANNON, EFFECT_SP_DEF_DOWN_HIT,    80, SPECIAL,  STEEL,    100, 10,  10
	move AIR_SLASH,    EFFECT_FLINCH_HIT,         75, SPECIAL,  FLYING,    95, 15,  30
	move POISON_JAB,   EFFECT_POISON_HIT,         80, PHYSICAL, POISON,   100, 20,  30
	move BUG_BUZZ,     EFFECT_SP_DEF_DOWN_HIT,    90, SPECIAL,  BUG,      100, 10,  10
	move DRILL_RUN,    EFFECT_NORMAL_HIT,         80, PHYSICAL, GROUND,    95, 10,   0
	move DAZZLINGLEAM, EFFECT_NORMAL_HIT,         80, SPECIAL,  FAIRY_T,  100, 10,   0
	move SHADOW_CLAW,  EFFECT_NORMAL_HIT,         70, PHYSICAL, GHOST,    100, 15,   0
	move ZEN_HEADBUTT, EFFECT_FLINCH_HIT,         80, PHYSICAL, PSYCHIC,   90, 15,  20
	move IRON_DEFENSE, EFFECT_DEFENSE_UP_2,        0, STATUS,   STEEL,    100, 15,   0
	move DARK_PULSE,   EFFECT_FLINCH_HIT,         80, SPECIAL,  DARK,     100, 15,  20
	move HEAT_WAVE,    EFFECT_BURN_HIT,           95, SPECIAL,  FIRE,      90, 10,  10
	move X_SCISSOR,    EFFECT_NORMAL_HIT,         80, PHYSICAL, BUG,      100, 15,   0
	move SEED_BOMB,    EFFECT_NORMAL_HIT,         80, PHYSICAL, GRASS,    100, 15,   0
	move GUNK_SHOT,    EFFECT_POISON_HIT,        120, PHYSICAL, POISON,    80,  5,  30
	move FAIRY_WIND,   EFFECT_NORMAL_HIT,         40, SPECIAL,  FAIRY_T,   40, 15,   0
	move IRON_HEAD,    EFFECT_FLINCH_HIT,         80, PHYSICAL, STEEL,    100, 15,  30
	move NASTY_PLOT,   EFFECT_SP_ATK_UP_2,         0, STATUS,   DARK,     100, 20,   0
	move METAL_SOUND,  EFFECT_SP_DEF_DOWN_2,       0, STATUS,   STEEL,    100, 40,   0
	move WILD_CHARGE,  EFFECT_RECOIL_HIT,         90, PHYSICAL, ELECTRIC,  90, 15,   0
	move DRAGON_PULSE, EFFECT_NORMAL_HIT,         85, SPECIAL,  DRAGON,   100, 10,   0
	move EARTH_POWER,  EFFECT_SP_DEF_DOWN_HIT,    90, SPECIAL,  GROUND,   100, 10,  10
	move FOCUS_BLAST,  EFFECT_SP_DEF_DOWN_HIT,   120, SPECIAL,  FIGHTING,  70,  5,  10
	move AQUA_JET,     EFFECT_PRIORITY_HIT,       40, PHYSICAL, WATER,    100, 20,   0
	move FLARE_BLITZ,  EFFECT_RECOIL_HIT,        120, PHYSICAL, FIRE,     100, 15,   0
	
	
	
	
	
