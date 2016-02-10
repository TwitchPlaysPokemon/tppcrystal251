INCLUDE "includes.asm"


SECTION "Egg Moves", ROMX, BANK[EGG_MOVES]

; Staryu's egg moves were removed in Crystal, because Staryu is genderless
; and can only breed with Ditto.


INCLUDE "data/egg_move_pointers.asm"


EggMoves::

BulbasaurEggMoves:
	db LIGHT_SCREEN
	db CHARM
	db SAFEGUARD
	db AMNESIA
	db OUTRAGE
	db TAKE_DOWN
	db ROAR
	db $ff

CharmanderEggMoves:
	db RAGE
	db MUD_SLAP
	db COUNTER
	db DRAGONBREATH
	db IRON_TAIL
	db $ff

SquirtleEggMoves:
	db MIST
	db FORESIGHT
	db FLAIL
	db ROLLOUT
	db ROAR
	db $ff

PidgeyEggMoves:
	db FORESIGHT
	db SWIFT
	db PECK
	db $ff

RattataEggMoves:
	db TAKE_DOWN
	db DEFENSE_CURL
	db SWIFT
	db FOCUS_ENERGY
	db $ff

SpearowEggMoves:
	db SCARY_FACE
	db WING_ATTACK
	db SWIFT
	db $ff

EkansEggMoves:
	db DISABLE
	db SPITE
	db SCARY_FACE
	db $ff

SandshrewEggMoves:
	db DOUBLE_EDGE
	db SAFEGUARD
	db COUNTER
	db RAPID_SPIN
	db SAND_ATTACK
	db $ff

NidoranFEggMoves:
	db SUPERSONIC
	db FOCUS_ENERGY
	db TAKE_DOWN
	db COUNTER
	db DRILL_RUN
	db OUTRAGE
	db ROAR
	db $ff

NidoranMEggMoves:
	db SUPERSONIC
	db COUNTER
	db SUPER_FANG
	db ROAR
	db $ff

VulpixEggMoves:
	db SWIFT
	db RAGE
	db FLAIL
	db SPITE
	db $ff

ZubatEggMoves:
	db PURSUIT
	db FLAIL
	db ENDURE
	db SCREECH
	db $ff

OddishEggMoves:
	db SYNTHESIS
	db MIMIC
	db SEED_BOMB
	db SAFEGUARD
	db REFLECT
	db $ff

ParasEggMoves:
	db SCREECH
	db COUNTER
	db FLAIL
	db LIGHT_SCREEN
	db PURSUIT
	db SYNTHESIS
	db DOUBLE_EDGE
	db $ff

VenonatEggMoves:
	db SCREECH
	db MIMIC
	db SWIFT
	db $ff

DiglettEggMoves:
	db TRI_ATTACK
	db TAKE_DOWN
	db CHARM
	db $ff

MeowthEggMoves:
	db DREAM_EATER
	db NIGHTMARE
	db MUD_SLAP
	db IRON_TAIL
	db SING
	db SWIFT
	db $ff

PsyduckEggMoves:
	db FORESIGHT
	db LIGHT_SCREEN
	db CONFUSE_RAY
	db SWIFT
	db CHARM
	db COUNTER
	db SCREECH
	db $ff

MankeyEggMoves:
	db COUNTER
	db SPITE
	db ENCORE
	db IRON_TAIL
	db $ff

GrowlitheEggMoves:
	db THRASH
	db IRON_TAIL
	db SAFEGUARD
	db MUD_SLAP
	db DOUBLE_EDGE
	db CHARM
	db REVERSAL
	db ENDURE
	db $ff

PoliwagEggMoves:
	db MIST
	db SPLASH
	db PSYWAVE
	db ENDURE
	db COUNTER
	db $ff

AbraEggMoves:
	db ENCORE
	db ENDURE
	db FORESIGHT
	db METRONOME
	db $ff

MachopEggMoves:
	db MEGA_KICK
	db METRONOME
	db $ff

BellsproutEggMoves:
	db DOUBLE_EDGE
	db MIMIC
	db REFLECT
	db $ff

TentacoolEggMoves:
	db WATER_GUN
	db ACID
	db SCREECH
	db $ff

