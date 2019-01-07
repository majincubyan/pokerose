	const_def 2 ; object constants
	const CEMETARY_SHUPPET

SecundaCemetary_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Shuppet

.Shuppet:
	checkflag ENGINE_UNION_CAVE_LAPRAS
	iftrue .NoAppear
	checkcode VAR_WEEKDAY
	ifequal FRIDAY, .CheckTime
.CheckTime:
	checkcode VAR_TIMEOFDAY
	ifequal NITE_F, .Appear
.NoAppear:
	disappear CEMETARY_SHUPPET
	return

.Appear:
	appear CEMETARY_SHUPPET
	return

ShuppetScript:
	faceplayer
	cry WOOPER
	loadwildmon WOOPER, 20
	startbattle
	disappear CEMETARY_SHUPPET
	setflag ENGINE_UNION_CAVE_LAPRAS
	reloadmapafterbattle
	end

SecundaCemetary_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events
	
	db 0 ; coord events
	
	db 0 ; bg events

	db 1 ; object events
	object_event 4, 5, SPRITE_SHUPPET, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ShuppetScript, EVENT_UNION_CAVE_B2F_LAPRAS