	const_def 1 ; object constants
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
	moveobject FOREST_HUSBAND, 17, 15
PleaseHelpScript1:
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement FOREST_HUSBAND, ApprochPlayerMovement
	setscene SCENE_FOREST_NOTHING
	end

MapleHusbandScript:
	end

SomethingIsGoingOnScript:
	end

ApprochPlayerMovement:
	step LEFT
	step LEFT
	step LEFT
	step_end
	
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
	coord_event 13, 14, SCENE_FOREST_ETERNITY, PleaseHelpScript1
	coord_event 13, 15, SCENE_FOREST_ETERNITY, PleaseHelpScript2

	db 0 ; bg events

	db 2 ; object events
	object_event 17, 14, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MapleHusbandScript, -1
	object_event 7, 12, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SomethingIsGoingOnScript, -1
