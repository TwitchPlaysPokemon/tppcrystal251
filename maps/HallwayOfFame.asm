HallwayOfFame_MapScriptHeader: ; 0x180e2c
	; trigger count
	db 2

	; triggers
	dw HallwayTrigger0, $0000
	dw HallwayTrigger1, $0000

	; callback count
	db 0
; 0x180e39

HallwayTrigger0: ; 0x180e39
	priorityjump RealChampScript
	end
; 0x180e3d

HallwayTrigger1: ; 0x180e3d
	end
; 0x180e3e


RealChampScript: ; 0x180e74
	applymovement $0, MovementToChamp
	playmusic MUSIC_RIVAL_RB
	checkevent EVENT_OAK_DEFEATED
	iftrue EGKRivalRematch
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male_intro
	writetext AzureBeforeBattleText
	jump .selectbattle
.male_intro
	writetext RustBeforeBattleText
.selectbattle
	waitbutton
	closetext
	checkevent EVENT_GOT_CHARMANDER_FROM_OAK
	iftrue .charmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_OAK
	iftrue .squirtle
	loadtrainer BLUE_RB, BLUE_RB_5C
	jump .startbattle
.squirtle
	loadtrainer BLUE_RB, BLUE_RB_5B
	jump .startbattle
.charmander
	loadtrainer BLUE_RB, BLUE_RB_5A
.startbattle
	winlosstext WinVsChampAzureText, LoseVsChampAzureText
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .got_rival_gender
	loadvar OtherTrainerClass, BLUE_RB_F
	winlosstext WinVsChampRustText, LoseVsChampRustText
.got_rival_gender
	writecode VAR_BATTLETYPE, BATTLETYPE_RIVAL_RB
	startbattle
	returnafterbattle
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male_postfight
	writetext AzurePostFightText
	jump OakAppears
.male_postfight
	writetext RustPostFightText
OakAppears:
	appear $3
	applymovement $3, OakWalksUp
	spriteface $0, $2
	spriteface $2, $2
	loadfont
	checkevent EVENT_OAK_DEFEATED
	iftrue CheckDexForMtSilver
	writetext UnknownText_0x18121b
	waitbutton
	closetext
	applymovement $3, OakWalkBackToPlayer
	writetext OakAfterRivalTalkToPlayer
AfterOakTalk:
	waitbutton
	closetext
	applymovement $2, OakRepositions
	follow $2, $0
	spriteface $3, $1
	applymovement $2, OakWalksUp
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear $2
	applymovement $0, MovementData_0x180f55
	playsound SFX_EXIT_BUILDING
	disappear $0
	special Function8c084
	pause 15
	warpfacing $1, GROUP_HALL_OF_FAME, MAP_HALL_OF_FAME, $4, $d
	end


EGKRivalRematch:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male_intro
	writetext AzureBeforeRematchText
	jump .selectbattle
.male_intro
	writetext RustBeforeRematchText
.selectbattle
	waitbutton
	closetext
	checkevent EVENT_GOT_CHARMANDER_FROM_OAK
	iftrue .charmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_OAK
	iftrue .squirtle
	loadtrainer BLUE_RB, BLUE_RB_6C
	jump .startbattle
.squirtle
	loadtrainer BLUE_RB, BLUE_RB_6B
	jump .startbattle
.charmander
	loadtrainer BLUE_RB, BLUE_RB_6A
.startbattle
	winlosstext WinVsRematchAzureText, LoseVsRematchAzureText
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .got_rival_gender
	loadvar OtherTrainerClass, BLUE_RB_F
	winlosstext WinVsRematchRustText, LoseVsRematchRustText
.got_rival_gender
	writecode VAR_BATTLETYPE, BATTLETYPE_RIVAL_RB
	startbattle
	returnafterbattle
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male_postfight
	writetext AzurePostRematchText
	jump OakAppears
.male_postfight
	writetext RustPostRematchText
	jump OakAppears


CheckDexForMtSilver:
	writetext OakToRivalAfterRemtachText
	waitbutton
	closetext
	applymovement $3, OakWalkBackToPlayer
	loadfont
	checkevent EVENT_ALLOWED_INTO_ROUTE_28
	iftrue AfterOakTalk
	checkevent EVENT_OAK_KNOWS_DEX_FULL
	iftrue OakAllowsRoute28
	writetext OakRematchText
	buttonsound
	writetext OakCheckDexAtHoF
	special ProfOaksPCBoot
	special RateIntoScriptVar
	if_less_than 251, DexNotFull
	writetext OakFullDex
	buttonsound
	writetext OakCongrats
	jump AfterOakTalk

DexNotFull:
	writetext OakDexNotFull
	jump AfterOakTalk

OakAllowsRoute28:
	writetext OakRematchText
	buttonsound
	writetext OakCongrats
	setevent EVENT_ALLOWED_INTO_ROUTE_28
	jump AfterOakTalk
; 0x180f33


OakRematchText:
	text "PROF.OAK: Ah,"
	line "<PLAY_G>!"

	para "Congratulations"
	line "on being able to"
	cont "prove yourself"
	cont "amongst the best"
	cont "#MON TRAINERS"
	cont "in the world."
	done

OakCheckDexAtHoF:
	text "May I ask how your"
	line "#DEX is coming"
	cont "along?"

	done

OakFullDex: 
	text "Wow!"
	line "The #DEX is"
	cont "complete!"

