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
	db HEAT_WAVE ; tm move or not?
	db $ff

EkansEggMoves:
	db DISABLE
	db SPITE
	db BODY_SLAM
	db $ff

SandshrewEggMoves:
	db SUPER_FANG
	db SAFEGUARD
	db COUNTER
	db RAPID_SPIN
	db $ff

NidoranFEggMoves:
	db SUPERSONIC
	db FOCUS_ENERGY
	db TAKE_DOWN
	db COUNTER
	db DRILL_RUN ; tm move or not?
	db $ff

NidoranMEggMoves:
	db SUPERSONIC
	db BODY_SLAM
	db COUNTER
	db SUPER_FANG
	db DRILL_RUN ; tm move or not?
	db $ff

VulpixEggMoves:
	db SWIFT
	db RAGE
	db FLAIL
	db SPITE
	db REFLECT
	db $ff

ZubatEggMoves:
	db GUNK_SHOT
	db PURSUIT
	db HEAT_WAVE ; tm move or not?
	db ZEN_HEADBUTT ; tm move or not?
	db $ff

OddishEggMoves:
	db SYNTHESIS
	db MIMIC
	db $ff

ParasEggMoves:
	db SCREECH
	db COUNTER
	db FLAIL
	db LIGHT_SCREEN
	db PURSUIT
	db $ff

VenonatEggMoves:
	db SCREECH
	db MIMIC
	db STRING_SHOT
	db SWIFT ; tm or not?
	db $ff

DiglettEggMoves:
	db TRI_ATTACK
	db TAKE_DOWN
	db BODY_SLAM
	db $ff

MeowthEggMoves:
	db IRON_TAIL
	db DREAM_EATER
	db NIGHTMARE
	db MUD_SLAP
	db $ff

PsyduckEggMoves:
	db ICE_BEAM
	db FORESIGHT
	db LIGHT_SCREEN
	db CONFUSE_RAY
	db $ff

MankeyEggMoves:
	db COUNTER
	db BODY_SLAM
	db RAGE
	db SPITE
	db $ff

GrowlitheEggMoves:
	db THRASH
	db IRON_HEAD ; tm or not?
	db MUD_SLAP
	db BODY_SLAM
	db $ff

PoliwagEggMoves:
	db MIST
	db SPLASH
	db HAZE
	db ENDURE
	db $ff

AbraEggMoves:
	db ENCORE
	db ENDURE
	db FORESIGHT
	db SEISMIC_TOSS
	db $ff

MachopEggMoves:
	db LIGHT_SCREEN
	db RAGE
	db SEISMIC_TOSS
	db $ff

BellsproutEggMoves:
	db DOUBLE_EDGE
	db MIMIC
	db $ff

TentacoolEggMoves:
	db HAZE
	db SAFEGUARD
	db WATER_GUN
	db SLUDGE
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
	db FLARE_BLITZ
	db $ff

SlowpokeEggMoves:
	db BELLY_DRUM
	db COUNTER
	db IRON_DEFENSE
	db MEGA_KICK
	db $ff

FarfetchDEggMoves:
	db MIRROR_MOVE
	db QUICK_ATTACK
	db FLAIL
	db HEAT_WAVE
	db $ff

DoduoEggMoves:
	db FLAIL
	db ENDURE
	db QUICK_ATTACK
	db $ff

SeelEggMoves:
	db ENDURE
	db FLAIL
	db SLAM
	db MIMIC
	db $ff

GrimerEggMoves:
	db HAZE
	db MEAN_LOOK
	db LICK
	db SCARY_FACE
	db $ff

ShellderEggMoves:
	db BUBBLEBEAM
	db POISON_JAB ; tm move or not?
	db RAPID_SPIN
	db SCREECH
	db $ff

GastlyEggMoves:
	db HAZE
	db METRONOME
	db DISABLE
	db SCARY_FACE
	db $ff

OnixEggMoves:
	db FLAIL
	db EXPLOSION
	db DARK_PULSE
	db TWISTER
	db $ff

DrowzeeEggMoves:
	db LIGHT_SCREEN
	db COUNTER
	db BODY_SLAM
	db $ff

KrabbyEggMoves:
	db HAZE
	db FLAIL
	db MUD_SLAP
	db ANCIENTPOWER
	db $ff

ExeggcuteEggMoves:
	db SELFDESTRUCT
	db EXPLOSION
	db NIGHTMARE
	db $ff

