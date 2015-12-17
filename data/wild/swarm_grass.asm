; swarms in grass

; Dunsparce swarm
	db GROUP_DARK_CAVE_VIOLET_ENTRANCE, MAP_DARK_CAVE_VIOLET_ENTRANCE ;obviosly wrong, need to come back to this
	db $19
	db 80
	db $01
;morning
		db VOLTORB ;20
		db ELECTRODE ;20
		db MAGNETON ;10
		db MAGNETON ;10
		db ELEKID ;5
		db ELEKID ;5
		db RAICHU ;5
		db RAICHU ;5
		db RAICHU ;4
		db FLAAFFY ;4
		db FLAAFFY ;3
		db ELECTABUZZ ;3
		db ELECTABUZZ ;2
		db AMPHAROS ;2
		db FLAAFFY ;1
		db RAICHU ;1
;day
		db VOLTORB ;20
		db ELECTRODE ;20
		db MAGNETON ;10
		db MAGNETON ;10
		db ELEKID ;5
		db ELEKID ;5
		db RAICHU ;5
		db RAICHU ;5
		db FLAAFFY ;4
		db ELECTABUZZ ;4
		db ELECTABUZZ ;3
		db ELECTABUZZ ;3
		db ELECTABUZZ ;2
		db ELECTABUZZ ;2
		db ELECTABUZZ ;1
		db AMPHAROS ;1

;night
		db VOLTORB ;20
		db ELECTRODE ;20
		db MAGNETON ;10
		db MAGNETON ;10
		db ELEKID ;5
		db ELEKID ;5
		db RAICHU ;5
		db ELECTABUZZ ;5
		db AMPHAROS ;4
		db FLAAFFY ;4
		db FLAAFFY ;3
		db FLAAFFY ;3
		db FLAAFFY ;2
		db FLAAFFY ;2
		db FLAAFFY ;1
		db AMPHAROS ;1

; Yanma swarm
	db GROUP_ROUTE_35, MAP_ROUTE_35
	db $19 ; encounter rates: morn/day/nite
	db 85
	db $01
;morning
		db VENOMOTH ;20
		db WIGGLYTUFF ;20
		db SANDSLASH ;10
		db RAICHU ;10
		db VENOMOTH ;5
		db NIDOKING ;5
		db GRANBULL ;5
		db GENGAR ;5
		db GENGAR ;4
		db PILOSWINE ;4
		db PILOSWINE ;3
		db PILOSWINE ;3
		db PILOSWINE ;2
		db PILOSWINE ;2
		db PILOSWINE ;1
		db GENGAR ;1
;day
		db RAICHU ;20
		db NIDOKING ;20
		db PILOSWINE ;10
		db GRANBULL ;10
		db SANDSLASH ;5
		db SANDSLASH ;5
		db SANDSLASH ;5
		db VENOMOTH ;5
		db VENOMOTH ;4
		db VENOMOTH ;4
		db WIGGLYTUFF ;3
		db WIGGLYTUFF ;3
		db VENOMOTH ;2
		db WIGGLYTUFF ;2
		db WIGGLYTUFF ;1
		db WIGGLYTUFF ;1
;night
		db GENGAR ;20
		db SANDSLASH ;20
		db NIDOKING ;10
		db RAICHU ;10
		db GENGAR ;5
		db RAICHU ;5
		db WIGGLYTUFF ;5
		db VENOMOTH ;5
		db PILOSWINE ;4
		db GRANBULL ;4
		db GRANBULL ;3
		db GRANBULL ;3
		db GRANBULL ;2
		db GRANBULL ;2
		db PILOSWINE ;1
		db GRANBULL ;1

	db $ff ; end
