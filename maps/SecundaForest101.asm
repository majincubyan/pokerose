	const_def 0 ; object constants

SecundaForest101_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks



SecundaForest101_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 4, 12, SECUNDA_FOREST_GATE1, 1
	warp_event 4, 13, SECUNDA_FOREST_GATE1, 2
	
	db 0 ; coord events
	
	db 0 ; bg events

	db 0 ; object events