CuboneEggMoves:
	db ANCIENTPOWER
	db BELLY_DRUM
	db SCREECH
	db IRON_TAIL ; tm or not?
	db $ff

LickitungEggMoves:
	db IRON_TAIL ; tm move or not?
	db MUD_SLAP
	db MEGA_KICK
	db AMNESIA
	db $ff

KoffingEggMoves:
	db SCREECH
	db BIDE
	db DEFENSE_CURL
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
	db SEED_BOMB
	db $ff

KangaskhanEggMoves:
	db FORESIGHT
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
	db HEADBUTT ; tm move or not?
	db DOUBLE_EDGE
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
	db $ff

SnorlaxEggMoves:
	db SELFDESTRUCT
	db OUTRAGE
	db GUNK_SHOT ; tm or not?
	db DOUBLE_EDGE
	db $ff

DratiniEggMoves:
	db LIGHT_SCREEN
	db MIST
	db HAZE
	db IRON_TAIL ; tm or not?
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
	db HEADBUTT ; tm or not?
	db $ff

TotodileEggMoves:
	db ANCIENTPOWER
	db BODY_SLAM
	db MUD_SLAP
	db SEISMIC_TOSS ; tm or not?
	db ROCK_SLIDE ; tm or not?
	db $ff

SentretEggMoves:
	db FOCUS_ENERGY
	db TAKE_DOWN
	db CHARM
	db IRON_TAIL ; tm or not?
	db $ff

HoothootEggMoves:
	db SUPERSONIC
	db DREAM_EATER
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
	db $ff

CleffaEggMoves:
	db PRESENT
	db SPLASH
	db MIMIC
	db PLAY_ROUGH
	db $ff

IgglybuffEggMoves:
	db PRESENT
	db NIGHTMARE
	db PAIN_SPLIT
	db SEISMIC_TOSS
	db COUNTER
	db $ff

TogepiEggMoves:
	db PRESENT
	db FORESIGHT
	db COUNTER
	db HEAL_BELL
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
	db $ff

MurkrowEggMoves:
	db WHIRLWIND
	db MIRROR_MOVE
	db SCREECH
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
	db $ff

GligarEggMoves:
	db COUNTER
	db BATON_PASS
	db AGILITY
	db $ff

SnubbullEggMoves:
	db PRESENT
	db LEER
	db TAKE_DOWN
	db COUNTER
	db $ff

QwilfishEggMoves:
	db FLAIL
	db ENDURE
	db AQUA_JET
	db SUPERSONIC
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
	db IRON_TAIL ; tm or not?
	db $ff

TeddiursaEggMoves:
	db TAKE_DOWN
	db SEISMIC_TOSS
	db COUNTER
	db SEED_BOMB
	db GUNK_SHOT ; tm or not?
	db $ff

SlugmaEggMoves:
	db HEAT_WAVE
	db MUD_SLAP
	db DEFENSE_CURL
	db DOUBLE_EDGE
	db $ff

SwinubEggMoves:
	db MIMIC
	db DEFENSE_CURL
	db FISSURE
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
	db $ff

DelibirdEggMoves:
	db AURORA_BEAM
	db QUICK_ATTACK
	db FUTURE_SIGHT
	db SPLASH
	db RAPID_SPIN
	db $ff

MantineEggMoves:
	db SEED_BOMB
	db GUNK_SHOT ; tm or not?
	db HAZE
	db SLAM
	db $ff

SkarmoryEggMoves:
	db PURSUIT
	db MIMIC
	db MUD_SLAP
	db $ff

HoundourEggMoves:
	db RAGE
	db REVERSAL
	db FAINT_ATTACK
	db $ff

PhanpyEggMoves:
	db FOCUS_ENERGY
	db PLAY_ROUGH
	db GUNK_SHOT ; tm or not?
	db COUNTER
	db IRON_TAIL
	db $ff

StantlerEggMoves:
	db REFLECT
	db SPITE
	db DISABLE
	db LIGHT_SCREEN
	db SWIFT
	db $ff

TyrogueEggMoves:
	db BODY_SLAM
	db MUD_SLAP
	db METRONOME
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
	db $ff

MiltankEggMoves:
	db IRON_TAIL ; tm or not?
	db HEADBUTT ; tm or not?
	db MUD_SLAP
	db DIZZY_PUNCH
	db $ff

LarvitarEggMoves:
	db IRON_HEAD
	db COUNTER
	db MUD_SLAP
	db $ff

NoEggMoves:
	db $ff
