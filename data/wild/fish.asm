FishAction: ; 92402
; Using a fishing rod.
; Fish for monsters with rod e in encounter group d.
; Return monster e at level d.

	push af
	push bc
	push hl
	
; Get the fishing group for this map.
	ld b, e ;rod into b
	call GetFishGroupHeader ;e = d-1, d = 0, a = d. if d = 11 or 12 then if swarm flag is on then special case
	
	ld hl, FishGroupHeaders
	; go down to correct table. encounter chance no longer needed
	;add hl, de
	; pointer to old rod data
	add hl, de
	add hl, de
	; pointer to good rod data
	add hl, de
	add hl, de
	; pointer to super rod data
	add hl, de
	add hl, de
	
	call Fish ;load mon into d and level into e. 0 in both if fail to fish
	
	pop hl
	pop bc
	pop af
	ret
; 9241a


Fish: ; 9241a
; Grandfathered from Red.

; Fish for monsters with rod b from encounter data in FishGroup at hl.
; Return monster e at level d.

	call Random

; Got a bite?
	cp 230 ;230/256 of bite
	jr nc, .NoBite

; Get encounter data by rod:
; 	0: Old
; 	1: Good
; 	2: Super
	;inc hl ;removed as it now starts on old rod slot
	ld e, b ;rod into e
	ld d, 0
	add hl, de ;onto correct rod
	add hl, de
	ld a, [hli] ;load table location into hl
	ld h, [hl]
	ld l, a
	
; Encounter chance for this monster:
	call Random
	
.CheckEncounter
	cp [hl] ;if equal or less then % to encounter, jump ahead, otherwise go to next mon
	jr z, .ReadMon
	jr c, .ReadMon
	
; Next monster...
	inc hl
	inc hl
	inc hl
	jr .CheckEncounter
	
.ReadMon
; We're done with the encounter chance
	inc hl ;onto mon
	
; Species 0 triggers a read from a time-based encounter table.
	ld a, [hli]
	ld d, a
	and a
	call z, .TimeEncounter

; Level
	ld a, [hl]
	ld b, a
	callab AddVariance ;add level variance
	ld e, b
	ret
	
.NoBite
	ld de, 0
	ret
	
.TimeEncounter

; The level byte is repurposed as the index for the new table.
	ld e, [hl]
	ld d, 0
	ld hl, TimeFishGroups
	add hl, de
	add hl, de
	add hl, de
	add hl, de

; One nightmon, then one daymon
	ld a, [TimeOfDay]
	and 3
	cp NITE
	jr c, .TimeSpecies
	inc hl
	inc hl
	
.TimeSpecies
	ld d, [hl]
	inc hl
	ret
; 9245b




GetFishGroupHeader: ; 9245b
; Return fishing encounter group header d in de.

	push hl
	ld hl, DailyFlags
	bit 2, [hl] ; check bit 2 of dialybits skip check for groups 11 and 12 unless flag is on(possibly related to quilfish swarm?)
	pop hl
	jr z, .end
	
; Groups 11 and 12 have special attributes.
	ld a, d
	cp 11
	jr z, .group11
	cp 12
	jr z, .group12
	
.end
	dec d
	ld e, d
	ld d, 0
	ret
	
.group11
	ld a, [wdfce] ;if ? is 1 then use table 6 instead (something to do with quilfish swarm)
	cp 1
	jr nz, .end
	ld d, 6
	jr .end
	
.group12
	ld a, [wdfce] ; if ? is 2 then use table 7 instead
	cp 2
	jr nz, .end
	ld d, 7
	jr .end
; 92488


FishGroupHeaders: ;fish sucsess chance removed, made constant

FishGroup1Header: ; 92488
	;db $80 ; 50%
	dw FishGroup1_Old
	dw FishGroup1_Good
	dw FishGroup1_Super

FishGroup2Header: ; 9248f
	;db $80 ; 50%
	dw FishGroup2_Old
	dw FishGroup2_Good
	dw FishGroup2_Super

FishGroup3Header: ; 92496
	;db $80 ; 50%
	dw FishGroup3_Old
	dw FishGroup3_Good
	dw FishGroup3_Super

FishGroup4Header: ; 9249d
	;db $80 ; 50%
	dw FishGroup4_Old
	dw FishGroup4_Good
	dw FishGroup4_Super