GeodudeEggMoves:
	db EARTH_POWER
	db COUNTER
	db FLAIL
	db ENDURE
	db $ff

PonytaEggMoves:
	db THRASH
	db QUICK_ATTACK
	db $ff

SlowpokeEggMoves:
	db BELLY_DRUM
	db MEGA_KICK
	db SWIFT
	db DISABLE
	db LIGHT_SCREEN
	db $ff

FarfetchDEggMoves:
	db MIRROR_MOVE
	db QUICK_ATTACK
	db FLAIL
	db REFLECT
	db FORESIGHT
	db $ff

DoduoEggMoves:
	db FLAIL
	db ENDURE
	db QUICK_ATTACK
	db BATON_PASS
	db MUD_SLAP
	db SWIFT
	db $ff

SeelEggMoves:
	db ENDURE
	db FLAIL
	db MIMIC
	db DISABLE
	db DOUBLE_EDGE
	db $ff

GrimerEggMoves:
	db HAZE
	db SCARY_FACE
	db MUD_SLAP
	db $ff

ShellderEggMoves:
	db BUBBLEBEAM
	db RAPID_SPIN
	db SCREECH
	db $ff

GastlyEggMoves:
	db HAZE
	db METRONOME
	db DISABLE
	db SCARY_FACE
	db COUNTER
	db $ff

OnixEggMoves:
	db FLAIL
	db EXPLOSION
	db IRON_TAIL
	db TWISTER
	db ROAR
	db DOUBLE_EDGE
	db $ff

DrowzeeEggMoves:
	db LIGHT_SCREEN
	db COUNTER
	db REFLECT
	db DREAM_EATER
	db AMNESIA
	db SAFEGUARD
	db BELLY_DRUM
	db $ff

KrabbyEggMoves:
	db HAZE
	db FLAIL
	db MUD_SLAP
	db ANCIENTPOWER
	db $ff

ExeggcuteEggMoves:
	db EXPLOSION
	db NIGHTMARE
	db ROLLOUT
	db LIGHT_SCREEN
	db RAGE
	db $ff

CuboneEggMoves:
	db ANCIENTPOWER
	db BELLY_DRUM
	db SCREECH
	db IRON_TAIL
	db OUTRAGE
	db SING
	db DOUBLE_EDGE
	db RAGE
	db $ff

LickitungEggMoves:
	db IRON_TAIL
	db MUD_SLAP
	db MEGA_KICK
	db AMNESIA
	db $ff

KoffingEggMoves:
	db SCREECH
	db BIDE
	db DEFENSE_CURL
	db ROLLOUT
	db $ff

RhyhornEggMoves:
	db REVERSAL
	db THRASH
	db COUNTER
	db SPITE
	db TAKE_DOWN
	db $ff

ChanseyEggMoves:
	db PRESENT
	db LIGHT_SCREEN
	db HEAL_BELL
	db CHARM
	db SWEET_KISS
	db SAFEGUARD
	db $ff

TangelaEggMoves:
	db REFLECT
	db RAZOR_LEAF
	db WRAP
	db SLAM
	db $ff

KangaskhanEggMoves:
	db FOCUS_ENERGY
	db SAFEGUARD
	db DISABLE
	db $ff

HorseaEggMoves:
	db FLAIL
	db ENDURE
	db SPLASH
	db OUTRAGE
	db $ff

GoldeenEggMoves:
	db HAZE
	db HYDRO_PUMP
	db FLAIL
	db ENDURE
	db $ff

MrMimeEggMoves:
	db FUTURE_SIGHT
	db NASTY_PLOT
	db MIND_READER
	db METRONOME
	db $ff

ScytherEggMoves:
	db SAFEGUARD
	db LIGHT_SCREEN
	db HEADBUTT
	db DOUBLE_EDGE
	db IRON_HEAD
	db $ff

PinsirEggMoves:
	db FALSE_SWIPE
	db QUICK_ATTACK
	db FLAIL
	db ENDURE
	db $ff

LaprasEggMoves:
	db SING
	db FORESIGHT
	db DREAM_EATER
	db HEAL_BELL
	db $ff

EeveeEggMoves:
	db BODY_SLAM
	db HEAL_BELL
	db QUICK_ATTACK
	db SWIFT
	db $ff

