	const_def 2 ; object constants
	const FOREST_HUSBAND
	const FOREST_NURSE

SecundaForest_MapScripts:
	db 2 ; scene scripts
	scene_script .Nothing1 ; SCENE_FOREST_ETERNITY
	scene_script .Nothing2; SCENE_FOREST_NOTHING
	
	db 0 ; callbacks

.Nothing1:
	end

.Nothing2:
	end

PleaseHelpScript2:
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement FOREST_HUSBAND, ApprochPlayerMovement2
	turnobject PLAYER, UP
	setscene SCENE_FOREST_NOTHING
	setmapscene SECUNDA_RUINS_1F, SCENE_RUINS_ETERNAL_TAKEOVER
	opentext
	writetext YouMustBeText
	waitbutton
	turnobject FOREST_HUSBAND, RIGHT
	writetext SomeWeirdosTookOverText
	waitbutton
	turnobject FOREST_HUSBAND, DOWN
	writetext YouGottaTakeCareOfText
	waitbutton
	closetext
	end
	
PleaseHelpScript1:
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement FOREST_HUSBAND, ApprochPlayerMovement
	setscene SCENE_FOREST_NOTHING
	setmapscene SECUNDA_RUINS_1F, SCENE_RUINS_ETERNAL_TAKEOVER
	opentext
	writetext YouMustBeText
	waitbutton
	turnobject FOREST_HUSBAND, RIGHT
	writetext SomeWeirdosTookOverText
	waitbutton
	turnobject FOREST_HUSBAND, LEFT
	writetext YouGottaTakeCareOfText
	waitbutton
	closetext
	end

MapleHusbandScript:
	faceplayer
	opentext
	writetext ImCountingOnYouText
	waitbutton
	closetext
	end

SomethingIsGoingOnScript:
	opentext
	writetext SomethingIsGoingOnText
	yesorno
	iffalse .Done
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special StubbedTrainerRankings_Healings
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
.Done:
	closetext
	end

ApprochPlayerMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

ApprochPlayerMovement2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end
	
YouMustBeText:
	text "Oh, you must be"
	line "<PLAYER>."
	
	para "My wife said you'd"
	line "be by with the"
	cont "Stone Tablet."
	
	para "But that doesn't"
	line "even matter now!"
	done
	
SomeWeirdosTookOverText:
	text "I was in the ruins"
	line "when some weirdos"
	cont "came barging in"
	cont "and drove me out!"
	
	para "They were spouting"
	line "this nonsense"
	cont "about the ruins"
	
	para "belonging to Team"
	line "Eternal!"
	done
	
YouGottaTakeCareOfText:
	text "The ruins are just"
	line "ahead!"
	
	para "You and your"
	line "#mon have to"
	cont "get rid of those"
	cont "creeps for me!"
	done

ImCountingOnYouText:
	text "I'm not very good"
	line "at battling."
	
	para "Please, <PLAYER>!"
	
	para "I'm counting on you"
	line "to take care of"
	cont "those creeps!"
	done
	
SomethingIsGoingOnText:
	text "I heard some"
	line "shouting while I"
	
	para "was picking herbs"
	line "for the #mon"
	cont "Center."
	
	para "Could you please"
	line "go check it out"
	cont "for me?"
	
	para "I can heal your"
	line "#mon for you."
	done

SecundaForest_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 13, 30, SECUNDA_FOREST_GATE1, 3
	warp_event 13, 31, SECUNDA_FOREST_GATE1, 4
	warp_event 15,  5, SECUNDA_RUINS_1F, 1
	warp_event 16,  5, SECUNDA_RUINS_1F, 2
	warp_event  4,  6, SECUNDA_FOREST_GATE2, 3
	warp_event  4,  7, SECUNDA_FOREST_GATE2, 4
	
	db 2 ; coord events
	coord_event 12, 14, SCENE_FOREST_ETERNITY, PleaseHelpScript1
	coord_event 12, 15, SCENE_FOREST_ETERNITY, PleaseHelpScript2

	db 0 ; bg events

	db 2 ; object events
	object_event 17, 14, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MapleHusbandScript, EVENT_BEAT_RUINS_ADMIN
	object_event  7, 12, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SomethingIsGoingOnScript, EVENT_BEAT_RUINS_ADMIN
