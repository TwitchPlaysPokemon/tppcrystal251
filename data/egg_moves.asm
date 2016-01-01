INCLUDE "includes.asm"


SECTION "Egg Moves", ROMX, BANK[EGG_MOVES]

; All instances of Charm, Steel Wing, Sweet Scent, and Lovely Kiss were
; removed from egg move lists in Crystal, because they are also TMs.

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
	db $ff

CharmanderEggMoves:
	db RAGE
	db LEER
	db COUNTER
	db OUTRAGE
	db $ff

SquirtleEggMoves:
	db MIST
	db FORESIGHT
	db FLAIL
	db HAZE
	db OUTRAGE
	db $ff

PidgeyEggMoves:
	db FORESIGHT
	db MUD_SLAP
	db PECK
	db $ff

RattataEggMoves:
	db TAKE_DOWN
	db DEFENSE_CURL
	db BODY_SLAM
	db $ff

SpearowEggMoves:
	db SCARY_FACE
	db QUICK_ATTACK
	db WING_ATTACK
	db HEAT_WAVE
	db $ff

EkansEggMoves:
	db SLAM
	db SPITE
	db CRUNCH
	db $ff

SandshrewEggMoves:
	db FLAIL
	db SAFEGUARD
	db COUNTER
	db RAPID_SPIN
if _CRYSTAL
	db METAL_CLAW
endc
	db $ff

NidoranFEggMoves:
	db SUPERSONIC
	db TAKE_DOWN
	db COUNTER
	db SUPER_FANG
	db $ff

NidoranMEggMoves:
	db SUPERSONIC
	db DISABLE
	db COUNTER
	db SUPER_FANG
	db DOUBLE_EDGE
	db $ff

VulpixEggMoves:
	db FAINT_ATTACK
	db HYPNOSIS
	db FLAIL
	db SPITE
	db DISABLE
	db $ff

ZubatEggMoves:
	db PURSUIT
	db $ff

OddishEggMoves:
	db SYNTHESIS
	db CHARM
	db $ff

ParasEggMoves:
	db SCREECH
	db COUNTER
	db FLAIL
;	db SWEET_SCENT
	db LIGHT_SCREEN
	db PURSUIT
	db $ff

VenonatEggMoves:
	db SCREECH
	db $ff

DiglettEggMoves:
	db TRI_ATTACK
	db TAKE_DOWN
	db $ff

MeowthEggMoves:
	db SPITE
	db CHARM
	db HYPNOSIS
	db AMNESIA
	db $ff

PsyduckEggMoves:
	db ICE_BEAM
	db FORESIGHT
	db LIGHT_SCREEN
	db FUTURE_SIGHT
	db PSYCHIC_M
	db $ff

MankeyEggMoves:
	db ROCK_SLIDE
	db FORESIGHT
	db MEDITATE
	db COUNTER
	db REVERSAL
	db $ff

GrowlitheEggMoves:
	db THRASH
	db $ff

PoliwagEggMoves:
	db MIST
	db SPLASH
	db HAZE
	db $ff

AbraEggMoves:
	db LIGHT_SCREEN
	db ENCORE
	db BARRIER
	db $ff

MachopEggMoves:
	db LIGHT_SCREEN
	db MEDITATE
	db ROLLING_KICK
	db ENCORE
	db $ff

BellsproutEggMoves:
	db BODY_SLAM
	db $ff

TentacoolEggMoves:
	db AURORA_BEAM
	db MIRROR_COAT
	db RAPID_SPIN
	db HAZE
	db SAFEGUARD
	db $ff

GeodudeEggMoves:
;	db MEGA_PUNCH
	db ROCK_SLIDE
	db $ff

PonytaEggMoves:
	db THRASH
	db QUICK_ATTACK
	db $ff

SlowpokeEggMoves:
	db BELLY_DRUM
	db $ff

FarfetchDEggMoves:
	db FORESIGHT
	db MIRROR_MOVE
	db GUST
	db QUICK_ATTACK
	db FLAIL
	db $ff

DoduoEggMoves:
	db FLAIL
	db $ff

SeelEggMoves:
	db PERISH_SONG
	db SLAM
	db $ff

GrimerEggMoves:
	db HAZE
	db MEAN_LOOK
	db LICK
	db $ff

ShellderEggMoves:
	db BUBBLEBEAM
	db TAKE_DOWN
	db BARRIER
	db RAPID_SPIN
	db SCREECH
	db $ff

