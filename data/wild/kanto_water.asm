; Kanto Pokémon in water

;	db GROUP_TOHJO_FALLS, MAP_TOHJO_FALLS
;	db $0a ; encounter rate

	db GROUP_VERMILION_PORT, MAP_VERMILION_PORT
	db $05 ; encounter rate
	db 35,TENTACOOL
	db 30,TENTACOOL
	db 35,TENTACRUEL

	db GROUP_ROUTE_4, MAP_ROUTE_4
	db $0a ; encounter rate
	db 10,GOLDEEN
	db 5,GOLDEEN
	db 10,SEAKING

	db GROUP_ROUTE_6, MAP_ROUTE_6
	db $05 ; encounter rate
	db 10,PSYDUCK
	db 5,PSYDUCK
	db 10,GOLDUCK

	db GROUP_ROUTE_9, MAP_ROUTE_9
	db $0a ; encounter rate
	db 15,GOLDEEN
	db 10,GOLDEEN
	db 15,SEAKING

	db GROUP_ROUTE_10_NORTH, MAP_ROUTE_10_NORTH
	db $0a ; encounter rate
	db 15,GOLDEEN
	db 10,GOLDEEN
	db 15,SEAKING

	db GROUP_ROUTE_12, MAP_ROUTE_12
	db $0f ; encounter rate
	db 25,TENTACOOL
	db 25,QUAGSIRE
	db 25,TENTACRUEL

	db GROUP_ROUTE_13, MAP_ROUTE_13
	db $0f ; encounter rate
	db 25,TENTACOOL
	db 25,QUAGSIRE
	db 25,TENTACRUEL

	db GROUP_ROUTE_19, MAP_ROUTE_19
	db $0f ; encounter rate
	db 35,TENTACOOL
	db 30,TENTACOOL
	db 35,TENTACRUEL

	db GROUP_ROUTE_20, MAP_ROUTE_20
	db $0f ; encounter rate
	db 35,TENTACOOL
	db 30,TENTACOOL
	db 35,TENTACRUEL

	db GROUP_ROUTE_21, MAP_ROUTE_21
	db $0f ; encounter rate
	db 35,TENTACOOL
	db 30,TENTACOOL
	db 35,TENTACRUEL

	db GROUP_ROUTE_22, MAP_ROUTE_22
	db $05 ; encounter rate
	db 10,POLIWAG
	db 5,POLIWAG
	db 10,POLIWHIRL

	db GROUP_ROUTE_24, MAP_ROUTE_24
	db $0a ; encounter rate
	db 10,GOLDEEN
	db 5,GOLDEEN
	db 10,SEAKING

	db GROUP_ROUTE_25, MAP_ROUTE_25
	db $0a ; encounter rate
	db 10,GOLDEEN
	db 5,GOLDEEN
	db 10,SEAKING

	db GROUP_ROUTE_26, MAP_ROUTE_26
	db $0f ; encounter rate
	db 55
	db $01
;morning
		db GOLDEEN ;20
		db QUAGSIRE ;20
		db SEAKING ;10
		db WOOPER ;10
		db GOLDEEN ;5
		db MARILL ;5
		db MARILL ;5
		db MARILL ;5
		db AZUMARILL ;4
		db PSYDUCK ;4
		db PSYDUCK ;3
		db GOLDUCK ;3
		db WARTORTLE ;2
		db WARTORTLE ;2
		db AZUMARILL ;1
		db WARTORTLE ;1
;day
		db PSYDUCK ;20
		db WOOPER ;20
		db GOLDUCK ;10
		db GOLDEEN ;10
		db GOLDEEN ;5
		db MARILL ;5
		db AZUMARILL ;5
		db AZUMARILL ;5
		db SEAKING ;4
		db QUAGSIRE ;4
		db WARTORTLE ;3
		db PSYDUCK ;3
		db WARTORTLE ;2
		db PSYDUCK ;2
		db SEAKING ;1
		db QUAGSIRE ;1
;night
		db ;20
		db ;20
		db ;10
		db ;10
		db ;5
		db ;5
		db ;5
		db ;5
		db ;4
		db ;4
		db ;3
		db ;3
		db ;2
		db ;2
		db ;1
		db ;1
	db GROUP_ROUTE_27, MAP_ROUTE_27
	db $0f ; encounter rate
	db 20,TENTACOOL
	db 15,TENTACOOL
	db 20,TENTACRUEL

	db GROUP_ROUTE_28, MAP_ROUTE_28
	db $05 ; encounter rate
	db 40,POLIWAG
	db 35,POLIWAG
	db 40,POLIWHIRL

	db GROUP_PALLET_TOWN, MAP_PALLET_TOWN
	db $0f ; encounter rate
	db 35,TENTACOOL
	db 30,TENTACOOL
	db 35,TENTACRUEL

	db GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY
	db $05 ; encounter rate
	db 10,POLIWAG
	db 5,POLIWAG
	db 10,POLIWHIRL

	db GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY
	db $0a ; encounter rate
	db 10,GOLDEEN
	db 5,GOLDEEN
	db 10,SEAKING

	db GROUP_VERMILION_CITY, MAP_VERMILION_CITY
	db $0f ; encounter rate
	db 35,TENTACOOL
	db 30,TENTACOOL
	db 35,TENTACRUEL

	db GROUP_CELADON_CITY, MAP_CELADON_CITY
	db $05 ; encounter rate
	db 20,GRIMER
	db 15,GRIMER
	db 15,MUK

	db GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY
	db $05 ; encounter rate
	db 20,MAGIKARP
	db 15,MAGIKARP
	db 10,MAGIKARP

	db GROUP_CINNABAR_ISLAND, MAP_CINNABAR_ISLAND
	db $0f ; encounter rate
	db 35,TENTACOOL
	db 30,TENTACOOL
	db 35,TENTACRUEL

	db $ff ; end