FishGroup5Header: ; 924a4
	;db $80 ; 50%
	dw FishGroup5_Old
	dw FishGroup5_Good
	dw FishGroup5_Super

FishGroup6Header: ; 924ab
	;db $80 ; 50%
	dw FishGroup6_Old
	dw FishGroup6_Good
	dw FishGroup6_Super

FishGroup7Header: ; 924b2
	;db $80 ; 50%
	dw FishGroup7_Old
	dw FishGroup7_Good
	dw FishGroup7_Super

FishGroup8Header: ; 924b9
	;db $80 ; 50%
	dw FishGroup8_Old
	dw FishGroup8_Good
	dw FishGroup8_Super

FishGroup9Header: ; 924c0
	;db $80 ; 50%
	dw FishGroup9_Old
	dw FishGroup9_Good
	dw FishGroup9_Super

FishGroup10Header: ; 924c7
	;db $80 ; 50%
	dw FishGroup10_Old
	dw FishGroup10_Good
	dw FishGroup10_Super

FishGroup11Header: ; 924ce
	;db $80 ; 50%
	dw FishGroup11_Old
	dw FishGroup11_Good
	dw FishGroup11_Super

FishGroup12Header: ; 924d5
	;db $80 ; 50%
	dw FishGroup12_Old
	dw FishGroup12_Good
	dw FishGroup12_Super

FishGroup13Header: ; 924dc
	;db $80 ; 50%
	dw FishGroup11_Old
	dw FishGroup11_Good
	dw FishGroup11_Super

;to set fishing mons, first you have to make/edit a group, then assign that group to an area in maps/map_headers.asm (last number). group 0 is used to represent no fishing mons
;each group is split into rods, but each table can be any legnth
;first number is chance out of 255, currently in hex (noted by the $) but a decimal number can be entered too. This number is not individual chance, but culumulative chance of getting that far
; if the first slot is 10, and the second slot 20, you put 30 in slot 2's chance. The last chance in the table must be 255 (or $ff)
; next is the mon, and last is level
;entering 0 as a mon causes the game to check the time of day slot in level for the mon instead, more about that below (ctrl-f TimeFishGroups)
;If you add a table here, you have to add an appropriote header table above, make sure the names match
;groups 6,7 11 and 12 are special. 11 becomes 6 if a quilfish swarm is on, and 12 becomes 7 if a remoraid(dummied out?) swarm is on. I don't 100% know about these, especially the second one, but keep it in mind and reserve 11 and 12 for areas with swarms
;any number of groups can be added


FishGroup1: ;Johto Freshwater
FishGroup1_Old: ; 924e3
	db 125, REMORAID,	10
	db 138, TOTODILE,	10
	db 150, POLIWAG,	10
	db 163, MARILL,		10
	db 188, $0,			1
	db 213, $0,			2
	db $ff, $0,			0
FishGroup1_Good: ; 924ec
	db 75, REMORAID,	25
	db 120, OCTILLERY,	30
	db 113, AZUMARILL,	30
	db 125, CROCONAW,	30
	db 138, WOOPER,		25
	db 150, MARILL,		25
	db 188, $0,			4
	db 201, $0,			3
	db 213, $0,			6
	db 226, $0,			7
	db $ff, $0,         5
FishGroup1_Super: ; 924f8
	db 63, OCTILLERY,	75
	db 75, TOTODILE,	50
	db 88, CROCONAW,	65
	db 100, WOOPER,		50
	db 125, QUAGSIRE,	75
	db 138, AZUMARILL,	75
	db 150, POLIWHIRL,	65
	db 163, POLITOED,	75
	db 175, $0,			8
	db 200, $0,			9
	db 238, $0,			10
	db $ff, $0,			11
	
FishGroup2: ; Johto Seawater
FishGroup2_Old: ; 92504
	db 125, REMORAID,	10
	db 160, HORSEA,		10
	db 180, CORSOLA,	10
	db 214, CHINCHOU,	10
	db $ff, $0,			12
FishGroup2_Good: ; 9250d
	db 63, REMORAID,	25
	db 125, OCTILLERY,	30
	db 163, CORSOLA,	30
	db 176, HORSEA,		25
	db 189, SEADRA,		30
	db 202, CHINCHOU,	25
	db 214, LANTURN,	30
	db 226, $0,			13
	db $ff, $0,         14