GastlyEggMoves:
	db PSYWAVE
	db PERISH_SONG
	db HAZE
	db METRONOME
	db $ff

OnixEggMoves:
	db FLAIL
	db EXPLOSION
	db $ff

DrowzeeEggMoves:
	db LIGHT_SCREEN
	db $ff

KrabbyEggMoves:
	db DIG
	db HAZE
	db AMNESIA
	db FLAIL
	db SLAM
	db $ff

ExeggcuteEggMoves:
	db ANCIENTPOWER
	db $ff

CuboneEggMoves:
	db ROCK_SLIDE
	db ANCIENTPOWER
	db BELLY_DRUM
	db SCREECH
;	db SKULL_BASH
	db PERISH_SONG
if _CRYSTAL
	db SWORDS_DANCE
endc
	db $ff

LickitungEggMoves:
	db BELLY_DRUM
	db MAGNITUDE
	db BODY_SLAM
	db $ff

KoffingEggMoves:
	db SCREECH
	db ROLLOUT
	db $ff

RhyhornEggMoves:
	db REVERSAL
	db THRASH
	db COUNTER
	db $ff

ChanseyEggMoves:
	db PRESENT
	db LIGHT_SCREEN
	db HEAL_BELL
	db $ff

TangelaEggMoves:
	db REFLECT
	db RAZOR_LEAF
	db $ff

KangaskhanEggMoves:
	db FORESIGHT
	db FOCUS_ENERGY
	db SAFEGUARD
	db $ff

HorseaEggMoves:
	db FLAIL
	db AURORA_BEAM
	db OCTAZOOKA
	db DISABLE
	db SPLASH
	db DRAGON_RAGE
	db $ff

GoldeenEggMoves:
	db HAZE
	db HYDRO_PUMP
	db $ff

if !_CRYSTAL
StaryuEggMoves:
	db AURORA_BEAM
	db BARRIER
	db SUPERSONIC
	db $ff
endc

MrMimeEggMoves:
	db FUTURE_SIGHT
	db HYPNOSIS
	db MIND_READER
	db METRONOME
	db $ff

ScytherEggMoves:
	db COUNTER
	db SAFEGUARD
;	db RAZOR_WIND
	db REVERSAL
	db LIGHT_SCREEN
	db $ff

PinsirEggMoves:
	db FALSE_SWIPE
	db QUICK_ATTACK
	db FLAIL
	db FISSURE
	db $ff

LaprasEggMoves:
	db AURORA_BEAM
	db FORESIGHT
	db $ff

EeveeEggMoves:
	db BODY_SLAM
	db HEAL_BELL
	db $ff

OmanyteEggMoves:
	db BUBBLEBEAM
	db AURORA_BEAM
	db SLAM
	db SUPERSONIC
	db HAZE
	db $ff

KabutoEggMoves:
	db BUBBLEBEAM
	db AURORA_BEAM
	db RAPID_SPIN
	db DIG
	db FLAIL
	db $ff

AerodactylEggMoves:
	db WHIRLWIND
	db PURSUIT
	db FORESIGHT
if !_CRYSTAL
	db STEEL_WING
endc
	db $ff

SnorlaxEggMoves:
	db METRONOME
	db CHARM
	db $ff

DratiniEggMoves:
	db LIGHT_SCREEN
	db MIST
	db HAZE
	db SUPERSONIC
	db $ff

ChikoritaEggMoves:
	db VINE_WHIP
	db COUNTER
	db FLAIL
	db SWORDS_DANCE
	db $ff

CyndaquilEggMoves:
	db FURY_ATTACK
	db QUICK_ATTACK
	db FORESIGHT
	db $ff

TotodileEggMoves:
	db CRUNCH
	db THRASH
	db HYDRO_PUMP
	db ANCIENTPOWER
;	db RAZOR_WIND
	db ROCK_SLIDE
	db $ff

SentretEggMoves:
	db FOCUS_ENERGY
	db TAKE_DOWN
	db $ff

HoothootEggMoves:
	db SUPERSONIC
if _CRYSTAL
	db SKY_ATTACK
endc
	db $ff

LedybaEggMoves:
	db LIGHT_SCREEN
	db $ff

SpinarakEggMoves:
	db PSYBEAM
	db SONICBOOM
	db $ff

