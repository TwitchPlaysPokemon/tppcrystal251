; Johto Pokémon in grass

	db GROUP_SPROUT_TOWER_2F, MAP_SPROUT_TOWER_2F ;MAP tells you what map this encounter table is for, should be pretty obvious. don't touch it
	db $05 ; encounter rates for all day Encounter rate out of 255, delete 2 of the 3 identical numbers and both commas
	db 20 ;base level for the area before alteration. Use lower bound for random spread (for 2-6, use 2)
	db $00 ;Tables to use. first is a $ for tech reasons Left number/letter is level alteration table. Right number is what %chance table to use. 0 = big 30, 1 = 2020, 2 = 2015, 3 = 1510
	; The level alteration table hasn't been decided/coded yet, though 0 is for no alteration exept random variance
;morning Mons go here, make sure no semi-colons are where they shouldn't be (before mons), and that morning/day/night are after semi-colons
        db BELLSPROUT ;30
        db ZUBAT ;10
        db HOUNDOUR ;10
        db BELLSPROUT 10
        db SPINARAK;5
        db MURKROW ;5
        db SPINARAK  ;5
        db BELLSPROUT ;5
        db HOOTHOOT ;4
        db WEEPINBELL ;4
        db WEEPINBELL ;3
        db BELLSPROUT ;3
        db GOLBAT ;2
        db BELLSPROUT ;2
        db HOOTHOOT ;1
        db ODDISH ;1
;day
        db BELLSPROUT ;30
        db ZUBAT ;10
        db SPINARAK ;10
        db BELLSPROUT 10
        db HOOTHOOT ;5
        db BELLSPROUT ;5
        db MURKROW ;5
        db BELLSPROUT ;5
        db HOUNDOUR ;4
        db WEEPINBELL ;4
        db GOLBAT ;3
        db WEEPINBELL ;3
        db ZUBAT ;2
        db SPINARAK ;2
        db HOUNDOUR ;1
        db ODDISH ;1
