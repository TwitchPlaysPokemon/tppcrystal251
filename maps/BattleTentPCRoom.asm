BattleTentPCRoom_MapScriptHeader:
	db 0
	
	db 0
	
LeaguePCScript:
	loadfont
	playsound SFX_BOOT_PC
	writetext tppPcIntroText
	loadmenudata tppPc_Options_Header
	interpretmenu2
	writebackup
	if_equal $1, tppPcUltimateTeamBattle
	if_equal $2, tppPcMirrorBattle
tppPcEndBattle:
	writetext tppPcLogOffText
	playsound SFX_SHUT_DOWN_PC
	pause 15
	closetext
	end
	
tppPcUltimateTeamBattle:
	writetext tppPcHealText
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	writetext tppPcBeginUltimateBattleText
	waitbutton
	closetext
	loadtrainer TPPPC, ULTIMATE
	jump tppPcStartBattle
	
tppPcMirrorBattle:
	writetext tppPcHealText
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	writetext tppPcBeginMirrorBattleText
	waitbutton
	closetext
	loadtrainer TPPPC, MIRROR
tppPcStartBattle:
	winlosstext tppPcWonText, tppPcLostText
	startbattle
	returnafterbattle
	loadfont
	jump tppPcEndBattle
	
tppPc_Options_Header: ; 0x56478
	db $40 ; flags
	db 02, 02 ; start coords
	db 9, 17 ; end coords
	dw tppPc_Options
	db 1 ; default option
; 0x56480

tppPc_Options: ; 0x56480
	db $80 ; flags
	db 3 ; items
	db "ULTIMATE TEAM@"
	db "YOUR OWN TEAM@"
	db "CANCEL@"
	
tppPcIntroText:
	text "<PLAY_G> turned"
	line "on the PC!"

	para "#MON LEAGUE"
	line "BATTLE SIMULATOR"

	para "In this software,"
	line "you can fight a"

	para "team of the most"
	line "powerful #MON"
	cont "known to man."

	para "Or, you can battle"
	line "a copy of your own"
	cont "party of #MON."

	para "Please make your"
	line "selection."
	done
	
tppPcHealText:
	text "Before we begin,"
	line "we will restore"

	para "your #MON to"
	line "full health."
	done

tppPcWonText:
	text "Results: The"
	line "challenger won."
	done

tppPcLostText:
	text "Results: The"
	line "challenger lost."
	done

tppPcBeginUltimateBattleText:
	text "Now loading the"
	line "Ultimate Team."
	done

tppPcBeginMirrorBattleText:
	text "Now copying your"
	line "team to memory."
	done

tppPcLogOffText:
	text "Terminating"
	line "execution."

	para "Good bye!"
	done
	
BattleTentPCRoom_MapEventHeader:
	db 0, 0
	
	db 2
	warp_def 7, 3, 3, GROUP_BATTLE_TENT_BATTLE_ROOM, MAP_BATTLE_TENT_BATTLE_ROOM
	warp_def 7, 4, 3, GROUP_BATTLE_TENT_BATTLE_ROOM, MAP_BATTLE_TENT_BATTLE_ROOM
	
	db 0
	
	db 1
	signpost 2, 3, 1, LeaguePCScript
	
	db 0