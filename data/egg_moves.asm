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
	db MIMIC
	db REFLECT
	db $ff

CharmanderEggMoves:
	db RAGE
	db MUD_SLAP
	db COUNTER
	db DRAGONBREATH
	db IRON_TAIL
	db SUBMISSION
	db REFLECT
	db MEGA_KICK
	db FISSURE
	db DOUBLE_EDGE
	db HEAT_WAVE
	db SWIFT
	db $ff

SquirtleEggMoves:
	db MIST
	db FORESIGHT
	db FLAIL
	db ROLLOUT
	db ROAR
	db DEFENSE_CURL
	db ENDURE
	db DOUBLE_EDGE
	db MIMIC
	db MUD_SLAP
	db BIDE
	db $ff

PidgeyEggMoves:
	db FORESIGHT
	db SWIFT
	db PECK
	db MIMIC
	db BIDE
	db $ff

RattataEggMoves:
	db TAKE_DOWN
	db DEFENSE_CURL
	db SWIFT
	db FOCUS_ENERGY
	db MIMIC
	db $ff

SpearowEggMoves:
	db SCARY_FACE
	db WING_ATTACK
	db SWIFT
	db MIMIC
	db BIDE
	db MIRROR_MOVE
	db RAGE
	db $ff

EkansEggMoves:
	db DISABLE
	db SPITE
	db SCARY_FACE
	db HEADBUTT
	db RAGE
	db BIDE
	db MIMIC
	db $ff

SandshrewEggMoves:
	db DOUBLE_EDGE
	db SAFEGUARD
	db COUNTER
	db RAPID_SPIN
	db SAND_ATTACK
	db HEADBUTT
	db IRON_TAIL
	db BIDE
	db MIMIC
	db SUBMISSION
	db $ff

NidoranFEggMoves:
	db SUPERSONIC
	db FOCUS_ENERGY
	db TAKE_DOWN
	db COUNTER
	db DRILL_RUN
	db OUTRAGE
	db ROAR
	db BIDE
	db MIMIC
	db MEGA_KICK
	db MUD_SLAP
	db FISSURE
	db REFLECT
	db HORN_DRILL
	db DEFENSE_CURL
	db SUBMISSION
	db DOUBLE_EDGE
	db $ff

NidoranMEggMoves:
	db SUPERSONIC
	db COUNTER
	db SUPER_FANG
	db ROAR
	db BIDE
	db MIMIC
	db MEGA_KICK
	db MUD_SLAP
	db FISSURE
	db REFLECT
	db HORN_DRILL
	db DEFENSE_CURL
	db SUBMISSION
	db DOUBLE_EDGE
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
	db DOUBLE_EDGE
	db RAGE
	db MIMIC
	db BIDE
	db $ff

OddishEggMoves:
	db SYNTHESIS
	db MIMIC
	db SEED_BOMB
	db SAFEGUARD
	db REFLECT
	db DOUBLE_EDGE
	db BIDE
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
	db DOUBLE_EDGE
	db BIDE
	db REFLECT
	db PSYWAVE
	db SCREECH
	db $ff

DiglettEggMoves:
	db TRI_ATTACK
	db TAKE_DOWN
	db BIDE
	db RAGE
	db MIMIC
	db SAND_ATTACK
	db $ff

MeowthEggMoves:
	db DREAM_EATER
	db NIGHTMARE
	db MUD_SLAP
	db IRON_TAIL
	db SING
	db SWIFT
	db DEFENSE_CURL
	db ENDURE
	db MIMIC
	db BIDE
	db RAGE
	db $ff

PsyduckEggMoves:
	db FORESIGHT
	db LIGHT_SCREEN
	db CONFUSE_RAY
	db SWIFT
	db CHARM
	db COUNTER
	db SCREECH
	db MIMIC
	db BIDE
	db RAGE
	db DOUBLE_EDGE
	db HEADBUTT
	db MUD_SLAP
	db $ff

MankeyEggMoves:
	db COUNTER
	db SPITE
	db METRONOME
	db IRON_TAIL
	db DOUBLE_EDGE
	db MUD_SLAP
	db MIMIC
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
	db BIDE
	db MIMIC
	db RAGE
	db REFLECT
	db $ff

