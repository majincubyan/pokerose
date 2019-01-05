	const_def 0 ; object constants

SecundaForestGate1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks



SecundaForestGate1_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 9, 4, SECUNDA_FOREST_101, 1
	warp_event 9, 5, SECUNDA_FOREST_101, 2
	warp_event 0, 4, SECUNDA_FOREST, 1
	warp_event 0, 5, SECUNDA_FOREST, 2
	
	db 0 ; coord events
	
	db 0 ; bg events

	db 0 ; object events
