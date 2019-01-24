; pokemon ids
; indexes for:
; - PokemonNames (see data/pokemon/names.asm)
; - BaseData (see data/pokemon/base_stats.asm)
; - EvosAttacksPointers (see data/pokemon/evos_attacks_pointers.asm)
; - EggMovePointers (see data/pokemon/egg_move_pointers.asm)
; - PokemonCries (see data/pokemon/cries.asm)
; - MonMenuIcons (see data/pokemon/menu_icons.asm)
; - PokemonPicPointers (see data/pokemon/pic_pointers.asm)
; - PokemonPalettes (see data/pokemon/palettes.asm)
; - PokedexDataPointerTable (see data/pokemon/dex_entry_pointers.asm)
; - AlphabeticalPokedexOrder (see data/pokemon/dex_order_alpha.asm)
; - EZChat_SortedPokemon (see data/pokemon/ezchat_order.asm)
; - NewPokedexOrder (see data/pokemon/dex_order_new.asm)
; - Pokered_MonIndices (see data/pokemon/gen1_order.asm)
; - AnimationPointers (see gfx/pokemon/anim_pointers.asm)
; - AnimationIdlePointers (see gfx/pokemon/idle_pointers.asm)
; - BitmasksPointers (see gfx/pokemon/bitmask_pointers.asm)
; - FramesPointers (see gfx/pokemon/frame_pointers.asm)
	const_def 1
	const BELDUM     ; 01
	const METANG     ; 02
	const METAGROSS  ; 03
	const BAGON      ; 04
	const SHELGON   ; 05
	const SALAMENCE  ; 06
	const TRAPINCH   ; 07
	const VIBRAVA    ; 08
	const FLYGON     ; 09
	const CATERPIE   ; 0a
	const METAPOD    ; 0b
	const BUTTERFREE ; 0c
	const WEEDLE     ; 0d
	const KAKUNA     ; 0e
	const BEEDRILL   ; 0f
	const STARLY     ; 10
	const STARAVIA   ; 11
	const STARAPTOR  ; 12
	const ZIGZAGOON  ; 13
	const LINOONE    ; 14
	const JOLTIK     ; 15
	const GALVANTULA ; 16
	const EKANS      ; 17
	const ARBOK      ; 18
	const PIKACHU    ; 19
	const RAICHU     ; 1a
	const SANDSHREW  ; 1b
	const SANDSLASH  ; 1c
	const NIDORAN_F  ; 1d
	const NIDORINA   ; 1e
	const NIDOQUEEN  ; 1f
	const NIDORAN_M  ; 20
	const NIDORINO   ; 21
	const NIDOKING   ; 22
	const NOIBAT     ; 23
	const NOIVERN    ; 24
	const VULPIX     ; 25
	const NINETALES  ; 26
	const JIGGLYPUFF ; 27
	const WIGGLYTUFF ; 28
	const POOCHYENA  ; 29
	const MIGHTYENA  ; 2a
	const ODDISH     ; 2b
	const GLOOM      ; 2c
	const VILEPLUME  ; 2d
	const MEDITITE   ; 2e
	const MEDICHAM   ; 2f
	const SPOINK     ; 30
	const GRUMPIG    ; 31
	const DIGLETT    ; 32
	const DUGTRIO    ; 33
	const PANPOUR    ; 34
	const SIMIPOUR   ; 35
	const PANSAGE    ; 36
	const SIMISAGE   ; 37
	const PANSEAR    ; 38
	const SIMISEAR   ; 39
	const GROWLITHE  ; 3a
	const ARCANINE   ; 3b
	const POLIWAG    ; 3c
	const POLIWHIRL  ; 3d
	const POLIWRATH  ; 3e
	const ABRA       ; 3f
	const KADABRA    ; 40
	const ALAKAZAM   ; 41
	const GOOMY      ; 42
	const SLIGGOO    ; 43
	const GOODRA     ; 44
	const SHINX      ; 45
	const LUXIO      ; 46
	const LUXRAY     ; 47
	const TENTACOOL  ; 48
	const TENTACRUEL ; 49
	const GEODUDE    ; 4a
	const GRAVELER   ; 4b
	const GOLEM      ; 4c
	const PONYTA     ; 4d
	const RAPIDASH   ; 4e
	const SLOWPOKE   ; 4f
	const SLOWBRO    ; 50
	const MAGNEMITE  ; 51
	const MAGNETON   ; 52
	const FARFETCH_D ; 53
	const SEVIPER    ; 54
	const ZANGOOSE   ; 55
	const SEEL       ; 56
	const DEWGONG    ; 57
	const GRIMER     ; 58
	const MUK        ; 59
	const FEEBAS     ; 5a
	const MILOTIC    ; 5b
	const GASTLY     ; 5c
	const HAUNTER    ; 5d
	const GENGAR     ; 5e
	const HAWLUCHA   ; 5f
	const MAGMORTOR  ; 60
	const ELECTRIVE  ; 61
	const RHYPERIOR  ; 62
	const MISMAGIUS  ; 63
	const TOGEKISS   ; 64
	const ABSOL      ; 65
	const MAGNEZONE  ; 66
	const SABLEYE  ; 67
	const CUBONE     ; 68
	const MAROWAK    ; 69
	const HITMONLEE  ; 6a
	const HITMONCHAN ; 6b
	const AZURILL  ; 6c
	const KOFFING    ; 6d
	const WEEZING    ; 6e
	const RHYHORN    ; 6f
	const RHYDON     ; 70
	const HONCHKROW    ; 71
	const TROPIUS    ; 72
	const KANGASKHAN ; 73
	const WAILMER     ; 74
	const WAILORD     ; 75
	const NUMEL    ; 76
	const CAMERUPT    ; 77
	const STARYU     ; 78
	const STARMIE    ; 79
	const MIMIKYU   ; 7a
	const SCYTHER    ; 7b
	const JYNX       ; 7c
	const ELECTABUZZ ; 7d
	const MAGMAR     ; 7e
	const PINSIR     ; 7f
	const TAUROS     ; 80
	const MAGIKARP   ; 81
	const GYARADOS   ; 82
	const LAPRAS     ; 83
	const DITTO      ; 84
	const EEVEE      ; 85
	const VAPOREON   ; 86
	const JOLTEON    ; 87
	const FLAREON    ; 88
	const MAWILE    ; 89
	const TYRUNT    ; 8a
	const TYRANTRUM    ; 8b
	const KABUTO     ; 8c
	const KABUTOPS   ; 8d
	const SYLVEON ; 8e
	const SNORLAX    ; 8f
	const GROUDON   ; 90
	const KYOGRE     ; 91
	const RAYQUAZA    ; 92
	const DRATINI    ; 93
	const DRAGONAIR  ; 94
	const DRAGONITE  ; 95
	const GLACEON     ; 96
	const LEAFEON        ; 97
