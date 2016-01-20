	const_def
	const       NO_AI
const_value = 0
	shift_const AI_BASIC
	shift_const AI_SETUP
	shift_const AI_TYPES
	shift_const AI_OFFENSIVE
	shift_const AI_SMART
	shift_const AI_OPPORTUNIST
	shift_const AI_AGGRESSIVE
	shift_const AI_CAUTIOUS
	shift_const AI_STATUS
	shift_const AI_RISKY
	shift_const AI_10
	shift_const AI_11
	shift_const AI_12
	shift_const AI_13
	shift_const AI_14
	shift_const AI_15

TrainerClassAttributes: ; 3959c

; Falkner
	db NONE, NONE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Whitney
	db NONE, NONE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Bugsy
	db NONE, NONE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Morty
	db NONE, NONE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Pryce
	db HYPER_POTION, NONE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Jasmine
	db HYPER_POTION, NONE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Chuck
	db FULL_HEAL, NONE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Clair
	db FULL_HEAL, HYPER_POTION ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Rival1
	db NONE, NONE ; items
	db 15 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Pokemon Prof
	db NONE, NONE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_AGGRESSIVE + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Will
	db MAX_POTION, NONE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Cal
	db NONE, NONE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Bruno
	db MAX_POTION, NONE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Karen
	db FULL_HEAL, MAX_POTION ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Koga
	db FULL_HEAL, FULL_RESTORE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Champion
	db FULL_HEAL, FULL_RESTORE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Brock
	db HYPER_POTION, NONE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Misty
	db FULL_HEAL, NONE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Lt Surge
	db HYPER_POTION, NONE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Scientist
	db NONE, NONE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Erika
	db HYPER_POTION, NONE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Youngster
	db NONE, NONE ; items
	db 4 ; base reward
	dw AI_BASIC + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Schoolboy
	db NONE, NONE ; items
	db 8 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_OFTEN

; Bird Keeper
	db NONE, NONE ; items
	db 6 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OFFENSIVE + AI_OPPORTUNIST + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Lass
	db NONE, NONE ; items
	db 6 ; base reward
	dw AI_BASIC + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_OFTEN

; Janine
	db DIRE_HIT, NONE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Cooltrainerm
	db NONE, NONE ; items
	db 12 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Cooltrainerf
	db NONE, NONE ; items
	db 12 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Beauty
	db NONE, NONE ; items
	db 22 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Pokemaniac
	db NONE, NONE ; items
	db 15 ; base reward
	dw AI_BASIC + AI_SETUP + AI_OFFENSIVE + AI_AGGRESSIVE + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Gruntm
	db NONE, NONE ; items
	db 10 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Gentleman
	db NONE, NONE ; items
	db 18 ; base reward
	dw AI_BASIC + AI_SETUP + AI_AGGRESSIVE + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Skier
	db NONE, NONE ; items
	db 18 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Teacher
	db NONE, NONE ; items
	db 18 ; base reward
	dw AI_BASIC + AI_OPPORTUNIST + AI_AGGRESSIVE + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Sabrina
	db HYPER_POTION, NONE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Bug Catcher
	db NONE, NONE ; items
	db 4 ; base reward
	dw AI_BASIC + AI_SETUP + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Fisher
	db NONE, NONE ; items
	db 10 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_OFTEN

; Swimmerm
	db NONE, NONE ; items
	db 2 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_OFFENSIVE + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Swimmerf
	db NONE, NONE ; items
	db 5 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Sailor
	db NONE, NONE ; items
	db 10 ; base reward
	dw AI_BASIC + AI_OFFENSIVE + AI_OPPORTUNIST + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Super Nerd
	db NONE, NONE ; items
	db 8 ; base reward
	dw AI_BASIC + AI_TYPES + AI_SMART + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Rival2
	db NONE, NONE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Guitarist
	db NONE, NONE ; items
	db 8 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Hiker
	db NONE, NONE ; items
	db 8 ; base reward
	dw AI_BASIC + AI_OFFENSIVE + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Biker
	db NONE, NONE ; items
	db 8 ; base reward
	dw AI_BASIC + AI_TYPES + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Blaine
	db MAX_POTION, FULL_HEAL ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Burglar
	db NONE, NONE ; items
	db 22 ; base reward
	dw AI_BASIC + AI_OFFENSIVE + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Firebreather
	db NONE, NONE ; items
	db 12 ; base reward
	dw AI_BASIC + AI_SETUP + AI_OFFENSIVE + AI_OPPORTUNIST + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Juggler
	db NONE, NONE ; items
	db 10 ; base reward
	dw AI_BASIC + AI_TYPES + AI_SMART + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Blackbelt T
	db NONE, NONE ; items
	db 6 ; base reward
	dw AI_BASIC + AI_OFFENSIVE + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Executivem
	db NONE, NONE ; items
	db 18 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_SMART + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Psychic T
	db NONE, NONE ; items
	db 8 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Picnicker
	db NONE, NONE ; items
	db 5 ; base reward
	dw AI_BASIC + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Camper
	db NONE, NONE ; items
	db 5 ; base reward
	dw AI_BASIC + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Executivef
	db NONE, NONE ; items
	db 18 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_SMART + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Sage
	db NONE, NONE ; items
	db 8 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Medium
	db NONE, NONE ; items
	db 10 ; base reward
	dw AI_BASIC + AI_SETUP + AI_TYPES + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Boarder
	db NONE, NONE ; items
	db 18 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Pokefanm
	db NONE, NONE ; items
	db 20 ; base reward
	dw AI_BASIC + AI_TYPES + AI_SMART + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Kimono Girl
	db NONE, NONE ; items
	db 18 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Twins
	db NONE, NONE ; items
	db 5 ; base reward
	dw NO_AI
	dw CONTEXT_USE + SWITCH_OFTEN

; Pokefanf
	db NONE, NONE ; items
	db 20 ; base reward
	dw AI_BASIC + AI_TYPES + AI_SMART + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Red
	db FULL_RESTORE, FULL_RESTORE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Blue
	db FULL_RESTORE, FULL_RESTORE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Officer
	db NONE, NONE ; items
	db 10 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_STATUS
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Gruntf
	db NONE, NONE ; items
	db 10 ; base reward
	dw AI_BASIC + AI_TYPES + AI_OPPORTUNIST + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Mysticalman
	db NONE, NONE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Bill
	db FULL_RESTORE, FULL_RESTORE ; items
	db 25
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Elm
	db FULL_RESTORE, FULL_RESTORE ; items
	db 25
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; tppPc
	db FULL_RESTORE, FULL_RESTORE ; items
	db 25
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; Giovanni
	db FULL_RESTORE, FULL_RESTORE ; items
	db 25
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; CoolSibs
	db NONE, NONE ; items
	db 12 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; RivalRB
	db NONE, NONE ; items
	db 15 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; RivalRB
	db NONE, NONE ; items
	db 15 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; BrockRB
	db POTION, NONE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; MistyRB
	db FULL_HEAL, NONE ; items
	db 25 ; base reward
	dw AI_BASIC + AI_SETUP + AI_SMART + AI_AGGRESSIVE + AI_CAUTIOUS + AI_STATUS + AI_RISKY
	dw CONTEXT_USE + SWITCH_SOMETIMES

; 39771