FishGroup2_Super: ; 92519
	db 35, OCTILLERY,	75
	db 55, CORSOLA,		75
	db 65, LANTURN,		75
	db 75, SEADRA,		65
	db 80, QWILFISH,	75
	db $ff, $0,		    15

FishGroup3: ; Lake of Rage
FishGroup3_Old: ; 92525
	db $ff, MAGIKARP,   10
FishGroup3_Good: ; 9252e
	db 150, MAGIKARP,	25
	db 201, GYARADOS,	35
	db 227, STARMIE,	30
	db 240, SEAKING,	30
	db $ff, $0,         16
FishGroup3_Super: ; 9253a
	db 25, MAGIKARP,	70
	db 70, GYARADOS,	80
	db 85, STARMIE,		75
	db 95, SEAKING,		75
	db $ff, $0,  		17

FishGroup4: ; Dragon's Den
FishGroup4_Old: ; 92546
	db 200, MAGIKARP,	10
	db 214, $0,			18
	db 240, $0,			19
	db $ff, $0,			20
FishGroup4_Good: ; 9254f
	db 76, MAGIKARP,	25
	db 127, DRATINI,	25
	db 152, DRAGONAIR,	30
	db 183, SEADRA,		25
	db 215, $0,			21
	db 241, $0,			22
	db $ff, $0,         23
FishGroup4_Super: ; 9255b
	db 26, MAGIKARP,	70
	db 102, GYARADOS,	80
	db 128, DRATINI,	70
	db 179, DRAGONAIR,	75
	db 193, SEADRA,		75
	db 242, $0,			24
	db $ff, $0,			25

FishGroup5: ; Blackthorne City
FishGroup5_Old: ; 92567
	db 88, MAGIKARP,	10
	db 126, SEEL,		10
	db 164, SHELLDER,	10
	db 190, DRATINI,	10
	db 228, HORSEA,		10
	db 242, $0,			26
	db $ff, $0,			27
FishGroup5_Good: ; 92570
	db 26, HORSEA,		25
	db 52, SEADRA,		30
	db 90, SEEL,		25
	db 128, SHELLDER,	25
	db 166, DRATINI,	25
	db 204, DRAGONAIR,	30
	db 229, $0,			28
	db $ff, $0,         29
FishGroup5_Super: ; 9257c
	db 51, GYARADOS,	80
	db 76, SEADRA,		75
	db 102, DRAGONAIR,	75
	db 140, DEWGONG,	80
	db 178, CLOYSTER,	80
	db 215, $0,			30
	db $ff, $0,			31

FishGroup6: ; Qwilfish swarm
FishGroup6_Old: ; 92588
	db $b3, MAGIKARP,   5
	db $d9, MAGIKARP,   5
	db $ff, QWILFISH,   5
FishGroup6_Good: ; 92591
	db $59, MAGIKARP,   20
	db $b2, QWILFISH,   20
	db $e6, QWILFISH,   20
	db $ff, $0,         10
FishGroup6_Super: ; 9259d
	db $66, QWILFISH,   40
	db $b2, $0,         11
	db $e6, QWILFISH,   40
	db $ff, QWILFISH,   40

FishGroup7: ; Remoraid swarm
FishGroup7_Old: ; 925a9
	db $b3, MAGIKARP,   10
	db $d9, MAGIKARP,   10
	db $ff, REMORAID,   10
FishGroup7_Good: ; 925b2
	db $59, MAGIKARP,   20
	db $b2, REMORAID,   20
	db $e6, REMORAID,   20
	db $ff, $0,         12
FishGroup7_Super: ; 925be
	db $66, REMORAID,   40
	db $b2, $0,         13
	db $e6, REMORAID,   40
	db $ff, REMORAID,   40

FishGroup8: ; Dark Cave
FishGroup8_Old: ; 925ca
	db 126, MAGIKARP,	10
	db 152, WOOPER,		10
	db 178, CORSOLA,	10
	db 191, SEEL,		10
	db 204, SHELLDER,	10
	db 230, $0,			32
	db $ff, $0,			33
FishGroup8_Good: ; 925d3
	db 76, MAGIKARP,	25
	db 113, CORSOLA,	30
	db 139, QUAGSIRE,	30
	db 166, SEEL,		25
	db 191, SHELLDER,	25
	db 216, $0,			34
	db $ff, $0,         35
