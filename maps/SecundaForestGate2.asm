	const_def 2 ; object constants
	const GATE2_OFFICER
	const GATE2_COOLTRAINER_F

SecundaForestGate2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SecundaForestGate2OfficerScript:
	jumptextfaceplayer SecundaForestGate2OfficerText

SecundaForestGate2CooltrainerFScript:
	jumptextfaceplayer SecundaForestGate2CooltrainerFText

SecundaForestGate2OfficerText:
	text "Hi there!"
	line "Did you visit"
	cont "the ruins?"
	done

SecundaForestGate2CooltrainerFText:
	text "I came too far"
	line "out. I'd better"
	cont "phone home!"
	done

SecundaForestGate2_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, CHERRYGROVE_CITY, 3
	warp_event  0,  5, CHERRYGROVE_CITY, 4
	warp_event  9,  4, SECUNDA_FOREST, 5
	warp_event  9,  5, SECUNDA_FOREST, 6

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SecundaForestGate2OfficerScript, -1
	object_event  1,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SecundaForestGate2CooltrainerFScript, -1