PoliwagEggMoves:
	db MIST
	db SPLASH
	db PSYWAVE
	db ENDURE
	db COUNTER
	db DEFENSE_CURL
	db METRONOME
	db MUD_SLAP
	db $ff

AbraEggMoves:
	db ENCORE
	db ENDURE
	db FORESIGHT
	db METRONOME
	db DREAM_EATER
	db HEADBUTT
	db NIGHTMARE
	db BIDE
	db MIMIC
	db MEGA_KICK
	db DOUBLE_EDGE
	db RAGE
	db IRON_TAIL
	db SAFEGUARD
	db $ff

MachopEggMoves:
	db MEGA_KICK
	db METRONOME
	db DOUBLE_EDGE
	db RAGE
	db MIMIC
	db HEADBUTT
	db MIMIC
	db $ff

BellsproutEggMoves:
	db DOUBLE_EDGE
	db MIMIC
	db REFLECT
	db BIDE
	db MORNING_SUN
	db SYNTHESIS
	db $ff

TentacoolEggMoves:
	db WATER_GUN
	db ACID
	db SCREECH
	db DOUBLE_EDGE
	db MIMIC
	db BIDE
	db RAGE
	db $ff

GeodudeEggMoves:
	db COUNTER
	db FLAIL
	db ENDURE
	db FISSURE
	db MIMIC
	db RAGE
	db SUBMISSION
	db HEADBUTT
	db ANCIENTPOWER
	db IRON_HEAD
	db METRONOME
	db $ff

PonytaEggMoves:
	db THRASH
	db QUICK_ATTACK
	db DOUBLE_EDGE
	db MIMIC
	db BIDE
	db RAGE
	db $ff

SlowpokeEggMoves:
	db BELLY_DRUM
	db MEGA_KICK
	db SWIFT
	db DREAM_EATER
	db MUD_SLAP
	db LIGHT_SCREEN
	db NIGHTMARE
	db BIDE
	db MIMIC
	db DOUBLE_EDGE
	db FISSURE
	db RAGE
	db REFLECT
	db PSYWAVE
	db $ff

FarfetchDEggMoves:
	db MIRROR_MOVE
	db QUICK_ATTACK
	db FLAIL
	db REFLECT
	db FORESIGHT
	db ENDURE
	db HEADBUTT
	db MIMIC
	db BIDE
	db MUD_SLAP
	db $ff

DoduoEggMoves:
	db FLAIL
	db ENDURE
	db QUICK_ATTACK
	db BATON_PASS
	db MUD_SLAP
	db SWIFT
	db BIDE
	db MIMIC
	db REFLECT
	db $ff

SeelEggMoves:
	db ENDURE
	db FLAIL
	db MIMIC
	db DISABLE
	db DOUBLE_EDGE
	db BIDE
	db $ff

GrimerEggMoves:
	db HAZE
	db SCARY_FACE
	db MUD_SLAP
	db BIDE
	db MIMIC
	db RAGE
	db $ff

ShellderEggMoves:
	db BUBBLEBEAM
	db RAPID_SPIN
	db SCREECH
	db DOUBLE_EDGE
	db MIMIC
	db BIDE
	db RAGE
	db REFLECT
	db TRI_ATTACK
	db $ff

GastlyEggMoves:
	db HAZE
	db METRONOME
	db DISABLE
	db SCARY_FACE
	db COUNTER
	db BIDE
	db HEADBUTT
	db DOUBLE_EDGE
	db MIMIC
	db $ff

OnixEggMoves:
	db FLAIL
	db EXPLOSION
	db IRON_TAIL
	db TWISTER
	db ROAR
	db DOUBLE_EDGE
	db MUD_SLAP
	db MIMIC
	db RAGE
	db FISSURE
	db ENDURE
	db $ff

DrowzeeEggMoves:
	db LIGHT_SCREEN
	db COUNTER
	db REFLECT
	db AMNESIA
	db METRONOME
	db BELLY_DRUM
	db DOUBLE_EDGE
	db BIDE
	db MEGA_KICK
	db MIMIC
	db RAGE
	db SUBMISSION
	db $ff

KrabbyEggMoves:
	db HAZE
	db FLAIL
	db MUD_SLAP
	db ANCIENTPOWER
	db ENDURE
	db MIMIC
	db $ff