OakCongrats:
	text "You're a true"
	line "#MON master!"

	para "Tell you what,"
	line "<PLAY_G>. I'll make"

	para "arrangements so"
	line "that you can go to"
	cont "MT.SILVER."

	para "It's too dangerous"
	line "for your average"

	para "trainer, so it's"
	line "off limits. But"

	para "we can make an"
	line "exception in your"
	cont "case, <PLAY_G>."

	para "The gate there is"
	line "west of ROUTE 22."

	para "Just remember to"
	line "get a DIPLOMA"
	cont "from CELADON as"
	cont "proof of your"
	cont "accomplishment."

	done

OakDexNotFull:
	text "It seems your"
	line "adventure is not"
	cont "over yet."

	para "Once you fill the"
	line "#DEX come see"
	cont "me in my LAB."

	done 

MovementToChamp:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	turn_head_right
	step_end

OakWalksUp:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

OakWalkBackToPlayer:
	step_left
	step_left
	step_up
	turn_head_right
	step_end

OakRepositions:
	step_up
	step_right
	step_end

MovementData_0x180f55: ; 0x180f55
	step_up
	step_end

AzureBeforeBattleText:
	text "Oh! <PLAY_G>!"
	line "You're OK!"
	
	para "I always believed"
	line "you escaped from"
	cont "the SS ANNE!"
	
	para "I just knew you"
	line "were strong enough"
	cont "to survive!"

	para "Well, I have taken"
	line "good care of my"
	cont "#MON."
	
	para "And now, here I am."
	
	para "I have risen up"
	line "over those who"
	cont "called themselves"
	cont "the ELITE FOUR."
	
	para "I'm the new"
	line "CHAMPION!"

	para "<PLAY_G>!"
	line "I knew it would"
	cont "come to this"
	cont "one day."
	
	para "Do you know what"
	line "this means,"
	cont "<PLAY_G>?"

	para "It means we can"
	line "have that fated"
	cont "battle we were"
	cont "always meant"
	cont "to have!"
	
	para "<PLAY_G>!"
	line "I challenge you"
	cont "as the #MON"
	cont "CHAMPION!
	done

RustBeforeBattleText:
	text "Hey! I was lookin'"
	line "forward to seein"
	cont "you, <PLAY_G>!"
	
	para "I always thought"
	line "you made it off"
	cont "the SS ANNE!"
	
	para "No rival of mine"
	line "would be so weak"
	cont "as to lose to TEAM"
	cont "ROCKET after all!"

	para "Well now that"
	line "you're here<...>"
	
	para "I just wanted to"
	line "let you know"
	cont "something."

	para "While working on"
	line "my #DEX, I "
	cont "looked all over"
	cont "for powerful"
	cont "#MON!"
	
	para "Not only that, I"
	line "assembled teams"
	cont "that would beat"
	cont "any #MON type!"
	
	para "Well guess what?!"
	line "I am now the"
	cont "#MON LEAGUE"
	cont "CHAMPION!"
	
	para "<PLAY_G>!"
	line "Do you know"
	cont "what that means"
	cont "for you?" 
	
	para "Well!"
	line "I'll tell you!"
	
	para "I am the most"
	line "powerful trainer"
	cont "in the world!"
	done

WinVsAzureText:
	text "D'aww<...> I'm not"
	line "as good as you."
	done
LoseVsAzureText
	text "I like your effort… but it wasn't good enough. I hope you try harder next time!"
	done

LoseVsRustText:
	text "Haha!"
	line "I knew I was good"
	cont "enough for champ!"
	done

WinVsRustText:
	text "Aw, man<...> this sucks."
	line "Why did I gotta"
	cont "lose to a chump"
	cont "like you?"
	done

AzurePostFightText:
	text "I guess I must"
	line "concede:"
	
	para "You are a better"
	line "trainer than I am."

	para "OAK: "<GREEN>!"
	done

RustPostFightText:
	text "Darn it!"
	line "I guess you're"
	cont "the new champ,"
	cont "though I don't"
	cont "like to admit it."

	para "OAK: "<GREEN>!"
	done

AzureBeforeRematchText:
RustBeforeRematchText:
	text ""
	done

WinVsRematchAzureText:
LoseVsRematchAzureText:
WinVsRematchRustText: 
LoseVsRematchRustText:
	text "as the simiarly name above, but for the rematch"
	done

AzurePostRematchText:
RustPostRematchText:
	text ""
	done

OakToRivalAfterRemtachText:
	text ""
	done

; 0x1811dd


UnknownText_0x18121b: ; 0x18121b
	text "PROF.OAK: I've"
	line "heard what"
	cont "happened!"
	
	para "I'm dissapointed!"
	
	para "I came when I"
	line "heard you beat"
	cont "the Elite Four!"
	
	para "But, when I got"
	line "here, you had"
	cont "already lost!"
	done

OakAfterRivalTalkToPlayer:
	
	text "<PLAY_G>!"
	line "You understand"
	cont "that your victory"
	cont "was not just your"
	cont "own doing!"
	
	para "The bond you"
	line "share with your"
	cont "#MON is"
	cont "marvelous!"
	
	para "<PLAY_G>!"
	line "Come with me!"
	done
; 0x18134b


; 0x18137b


HallwayOfFame_MapEventHeader: ; 0x1813f4
	; filler
	db 0, 0

	; warps
	db 4
	warp_def 19, $5, 3, GROUP_LANCES_ROOM, MAP_LANCES_ROOM
	warp_def 19, $6, 4, GROUP_LANCES_ROOM, MAP_LANCES_ROOM
	warp_def $2, $5, 1, GROUP_HALL_OF_FAME, MAP_HALL_OF_FAME
	warp_def $2, $6, 2, GROUP_HALL_OF_FAME, MAP_HALL_OF_FAME

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_EGK_RIVAL, 9, 6, $7, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, -1
	person_event SPRITE_OAK, 15, 6, $7, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_MARY_AND_OAK_IN_LANCES_ROOM
; 0x181445

