BlackthornGymRematch2F_MapScriptHeader:
	; triggers
	db 0

	; callback count 
	db 1
	dbw 3, BlackthornRematch2FBoulder_CheckIfOverWarp

BoulderScriptRematch2F: ; 0x19575e
	jumpstd strengthboulder

BlackthornRematch2FBoulder_CheckIfOverWarp: 
	writecmdqueue CmdQueue_BlackthornRematch2FBoulder
	return
	
CmdQueue_BlackthornRematch2FBoulder: 
	dbw 2, BlackthornRematch2F_BoulderTable ; check if any stones are sitting on a warp
	db 0, 0 ; filler
	
BlackthornRematch2F_BoulderTable: 
	db 7, 3 ; warp, person
	dw BlackthornRematch_Boulder1_Pushed	
	db $ff
	

BlackthornRematch_Boulder1_Pushed: ; 0x19573d
	disappear 3
	jump BlackthornRematch_PushedBoulder
	end
	
BlackthornRematch_PushedBoulder:
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	loadfont
	writetext BlackthornRematch_PushBoulderText
	waitbutton
	closetext
	end

; <text goes here>
BlackthornRematch_PushBoulderText: ; 0x1958a5
	text "The boulder fell"
	line "through!"
	done

BlackthornGymRematch2F_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 10
	warp_def $15, $d, 3, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F
	warp_def $d, $5, 4, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F
	warp_def $9, $9, 5, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F
	warp_def $9, $3, 6, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F
	warp_def $3, $d, 7, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F
	warp_def $9, $f, 8, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F
	
	warp_def $d, $c, 9, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F
	warp_def $11, $6, 10, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F
	warp_def $d, $2, 11, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F
	warp_def $3, $8, 12, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F

	; coord events
	db 0

	; bg events
	db 0

	; object events
	db 5
	person_event SPRITE_BOULDER, 25, 5, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScriptRematch2F, EVENT_BLACKTHORN_REMATCH_BOULDER_1
	person_event SPRITE_BOULDER, 23, 18, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScriptRematch2F, EVENT_BLACKTHORN_REMATCH_BOULDER_2
	person_event SPRITE_BOULDER, 8, 4, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScriptRematch2F, EVENT_BLACKTHORN_REMATCH_BOULDER_3
	person_event SPRITE_BOULDER, 8, 5, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScriptRematch2F, EVENT_BLACKTHORN_REMATCH_BOULDER_4
	person_event SPRITE_BOULDER, 22, 5, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScriptRematch2F, EVENT_BLACKTHORN_REMATCH_BOULDER_5