OmanyteEggMoves:
	db AURORA_BEAM
	db SLAM
	db SUPERSONIC
	db HAZE
	db $ff

KabutoEggMoves:
	db AURORA_BEAM
	db RAPID_SPIN
	db ENDURE
	db FLAIL
	db $ff

AerodactylEggMoves:
	db TAKE_DOWN
	db PURSUIT
	db FORESIGHT
	db ROAR
	db $ff

SnorlaxEggMoves:
	db SELFDESTRUCT
	db OUTRAGE
	db DOUBLE_EDGE
	db $ff

DratiniEggMoves:
	db LIGHT_SCREEN
	db MIST
	db HAZE
	db IRON_TAIL
	db $ff

ChikoritaEggMoves:
	db VINE_WHIP
	db FLAIL
	db ENDURE
	db MIMIC
	db $ff

CyndaquilEggMoves:
	db FURY_ATTACK
	db QUICK_ATTACK
	db FORESIGHT
	db HEADBUTT
	db $ff

TotodileEggMoves:
	db ANCIENTPOWER
	db BODY_SLAM
	db MUD_SLAP
	db $ff

SentretEggMoves:
	db FOCUS_ENERGY
	db TAKE_DOWN
	db CHARM
	db IRON_TAIL
	db $ff

HoothootEggMoves:
	db SUPERSONIC
	db NIGHT_SHADE
	db NIGHTMARE
	db AGILITY
	db $ff

LedybaEggMoves:
	db SCREECH
	db MIMIC
	db SWIFT	
	db $ff

SpinarakEggMoves:
	db PSYBEAM
	db SONICBOOM
	db SCREECH
	db $ff

ChinchouEggMoves:
	db AGILITY
	db AMNESIA
	db MIMIC
	db $ff

PichuEggMoves:
	db SCARY_FACE
	db BIDE
	db PRESENT
	db DOUBLESLAP
	db ROLLOUT
	db FLAIL
	db REVERSAL
	db ENDURE
	db AGILITY
	db $ff

CleffaEggMoves:
	db PRESENT
	db SPLASH
	db MIMIC
	db IRON_TAIL
	db COUNTER
	db REFLECT
	db $ff

IgglybuffEggMoves:
	db PRESENT
	db NIGHTMARE
	db SUBMISSION
	db MIMIC
	db PSYWAVE
	db DISABLE
	db $ff

TogepiEggMoves:
	db PRESENT
	db FORESIGHT
	db COUNTER
	db HEAL_BELL
	db ROLLOUT
	db $ff

NatuEggMoves:
	db QUICK_ATTACK
	db LIGHT_SCREEN
	db FAINT_ATTACK
	db $ff

MareepEggMoves:
	db BODY_SLAM
	db SAFEGUARD
	db REFLECT
	db OUTRAGE
	db $ff

MarillEggMoves:
	db LIGHT_SCREEN
	db PRESENT
	db AMNESIA
	db SUPERSONIC
	db FORESIGHT
	db $ff

SudowoodoEggMoves:
	db ENDURE
	db BODY_SLAM
	db MUD_SLAP
	db $ff

HoppipEggMoves:
	db CONFUSION
	db GROWL
	db ENCORE
	db REFLECT
	db AMNESIA
	db $ff

AipomEggMoves:
	db COUNTER
	db PURSUIT
	db SPITE
	db DEFENSE_CURL
	db $ff

YanmaEggMoves:
	db WHIRLWIND
	db DOUBLE_EDGE
	db FAINT_ATTACK
	db $ff

WooperEggMoves:
	db BODY_SLAM
	db ANCIENTPOWER
	db SAFEGUARD
	db SCARY_FACE
	db ROLLOUT
	db $ff

MurkrowEggMoves:
	db WHIRLWIND
	db MIRROR_MOVE
	db SCREECH
	db SPITE
	db $ff

MisdreavusEggMoves:
	db SCREECH
	db DESTINY_BOND
	db DREAM_EATER
	db $ff

GirafarigEggMoves:
	db MEAN_LOOK
	db FORESIGHT
	db FUTURE_SIGHT
	db TAKE_DOWN
	db SWIFT
	db DOUBLE_EDGE
	db MUD_SLAP
	db $ff