FishGroup8_Super: ; 925df
	db 76, GYARADOS,	80
	db 128, CORSOLA,	75
	db 153, DEWGONG,	80
	db 179, CLOYSTER,	80
	db 216, $0,			36
	db $ff, $0,			37

FishGroup9: ; Mt Mortar
FishGroup9_Old: ; 925eb
	db 126, REMORAID,	10
	db 164, MARILL,		10
	db 203, GOLDEEN,	10
	db 228, POLIWAG,	10
	db 242, $0,			38
	db $ff, $0,			39
FishGroup9_Good: ; 925f4
	db 76, REMORAID,	25
	db 101, AZUMARILL,	30
	db 114, GOLDEEN,	25
	db 140, SEAKING,	30
	db 166, POLIWHIRL,	30
	db 202, OCTILLERY,	30
	db 215, $0,			40
	db 228, $0,			41
	db $ff, $0,         42
FishGroup9_Super: ; 92600
	db 76, OCTILLERY,	75
	db 139, $0,			43
	db 190, $0,			44
	db 215, $0,			45
	db 241, $0,			46
	db $ff, $0,			47

FishGroup10: ; Mt Silver
FishGroup10_Old: ; 9260c
	db 51, TOTODILE,	100
	db 102, DRATINI,	100
	db 153, GOLDEEN,	100
	db 204, MAGIKARP,	100
	db $ff, REMORAID,	100
FishGroup10_Good: ; 92615
	db 51, CROCONAW,	100
	db 102, DRAGONAIR,	100
	db 153, SEAKING,	100
	db 204, STARYU,		100
	db $ff, OCTILLERY,	100
FishGroup10_Super: ; 92621
	db 51, FERALIGATR,	100
	db 102, CORSOLA,	100
	db 140, STARMIE,	100
	db 179, VAPOREON,	100
	db 218, GYARADOS,	100 
	db $ff, LAPRAS,     100

FishGroup11: ; swarm route
FishGroup11_Old: ; 9262d
	db $b3, MAGIKARP,   10
	db $d9, MAGIKARP,   10
	db $ff, TENTACOOL,  10
FishGroup11_Good: ; 92636
	db $59, MAGIKARP,   20
	db $b2, TENTACOOL,  20
	db $e6, TENTACOOL,  20
	db $ff, $0,         20
FishGroup11_Super: ; 92642
	db $66, TENTACOOL,  40
	db $b2, $0,         21
	db $e6, MAGIKARP,   40
	db $ff, QWILFISH,   40

FishGroup12: ; swarm route
FishGroup12_Old: ; 9264e
	db $b3, MAGIKARP,   10
	db $d9, MAGIKARP,   10
	db $ff, POLIWAG,    10
FishGroup12_Good: ; 92657
	db $59, MAGIKARP,   20
	db $b2, POLIWAG,    20
	db $e6, POLIWAG,    20
	db $ff, $0,         6
FishGroup12_Super: ; 92663
	db $66, POLIWAG,    40
	db $b2, $0,         7
	db $e6, MAGIKARP,   40
	db $ff, REMORAID,   40

; 9266f

;if 0 is the mon in fish groups, then check these tables to get what mon to fish up based on ToD. day covers mourning too.
;the level bit in the above table determines which if these tables to use
;you can add any number of tables here
TimeFishGroups: ; 9266f
; 0 - Johto Freshwater Old Rod
	db WOOPER,     10 ; nite
	db MARILL,     10 ; day
; 1 - Johto Freshwater Old Rod
	db POLIWAG,    10 ; nite
	db WOOPER,     10 ; day
; 2 - Johto Freshwater Old Rod
	db WOOPER,     10 ; nite
	db TOTODILE,   10 ; day
; 3 - Johto Freshwater Good Rod 5%
	db TOTODILE,   25 ; nite
	db POLIWHIRL,  30 ; day
; 4 - Johto Freshwater Good Rod 15%
	db POLIWHIRL,  30 ; nite
	db AZUMARILL,  30 ; day
; 5 - Johto Freshwater Good Rod 10%
	db WOOPER,     25 ; nite
	db MARILL,     25 ; day
; 6 - Johto Freshwater Good Rod 5%
	db WOOPER,     25 ; nite
	db TOTODILE,   25 ; day
; 7 - Johto Freshwater Good Rod 5%
	db WOOPER,     25 ; nite
	db CROCONAW,   25 ; day
