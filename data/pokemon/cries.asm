mon_cry: MACRO
; index, pitch, length
	dw \1, \2, \3
ENDM

PokemonCries::
; entries correspond to constants/pokemon_constants.asm
	mon_cry CRY_BULBASAUR,   $080,  $081 ; BELDUM
	mon_cry CRY_BULBASAUR,   $020,  $100 ; METANG
	mon_cry CRY_BULBASAUR,   $000,  $140 ; METAGROSS
	mon_cry CRY_CHARMANDER,  $060,  $0c0 ; BAGON
	mon_cry CRY_CHARMANDER,  $020,  $0c0 ; SHELGON
	mon_cry CRY_CHARMANDER,  $000,  $100 ; SALAMENCE
	mon_cry CRY_SQUIRTLE,    $060,  $0c0 ; TRAPINCH
	mon_cry CRY_SQUIRTLE,    $020,  $0c0 ; VIBRAVA
	mon_cry CRY_BLASTOISE,   $000,  $100 ; FLYGON
	mon_cry CRY_CATERPIE,    $080,  $0a0 ; CATERPIE
	mon_cry CRY_METAPOD,     $0cc,  $081 ; METAPOD
	mon_cry CRY_CATERPIE,    $077,  $0c0 ; BUTTERFREE
	mon_cry CRY_WEEDLE,      $0ee,  $081 ; WEEDLE
	mon_cry CRY_BLASTOISE,   $0ff,  $081 ; KAKUNA
	mon_cry CRY_BLASTOISE,   $060,  $100 ; BEEDRILL
	mon_cry CRY_PIDGEY,      $0df,  $084 ; STARLY
	mon_cry CRY_PIDGEOTTO,   $028,  $140 ; STARAVIA
	mon_cry CRY_PIDGEOTTO,   $011,  $17f ; STARAPTOR
	mon_cry CRY_RATTATA,     $000,  $100 ; ZIGZAGOON
	mon_cry CRY_RATTATA,     $020,  $17f ; LINOONE
	mon_cry CRY_SPEAROW,     $000,  $100 ; JOLTIK
	mon_cry CRY_FEAROW,      $040,  $120 ; GALVANTULA
	mon_cry CRY_EKANS,       $012,  $0c0 ; EKANS
	mon_cry CRY_EKANS,       $0e0,  $090 ; ARBOK
	mon_cry CRY_BULBASAUR,   $0ee,  $081 ; PIKACHU
	mon_cry CRY_RAICHU,      $0ee,  $088 ; RAICHU
	mon_cry CRY_NIDORAN_M,   $020,  $0c0 ; SANDSHREW
	mon_cry CRY_NIDORAN_M,   $0ff,  $17f ; SANDSLASH
	mon_cry CRY_NIDORAN_F,   $000,  $100 ; NIDORAN_F
	mon_cry CRY_NIDORAN_F,   $02c,  $160 ; NIDORINA
	mon_cry CRY_NIDOQUEEN,   $000,  $100 ; NIDOQUEEN
	mon_cry CRY_NIDORAN_M,   $000,  $100 ; NIDORAN_M
	mon_cry CRY_NIDORAN_M,   $02c,  $140 ; NIDORINO
	mon_cry CRY_RAICHU,      $000,  $100 ; NIDOKING
	mon_cry CRY_CLEFAIRY,    $0cc,  $081 ; NOIBAT
	mon_cry CRY_CLEFAIRY,    $0aa,  $0a0 ; NOIVERN
	mon_cry CRY_VULPIX,      $04f,  $090 ; VULPIX
	mon_cry CRY_VULPIX,      $088,  $0e0 ; NINETALES
	mon_cry CRY_PIDGEY,      $0ff,  $0b5 ; JIGGLYPUFF
	mon_cry CRY_PIDGEY,      $068,  $0e0 ; WIGGLYTUFF
	mon_cry CRY_SQUIRTLE,    $0e0,  $100 ; POOCHYENA
	mon_cry CRY_SQUIRTLE,    $0fa,  $100 ; MIGHTYENA
	mon_cry CRY_ODDISH,      $0dd,  $081 ; ODDISH
	mon_cry CRY_ODDISH,      $0aa,  $0c0 ; GLOOM
	mon_cry CRY_VILEPLUME,   $022,  $17f ; VILEPLUME
	mon_cry CRY_PARAS,       $020,  $160 ; MEDITITE
	mon_cry CRY_PARAS,       $042,  $17f ; MEDICHAM
	mon_cry CRY_VENONAT,     $044,  $0c0 ; SPOINK
	mon_cry CRY_VENONAT,     $029,  $100 ; GRUMPIG
	mon_cry CRY_DIGLETT,     $0aa,  $081 ; DIGLETT
	mon_cry CRY_DIGLETT,     $02a,  $090 ; DUGTRIO
	mon_cry CRY_CLEFAIRY,    $077,  $090 ; PANPOUR
	mon_cry CRY_CLEFAIRY,    $099,  $17f ; SIMIPOUR
	mon_cry CRY_PSYDUCK,     $020,  $0e0 ; PANSAGE
	mon_cry CRY_PSYDUCK,     $0ff,  $0c0 ; SIMISAGE
	mon_cry CRY_NIDOQUEEN,   $0dd,  $0e0 ; PANSEAR
	mon_cry CRY_NIDOQUEEN,   $0af,  $0c0 ; SIMISEAR
	mon_cry CRY_GROWLITHE,   $020,  $0c0 ; GROWLITHE
	mon_cry CRY_WEEDLE,      $000,  $100 ; ARCANINE
	mon_cry CRY_PIDGEY,      $0ff,  $17f ; POLIWAG
	mon_cry CRY_PIDGEY,      $077,  $0e0 ; POLIWHIRL
	mon_cry CRY_PIDGEY,      $000,  $17f ; POLIWRATH
	mon_cry CRY_METAPOD,     $0c0,  $081 ; ABRA
	mon_cry CRY_METAPOD,     $0a8,  $140 ; KADABRA
	mon_cry CRY_METAPOD,     $098,  $17f ; ALAKAZAM
	mon_cry CRY_GROWLITHE,   $0ee,  $081 ; GOOMY
	mon_cry CRY_GROWLITHE,   $048,  $0e0 ; SLIGGOO
	mon_cry CRY_GROWLITHE,   $008,  $140 ; GOODRA
	mon_cry CRY_PSYDUCK,     $055,  $081 ; SHINX
	mon_cry CRY_WEEPINBELL,  $044,  $0a0 ; LUXIO
	mon_cry CRY_WEEPINBELL,  $066,  $14c ; LUXRAY
	mon_cry CRY_VENONAT,     $000,  $100 ; TENTACOOL
	mon_cry CRY_VENONAT,     $0ee,  $17f ; TENTACRUEL
	mon_cry CRY_VULPIX,      $0f0,  $090 ; GEODUDE
	mon_cry CRY_VULPIX,      $000,  $100 ; GRAVELER
	mon_cry CRY_GOLEM,       $0e0,  $0c0 ; GOLEM
	mon_cry CRY_WEEPINBELL,  $000,  $100 ; PONYTA
	mon_cry CRY_WEEPINBELL,  $020,  $140 ; RAPIDASH
	mon_cry CRY_SLOWPOKE,    $000,  $100 ; SLOWPOKE
	mon_cry CRY_GROWLITHE,   $000,  $100 ; SLOWBRO
	mon_cry CRY_METAPOD,     $080,  $0e0 ; MAGNEMITE
	mon_cry CRY_METAPOD,     $020,  $140 ; MAGNETON
	mon_cry CRY_SPEAROW,     $0dd,  $081 ; FARFETCH_D
	mon_cry CRY_DIGLETT,     $0bb,  $081 ; SEVIPER
	mon_cry CRY_DIGLETT,     $099,  $0a0 ; ZANGOOSE
	mon_cry CRY_SEEL,        $088,  $140 ; SEEL
	mon_cry CRY_SEEL,        $023,  $17f ; DEWGONG
	mon_cry CRY_GRIMER,      $000,  $100 ; GRIMER
	mon_cry CRY_MUK,         $0ef,  $17f ; MUK
	mon_cry CRY_FEAROW,      $000,  $100 ; FEEBAS
	mon_cry CRY_FEAROW,      $06f,  $160 ; MILOTIC
	mon_cry CRY_METAPOD,     $000,  $100 ; GASTLY
	mon_cry CRY_METAPOD,     $030,  $0c0 ; HAUNTER
	mon_cry CRY_MUK,         $000,  $17f ; GENGAR
	mon_cry CRY_EKANS,       $0ff,  $140 ; HAWLUCHA
	mon_cry CRY_DROWZEE,     $088,  $0a0 ; MAGMORTOR
	mon_cry CRY_DROWZEE,     $0ee,  $0c0 ; ELECTRIVE
	mon_cry CRY_KRABBY,      $020,  $160 ; RHYPERIOR
	mon_cry CRY_KRABBY,      $0ee,  $160 ; MISMAGIUS
	mon_cry CRY_VOLTORB,     $0ed,  $100 ; TOGEKISS
	mon_cry CRY_VOLTORB,     $0a8,  $110 ; ABSOL
	mon_cry CRY_DIGLETT,     $000,  $100 ; MAGNEZONE
	mon_cry CRY_DROWZEE,     $000,  $100 ; SABLEYE
	mon_cry CRY_CLEFAIRY,    $000,  $100 ; CUBONE
	mon_cry CRY_ODDISH,      $04f,  $0e0 ; MAROWAK
	mon_cry CRY_GOLEM,       $080,  $140 ; HITMONLEE
	mon_cry CRY_SEEL,        $0ee,  $140 ; HITMONCHAN
	mon_cry CRY_SEEL,        $000,  $100 ; AZURILL
	mon_cry CRY_GOLEM,       $0e6,  $15d ; KOFFING
	mon_cry CRY_GOLEM,       $0ff,  $17f ; WEEZING
	mon_cry CRY_CHARMANDER,  $000,  $100 ; RHYHORN
	mon_cry CRY_RHYDON,      $000,  $100 ; RHYDON
	mon_cry CRY_PIDGEOTTO,   $00a,  $140 ; HONCHKROW
	mon_cry CRY_GOLEM,       $000,  $100 ; TROPIUS
	mon_cry CRY_KANGASKHAN,  $000,  $100 ; KANGASKHAN
	mon_cry CRY_CLEFAIRY,    $099,  $090 ; WAILMER
	mon_cry CRY_CLEFAIRY,    $03c,  $081 ; WAILORD
	mon_cry CRY_CATERPIE,    $080,  $0c0 ; NUMEL
	mon_cry CRY_CATERPIE,    $010,  $17f ; CAMERUPT
	mon_cry CRY_PARAS,       $002,  $0a0 ; STARYU
	mon_cry CRY_PARAS,       $000,  $100 ; STARMIE
	mon_cry CRY_KRABBY,      $008,  $0c0 ; MIMIKYU
	mon_cry CRY_CATERPIE,    $000,  $100 ; SCYTHER
	mon_cry CRY_DROWZEE,     $0ff,  $17f ; JYNX
	mon_cry CRY_VOLTORB,     $08f,  $17f ; ELECTABUZZ
	mon_cry CRY_CHARMANDER,  $0ff,  $0b0 ; MAGMAR
	mon_cry CRY_PIDGEOTTO,   $000,  $100 ; PINSIR
	mon_cry CRY_SQUIRTLE,    $011,  $0c0 ; TAUROS
	mon_cry CRY_EKANS,       $080,  $080 ; MAGIKARP
	mon_cry CRY_EKANS,       $000,  $100 ; GYARADOS
	mon_cry CRY_LAPRAS,      $000,  $100 ; LAPRAS
	mon_cry CRY_PIDGEY,      $0ff,  $17f ; DITTO
	mon_cry CRY_VENONAT,     $088,  $0e0 ; EEVEE
	mon_cry CRY_VENONAT,     $0aa,  $17f ; VAPOREON
	mon_cry CRY_VENONAT,     $03d,  $100 ; JOLTEON
	mon_cry CRY_VENONAT,     $010,  $0a0 ; FLAREON
	mon_cry CRY_WEEPINBELL,  $0aa,  $17f ; MAWILE
	mon_cry CRY_GROWLITHE,   $0f0,  $081 ; TYRUNT
	mon_cry CRY_GROWLITHE,   $0ff,  $0c0 ; TYRANTRUM
	mon_cry CRY_CATERPIE,    $0bb,  $0c0 ; KABUTO
	mon_cry CRY_FEAROW,      $0ee,  $081 ; KABUTOPS
	mon_cry CRY_VILEPLUME,   $020,  $170 ; SYLVEON
	mon_cry CRY_GRIMER,      $055,  $081 ; SNORLAX
	mon_cry CRY_RAICHU,      $080,  $0c0 ; GROUDON
	mon_cry CRY_FEAROW,      $0ff,  $100 ; KYOGRE
	mon_cry CRY_RAICHU,      $0f8,  $0c0 ; RAYQUAZA
	mon_cry CRY_BULBASAUR,   $060,  $0c0 ; DRATINI
	mon_cry CRY_BULBASAUR,   $040,  $100 ; DRAGONAIR
	mon_cry CRY_BULBASAUR,   $03c,  $140 ; DRAGONITE
	mon_cry CRY_PARAS,       $099,  $17f ; GLACEON
	mon_cry CRY_PARAS,       $0ee,  $17f ; LEAFEON
	mon_cry CRY_CHIKORITA,  -$010,  $0b0 ; ROWLET
	mon_cry CRY_CHIKORITA,  -$022,  $120 ; DARTRIX
	mon_cry CRY_CHIKORITA,  -$0b7,  $200 ; DECIDUEYE
	mon_cry CRY_CYNDAQUIL,   $347,  $080 ; CHIMCHAR
	mon_cry CRY_CYNDAQUIL,   $321,  $120 ; MONFERNO
	mon_cry CRY_TYPHLOSION,  $f00,  $0d4 ; INFERNAPE
	mon_cry CRY_TOTODILE,    $46c,  $0e8 ; OSHAWOTT
	mon_cry CRY_TOTODILE,    $440,  $110 ; DEWOTT
	mon_cry CRY_TOTODILE,    $3fc,  $180 ; SAMUROTT
	mon_cry CRY_SENTRET,     $08a,  $0b8 ; YAMASK
	mon_cry CRY_SENTRET,     $06b,  $102 ; COFAGRIGUS
	mon_cry CRY_HOOTHOOT,    $091,  $0d8 ; PHANTOMP
	mon_cry CRY_HOOTHOOT,    $000,  $1a0 ; TREVENANT
	mon_cry CRY_LEDYBA,      $000,  $0de ; DRILBUR
	mon_cry CRY_LEDYBA,     -$096,  $138 ; EXCADRILL
	mon_cry CRY_SPINARAK,    $011,  $200 ; AMAURA
	mon_cry CRY_SPINARAK,   -$0ae,  $1e2 ; AURORUS
	mon_cry CRY_SQUIRTLE,   -$010,  $140 ; BUDEW
	mon_cry CRY_CYNDAQUIL,   $3c9,  $140 ; ROSELIA
	mon_cry CRY_CYNDAQUIL,   $2d0,  $110 ; ROSERADE
	mon_cry CRY_PICHU,       $000,  $140 ; PICHU
	mon_cry CRY_CLEFFA,      $061,  $091 ; PIKIPEK
	mon_cry CRY_CHIKORITA,   $0e8,  $0e8 ; IGGLYBUFF
	mon_cry CRY_TOGEPI,      $010,  $100 ; TOGEPI
	mon_cry CRY_TOGETIC,     $03b,  $038 ; TOGETIC
	mon_cry CRY_NATU,       -$067,  $100 ; SWABLU
	mon_cry CRY_NATU,       -$0a7,  $168 ; ALTARIA
	mon_cry CRY_MAREEP,      $022,  $0d8 ; MAREEP
	mon_cry CRY_MAREEP,     -$007,  $180 ; FLAAFFY
	mon_cry CRY_AMPHAROS,   -$07c,  $0e8 ; AMPHAROS
	mon_cry CRY_CLEFFA,      $084,  $150 ; BELLOSSOM
	mon_cry CRY_MARILL,      $11b,  $120 ; MARILL
	mon_cry CRY_MARILL,      $0b6,  $180 ; AZUMARILL
	mon_cry CRY_CLEFFA,      $f40,  $180 ; TRUMBEAK
	mon_cry CRY_CLEFFA,     -$2a3,  $1c8 ; POLITOED
	mon_cry CRY_CLEFFA,      $03b,  $0c8 ; MAKUHITA
	mon_cry CRY_CLEFFA,      $027,  $138 ; HARIYAMA
	mon_cry CRY_CLEFFA,      $000,  $180 ; RIOLU
	mon_cry CRY_AIPOM,      -$051,  $0e8 ; LUCARIO
	mon_cry CRY_MARILL,      $12b,  $0b8 ; LOTAD
	mon_cry CRY_SUNFLORA,   -$020,  $180 ; LOMBRE
	mon_cry CRY_TOTODILE,    $031,  $0c8 ; LUDICOLO
	mon_cry CRY_WOOPER,      $093,  $0af ; SHUPPET
	mon_cry CRY_WOOPER,     -$0c6,  $140 ; BANETTE
	mon_cry CRY_AIPOM,       $0a2,  $140 ; ESPEON
	mon_cry CRY_VENONAT,    -$0e9,  $0f0 ; UMBREON
	mon_cry CRY_MARILL,     -$01f,  $180 ; MURKROW
	mon_cry CRY_SLOWKING,    $104,  $200 ; SLOWKING
	mon_cry CRY_HOOTHOOT,    $130,  $0e8 ; MISDREAVUS
	mon_cry CRY_HOOTHOOT,    $162,  $100 ; UNOWN
	mon_cry CRY_AMPHAROS,    $27b,  $144 ; HELIOPTILE
	mon_cry CRY_GIRAFARIG,   $041,  $200 ; HELIOLISK
	mon_cry CRY_SLOWKING,    $080,  $100 ; LITLEO
	mon_cry CRY_SLOWKING,    $000,  $180 ; PYROAR
	mon_cry CRY_DUNSPARCE,   $1c4,  $100 ; BRONZOR
	mon_cry CRY_GLIGAR,     -$102,  $100 ; BRONZONG
	mon_cry CRY_TYPHLOSION,  $0ef,  $0f7 ; PANCHAM
	mon_cry CRY_DUNSPARCE,   $112,  $0e8 ; PANGORO
	mon_cry CRY_DUNSPARCE,   $000,  $180 ; SHROOMISH
	mon_cry CRY_SLOWKING,    $160,  $0e0 ; BRELOOM
	mon_cry CRY_AMPHAROS,    $000,  $160 ; SCIZOR
	mon_cry CRY_DUNSPARCE,   $290,  $0a8 ; TOUCANNON
	mon_cry CRY_AMPHAROS,    $035,  $0e0 ; HERACROSS
	mon_cry CRY_WOOPER,      $053,  $0af ; HONEDGE
	mon_cry CRY_TEDDIURSA,   $7a2,  $06e ; TEDDIURSA
	mon_cry CRY_TEDDIURSA,   $640,  $0d8 ; URSARING
	mon_cry CRY_SLUGMA,     -$1d8,  $140 ; SLUGMA
	mon_cry CRY_MAGCARGO,   -$20d,  $1c0 ; MAGCARGO
	mon_cry CRY_CYNDAQUIL,   $1fe,  $140 ; BALTOY
	mon_cry CRY_MAGCARGO,   -$109,  $100 ; CLAYDOL
	mon_cry CRY_MAGCARGO,    $0a1,  $0e8 ; CORSOLA
	mon_cry CRY_SUNFLORA,    $00d,  $100 ; SKITTY
	mon_cry CRY_TOTODILE,    $000,  $180 ; DELCATTY
	mon_cry CRY_TEDDIURSA,   $002,  $06a ; DELIBIRD
	mon_cry CRY_MANTINE,    -$0be,  $0f0 ; DOUBLADE
	mon_cry CRY_AMPHAROS,    $8a9,  $180 ; SKARMORY
	mon_cry CRY_CYNDAQUIL,   $039,  $140 ; HOUNDOUR
	mon_cry CRY_TOTODILE,   -$10a,  $100 ; HOUNDOOM
	mon_cry CRY_SLUGMA,      $2fb,  $100 ; AEGISLASH
	mon_cry CRY_SENTRET,     $048,  $230 ; PHANPY
	mon_cry CRY_DONPHAN,     $000,  $1a0 ; DONPHAN
	mon_cry CRY_GIRAFARIG,   $073,  $240 ; SPHEAL
	mon_cry CRY_AIPOM,      -$160,  $180 ; SEALEO
	mon_cry CRY_PICHU,      -$21a,  $1f0 ; WALREIN
	mon_cry CRY_AIPOM,       $02c,  $108 ; TYROGUE
	mon_cry CRY_SLUGMA,      $000,  $100 ; HITMONTOP
	mon_cry CRY_MARILL,      $068,  $100 ; SMOOCHUM
	mon_cry CRY_SUNFLORA,   -$2d8,  $0b4 ; ELEKID
	mon_cry CRY_TEDDIURSA,   $176,  $03a ; MAGBY
	mon_cry CRY_GLIGAR,     -$1cd,  $1a0 ; MILTANK
	mon_cry CRY_SLOWKING,    $293,  $140 ; EMOLGA
	mon_cry CRY_RAICHU,      $080,  $0c0 ; ARTICUNO
	mon_cry CRY_FEAROW,      $0ff,  $100 ; ZAPDOS
	mon_cry CRY_RAICHU,      $0f8,  $0c0 ; MOLTRES
	mon_cry CRY_RAIKOU,      $05f,  $0d0 ; LARVITAR
	mon_cry CRY_SPINARAK,   -$1db,  $150 ; PUPITAR
	mon_cry CRY_RAIKOU,     -$100,  $180 ; TYRANITAR
	mon_cry CRY_TYPHLOSION,  $000,  $100 ; LITWICK
	mon_cry CRY_AIPOM,       $000,  $180 ; LAMPENT
	mon_cry CRY_ENTEI,       $14a,  $111 ; CELEBI
	mon_cry CRY_MUK,         $000,  $17f ; CHANDELURE
	mon_cry CRY_GRIMER,      $065,  $080 ; MUNCHLAX
	mon_cry CRY_NIDORAN_M,      0,     0 ; 254
	mon_cry CRY_NIDORAN_M,      0,     0 ; 255