JOHTO_POKEMON EQU const_value
	const ROWLET     ; 98
	const DARTRIX    ; 99
	const DECIDUEYE   ; 9a
	const CHIMCHAR  ; 9b
	const MONFERNO    ; 9c
	const INFERNAPE ; 9d
	const OSHAWOTT   ; 9e
	const DEWOTT   ; 9f
	const SAMUROTT ; a0
	const YAMASK    ; a1
	const COFAGRIGUS     ; a2
	const PHANTUMP   ; a3
	const TREVENANT    ; a4
	const DRILBUR     ; a5
	const EXCADRILL     ; a6
	const AMAURA   ; a7
	const AURORUS    ; a8
	const BUDEW     ; a9
	const ROSELIA   ; aa
	const ROSERADE    ; ab
	const PICHU      ; ac
	const PIKIPEK     ; ad
	const IGGLYBUFF  ; ae
	const TOGEPI     ; af
	const TOGETIC    ; b0
	const SWABLU       ; b1
	const ALTARIA       ; b2
	const MAREEP     ; b3
	const FLAAFFY    ; b4
	const AMPHAROS   ; b5
	const BELLOSSOM  ; b6
	const MARILL     ; b7
	const AZUMARILL  ; b8
	const TRUMBEAK  ; b9
	const POLITOED   ; ba
	const MAKUHITA     ; bb
	const HARIYAMA   ; bc
	const RIOLU   ; bd
	const LUCARIO      ; be
	const LOTAD    ; bf
	const LOMBRE   ; c0
	const LUDICOLO      ; c1
	const SHUPPET     ; c2
	const BANETTE   ; c3
	const ESPEON     ; c4
	const UMBREON    ; c5
	const MURKROW    ; c6
	const SLOWKING   ; c7
	const MISDREAVUS ; c8
	const UNOWN      ; c9
	const HELIOPTILE  ; ca
	const HELIOLISK  ; cb
	const LITLEO     ; cc
	const PYROAR ; cd
	const BRONZOR  ; ce
	const BRONZONG     ; cf
	const PANCHAM    ; d0
	const PANGORO   ; d1
	const SHROOMISH   ; d2
	const BRELOOM   ; d3
	const SCIZOR     ; d4
	const TOUCANNON    ; d5
	const HERACROSS  ; d6
	const HONEDGE    ; d7
	const TEDDIURSA  ; d8
	const URSARING   ; d9
	const SLUGMA     ; da
	const MAGCARGO   ; db
	const BALTOY     ; dc
	const CLAYDOL  ; dd
	const CORSOLA    ; de
	const SKITTY   ; df
	const DELCATTY  ; e0
	const DELIBIRD   ; e1
	const DOUBLADE    ; e2
	const SKARMORY   ; e3
	const HOUNDOUR   ; e4
	const HOUNDOOM   ; e5
	const AEGISLASH    ; e6
	const PHANPY     ; e7
	const DONPHAN    ; e8
	const SPHEAL   ; e9
	const SEALEO   ; ea
	const WALREIN   ; eb
	const TYROGUE    ; ec
	const HITMONTOP  ; ed
	const SMOOCHUM   ; ee
	const ELEKID     ; ef
	const MAGBY      ; f0
	const MILTANK    ; f1
	const EMOLGA    ; f2
	const ARTICUNO     ; f3
	const ZAPDOS      ; f4
	const MOLTRES    ; f5
	const LARVITAR   ; f6
	const PUPITAR    ; f7
	const TYRANITAR  ; f8
	const LITWICK      ; f9
	const LAMPENT      ; fa
	const CELEBI     ; fb
	const CHANDELURE ; fc
	const MUNCHLAX   ; fd