; 8 - Johto Freshwater Super Rod 5% 
	db POLIWHIRL,   65 ; nite
	db TOTODILE,   50 ; day
; 9 - Johto Freshwater Super Rod 10%
	db WOOPER,     50 ; nite
	db CROCONAW,   65 ; day
; 10 - Johto Freshwater Super Rod 15%
	db QUAGSIRE,   75 ; nite
	db AZUMARILL,  75 ; day
; 11 - Johto Freshwater Super Rod 5%
	db POLITOED,   75 ; nite
	db AZUMARILL,  75 ; day
; 12 - Johto Seawwater Old Rod 15%
	db CHINCHOU,   10 ; nite
	db QWILFISH,   10 ; day
; 13 - Johto Seawwater Good Rod 5%
	db CHINCHOU,   25 ; nite
	db QWILFISH,   30 ; day
; 14 - Johto Seawwater Good Rod 10%
	db LANTURN,    30 ; nite
	db QWILFISH,   30 ; day
; 15 - Johto Seawwater Super Rod 20%
	db LANTURN,    75 ; nite
	db QWILFISH,   75 ; day
; 16 - Lake of Rage Good Rod 5%
	db SEAKING,    30 ; nite
	db GYARADOS,   35 ; day
; 17 - Lake of Rage Super Rod 5%
	db SEAKING,    75 ; nite
	db GYARADOS,   80 ; day
; 18 - Dragon's Den Old Rod 25%
	db HORSEA,     10 ; nite
	db DRATINI,    10 ; day
; 19 - Dragon's Den Old Rod 10%
	db DRATINI,    10 ; nite
	db DRAGONAIR,  15 ; day
; 20 - Dragon's Den Old Rod 5%
	db DRAGONAIR,  15 ; nite
	db HORSEA,     10 ; day
; 21
	db SEADRA,     30 ; nite
	db DRATINI,    25 ; day
; 22
	db HORSEA,     25 ; nite
	db DRATINI,    25 ; day
; 23
	db HORSEA,     25 ; nite
	db DRAGONAIR,  30 ; day
; 24
	db SEADRA,     75 ; nite
	db DRAGONAIR,  75 ; day
; 25
	db GYARADOS,   80 ; nite
	db DRATINI,    70 ; day
; 26
	db SEEL,       10 ; nite
	db DRATINI,    10 ; day
; 27
	db SHELLDER,   10 ; nite
	db DRATINI,    10 ; day
; 28
	db SEEL,       25 ; nite
	db DRATINI,    25 ; day
; 29
	db SHELLDER,   25 ; nite
	db DRAGONAIR,  30 ; day
; 30
	db DEWGONG,    80 ; nite
	db DRAGONAIR,  75 ; day
; 31
	db CLOYSTER,   80 ; nite
	db DRAGONAIR,  75 ; day
; 32
	db WOOPER,     10 ; nite
	db SEEL,       10 ; day
; 33
	db WOOPER,     10 ; nite
	db SHELLDER,   10 ; day
; 34
	db WOOPER,     25 ; nite
	db SEEL,       25 ; day
; 35
	db QUAGSIRE,   30 ; nite
	db SHELLDER,   25 ; day
; 36
	db QUAGSIRE,   75 ; nite
	db DEWGONG,    80 ; day
; 37
	db QUAGSIRE,   75 ; nite
	db CLOYSTER,   80 ; day
; 38
	db POLIWAG,    10 ; nite
	db MARILL,     10 ; day
; 39
	db POLIWAG,    10 ; nite
	db GOLDEEN,    10 ; day
; 40
	db POLIWHIRL,  30 ; nite
	db SEAKING,    30 ; day
; 41
	db POLIWHIRL,  30 ; nite
	db GOLDEEN,    25 ; day
; 42
	db POLIWHIRL,  30 ; nite
	db AZUMARILL,  30 ; day
; 43
	db POLIWHIRL,  75 ; nite
	db AZUMARILL,  75 ; day
; 44
	db POLIWRATH,  80 ; nite
	db SEAKING,    75 ; nite
; 45
	db AZUMARILL,  75 ; nite
	db POLITOED,   80 ; day
; 46
	db SEAKING,    75 ; nite
	db POLIWRATH,  80 ; day
; 47
	db POLITOED,    80 ; nite
	db POLIWHIRL,   75 ; day
	

	
; 926c7

