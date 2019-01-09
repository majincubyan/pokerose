tmhm: MACRO
; used in data/pokemon/base_stats/*.asm
tms1 = 0 ; TM01-TM24 (24)
tms2 = 0 ; TM25-TM48 (24)
tms3 = 0 ; TM49-TM50 + HM01-HM07 + MT01-MT03 (12/24)
rept _NARG
	if DEF(\1_TMNUM)
	if \1_TMNUM < 24 + 1
tms1 = tms1 | (1 << ((\1_TMNUM) - 1))
	elif \1_TMNUM < 48 + 1
tms2 = tms2 | (1 << ((\1_TMNUM) - 1 - 24))
	else
tms3 = tms3 | (1 << ((\1_TMNUM) - 1 - 48))
	endc
	else
		fail "\1 is not a TM, HM, or move tutor move"
	endc
	shift
endr
rept 3 ; TM01-TM24 (24/24)
	db tms1 & $ff
tms1 = tms1 >> 8
endr
rept 3 ; TM25-TM48 (24/24)
	db tms2 & $ff
tms2 = tms2 >> 8
endr
rept 2 ; TM49-TM50 + HM01-HM07 + MT01-MT03 (12/16)
	db tms3 & $ff
tms3 = tms3 >> 8
endr
ENDM

BaseData::
INCLUDE "data/pokemon/base_stats/beldum.asm"
INCLUDE "data/pokemon/base_stats/metang.asm"
INCLUDE "data/pokemon/base_stats/metagross.asm"
INCLUDE "data/pokemon/base_stats/bagon.asm"
INCLUDE "data/pokemon/base_stats/shellgon.asm"
INCLUDE "data/pokemon/base_stats/salamence.asm"
INCLUDE "data/pokemon/base_stats/trapinch.asm"
INCLUDE "data/pokemon/base_stats/vibrava.asm"
INCLUDE "data/pokemon/base_stats/flygon.asm"
INCLUDE "data/pokemon/base_stats/caterpie.asm"
INCLUDE "data/pokemon/base_stats/metapod.asm"
INCLUDE "data/pokemon/base_stats/butterfree.asm"
INCLUDE "data/pokemon/base_stats/weedle.asm"
INCLUDE "data/pokemon/base_stats/kakuna.asm"
INCLUDE "data/pokemon/base_stats/beedrill.asm"
INCLUDE "data/pokemon/base_stats/starly.asm"
INCLUDE "data/pokemon/base_stats/staravia.asm"
INCLUDE "data/pokemon/base_stats/staraptor.asm"
INCLUDE "data/pokemon/base_stats/zigzagoon.asm"
INCLUDE "data/pokemon/base_stats/linoone.asm"
INCLUDE "data/pokemon/base_stats/joltik.asm"
INCLUDE "data/pokemon/base_stats/galvantula.asm"
INCLUDE "data/pokemon/base_stats/ekans.asm"
INCLUDE "data/pokemon/base_stats/arbok.asm"
INCLUDE "data/pokemon/base_stats/pikachu.asm"
INCLUDE "data/pokemon/base_stats/raichu.asm"
INCLUDE "data/pokemon/base_stats/sandshrew.asm"
INCLUDE "data/pokemon/base_stats/sandslash.asm"
INCLUDE "data/pokemon/base_stats/nidoran_f.asm"
INCLUDE "data/pokemon/base_stats/nidorina.asm"
INCLUDE "data/pokemon/base_stats/nidoqueen.asm"
INCLUDE "data/pokemon/base_stats/nidoran_m.asm"
INCLUDE "data/pokemon/base_stats/nidorino.asm"
INCLUDE "data/pokemon/base_stats/nidoking.asm"
INCLUDE "data/pokemon/base_stats/noibat.asm"
INCLUDE "data/pokemon/base_stats/noivern.asm"
INCLUDE "data/pokemon/base_stats/vulpix.asm"
INCLUDE "data/pokemon/base_stats/ninetales.asm"
INCLUDE "data/pokemon/base_stats/jigglypuff.asm"
INCLUDE "data/pokemon/base_stats/wigglytuff.asm"
INCLUDE "data/pokemon/base_stats/poochyena.asm"
INCLUDE "data/pokemon/base_stats/mightyena.asm"
INCLUDE "data/pokemon/base_stats/oddish.asm"
INCLUDE "data/pokemon/base_stats/gloom.asm"
INCLUDE "data/pokemon/base_stats/vileplume.asm"
INCLUDE "data/pokemon/base_stats/meditite.asm"
INCLUDE "data/pokemon/base_stats/medicham.asm"
INCLUDE "data/pokemon/base_stats/spoink.asm"
INCLUDE "data/pokemon/base_stats/grumpig.asm"
INCLUDE "data/pokemon/base_stats/diglett.asm"
INCLUDE "data/pokemon/base_stats/dugtrio.asm"
INCLUDE "data/pokemon/base_stats/panpour.asm"
INCLUDE "data/pokemon/base_stats/simipour.asm"
INCLUDE "data/pokemon/base_stats/pansage.asm"
INCLUDE "data/pokemon/base_stats/simisage.asm"
INCLUDE "data/pokemon/base_stats/pansear.asm"
INCLUDE "data/pokemon/base_stats/simisear.asm"
INCLUDE "data/pokemon/base_stats/growlithe.asm"
INCLUDE "data/pokemon/base_stats/arcanine.asm"
INCLUDE "data/pokemon/base_stats/poliwag.asm"
INCLUDE "data/pokemon/base_stats/poliwhirl.asm"
INCLUDE "data/pokemon/base_stats/poliwrath.asm"
INCLUDE "data/pokemon/base_stats/abra.asm"
INCLUDE "data/pokemon/base_stats/kadabra.asm"
INCLUDE "data/pokemon/base_stats/alakazam.asm"
INCLUDE "data/pokemon/base_stats/goomy.asm"
INCLUDE "data/pokemon/base_stats/sliggoo.asm"
INCLUDE "data/pokemon/base_stats/goodra.asm"
INCLUDE "data/pokemon/base_stats/shinx.asm"
INCLUDE "data/pokemon/base_stats/luxio.asm"
INCLUDE "data/pokemon/base_stats/luxray.asm"
INCLUDE "data/pokemon/base_stats/tentacool.asm"
INCLUDE "data/pokemon/base_stats/tentacruel.asm"
INCLUDE "data/pokemon/base_stats/geodude.asm"
INCLUDE "data/pokemon/base_stats/graveler.asm"
INCLUDE "data/pokemon/base_stats/golem.asm"
INCLUDE "data/pokemon/base_stats/ponyta.asm"
INCLUDE "data/pokemon/base_stats/rapidash.asm"
INCLUDE "data/pokemon/base_stats/slowpoke.asm"
INCLUDE "data/pokemon/base_stats/slowbro.asm"
INCLUDE "data/pokemon/base_stats/magnemite.asm"
INCLUDE "data/pokemon/base_stats/magneton.asm"
INCLUDE "data/pokemon/base_stats/farfetch_d.asm"
INCLUDE "data/pokemon/base_stats/seviper.asm"
INCLUDE "data/pokemon/base_stats/zangoose.asm"
INCLUDE "data/pokemon/base_stats/seel.asm"
INCLUDE "data/pokemon/base_stats/dewgong.asm"
INCLUDE "data/pokemon/base_stats/grimer.asm"
INCLUDE "data/pokemon/base_stats/muk.asm"
INCLUDE "data/pokemon/base_stats/feebas.asm"
INCLUDE "data/pokemon/base_stats/milotic.asm"
INCLUDE "data/pokemon/base_stats/gastly.asm"
INCLUDE "data/pokemon/base_stats/haunter.asm"
INCLUDE "data/pokemon/base_stats/gengar.asm"
INCLUDE "data/pokemon/base_stats/hawlucha.asm"
INCLUDE "data/pokemon/base_stats/magmortor.asm"
INCLUDE "data/pokemon/base_stats/electrive.asm"
INCLUDE "data/pokemon/base_stats/rhyperior.asm"
INCLUDE "data/pokemon/base_stats/mismagius.asm"
INCLUDE "data/pokemon/base_stats/togekiss.asm"
INCLUDE "data/pokemon/base_stats/absol.asm"
INCLUDE "data/pokemon/base_stats/magnezone.asm"
INCLUDE "data/pokemon/base_stats/sableye.asm"
INCLUDE "data/pokemon/base_stats/cubone.asm"
INCLUDE "data/pokemon/base_stats/marowak.asm"
INCLUDE "data/pokemon/base_stats/hitmonlee.asm"
INCLUDE "data/pokemon/base_stats/hitmonchan.asm"
INCLUDE "data/pokemon/base_stats/azurill.asm"
INCLUDE "data/pokemon/base_stats/koffing.asm"
INCLUDE "data/pokemon/base_stats/weezing.asm"
INCLUDE "data/pokemon/base_stats/rhyhorn.asm"
INCLUDE "data/pokemon/base_stats/rhydon.asm"
INCLUDE "data/pokemon/base_stats/honchkrow.asm"
INCLUDE "data/pokemon/base_stats/tropius.asm"
INCLUDE "data/pokemon/base_stats/kangaskhan.asm"
INCLUDE "data/pokemon/base_stats/wailmer.asm"
INCLUDE "data/pokemon/base_stats/wailord.asm"
INCLUDE "data/pokemon/base_stats/numel.asm"
INCLUDE "data/pokemon/base_stats/camerupt.asm"
INCLUDE "data/pokemon/base_stats/staryu.asm"
INCLUDE "data/pokemon/base_stats/starmie.asm"
INCLUDE "data/pokemon/base_stats/mimikyu.asm"
INCLUDE "data/pokemon/base_stats/scyther.asm"
INCLUDE "data/pokemon/base_stats/jynx.asm"
INCLUDE "data/pokemon/base_stats/electabuzz.asm"
INCLUDE "data/pokemon/base_stats/magmar.asm"
INCLUDE "data/pokemon/base_stats/pinsir.asm"
INCLUDE "data/pokemon/base_stats/tauros.asm"
INCLUDE "data/pokemon/base_stats/magikarp.asm"
INCLUDE "data/pokemon/base_stats/gyarados.asm"
INCLUDE "data/pokemon/base_stats/lapras.asm"
INCLUDE "data/pokemon/base_stats/ditto.asm"
INCLUDE "data/pokemon/base_stats/eevee.asm"
INCLUDE "data/pokemon/base_stats/vaporeon.asm"
INCLUDE "data/pokemon/base_stats/jolteon.asm"
INCLUDE "data/pokemon/base_stats/flareon.asm"
INCLUDE "data/pokemon/base_stats/mawile.asm"
INCLUDE "data/pokemon/base_stats/tyrunt.asm"
INCLUDE "data/pokemon/base_stats/tyrantrum.asm"
INCLUDE "data/pokemon/base_stats/kabuto.asm"
INCLUDE "data/pokemon/base_stats/kabutops.asm"
INCLUDE "data/pokemon/base_stats/sylveon.asm"
INCLUDE "data/pokemon/base_stats/snorlax.asm"
INCLUDE "data/pokemon/base_stats/groudon.asm"
INCLUDE "data/pokemon/base_stats/kyogre.asm"
INCLUDE "data/pokemon/base_stats/rayquaza.asm"
INCLUDE "data/pokemon/base_stats/dratini.asm"
INCLUDE "data/pokemon/base_stats/dragonair.asm"
INCLUDE "data/pokemon/base_stats/dragonite.asm"
INCLUDE "data/pokemon/base_stats/glaceon.asm"
INCLUDE "data/pokemon/base_stats/leafeon.asm"
INCLUDE "data/pokemon/base_stats/rowlet.asm"
INCLUDE "data/pokemon/base_stats/dartrix.asm"
INCLUDE "data/pokemon/base_stats/decidueye.asm"
INCLUDE "data/pokemon/base_stats/chimchar.asm"
INCLUDE "data/pokemon/base_stats/monferno.asm"
INCLUDE "data/pokemon/base_stats/infernape.asm"
INCLUDE "data/pokemon/base_stats/oshawott.asm"
INCLUDE "data/pokemon/base_stats/dewott.asm"
INCLUDE "data/pokemon/base_stats/samurott.asm"
INCLUDE "data/pokemon/base_stats/yamask.asm"
INCLUDE "data/pokemon/base_stats/cofagrigus.asm"
INCLUDE "data/pokemon/base_stats/phantump.asm"
INCLUDE "data/pokemon/base_stats/trevenant.asm"
INCLUDE "data/pokemon/base_stats/drilbur.asm"
INCLUDE "data/pokemon/base_stats/excadrill.asm"
INCLUDE "data/pokemon/base_stats/amaura.asm"
INCLUDE "data/pokemon/base_stats/aurorus.asm"
INCLUDE "data/pokemon/base_stats/budew.asm"
INCLUDE "data/pokemon/base_stats/roselia.asm"
INCLUDE "data/pokemon/base_stats/roserade.asm"
INCLUDE "data/pokemon/base_stats/pichu.asm"
INCLUDE "data/pokemon/base_stats/pikipek.asm"
INCLUDE "data/pokemon/base_stats/igglybuff.asm"
INCLUDE "data/pokemon/base_stats/togepi.asm"
INCLUDE "data/pokemon/base_stats/togetic.asm"
INCLUDE "data/pokemon/base_stats/swablu.asm"
INCLUDE "data/pokemon/base_stats/altaria.asm"
INCLUDE "data/pokemon/base_stats/mareep.asm"
INCLUDE "data/pokemon/base_stats/flaaffy.asm"
INCLUDE "data/pokemon/base_stats/ampharos.asm"
INCLUDE "data/pokemon/base_stats/bellossom.asm"
INCLUDE "data/pokemon/base_stats/marill.asm"
INCLUDE "data/pokemon/base_stats/azumarill.asm"
INCLUDE "data/pokemon/base_stats/trumbeak.asm"
INCLUDE "data/pokemon/base_stats/politoed.asm"
INCLUDE "data/pokemon/base_stats/makuhita.asm"
INCLUDE "data/pokemon/base_stats/hariyama.asm"
INCLUDE "data/pokemon/base_stats/riolu.asm"
INCLUDE "data/pokemon/base_stats/lucario.asm"
INCLUDE "data/pokemon/base_stats/lotad.asm"
INCLUDE "data/pokemon/base_stats/lombre.asm"
INCLUDE "data/pokemon/base_stats/ludicolo.asm"
INCLUDE "data/pokemon/base_stats/shuppet.asm"
INCLUDE "data/pokemon/base_stats/banette.asm"
INCLUDE "data/pokemon/base_stats/espeon.asm"
INCLUDE "data/pokemon/base_stats/umbreon.asm"
INCLUDE "data/pokemon/base_stats/murkrow.asm"
INCLUDE "data/pokemon/base_stats/slowking.asm"
INCLUDE "data/pokemon/base_stats/misdreavus.asm"
INCLUDE "data/pokemon/base_stats/unown.asm"
INCLUDE "data/pokemon/base_stats/helioptile.asm"
INCLUDE "data/pokemon/base_stats/heliolisk.asm"
INCLUDE "data/pokemon/base_stats/litleo.asm"
INCLUDE "data/pokemon/base_stats/pyroar.asm"
INCLUDE "data/pokemon/base_stats/dunsparce.asm"
INCLUDE "data/pokemon/base_stats/gligar.asm"
INCLUDE "data/pokemon/base_stats/steelix.asm"
INCLUDE "data/pokemon/base_stats/snubbull.asm"
INCLUDE "data/pokemon/base_stats/granbull.asm"
INCLUDE "data/pokemon/base_stats/qwilfish.asm"
INCLUDE "data/pokemon/base_stats/scizor.asm"
INCLUDE "data/pokemon/base_stats/shuckle.asm"
INCLUDE "data/pokemon/base_stats/heracross.asm"
INCLUDE "data/pokemon/base_stats/sneasel.asm"
INCLUDE "data/pokemon/base_stats/teddiursa.asm"
INCLUDE "data/pokemon/base_stats/ursaring.asm"
INCLUDE "data/pokemon/base_stats/slugma.asm"
INCLUDE "data/pokemon/base_stats/magcargo.asm"
INCLUDE "data/pokemon/base_stats/swinub.asm"
INCLUDE "data/pokemon/base_stats/piloswine.asm"
INCLUDE "data/pokemon/base_stats/corsola.asm"
INCLUDE "data/pokemon/base_stats/remoraid.asm"
INCLUDE "data/pokemon/base_stats/octillery.asm"
INCLUDE "data/pokemon/base_stats/delibird.asm"
INCLUDE "data/pokemon/base_stats/mantine.asm"
INCLUDE "data/pokemon/base_stats/skarmory.asm"
INCLUDE "data/pokemon/base_stats/houndour.asm"
INCLUDE "data/pokemon/base_stats/houndoom.asm"
INCLUDE "data/pokemon/base_stats/kingdra.asm"
INCLUDE "data/pokemon/base_stats/phanpy.asm"
INCLUDE "data/pokemon/base_stats/donphan.asm"
INCLUDE "data/pokemon/base_stats/porygon2.asm"
INCLUDE "data/pokemon/base_stats/stantler.asm"
INCLUDE "data/pokemon/base_stats/smeargle.asm"
INCLUDE "data/pokemon/base_stats/tyrogue.asm"
INCLUDE "data/pokemon/base_stats/hitmontop.asm"
INCLUDE "data/pokemon/base_stats/smoochum.asm"
INCLUDE "data/pokemon/base_stats/elekid.asm"
INCLUDE "data/pokemon/base_stats/magby.asm"
INCLUDE "data/pokemon/base_stats/miltank.asm"
INCLUDE "data/pokemon/base_stats/blissey.asm"
INCLUDE "data/pokemon/base_stats/raikou.asm"
INCLUDE "data/pokemon/base_stats/entei.asm"
INCLUDE "data/pokemon/base_stats/suicune.asm"
INCLUDE "data/pokemon/base_stats/larvitar.asm"
INCLUDE "data/pokemon/base_stats/pupitar.asm"
INCLUDE "data/pokemon/base_stats/tyranitar.asm"
INCLUDE "data/pokemon/base_stats/lugia.asm"
INCLUDE "data/pokemon/base_stats/ho_oh.asm"
INCLUDE "data/pokemon/base_stats/celebi.asm"
