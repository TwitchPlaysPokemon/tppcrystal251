NONE EQU 0

PARTY_LENGTH EQU 6

MAX_ITEMS     EQU 20
MAX_BALLS     EQU 12
MAX_KEY_ITEMS EQU 25
MAX_PC_ITEMS  EQU 50

; strings
PLAYER_NAME_LENGTH EQU 8
PKMN_NAME_LENGTH EQU 11
MOVE_NAME_LENGTH EQU 13
ITEM_NAME_LENGTH EQU 13
NAME_LENGTH EQU 11
LV_CHAR EQU $6e

; GetName types
PKMN_NAME     EQU 1
MOVE_NAME     EQU 2
ITEM_NAME     EQU 4
PARTY_OT_NAME EQU 5
ENEMY_OT_NAME EQU 6
TRAINER_NAME  EQU 7

; hp
HP_GREEN  EQU 0
HP_YELLOW EQU 1
HP_RED    EQU 2

; boxes
MONS_PER_BOX EQU 20
NUM_BOXES    EQU 14


; flag manipulation
RESET_FLAG EQU 0
SET_FLAG   EQU 1
CHECK_FLAG EQU 2


; joypad
BUTTONS    EQU %00010000
D_PAD      EQU %00100000

NO_INPUT   EQU %00000000
A_BUTTON   EQU %00000001
B_BUTTON   EQU %00000010
SELECT     EQU %00000100
START      EQU %00001000
D_RIGHT    EQU %00010000
D_LEFT     EQU %00100000
D_UP       EQU %01000000
D_DOWN     EQU %10000000


; screen
HP_BAR_LENGTH EQU 6
HP_BAR_LENGTH_PX EQU HP_BAR_LENGTH * 8
EXP_BAR_LENGTH EQU 8
EXP_BAR_LENGTH_PX EQU EXP_BAR_LENGTH * 8

SCREEN_WIDTH EQU 20
SCREEN_HEIGHT EQU 18
SCREEN_WIDTH_PX EQU 160
SCREEN_HEIGHT_PX EQU 144

BG_MAP_WIDTH  EQU 32
BG_MAP_HEIGHT EQU 32

TILE_WIDTH EQU 8


; movement
STEP_SLOW EQU 0
STEP_WALK EQU 1
STEP_BIKE EQU 2
STEP_LEDGE EQU 3
STEP_ICE EQU 4
STEP_TURN EQU 5
STEP_BACK_LEDGE EQU 6
STEP_WALK_IN_PLACE EQU 7
STEP_SPIN EQU 8
STEP_RUN EQU 9


; ai
CONTEXT_USE_F      EQU 6
UNKNOWN_USE_F      EQU 5
ALWAYS_USE_F       EQU 4
SWITCH_SOMETIMES_F EQU 2
SWITCH_RARELY_F    EQU 1
SWITCH_OFTEN_F     EQU 0

CONTEXT_USE        EQU 1 << CONTEXT_USE_F
UNKNOWN_USE        EQU 1 << UNKNOWN_USE_F
ALWAYS_USE         EQU 1 << ALWAYS_USE_F
SWITCH_SOMETIMES   EQU 1 << SWITCH_SOMETIMES_F
SWITCH_RARELY      EQU 1 << SWITCH_RARELY_F
SWITCH_OFTEN       EQU 1 << SWITCH_OFTEN_F

PARTY_STRUCT_LENGTH EQU 432