ChinchouEggMoves:
	db FLAIL
	db SUPERSONIC
	db SCREECH
	db $ff

PichuEggMoves:
	db SCARY_FACE
	db BIDE
	db PRESENT
	db DOUBLESLAP
	db EXTREMESPEED
	db $ff

CleffaEggMoves:
	db PRESENT
	db BELLY_DRUM
	db SPLASH
	db MIMIC
	db PLAY_ROUGH
	db $ff

IgglybuffEggMoves:
	db PRESENT
	db FAINT_ATTACK
	db $ff

TogepiEggMoves:
	db PRESENT
	db FORESIGHT
	db $ff

NatuEggMoves:
	db QUICK_ATTACK
	db LIGHT_SCREEN
	db $ff

MareepEggMoves:
	db BODY_SLAM
	db SAFEGUARD
	db REFLECT
	db $ff

MarillEggMoves:
	db LIGHT_SCREEN
	db PRESENT
	db AMNESIA
	db SUPERSONIC
	db FORESIGHT
	db $ff

SudowoodoEggMoves:
	db SELFDESTRUCT
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
	db $ff

MurkrowEggMoves:
	db WHIRLWIND
	db QUICK_ATTACK
	db MIRROR_MOVE
	db $ff

MisdreavusEggMoves:
	db SCREECH
	db DESTINY_BOND
	db $ff

GirafarigEggMoves:
	db AMNESIA
	db FORESIGHT
	db FUTURE_SIGHT
	db $ff

PinecoEggMoves:
	db REFLECT
	db FLAIL
	db SWIFT
	db $ff

DunsparceEggMoves:
	db BIDE
	db ANCIENTPOWER
	db ROCK_SLIDE
	db PURSUIT
	db RAGE
	db $ff

GligarEggMoves:
;	db RAZOR_WIND
	db COUNTER
	db BATON_PASS
	db $ff

SnubbullEggMoves:
	db FAINT_ATTACK
	db PRESENT
	db LEER
	db $ff

QwilfishEggMoves:
	db FLAIL
	db $ff

ShuckleEggMoves:
;	db SWEET_SCENT
	db $ff

HeracrossEggMoves:
	db FLAIL
	db BODY_SLAM
	db $ff

SneaselEggMoves:
	db COUNTER
	db FORESIGHT
	db REFLECT
	db $ff

TeddiursaEggMoves:
	db TAKE_DOWN
	db SEISMIC_TOSS
	db COUNTER
	db $ff

SlugmaEggMoves:
	db YAWN
	db DOUBLE_EDGE
	db $ff

SwinubEggMoves:
	db BODY_SLAM
	db FISSURE
	db $ff

CorsolaEggMoves:
	db ROCK_SLIDE
	db MIST
	db AMNESIA
	db $ff

RemoraidEggMoves:
	db SUPERSONIC
	db SCREECH
	db STRING_SHOT
	db $ff

DelibirdEggMoves:
	db AURORA_BEAM
	db QUICK_ATTACK
	db FUTURE_SIGHT
	db SPLASH
	db RAPID_SPIN
	db $ff

MantineEggMoves:
	db TWISTER
	db HYDRO_PUMP
	db HAZE
	db SLAM
	db $ff

SkarmoryEggMoves:
	db DRILL_PECK
	db PURSUIT
	db WHIRLWIND
if _CRYSTAL
	db SKY_ATTACK
endc
	db $ff

HoundourEggMoves:
	db RAGE
	db REVERSAL
	db FAINT_ATTACK
	db $ff

PhanpyEggMoves:
	db FOCUS_ENERGY
	db $ff

StantlerEggMoves:
	db REFLECT
	db SPITE
	db DISABLE
	db LIGHT_SCREEN
	db BITE
	db $ff

TyrogueEggMoves:
	db BODY_SLAM
	db $ff

SmoochumEggMoves:
	db LOVELY_KISS
	db MEDITATE
	db $ff

ElekidEggMoves:
	db KARATE_CHOP
	db BARRIER
	db BODY_SLAM
	db $ff

MagbyEggMoves:
	db KARATE_CHOP
	db BARRIER
	db BODY_SLAM
	db $ff

MiltankEggMoves:
	db PRESENT
	db REVERSAL
	db SEISMIC_TOSS
	db $ff

LarvitarEggMoves:
	db OUTRAGE
	db $ff

NoEggMoves:
	db $ff