NUM_POKEMON EQU const_value + -1
	const EGG        ; fe

; Unown forms
; indexes for:
; - UnownWords (see data/pokemon/unown_words.asm)
; - UnownPicPointers (see data/pokemon/unown_pic_pointers.asm)
; - UnownAnimationPointers (see gfx/pokemon/unown_anim_pointers.asm)
; - UnownAnimationIdlePointers (see gfx/pokemon/unown_idle_pointers.asm)
; - UnownBitmasksPointers (see gfx/pokemon/unown_bitmask_pointers.asm)
; - UnownFramesPointers (see gfx/pokemon/unown_frame_pointers.asm)
	const_def 1
	const UNOWN_A ;  1
	const UNOWN_B ;  2
	const UNOWN_C ;  3
	const UNOWN_D ;  4
	const UNOWN_E ;  5
	const UNOWN_F ;  6
	const UNOWN_G ;  7
	const UNOWN_H ;  8
	const UNOWN_I ;  9
	const UNOWN_J ; 10
	const UNOWN_K ; 11
	const UNOWN_L ; 12
	const UNOWN_M ; 13
	const UNOWN_N ; 14
	const UNOWN_O ; 15
	const UNOWN_P ; 16
	const UNOWN_Q ; 17
	const UNOWN_R ; 18
	const UNOWN_S ; 19
	const UNOWN_T ; 20
	const UNOWN_U ; 21
	const UNOWN_V ; 22
	const UNOWN_W ; 23
	const UNOWN_X ; 24
	const UNOWN_Y ; 25
	const UNOWN_Z ; 26
NUM_UNOWN EQU const_value + -1 ; 26
