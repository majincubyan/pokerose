; Every Pokémon sorted by their Japanese names in gojūon order.
; Notably, Rhydon is missing (it should be before Rhyhorn).

EZChat_SortedPokemon:
	dw .a
	dw .i
	dw .u
	dw .e
	dw .o
	dw .ka_ga
	dw .ki_gi
	dw .ku_gu
	dw .ke_ge
	dw .ko_go
	dw .sa_za
	dw .shi_ji
	dw .su_zu
	dw .se_ze
	dw .so_zo
	dw .ta_da
	dw .chi_dhi
	dw .tsu_du
	dw .te_de
	dw .to_do
	dw .na
	dw .ni
	dw .nu
	dw .ne
	dw .no
	dw .ha_ba_pa
	dw .hi_bi_pi
	dw .fu_bu_pu
	dw .he_be_pe
	dw .ho_bo_po
	dw .ma
	dw .mi
	dw .mu
	dw .me
	dw .mo
	dw .ya
	dw .yu
	dw .yo
	dw .ra
	dw .ri
	dw .ru
	dw .re
	dw .ro
	dw .wa
	dw .end

.a:        db EKANS, ARBOK, SEAKING, ARIADOS, CROCONAW, UNOWN, -1
.i:        db EEVEE, GEODUDE, SPINARAK, PILOSWINE, HAWLUCHA, -1
.u:        db ARCANINE, SUDOWOODO, LUXIO, LUXRAY, WOOPER, SWINUB, -1
.e:        db SKARMORY, AIPOM, ESPEON, HITMONCHAN, ELEKID, ELECTABUZZ, ENTEI, -1
.o:        db FERALIGATR, FURRET, OCTILLERY, SIMISEAR, SENTRET, STANTLER, JOLTIK, GALVANTULA, OMASTAR, OMANYTE, -1
.ka_ga:    db GROWLITHE, GOODRA, DRAGONITE, PINSIR, SNORLAX, KABUTO, KABUTOPS, HITMONTOP, VIBRAVA, FLYGON, FARFETCH_D, CUBONE, MAROWAK, KANGASKHAN, -1
.ki_gi:    db SUNFLORA, CATERPIE, GYARADOS, RAPIDASH, NINETALES, GIRAFARIG, BELLOSSOM, KINGDRA, MISMAGIUS, -1
.ku_gu:    db GLOOM, PINECO, GLIGAR, RHYPERIOR, GRANBULL, CROBAT, -1
.ke_ge:    db ABRA, GENGAR, TAUROS, -1
.ko_go:    db MAGIKARP, MAGNEMITE, GASTLY, HAUNTER, SLIGGOO, KAKUNA, PANSAGE, PHANPY, ZIGZAGOON, SIMISAGE, MIGHTYENA, GOLEM, GRAVELER, SPOINK, -1
.sa_za:    db RHYHORN, PUPITAR, CORSOLA, HITMONLEE, ZAPDOS, JOLTEON, SANDSHREW, SANDSLASH, -1 ; RHYDON should lead this list
.shi_ji:   db SEADRA, FEEBAS, VAPOREON, DEWGONG, -1
.su_zu:    db SUICUNE, STARMIE, SCYTHER, POOCHYENA, BEEDRILL, ELECTRIVE, MAGMORTOR, -1
.se_ze:    db TRAPINCH, CELEBI, -1
.so_zo:    db WOBBUFFET, -1
.ta_da:    db DUGTRIO, HORSEA, EXEGGCUTE, -1
.chi_dhi:  db ROWLET, CHINCHOU, -1
.tsu_du:   db SHUCKLE, -1
.te_de:    db DIGLETT, REMORAID, DELIBIRD, HOUNDOUR, AMPHAROS, -1
.to_do:    db SEVIPER, ZANGOOSE, SMEARGLE, KOFFING, TENTACRUEL, TOGETIC, TOGEPI, GOLDEEN, METAPOD, DONPHAN, -1
.na:       db ODDISH, EXEGGUTOR, -1
.ni:       db NIDOKING, NIDOQUEEN, NIDORAN_M, NIDORAN_F, NIDORINA, NIDORINO, PANPOUR, SNEASEL, POLIWHIRL, POLITOED, POLIWRATH, POLIWAG, -1
.nu:       db QUAGSIRE, -1
.ne:       db NATU, XATU, -1
.no:       db DUNSPARCE, -1
.ha_ba_pa: db SEEL, STEELIX, TYPHLOSION, DRAGONAIR, BUTTERFREE, SCIZOR, HOPPIP, BLISSEY, MEDITITE, MEDICHAM, QWILFISH, MR__MIME, TYROGUE, MILOTIC, TYRANITAR, -1
.hi_bi_pi: db CLEFFA, WEEDLE, PIKACHU, NOIVERN, STARAPTOR, STARAVIA, PICHU, NOIBAT, BAGON, STARYU, CYNDAQUIL, SUNKERN, TEDDIURSA, TOGEKISS, -1
.fu_bu_pu: db MOLTRES, FLAREON, ALAKAZAM, MAGMAR, FORRETRESS, WIGGLYTUFF, METANG, BELDUM, METAGROSS, AERODACTYL, MAGBY, IGGLYBUFF, UMBREON, ARTICUNO, JIGGLYPUFF, SNUBBULL, -1
.he_be_pe: db BAYLEEF, GRIMER, MUK, HERACROSS, HOUNDOOM, SIMIPOUR, LICKITUNG, -1
.ho_bo_po: db HO_OH, HOOTHOOT, STARLY, PONYTA, SKIPLOOM, PORYGON, PORYGON2, -1
.ma:       db MAGCARGO, SLUGMA, QUILAVA, SHINX, WEEZING, MARILL, AZUMARILL, ABSOL, PANSEAR, MANTINE, -1
.mi:       db DRATINI, MEW, MEWTWO, MILTANK, -1
.mu:       db MISDREAVUS, SMOOCHUM, -1
.me:       db MEGANIUM, DITTO, TENTACOOL, MAREEP, -1
.mo:       db FLAAFFY, GRUMPIG, TANGELA, -1
.ya:       db SLOWKING, SLOWBRO, SLOWPOKE, MURKROW, YANMA, -1
.yu:       db KADABRA, -1
.yo:       db LARVITAR, NOCTOWL, -1
.ra:       db RAIKOU, RAICHU, CHANSEY, LINOONE, LAPRAS, VILEPLUME, LANTURN, -1
.ri:       db SHELLGON, SALAMENCE, URSARING, -1
.ru:       db JYNX, LUGIA, -1
.re:       db MAGNETON, LEDIAN, LEDYBA, -1
.ro:       db VULPIX, -1
.wa:       db JUMPLUFF, TOTODILE, GOOMY ;, -1
.end:      db -1