PinecoEggMoves:
	db REFLECT
	db FLAIL
	db SWIFT
	db ENDURE
	db $ff

DunsparceEggMoves:
	db IRON_TAIL
	db PURSUIT
	db RAGE
	db BODY_SLAM
	db COUNTER
	db $ff

GligarEggMoves:
	db COUNTER
	db BATON_PASS
	db AGILITY
	db IRON_TAIL
	db DOUBLE_EDGE
	db $ff

SnubbullEggMoves:
	db PRESENT
	db LEER
	db TAKE_DOWN
	db COUNTER
	db PLAY_ROUGH
	db METRONOME
	db $ff

QwilfishEggMoves:
	db FLAIL
	db ENDURE
	db AQUA_JET
	db SUPERSONIC
	db ROLLOUT
	db $ff

ShuckleEggMoves:
	db MUD_SLAP
	db ACID
	db ENDURE
	db $ff

HeracrossEggMoves:
	db FLAIL
	db BODY_SLAM
	db DOUBLE_EDGE
	db $ff

SneaselEggMoves:
	db COUNTER
	db FORESIGHT
	db REFLECT
	db IRON_TAIL
	db $ff

TeddiursaEggMoves:
	db TAKE_DOWN
	db SEISMIC_TOSS
	db COUNTER
	db SEED_BOMB
	db ROLLOUT
	db $ff

SlugmaEggMoves:
	db HEAT_WAVE
	db MUD_SLAP
	db DEFENSE_CURL
	db DOUBLE_EDGE
	db ROLLOUT
	db $ff

SwinubEggMoves:
	db MIMIC
	db DEFENSE_CURL
	db FISSURE
	db ROAR
	db $ff

CorsolaEggMoves:
	db ROCK_POLISH
	db MIST
	db AMNESIA
	db IRON_DEFENSE
	db $ff

RemoraidEggMoves:
	db SUPERSONIC
	db SCREECH
	db MIND_READER
	db SWIFT
	db DOUBLE_EDGE
	db MUD_SLAP
	db $ff

DelibirdEggMoves:
	db AURORA_BEAM
	db QUICK_ATTACK
	db FUTURE_SIGHT
	db SPLASH
	db RAPID_SPIN
	db ROLLOUT
	db COUNTER
	db DOUBLE_EDGE
	db MEGA_KICK
	db SEED_BOMB
	db $ff

MantineEggMoves:
	db SEED_BOMB
	db HAZE
	db SLAM
	db $ff

SkarmoryEggMoves:
	db MIMIC
	db DOUBLE_EDGE
	db $ff

HoundourEggMoves:
	db RAGE
	db REVERSAL
	db FAINT_ATTACK
	db SWIFT
	db CHARM
	db DOUBLE_EDGE
	db MUD_SLAP
	db $ff

PhanpyEggMoves:
	db FOCUS_ENERGY
	db PLAY_ROUGH
	db COUNTER
	db IRON_TAIL
	db $ff

StantlerEggMoves:
	db REFLECT
	db SPITE
	db DISABLE
	db LIGHT_SCREEN
	db SWIFT
	db DOUBLE_EDGE
	db $ff

TyrogueEggMoves:
	db BODY_SLAM
	db MUD_SLAP
	db METRONOME
	db POISON_JAB
	db DIZZY_PUNCH
	db AGILITY
	db $ff

SmoochumEggMoves:
	db MEDITATE
	db THRASH
	db HEAL_BELL
	db $ff

ElekidEggMoves:
	db IRON_TAIL
	db BODY_SLAM
	db MUD_SLAP
	db SWIFT
	db $ff

MagbyEggMoves:
	db IRON_TAIL
	db BODY_SLAM
	db MUD_SLAP
	db SWIFT
	db BELLY_DRUM
	db THRASH
	db $ff

MiltankEggMoves:
	db IRON_TAIL
	db HEADBUTT
	db MUD_SLAP
	db DIZZY_PUNCH
	db $ff

LarvitarEggMoves:
	db IRON_HEAD
	db COUNTER
	db MUD_SLAP
	db DOUBLE_EDGE
	db FOCUS_ENERGY
	db MEGA_KICK
	db SPITE
	db $ff

NoEggMoves:
	db $ff