;night
        db BELLSPROUT ;30
        db MISDREAVUS ;10
        db BELLSPROUT ;10
        db MISDREAVUS  ;10
        db ZUBAT ;5
        db MISDREAVUS ;5
        db SPINARAK ;5
        db BELLSPROUT ;5
        db WEEPINBELL ;4
        db SPINARAK ;4
        db WEEPINBELL ;3
        db BELLSPROUT ;3
        db HOUNDOUR ;2
        db BELLSPROUT ;2
        db GOLBAT ;1
        db ODDISH ;1


	db GROUP_SPROUT_TOWER_3F, MAP_SPROUT_TOWER_3F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 3,RATTATA
	db 4,RATTATA
	db 5,RATTATA
	db 3,RATTATA
	db 6,RATTATA
	db 5,RATTATA
	db 5,RATTATA
	; day
	db 3,RATTATA
	db 4,RATTATA
	db 5,RATTATA
	db 3,RATTATA
	db 6,RATTATA
	db 5,RATTATA
	db 5,RATTATA
	; nite
	db 3,GASTLY
	db 4,GASTLY
	db 5,GASTLY
	db 3,RATTATA
	db 6,GASTLY
	db 5,RATTATA
	db 5,RATTATA

	db GROUP_TIN_TOWER_2F, MAP_TIN_TOWER_2F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; day
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; nite
	db 20,GASTLY
	db 21,GASTLY
	db 22,GASTLY
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA

	db GROUP_TIN_TOWER_3F, MAP_TIN_TOWER_3F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; day
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; nite
	db 20,GASTLY
	db 21,GASTLY
	db 22,GASTLY
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA

	db GROUP_TIN_TOWER_4F, MAP_TIN_TOWER_4F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; day
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; nite
	db 20,GASTLY
	db 21,GASTLY
	db 22,GASTLY
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA

	db GROUP_TIN_TOWER_5F, MAP_TIN_TOWER_5F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; day
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; nite
	db 20,GASTLY
	db 21,GASTLY
	db 22,GASTLY
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA

	db GROUP_TIN_TOWER_6F, MAP_TIN_TOWER_6F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; day
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; nite
	db 20,GASTLY
	db 21,GASTLY
	db 22,GASTLY
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA

	db GROUP_TIN_TOWER_7F, MAP_TIN_TOWER_7F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; day
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; nite
	db 20,GASTLY
	db 21,GASTLY
	db 22,GASTLY
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA

	db GROUP_TIN_TOWER_8F, MAP_TIN_TOWER_8F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; day
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; nite
	db 20,GASTLY
	db 21,GASTLY
	db 22,GASTLY
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA

	db GROUP_TIN_TOWER_9F, MAP_TIN_TOWER_9F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; day
	db 20,RATTATA
	db 21,RATTATA
	db 22,RATTATA
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA
	; nite
	db 20,GASTLY
	db 21,GASTLY
	db 22,GASTLY
	db 22,RATTATA
	db 23,RATTATA
	db 24,RATTATA
	db 24,RATTATA

	db GROUP_BURNED_TOWER_1F, MAP_BURNED_TOWER_1F
	db $0a,$0a,$0a ; encounter rates: morn/day/nite
	; morn
	db 13,RATTATA
	db 14,KOFFING
	db 15,RATTATA
	db 14,ZUBAT
	db 15,RATTATA
	db 15,RATICATE
	db 15,RATICATE
	; day
	db 13,RATTATA
	db 14,KOFFING
	db 15,RATTATA
	db 14,ZUBAT
	db 15,RATTATA
	db 15,RATICATE
	db 15,RATICATE
	; nite
	db 13,RATTATA
	db 14,KOFFING
	db 15,RATTATA
	db 14,ZUBAT
	db 15,RATTATA
	db 15,RATICATE
	db 15,RATICATE

	db GROUP_BURNED_TOWER_B1F, MAP_BURNED_TOWER_B1F
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 14,RATTATA
	db 14,KOFFING
	db 16,KOFFING
	db 15,ZUBAT
	db 12,KOFFING
	db 16,KOFFING
	db 16,WEEZING
	; day
	db 14,RATTATA
	db 14,KOFFING
	db 16,KOFFING
	db 15,ZUBAT
	db 12,KOFFING
	db 16,KOFFING
	db 16,WEEZING
	; nite
	db 14,RATTATA
	db 14,KOFFING
	db 16,KOFFING
	db 15,ZUBAT
	db 12,KOFFING
	db 16,KOFFING
	db 16,WEEZING

	db GROUP_NATIONAL_PARK, MAP_NATIONAL_PARK
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 12,NIDORAN_M
	db 12,NIDORAN_F
	db 14,LEDYBA
	db 13,PIDGEY
	db 10,CATERPIE
	db 10,WEEDLE
	db 10,WEEDLE
	; day
	db 12,NIDORAN_F
	db 12,NIDORAN_M
	db 14,SUNKERN
	db 13,PIDGEY
	db 10,CATERPIE
	db 10,WEEDLE
	db 10,WEEDLE
	; nite
	db 12,PSYDUCK
	db 13,HOOTHOOT
	db 14,SPINARAK
	db 15,HOOTHOOT
	db 10,VENONAT
	db 12,VENONAT
	db 12,VENONAT

	db GROUP_RUINS_OF_ALPH_OUTSIDE, MAP_RUINS_OF_ALPH_OUTSIDE
	db $0a,$0a,$0a ; encounter rates: morn/day/nite
	; morn
	db 20,NATU
	db 22,NATU
	db 18,NATU
	db 24,NATU
	db 20,SMEARGLE
	db 22,SMEARGLE
	db 22,SMEARGLE
	; day
	db 20,NATU
	db 22,NATU
	db 18,NATU
	db 24,NATU
	db 20,SMEARGLE
	db 22,SMEARGLE
	db 22,SMEARGLE
	; nite
	db 20,NATU
	db 22,NATU
	db 18,NATU
	db 24,NATU
	db 22,WOOPER
	db 22,QUAGSIRE
	db 22,QUAGSIRE

	db GROUP_RUINS_OF_ALPH_INNER_CHAMBER, MAP_RUINS_OF_ALPH_INNER_CHAMBER
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	; day
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	; nite
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN
	db 5,UNOWN

	db GROUP_UNION_CAVE_1F, MAP_UNION_CAVE_1F
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 6,GEODUDE
	db 6,SANDSHREW
	db 5,ZUBAT
	db 4,RATTATA
	db 7,ZUBAT
	db 6,ONIX
	db 6,ONIX
	; day
	db 6,GEODUDE
	db 6,SANDSHREW
	db 5,ZUBAT
	db 4,RATTATA
	db 7,ZUBAT
	db 6,ONIX
	db 6,ONIX
	; nite
	db 6,GEODUDE
	db 6,RATTATA
	db 5,WOOPER
	db 4,RATTATA
	db 7,ZUBAT
	db 6,ONIX
	db 6,ONIX

	db GROUP_UNION_CAVE_B1F, MAP_UNION_CAVE_B1F
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 8,GEODUDE
	db 6,ZUBAT
	db 8,ZUBAT
	db 8,ONIX
	db 6,RATTATA
	db 8,RATTATA
	db 8,RATTATA
	; day
	db 8,GEODUDE
	db 6,ZUBAT
	db 8,ZUBAT
	db 8,ONIX
	db 6,RATTATA
	db 8,RATTATA
	db 8,RATTATA
	; nite
	db 8,GEODUDE
	db 6,ZUBAT
	db 8,WOOPER
	db 8,ONIX
	db 6,RATTATA
	db 8,RATTATA
	db 8,RATTATA

	db GROUP_UNION_CAVE_B2F, MAP_UNION_CAVE_B2F
	db $0a,$0a,$0a ; encounter rates: morn/day/nite
	; morn
	db 22,ZUBAT
	db 22,GOLBAT
	db 22,ZUBAT
	db 21,RATICATE
	db 20,GEODUDE
	db 23,ONIX
	db 23,ONIX
	; day
	db 22,ZUBAT
	db 22,GOLBAT
	db 22,ZUBAT
	db 21,RATICATE
	db 20,GEODUDE
	db 23,ONIX
	db 23,ONIX
	; nite
	db 22,ZUBAT
	db 22,GOLBAT
	db 22,QUAGSIRE
	db 21,RATICATE
	db 20,GEODUDE
	db 23,ONIX
	db 23,ONIX

	db GROUP_SLOWPOKE_WELL_B1F, MAP_SLOWPOKE_WELL_B1F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 5,ZUBAT
	db 6,ZUBAT
	db 7,ZUBAT
	db 6,SLOWPOKE
	db 8,ZUBAT
	db 8,SLOWPOKE
	db 8,SLOWPOKE
	; day
	db 5,ZUBAT
	db 6,ZUBAT
	db 7,ZUBAT
	db 6,SLOWPOKE
	db 8,ZUBAT
	db 8,SLOWPOKE
	db 8,SLOWPOKE
	; nite
	db 5,ZUBAT
	db 6,ZUBAT
	db 7,ZUBAT
	db 6,SLOWPOKE
	db 8,ZUBAT
	db 8,SLOWPOKE
	db 8,SLOWPOKE

	db GROUP_SLOWPOKE_WELL_B2F, MAP_SLOWPOKE_WELL_B2F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 21,ZUBAT
	db 23,ZUBAT
	db 19,ZUBAT
	db 21,SLOWPOKE
	db 23,GOLBAT
	db 23,SLOWPOKE
	db 23,SLOWPOKE
	; day
	db 21,ZUBAT
	db 23,ZUBAT
	db 19,ZUBAT
	db 21,SLOWPOKE
	db 23,GOLBAT
	db 23,SLOWPOKE
	db 23,SLOWPOKE
	; nite
	db 21,ZUBAT
	db 23,ZUBAT
	db 19,ZUBAT
	db 21,SLOWPOKE
	db 23,GOLBAT
	db 23,SLOWPOKE
	db 23,SLOWPOKE

	db GROUP_ILEX_FOREST, MAP_ILEX_FOREST
	db $0a,$0a,$0a ; encounter rates: morn/day/nite
	; morn
	db 5,CATERPIE
	db 5,WEEDLE
	db 7,METAPOD
	db 7,KAKUNA
	db 7,PIDGEY
	db 6,PARAS
	db 6,PARAS
	; day
	db 5,CATERPIE
	db 5,WEEDLE
	db 7,METAPOD
	db 7,KAKUNA
	db 7,PIDGEY
	db 6,PARAS
	db 6,PARAS
	; nite
	db 5,ODDISH
	db 5,VENONAT
	db 7,ODDISH
	db 7,PSYDUCK
	db 7,HOOTHOOT
	db 6,PARAS
	db 6,PARAS

	db GROUP_MOUNT_MORTAR_1F_OUTSIDE, MAP_MOUNT_MORTAR_1F_OUTSIDE
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 14,RATTATA
	db 13,ZUBAT
	db 14,MACHOP
	db 13,GOLBAT
	db 14,GEODUDE
	db 16,RATICATE
	db 16,RATICATE
	; day
	db 14,RATTATA
	db 13,ZUBAT
	db 14,MACHOP
	db 13,GOLBAT
	db 14,GEODUDE
	db 16,RATICATE
	db 16,RATICATE
	; nite
	db 14,RATTATA
	db 13,ZUBAT
	db 14,MARILL
	db 13,GOLBAT
	db 14,GEODUDE
	db 16,RATICATE
	db 16,RATICATE

	db GROUP_MOUNT_MORTAR_1F_INSIDE, MAP_MOUNT_MORTAR_1F_INSIDE
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 13,GEODUDE
	db 14,RATTATA
	db 15,MACHOP
	db 14,RATICATE
	db 15,ZUBAT
	db 15,GOLBAT
	db 15,GOLBAT
	; day
	db 13,GEODUDE
	db 14,RATTATA
	db 15,MACHOP
	db 14,RATICATE
	db 15,ZUBAT
	db 15,GOLBAT
	db 15,GOLBAT
	; nite
	db 13,GEODUDE
	db 14,RATTATA
	db 15,RATICATE
	db 14,ZUBAT
	db 15,MARILL
	db 15,GOLBAT
	db 15,GOLBAT

	db GROUP_MOUNT_MORTAR_2F_INSIDE, MAP_MOUNT_MORTAR_2F_INSIDE
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 31,GRAVELER
	db 32,MACHOKE
	db 31,GEODUDE
	db 30,RATICATE
	db 28,MACHOP
	db 30,GOLBAT
	db 30,GOLBAT
	; day
	db 31,GRAVELER
	db 32,MACHOKE
	db 31,GEODUDE
	db 30,RATICATE
	db 28,MACHOP
	db 30,GOLBAT
	db 30,GOLBAT
	; nite
	db 31,GRAVELER
	db 31,GEODUDE
	db 30,RATICATE
	db 30,GOLBAT
	db 28,MARILL
	db 32,GOLBAT
	db 32,GOLBAT

	db GROUP_MOUNT_MORTAR_B1F, MAP_MOUNT_MORTAR_B1F
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 15,ZUBAT
	db 17,ZUBAT
	db 17,GOLBAT
	db 16,MACHOP
	db 16,GEODUDE
	db 18,RATICATE
	db 18,RATICATE
	; day
	db 15,ZUBAT
	db 17,ZUBAT
	db 17,GOLBAT
	db 16,MACHOP
	db 16,GEODUDE
	db 18,RATICATE
	db 18,RATICATE
	; nite
	db 15,ZUBAT
	db 17,ZUBAT
	db 17,GOLBAT
	db 16,MARILL
	db 16,GEODUDE
	db 18,RATICATE
	db 18,RATICATE

	db GROUP_ICE_PATH_1F, MAP_ICE_PATH_1F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 21,SWINUB
	db 22,ZUBAT
	db 22,GOLBAT
	db 23,SWINUB
	db 24,GOLBAT
	db 22,GOLBAT
	db 22,GOLBAT
	; day
	db 21,SWINUB
	db 22,ZUBAT
	db 22,GOLBAT
	db 23,SWINUB
	db 24,GOLBAT
	db 22,GOLBAT
	db 22,GOLBAT
	; nite
	db 21,DELIBIRD
	db 22,ZUBAT
	db 22,GOLBAT
	db 23,DELIBIRD
	db 24,GOLBAT
	db 22,GOLBAT
	db 22,GOLBAT

	db GROUP_ICE_PATH_B1F, MAP_ICE_PATH_B1F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 22,SWINUB
	db 23,ZUBAT
	db 23,GOLBAT
	db 24,SWINUB
	db 25,GOLBAT
	db 23,GOLBAT
	db 22,JYNX
	; day
	db 22,SWINUB
	db 23,ZUBAT
	db 23,GOLBAT
	db 24,SWINUB
	db 25,GOLBAT
	db 23,GOLBAT
	db 22,JYNX
	; nite
	db 22,DELIBIRD
	db 23,ZUBAT
	db 23,GOLBAT
	db 24,DELIBIRD
	db 25,GOLBAT
	db 23,GOLBAT
	db 22,SNEASEL

	db GROUP_ICE_PATH_B2F_MAHOGANY_SIDE, MAP_ICE_PATH_B2F_MAHOGANY_SIDE
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 23,SWINUB
	db 24,ZUBAT
	db 24,GOLBAT
	db 25,SWINUB
	db 26,GOLBAT
	db 22,JYNX
	db 24,JYNX
	; day
	db 23,SWINUB
	db 24,ZUBAT
	db 24,GOLBAT
	db 25,SWINUB
	db 26,GOLBAT
	db 22,JYNX
	db 24,JYNX
	; nite
	db 23,DELIBIRD
	db 24,ZUBAT
	db 24,GOLBAT
	db 25,DELIBIRD
	db 26,GOLBAT
	db 22,SNEASEL
	db 24,SNEASEL

	db GROUP_ICE_PATH_B2F_BLACKTHORN_SIDE, MAP_ICE_PATH_B2F_BLACKTHORN_SIDE
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 23,SWINUB
	db 24,ZUBAT
	db 24,GOLBAT
	db 25,SWINUB
	db 26,GOLBAT
	db 22,JYNX
	db 24,JYNX
	; day
	db 23,SWINUB
	db 24,ZUBAT
	db 24,GOLBAT
	db 25,SWINUB
	db 26,GOLBAT
	db 22,JYNX
	db 24,JYNX
	; nite
	db 23,DELIBIRD
	db 24,ZUBAT
	db 24,GOLBAT
	db 25,DELIBIRD
	db 26,GOLBAT
	db 22,SNEASEL
	db 24,SNEASEL

	db GROUP_ICE_PATH_B3F, MAP_ICE_PATH_B3F
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 24,SWINUB
	db 25,ZUBAT
	db 25,GOLBAT
	db 26,SWINUB
	db 22,JYNX
	db 24,JYNX
	db 26,JYNX
	; day
	db 24,SWINUB
	db 25,ZUBAT
	db 25,GOLBAT
	db 26,SWINUB
	db 22,JYNX
	db 24,JYNX
	db 26,JYNX
	; nite
	db 24,DELIBIRD
	db 25,ZUBAT
	db 25,GOLBAT
	db 26,DELIBIRD
	db 22,SNEASEL
	db 24,SNEASEL
	db 26,SNEASEL

	db GROUP_WHIRL_ISLAND_NW, MAP_WHIRL_ISLAND_NW
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 22,KRABBY
	db 23,ZUBAT
	db 22,SEEL
	db 24,KRABBY
	db 25,GOLBAT
	db 24,SEEL
	db 24,SEEL
	; day
	db 22,KRABBY
	db 23,ZUBAT
	db 22,SEEL
	db 24,KRABBY
	db 25,GOLBAT
	db 24,SEEL
	db 24,SEEL
	; nite
	db 22,KRABBY
	db 23,ZUBAT
	db 22,KRABBY
	db 24,KRABBY
	db 25,GOLBAT
	db 24,GOLBAT
	db 24,GOLBAT

	db GROUP_WHIRL_ISLAND_NE, MAP_WHIRL_ISLAND_NE
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 22,KRABBY
	db 23,ZUBAT
	db 22,SEEL
	db 24,KRABBY
	db 25,GOLBAT
	db 24,SEEL
	db 24,SEEL
	; day
	db 22,KRABBY
	db 23,ZUBAT
	db 22,SEEL
	db 24,KRABBY
	db 25,GOLBAT
	db 24,SEEL
	db 24,SEEL
	; nite
	db 22,KRABBY
	db 23,ZUBAT
	db 22,KRABBY
	db 24,KRABBY
	db 25,GOLBAT
	db 24,GOLBAT
	db 24,GOLBAT

	db GROUP_WHIRL_ISLAND_SW, MAP_WHIRL_ISLAND_SW
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 22,KRABBY
	db 23,ZUBAT
	db 22,SEEL
	db 24,KRABBY
	db 25,GOLBAT
	db 24,SEEL
	db 24,SEEL
	; day
	db 22,KRABBY
	db 23,ZUBAT
	db 22,SEEL
	db 24,KRABBY
	db 25,GOLBAT
	db 24,SEEL
	db 24,SEEL
	; nite
	db 22,KRABBY
	db 23,ZUBAT
	db 22,KRABBY
	db 24,KRABBY
	db 25,GOLBAT
	db 24,GOLBAT
	db 24,GOLBAT

	db GROUP_WHIRL_ISLAND_CAVE, MAP_WHIRL_ISLAND_CAVE
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 22,KRABBY
	db 23,ZUBAT
	db 22,SEEL
	db 24,KRABBY
	db 25,GOLBAT
	db 24,SEEL
	db 24,SEEL
	; day
	db 22,KRABBY
	db 23,ZUBAT
	db 22,SEEL
	db 24,KRABBY
	db 25,GOLBAT
	db 24,SEEL
	db 24,SEEL
	; nite
	db 22,KRABBY
	db 23,ZUBAT
	db 22,KRABBY
	db 24,KRABBY
	db 25,GOLBAT
	db 24,GOLBAT
	db 24,GOLBAT

	db GROUP_WHIRL_ISLAND_SE, MAP_WHIRL_ISLAND_SE
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 22,KRABBY
	db 23,ZUBAT
	db 22,SEEL
	db 24,KRABBY
	db 25,GOLBAT
	db 24,SEEL
	db 24,SEEL
	; day
	db 22,KRABBY
	db 23,ZUBAT
	db 22,SEEL
	db 24,KRABBY
	db 25,GOLBAT
	db 24,SEEL
	db 24,SEEL
	; nite
	db 22,KRABBY
	db 23,ZUBAT
	db 22,KRABBY
	db 24,KRABBY
	db 25,GOLBAT
	db 24,GOLBAT
	db 24,GOLBAT

	db GROUP_WHIRL_ISLAND_B1F, MAP_WHIRL_ISLAND_B1F
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 23,KRABBY
	db 24,ZUBAT
	db 23,SEEL
	db 25,KRABBY
	db 26,GOLBAT
	db 25,SEEL
	db 25,SEEL
	; day
	db 23,KRABBY
	db 24,ZUBAT
	db 23,SEEL
	db 25,KRABBY
	db 26,GOLBAT
	db 25,SEEL
	db 25,SEEL
	; nite
	db 23,KRABBY
	db 24,ZUBAT
	db 23,KRABBY
	db 25,KRABBY
	db 26,GOLBAT
	db 25,GOLBAT
	db 25,GOLBAT

	db GROUP_WHIRL_ISLAND_B2F, MAP_WHIRL_ISLAND_B2F
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 24,KRABBY
	db 25,ZUBAT
	db 24,SEEL
	db 26,KRABBY
	db 27,GOLBAT
	db 26,SEEL
	db 26,SEEL
	; day
	db 24,KRABBY
	db 25,ZUBAT
	db 24,SEEL
	db 26,KRABBY
	db 27,GOLBAT
	db 26,SEEL
	db 26,SEEL
	; nite
	db 24,KRABBY
	db 25,ZUBAT
	db 24,KRABBY
	db 26,KRABBY
	db 27,GOLBAT
	db 26,GOLBAT
	db 26,GOLBAT

	db GROUP_WHIRL_ISLAND_LUGIA_CHAMBER, MAP_WHIRL_ISLAND_LUGIA_CHAMBER
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 25,KRABBY
	db 26,ZUBAT
	db 25,SEEL
	db 27,KRABBY
	db 28,GOLBAT
	db 27,SEEL
	db 27,SEEL
	; day
	db 25,KRABBY
	db 26,ZUBAT
	db 25,SEEL
	db 27,KRABBY
	db 28,GOLBAT
	db 27,SEEL
	db 27,SEEL
	; nite
	db 25,KRABBY
	db 26,ZUBAT
	db 25,KRABBY
	db 27,KRABBY
	db 28,GOLBAT
	db 27,GOLBAT
	db 27,GOLBAT

	db GROUP_SILVER_CAVE_ROOM_1, MAP_SILVER_CAVE_ROOM_1
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 43,GRAVELER
	db 44,URSARING
	db 42,ONIX
	db 45,MAGMAR
	db 45,GOLBAT
	db 20,LARVITAR
	db 15,LARVITAR
	; day
	db 43,GRAVELER
	db 44,URSARING
	db 42,ONIX
	db 45,MAGMAR
	db 45,GOLBAT
	db 20,LARVITAR
	db 15,LARVITAR
	; nite
	db 43,GRAVELER
	db 44,GOLBAT
	db 42,ONIX
	db 42,GOLBAT
	db 45,GOLDUCK
	db 46,GOLBAT
	db 46,GOLBAT

	db GROUP_SILVER_CAVE_ROOM_2, MAP_SILVER_CAVE_ROOM_2
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 48,GOLBAT
	db 48,MACHOKE
	db 47,URSARING
	db 46,PARASECT
	db 48,PARASECT
	db 15,LARVITAR
	db 20,LARVITAR
	; day
	db 48,GOLBAT
	db 48,MACHOKE
	db 47,URSARING
	db 46,PARASECT
	db 48,PARASECT
	db 15,LARVITAR
	db 20,LARVITAR
	; nite
	db 48,GOLBAT
	db 48,GOLDUCK
	db 46,GOLBAT
	db 46,PARASECT
	db 48,PARASECT
	db 45,MISDREAVUS
	db 45,MISDREAVUS

	db GROUP_SILVER_CAVE_ROOM_3, MAP_SILVER_CAVE_ROOM_3
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 51,GOLBAT
	db 48,ONIX
	db 48,GRAVELER
	db 50,URSARING
	db 20,LARVITAR
	db 15,LARVITAR
	db 20,PUPITAR
	; day
	db 51,GOLBAT
	db 48,ONIX
	db 48,GRAVELER
	db 50,URSARING
	db 20,LARVITAR
	db 15,LARVITAR
	db 20,PUPITAR
	; nite
	db 51,GOLBAT
	db 48,ONIX
	db 48,GRAVELER
	db 49,GOLBAT
	db 45,GOLDUCK
	db 53,GOLBAT
	db 53,GOLBAT

	db GROUP_SILVER_CAVE_ITEM_ROOMS, MAP_SILVER_CAVE_ITEM_ROOMS
	db $0f,$0f,$0f ; encounter rates: morn/day/nite
	; morn
	db 48,GOLBAT
	db 46,GOLBAT
	db 50,GOLBAT
	db 46,PARASECT
	db 48,PARASECT
	db 50,PARASECT
	db 52,PARASECT
	; day
	db 48,GOLBAT
	db 46,GOLBAT
	db 50,GOLBAT
	db 46,PARASECT
	db 48,PARASECT
	db 50,PARASECT
	db 52,PARASECT
	; nite
	db 45,MISDREAVUS
	db 48,GOLBAT
	db 50,GOLBAT
	db 46,PARASECT
	db 48,PARASECT
	db 50,PARASECT
	db 52,PARASECT

	db GROUP_DARK_CAVE_VIOLET_ENTRANCE, MAP_DARK_CAVE_VIOLET_ENTRANCE
	db $0a,$0a,$0a ; encounter rates: morn/day/nite
	; morn
	db 3,GEODUDE
	db 2,ZUBAT
	db 2,GEODUDE
	db 4,GEODUDE
	db 2,TEDDIURSA
	db 4,ZUBAT
	db 4,DUNSPARCE
	; day
	db 3,GEODUDE
	db 2,ZUBAT
	db 2,GEODUDE
	db 4,GEODUDE
	db 2,ZUBAT
	db 4,ZUBAT
	db 4,DUNSPARCE
	; nite
	db 3,GEODUDE
	db 2,ZUBAT
	db 2,GEODUDE
	db 4,GEODUDE
	db 2,ZUBAT
	db 4,ZUBAT
	db 4,DUNSPARCE

	db GROUP_DARK_CAVE_BLACKTHORN_ENTRANCE, MAP_DARK_CAVE_BLACKTHORN_ENTRANCE
	db $0a,$0a,$0a ; encounter rates: morn/day/nite
	; morn
	db 23,GEODUDE
	db 23,ZUBAT
	db 25,GRAVELER
	db 25,URSARING
	db 20,TEDDIURSA
	db 23,GOLBAT
	db 23,GOLBAT
	; day
	db 23,GEODUDE
	db 23,ZUBAT
	db 25,GRAVELER
	db 25,URSARING
	db 30,URSARING
	db 23,GOLBAT
	db 23,GOLBAT
	; nite
	db 23,GEODUDE
	db 23,ZUBAT
	db 25,GRAVELER
	db 20,WOBBUFFET
	db 25,WOBBUFFET
	db 23,GOLBAT
	db 23,GOLBAT

	db GROUP_ROUTE_29, MAP_ROUTE_29
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 2,PIDGEY
	db 2,SENTRET
	db 2,SPEAROW
	db 2,MAREEP
	db 2,RATTATA
	db 2,HOPPIP
	db 2,VULPIX
	; day
	db 2,PIDGEY
	db 2,SENTRET
	db 2,SPEAROW
	db 2,MAREEP
	db 2,RATTATA
	db 2,HOPPIP
	db 2,VULPIX
	; nite
	db 2,PIDGEY
	db 2,SENTRET
	db 2,SPEAROW
	db 2,MAREEP
	db 2,RATTATA
	db 2,HOOTHOOT
	db 2,HOUNDOUR

	db GROUP_ROUTE_30, MAP_ROUTE_30
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 3,LEDYBA
	db 3,CATERPIE
	db 3,SPEAROW
	db 3,PIDGEY
	db 3,WEEDLE
	db 3,HOPPIP
	db 3,CHIKORITA
	; day
	db 3,PIDGEY
	db 3,CATERPIE
	db 3,SPEAROW
	db 3,PIDGEY
	db 3,WEEDLE
	db 3,HOPPIP
	db 3,CYNDAQUIL
	; nite
	db 3,SPINARAK
	db 3,HOOTHOOT
	db 3,POLIWAG
	db 3,ODDISH
	db 3,ZUBAT
	db 3,PIKACHU
	db 3,TOTODILE

	db GROUP_ROUTE_31, MAP_ROUTE_31
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 4,LEDYBA
	db 4,CATERPIE
	db 4,BELLSPROUT
	db 4,PIDGEY
	db 4,WEEDLE
	db 4,HOPPIP
	db 4,PARAS
	; day
	db 4,PIDGEY
	db 4,CATERPIE
	db 4,BELLSPROUT
	db 4,PIDGEY
	db 4,WEEDLE
	db 4,METAPOD
	db 4,KAKUNA
	; nite
	db 4,SPINARAK
	db 4,POLIWAG
	db 4,BELLSPROUT
	db 4,HOOTHOOT
	db 4,ZUBAT
	db 4,GASTLY
	db 4,MISDREAVUS

	db GROUP_ROUTE_32, MAP_ROUTE_32
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 7,EKANS
	db 7,RATTATA
	db 7,BELLSPROUT
	db 7,HOPPIP
	db 7,PIDGEY
	db 7,DUNSPARCE
	db 7,GEODUDE
	; day
	db 7,EKANS
	db 7,RATTATA
	db 7,BELLSPROUT
	db 7,HOPPIP
	db 7,PIDGEY
	db 7,DUNSPARCE
	db 7,GEODUDE
	; nite
	db 7,WOOPER
	db 7,RATTATA
	db 7,BELLSPROUT
	db 7,ZUBAT
	db 7,HOOTHOOT
	db 7,GASTLY
	db 7,MISDREAVUS

	db GROUP_ROUTE_33, MAP_ROUTE_33
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 11,RATTATA
	db 11,SPEAROW
	db 11,GEODUDE
	db 11,PARAS
	db 11,EKANS
	db 11,SLOWPOKE
	db 11,DIGLETT
	; day
	db 11,RATTATA
	db 11,SPEAROW
	db 11,GEODUDE
	db 11,PARAS
	db 11,EKANS
	db 11,SLOWPOKE
	db 11,DIGLETT
	; nite
	db 11,RATTATA
	db 11,ZUBAT
	db 11,GEODUDE
	db 11,PARAS
	db 11,HOUNDOUR
	db 11,SLOWPOKE
	db 11,DIGLETT

	db GROUP_ROUTE_34, MAP_ROUTE_34
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 16,SNUBBULL
	db 16,MEOWTH
	db 16,PIDGEY
	db 16,ABRA
	db 16,JIGGLYPUFF
	db 16,DITTO
	db 16,CLEFAIRY
	; day
	db 16,SNUBBULL
	db 16,NIDORAN_F
	db 16,NIDORAN_M
	db 16,ABRA
	db 16,JIGGLYPUFF
	db 16,DITTO
	db 16,CLEFAIRY
	; nite
	db 16,DROWZEE
	db 16,RATTATA
	db 16,HOOTHOOT
	db 16,ABRA
	db 16,JIGGLYPUFF
	db 16,DITTO
	db 16,CLEFAIRY

	db GROUP_ROUTE_35, MAP_ROUTE_35
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 18,SNUBBULL
	db 18,PIDGEY
	db 18,MAGNEMITE
	db 18,ABRA
	db 18,JIGGLYPUFF
	db 18,DITTO
	db 18,YANMA
	; day
	db 18,SNUBBULL
	db 18,PIDGEY
	db 18,GROWLITHE
	db 18,ABRA
	db 18,JIGGLYPUFF
	db 18,DITTO
	db 18,YANMA
	; nite
	db 18,DROWZEE
	db 18,HOOTHOOT
	db 18,PSYDUCK
	db 18,ABRA
	db 18,JIGGLYPUFF
	db 18,DITTO
	db 18,YANMA

	db GROUP_ROUTE_36, MAP_ROUTE_36
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 8,LEDYBA
	db 8,HOPPIP
	db 8,BELLSPROUT
	db 8,GROWLITHE
	db 8,SKARMORY
	db 8,PIDGEY
	db 8,SPEAROW
	; day
	db 8,LEDYBA
	db 8,HOPPIP
	db 8,BELLSPROUT
	db 8,GROWLITHE
	db 8,SKARMORY
	db 8,PIDGEY
	db 8,SPEAROW
	; nite
	db 8,SPINARAK
	db 8,HOOTHOOT
	db 8,BELLSPROUT
	db 8,HOUNDOUR
	db 8,MURKROW
	db 8,GASTLY
	db 8,POLIWAG

	db GROUP_ROUTE_37, MAP_ROUTE_37
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 20,BAYLEEF
	db 20,GROWLITHE
	db 20,FEAROW
	db 20,DUGTRIO
	db 20,PIDGEOTTO
	db 20,STANTLER
	db 20,LEDIAN
	; day
	db 20,
	db 20,QUILAVA
	db 20,SANDSLASH
	db 20,DUGTRIO
	db 20,PIDGEOTTO
	db 20,FEAROW
	db 20,GROWLITHE
	; nite
	db 20,CROCONAW
	db 20,STANTLER
	db 20,HAUNTER
	db 20,SUDOWOODO
	db 20,NOCTOWL
	db 20,GOLBAT
	db 20,ARIADOS

	db GROUP_ROUTE_38, MAP_ROUTE_38
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 23,FEAROW
	db 23,RATICATE
	db 23,MAGNETON
	db 23,PIDGEOTTO
	db 23,TAUROS
	db 23,MILTANK
	db 23,FLAAFFY
	; day
	db 23,FEAROW
	db 23,RATICATE
	db 23,MAGNETON
	db 23,PIDGEOTTO
	db 23,TAUROS
	db 23,MILTANK
	db 23,FLAAFFY
	; nite
	db 23,PERSIAN
	db 23,RATICATE
	db 23,MAGNETON
	db 23,NOCTOWL
	db 23,NIDORINO
	db 23,NIDORINA
	db 23,EEVEE

	db GROUP_ROUTE_39, MAP_ROUTE_39
	db $05,$05,$05 ; encounter rates: morn/day/nite
	; morn
	db 24,FEAROW
	db 24,RATICATE
	db 24,MAGNETON
	db 24,PIDGEOTTO
	db 24,MILTANK
	db 24,TAUROS
	db 24,CHANSEY
	; day
	db 24,FEAROW
	db 24,RATICATE
	db 24,MAGNETON
	db 24,PIDGEOTTO
	db 24,MILTANK
	db 24,TAUROS
	db 24,KANGASKHAN
	; nite
	db 24,PERSIAN
	db 24,RATICATE
	db 24,MAGNEMITE
	db 24,NOCTOWL
	db 24,POLIWHIRL
	db 24,GLOOM
	db 24,SKARMORY

	db GROUP_ROUTE_42, MAP_ROUTE_42
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 13,EKANS
	db 14,SPEAROW
	db 15,RATTATA
	db 16,RATICATE
	db 15,ARBOK
	db 16,FEAROW
	db 16,FEAROW
	; day
	db 13,EKANS
	db 14,SPEAROW
	db 15,RATTATA
	db 16,RATICATE
	db 15,ARBOK
	db 16,FEAROW
	db 16,FEAROW
	; nite
	db 13,RATTATA
	db 14,ZUBAT
	db 15,RATICATE
	db 16,GOLBAT
	db 15,MARILL
	db 16,GOLBAT
	db 16,GOLBAT

	db GROUP_ROUTE_43, MAP_ROUTE_43
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 15,SENTRET
	db 16,PIDGEOTTO
	db 16,FARFETCH_D
	db 15,FURRET
	db 17,RATICATE
	db 17,FURRET
	db 17,FURRET
	; day
	db 15,SENTRET
	db 16,PIDGEOTTO
	db 16,FARFETCH_D
	db 15,FURRET
	db 17,RATICATE
	db 17,FURRET
	db 17,FURRET
	; nite
	db 15,VENONAT
	db 16,NOCTOWL
	db 16,RATICATE
	db 17,VENONAT
	db 17,RATICATE
	db 17,VENOMOTH
	db 17,VENOMOTH

	db GROUP_ROUTE_44, MAP_ROUTE_44
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 23,TANGELA
	db 22,LICKITUNG
	db 22,BELLSPROUT
	db 24,WEEPINBELL
	db 24,LICKITUNG
	db 26,LICKITUNG
	db 26,LICKITUNG
	; day
	db 23,TANGELA
	db 22,LICKITUNG
	db 22,BELLSPROUT
	db 24,WEEPINBELL
	db 24,LICKITUNG
	db 26,LICKITUNG
	db 26,LICKITUNG
	; nite
	db 23,TANGELA
	db 22,POLIWAG
	db 22,BELLSPROUT
	db 24,WEEPINBELL
	db 24,POLIWHIRL
	db 26,POLIWHIRL
	db 26,POLIWHIRL

	db GROUP_ROUTE_45, MAP_ROUTE_45
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 23,GEODUDE
	db 23,GRAVELER
	db 24,GLIGAR
	db 25,DONPHAN
	db 20,PHANPY
	db 27,SKARMORY
	db 27,SKARMORY
	; day
	db 23,GEODUDE
	db 23,GRAVELER
	db 24,GLIGAR
	db 25,DONPHAN
	db 30,DONPHAN
	db 27,SKARMORY
	db 27,SKARMORY
	; nite
	db 23,GEODUDE
	db 23,GRAVELER
	db 24,GLIGAR
	db 25,GRAVELER
	db 27,GRAVELER
	db 27,GRAVELER
	db 27,GRAVELER

	db GROUP_ROUTE_46, MAP_ROUTE_46
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 2,GEODUDE
	db 2,SPEAROW
	db 3,GEODUDE
	db 3,RATTATA
	db 2,PHANPY
	db 2,RATTATA
	db 2,RATTATA
	; day
	db 2,GEODUDE
	db 2,SPEAROW
	db 3,GEODUDE
	db 3,RATTATA
	db 2,RATTATA
	db 2,RATTATA
	db 2,RATTATA
	; nite
	db 2,GEODUDE
	db 2,RATTATA
	db 3,GEODUDE
	db 3,RATTATA
	db 2,RATTATA
	db 2,RATTATA
	db 2,RATTATA

	db GROUP_SILVER_CAVE_OUTSIDE, MAP_SILVER_CAVE_OUTSIDE
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 41,TANGELA
	db 42,PONYTA
	db 42,ARBOK
	db 44,RAPIDASH
	db 41,DODUO
	db 43,DODRIO
	db 43,DODRIO
	; day
	db 41,TANGELA
	db 42,PONYTA
	db 42,ARBOK
	db 44,RAPIDASH
	db 41,DODUO
	db 43,DODRIO
	db 43,DODRIO
	; nite
	db 41,TANGELA
	db 42,POLIWHIRL
	db 42,GOLBAT
	db 44,POLIWHIRL
	db 40,GOLBAT
	db 44,GOLBAT
	db 44,GOLBAT

	db $ff ; end
