	const_def 0 ; object constants

SecundaForest_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks



SecundaForest_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 13, 30, SECUNDA_FOREST_GATE1, 3
	warp_event 13, 31, SECUNDA_FOREST_GATE1, 4
	warp_event 15,  5, SECUNDA_RUINS_1F, 1
	warp_event 16,  5, SECUNDA_RUINS_1F, 2
	warp_event  4,  6, SECUNDA_FOREST_GATE2, 3
	warp_event  4,  7, SECUNDA_FOREST_GATE2, 4
	
	db 0 ; coord events
	
	db 0 ; bg events

	db 0 ; object events