ExeggcuteEggMoves:
	db EXPLOSION
	db NIGHTMARE
	db ROLLOUT
	db LIGHT_SCREEN
	db RAGE
	db ANCIENTPOWER
	db DOUBLE_EDGE
	db HEADBUTT
	db SYNTHESIS
	db BIDE
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
	db BIDE
	db MIMIC
	db SUBMISSION
	db FISSURE
	db MEGA_KICK
	db $ff

LickitungEggMoves:
	db IRON_TAIL
	db MUD_SLAP
	db MEGA_KICK
	db AMNESIA
	db WRAP
	db COUNTER
	db DISABLE
	db DOUBLE_EDGE
	db DREAM_EATER
	db HEADBUTT
	db HEAL_BELL
	db MIMIC
	db BIDE
	db RAGE
	db EXPLOSION
	db FISSURE
	db $ff

KoffingEggMoves:
	db SCREECH
	db BIDE
	db MIMIC
	db RAGE
	db ROLLOUT
	db MUD_SLAP
	db $ff

RhyhornEggMoves:
	db REVERSAL
	db THRASH
	db COUNTER
	db SPITE
	db TAKE_DOWN
	db ANCIENTPOWER
	db ENDURE
	db DOUBLE_EDGE
	db HEADBUTT
	db MEGA_KICK
	db MIMIC
	db OUTRAGE
	db POISON_JAB
	db SUBMISSION
	db $ff

ChanseyEggMoves:
	db PRESENT
	db DREAM_EATER
	db IRON_TAIL
	db MUD_SLAP
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
	db SLAM
	db SUPERSONIC
	db HAZE
	db REFLECT
	db $ff

KabutoEggMoves:
	db RAPID_SPIN
	db ENDURE
	db FLAIL
	db MUD_SLAP
	db REFLECT
	db $ff

AerodactylEggMoves:
	db TAKE_DOWN
	db PURSUIT
	db FORESIGHT
	db ROAR
	db ROCK_POLISH
	db $ff

SnorlaxEggMoves:
	db SELFDESTRUCT
	db OUTRAGE
	db DOUBLE_EDGE
	db HARDEN
	db FISSURE
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
	db QUICK_ATTACK
	db FORESIGHT
	db HEADBUTT
	db MEGA_KICK
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
	db DEFENSE_CURL
	db HEADBUTT
	db RAGE
	db MIMIC
	db REFLECT
	db SUBMISSION
	db MEGA_KICK
	db MUD_SLAP
	db DOUBLE_EDGE
	db $ff

CleffaEggMoves:
	db PRESENT
	db SPLASH
	db MIMIC
	db IRON_TAIL
	db COUNTER
	db REFLECT
	db ROLLOUT
	db SCARY_FACE
	db BIDE
	db SUBMISSION
	db MEGA_KICK
	db MUD_SLAP
	db DEFENSE_CURL
	db SAFEGUARD
	db AMNESIA
	db DREAM_EATER
	db NIGHTMARE
	db PSYWAVE
	db $ff

IgglybuffEggMoves:
	db PRESENT
	db NIGHTMARE
	db SUBMISSION
	db MIMIC
	db PSYWAVE
	db DISABLE
	db BIDE
	db BUBBLEBEAM
	db HEADBUTT
	db SCARY_FACE
	db DREAM_EATER
	db MUD_SLAP
	db SAFEGUARD
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
	db DEFENSE_CURL
	db MEGA_KICK
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
	db MIST
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
	db COUNTER
	db ROLLOUT
	db $ff

SlugmaEggMoves:
	db REFLECT
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
	db $ff

DelibirdEggMoves:
	db QUICK_ATTACK
	db FUTURE_SIGHT
	db SPLASH
	db RAPID_SPIN
	db ROLLOUT
	db COUNTER
	db DOUBLE_EDGE
	db MEGA_KICK
	db SPIKES
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
	db MUD_SLAP
	db METRONOME
	db POISON_JAB
	db DOUBLE_EDGE
	db BIDE
	db MIMIC
	db RAGE
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
	db COUNTER
	db DOUBLE_EDGE
	db FOCUS_ENERGY
	db SPITE
	db SCARY_FACE
	db $ff

NoEggMoves:
	db $ff
