; growth rate
MEDIUM_FAST EQU 0
MEDIUM_SLOW EQU 3
SLOW        EQU 4
FAST        EQU 5

; egg group constants

MONSTER       EQU $01
AMPHIBIAN     EQU $02
INSECT        EQU $03
AVIAN         EQU $04
FIELD         EQU $05
FAIRY         EQU $06
PLANT         EQU $07
HUMANSHAPE    EQU $08
INVERTEBRATE  EQU $09
INANIMATE     EQU $0A
AMORPHOUS     EQU $0B
FISH          EQU $0C
LADIES_MAN    EQU $0D
REPTILE       EQU $0E
NO_EGGS       EQU $0F


; menu sprites
ICON_POLIWAG       EQU $01
ICON_JIGGLYPUFF    EQU $02
ICON_DIGLETT       EQU $03
ICON_PIKACHU       EQU $04
ICON_STARYU        EQU $05
ICON_FISH          EQU $06
ICON_BIRD          EQU $07
ICON_MONSTER       EQU $08
ICON_CLEFAIRY      EQU $09
ICON_ODDISH        EQU $0a
ICON_BUG           EQU $0b
ICON_GHOST         EQU $0c
ICON_LAPRAS        EQU $0d
ICON_HUMANSHAPE    EQU $0e
ICON_FOX           EQU $0f
ICON_EQUINE        EQU $10
ICON_SHELL         EQU $11
ICON_BLOB          EQU $12
ICON_SERPENT       EQU $13
ICON_VOLTORB       EQU $14
ICON_SQUIRTLE      EQU $15
ICON_BULBASAUR     EQU $16
ICON_CHARMANDER    EQU $17
ICON_CATERPILLAR   EQU $18
ICON_UNOWN         EQU $19
ICON_GEODUDE       EQU $1a
ICON_FIGHTER       EQU $1b
ICON_EGG           EQU $1c
ICON_JELLYFISH     EQU $1d
ICON_MOTH          EQU $1e
ICON_BAT           EQU $1f
ICON_SNORLAX       EQU $20
ICON_HO_OH         EQU $21
ICON_LUGIA         EQU $22
ICON_GYARADOS      EQU $23
ICON_SLOWPOKE      EQU $24
ICON_SUDOWOODO     EQU $25
ICON_BIGMON        EQU $26
ICON_EEVEE         EQU $27
ICON_VAPOREON      EQU $28
ICON_JOLTEON       EQU $29
ICON_FLAREON       EQU $2a
ICON_ESPEON        EQU $2b
ICON_UMBREON       EQU $2c
ICON_IVYSAUR       EQU $2d
ICON_VENUSAUR      EQU $2e
ICON_CHARMELEON    EQU $2f
ICON_CHARIZARD     EQU $30
ICON_WARTORTLE     EQU $31
ICON_BLASTOISE     EQU $32
ICON_GASTLY        EQU $33
ICON_HAUNTER       EQU $34
ICON_MEW           EQU $35
ICON_MEWTWO        EQU $36
ICON_SLOWBRO       EQU $37
ICON_SLOWKING      EQU $38
ICON_RAICHU        EQU $39
ICON_OMANYTE       EQU $3a
ICON_OMASTAR       EQU $3b
ICON_KABUTO        EQU $3c
ICON_KABUTOPS      EQU $3d
ICON_AERODACTYL    EQU $3e
ICON_RAIKOU        EQU $3f
ICON_ENTEI         EQU $40
ICON_SUICUNE       EQU $41
ICON_CELEBI        EQU $42
ICON_ARTICUNO      EQU $43
ICON_ZAPDOS        EQU $44
ICON_MOLTRES       EQU $45
ICON_MAGIKARP      EQU $46
ICON_CHIKORITA     EQU $47
ICON_BAYLEEF       EQU $48
ICON_MEGANIUM      EQU $49
ICON_CYNDAQUIL     EQU $4a
ICON_QUILAVA       EQU $4b
ICON_TYPHLOSION    EQU $4c
ICON_TOTODILE      EQU $4d
ICON_CROCONAW      EQU $4e
ICON_FERALIGATR    EQU $4f
ICON_PARAS         EQU $50
ICON_PARASECT      EQU $51
ICON_MARILL        EQU $52
ICON_AZUMARILL     EQU $53
ICON_LEDIAN        EQU $54
ICON_PORYGON       EQU $55
ICON_DRAGONITE     EQU $56
ICON_SKARMORY      EQU $57

; evolution types
EVOLVE_LEVEL     EQU 1
EVOLVE_ITEM      EQU 2
EVOLVE_TRADE     EQU 3
EVOLVE_HAPPINESS EQU 4
EVOLVE_STAT      EQU 5
EVOLVE_LEVEL_ITEM EQU 6


BASE_HAPPINESS        EQU 70
FRIEND_BALL_HAPPINESS EQU 200

; happiness evolution triggers
HAPPINESS_TO_EVOLVE EQU 220
TR_ANYTIME EQU 1
TR_MORNDAY EQU 2
TR_NITE    EQU 3


; stat evolution triggers
ATK_GT_DEF EQU 1
ATK_LT_DEF EQU 2
ATK_EQ_DEF EQU 3