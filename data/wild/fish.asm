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

FishGroup1: 
FishGroup1_Old: ; 924e3
	db $b3, MAGIKARP,   10
	db $d9, MAGIKARP,   10
	db $ff, KRABBY,     10
FishGroup1_Good: ; 924ec
	db $59, MAGIKARP,   20
	db $b2, KRABBY,     20
	db $e6, KRABBY,     20
	db $ff, $0,         0
FishGroup1_Super: ; 924f8
	db $66, KRABBY,     40
	db $b2, $0,         1
	db $e6, KRABBY,     40
	db $ff, KINGLER,    40

FishGroup2:
FishGroup2_Old: ; 92504
	db $b3, MAGIKARP,   10
	db $d9, MAGIKARP,   10
	db $ff, TENTACOOL,  10
FishGroup2_Good: ; 9250d
	db $59, MAGIKARP,   20
	db $b2, TENTACOOL,  20
	db $e6, CHINCHOU,   20
	db $ff, $0,         2
FishGroup2_Super: ; 92519
	db $66, CHINCHOU,   40
	db $b2, $0,         3
	db $e6, TENTACRUEL, 40
	db $ff, LANTURN,    40

FishGroup3:
FishGroup3_Old: ; 92525
	db $b3, MAGIKARP,   10
	db $d9, MAGIKARP,   10
	db $ff, GOLDEEN,    10
FishGroup3_Good: ; 9252e
	db $59, MAGIKARP,   20
	db $b2, GOLDEEN,    20
	db $e6, GOLDEEN,    20
	db $ff, $0,         4
FishGroup3_Super: ; 9253a
	db $66, GOLDEEN,    40
	db $b2, $0,         5
	db $e6, MAGIKARP,   40
	db $ff, SEAKING,    40

FishGroup4:
FishGroup4_Old: ; 92546
	db $b3, MAGIKARP,   10
	db $d9, MAGIKARP,   10
	db $ff, POLIWAG,    10
FishGroup4_Good: ; 9254f
	db $59, MAGIKARP,   20
	db $b2, POLIWAG,    20
	db $e6, POLIWAG,    20
	db $ff, $0,         6
FishGroup4_Super: ; 9255b
	db $66, POLIWAG,    40
	db $b2, $0,         7
	db $e6, MAGIKARP,   40
	db $ff, POLIWAG,    40

FishGroup5:
FishGroup5_Old: ; 92567
	db $b3, MAGIKARP,   10
	db $d9, MAGIKARP,   10
	db $ff, MAGIKARP,   10
FishGroup5_Good: ; 92570
	db $59, MAGIKARP,   20
	db $b2, MAGIKARP,   20
	db $e6, MAGIKARP,   20
	db $ff, $0,         8
FishGroup5_Super: ; 9257c
	db $66, MAGIKARP,   40
	db $b2, $0,         9
	db $e6, MAGIKARP,   40
	db $ff, DRAGONAIR,  40

FishGroup6:
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

FishGroup7:
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

FishGroup8:
FishGroup8_Old: ; 925ca
	db $b3, MAGIKARP,   10
	db $d9, MAGIKARP,   10
	db $ff, MAGIKARP,   10
FishGroup8_Good: ; 925d3
	db $59, MAGIKARP,   20
	db $b2, MAGIKARP,   20
	db $e6, MAGIKARP,   20
	db $ff, $0,         14
FishGroup8_Super: ; 925df
	db $66, MAGIKARP,   40
	db $b2, $0,         15
	db $e6, MAGIKARP,   40
	db $ff, MAGIKARP,   40

FishGroup9:
FishGroup9_Old: ; 925eb
	db $b3, MAGIKARP,   10
	db $d9, MAGIKARP,   10
	db $ff, MAGIKARP,   10
FishGroup9_Good: ; 925f4
	db $59, MAGIKARP,   10
	db $b2, MAGIKARP,   10
	db $e6, MAGIKARP,   10
	db $ff, $0,         16
FishGroup9_Super: ; 92600
	db $66, MAGIKARP,   10
	db $b2, $0,         17
	db $e6, MAGIKARP,   10
	db $ff, DRAGONAIR,  10

FishGroup10:
FishGroup10_Old: ; 9260c
	db $b3, MAGIKARP,   10
	db $d9, MAGIKARP,   10
	db $ff, KRABBY,     10
FishGroup10_Good: ; 92615
	db $59, MAGIKARP,   20
	db $b2, KRABBY,     20
	db $e6, KRABBY,     20
	db $ff, $0,         18
FishGroup10_Super: ; 92621
	db $66, KRABBY,     40
	db $b2, $0,         19
	db $e6, KINGLER,    40
	db $ff, SEADRA,     40

FishGroup11:
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

FishGroup12:
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
; 0
	db CORSOLA,    20 ; nite
	db STARYU,     20 ; day
; 1
	db CORSOLA,    40 ; nite
	db STARYU,     40 ; day
; 2
	db SHELLDER,   20 ; nite
	db SHELLDER,   20 ; day
; 3
	db SHELLDER,   40 ; nite
	db SHELLDER,   40 ; day
; 4
	db GOLDEEN,    20 ; nite
	db GOLDEEN,    20 ; day
; 5
	db GOLDEEN,    40 ; nite
	db GOLDEEN,    40 ; day
; 6
	db POLIWAG,    20 ; nite
	db POLIWAG,    20 ; day
; 7
	db POLIWAG,    40 ; nite
	db POLIWAG,    40 ; day
; 8
	db DRATINI,    20 ; nite
	db DRATINI,    20 ; day
; 9
	db DRATINI,    40 ; nite
	db DRATINI,    40 ; day
; 10
	db QWILFISH,   20 ; nite
	db QWILFISH,   20 ; day
; 11
	db QWILFISH,   40 ; nite
	db QWILFISH,   40 ; day
; 12
	db REMORAID,   20 ; nite
	db REMORAID,   20 ; day
; 13
	db REMORAID,   40 ; nite
	db REMORAID,   40 ; day
; 14
	db GYARADOS,   20 ; nite
	db GYARADOS,   20 ; day
; 15
	db GYARADOS,   40 ; nite
	db GYARADOS,   40 ; day
; 16
	db DRATINI,    10 ; nite
	db DRATINI,    10 ; day
; 17
	db DRATINI,    10 ; nite
	db DRATINI,    10 ; day
; 18
	db HORSEA,     20 ; nite
	db HORSEA,     20 ; day
; 19
	db HORSEA,     40 ; nite
	db HORSEA,     40 ; day
; 20
	db TENTACOOL,  20 ; nite
	db TENTACOOL,  20 ; day
; 21
	db TENTACOOL,  40 ; nite
	db TENTACOOL,  40 ; day

; 926c7

