	const_def 0 ; object constants

SecundaRuins1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks



SecundaRuins1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 35, 15, SECUNDA_FOREST, 3
	warp_event 35, 15, SECUNDA_FOREST, 4
	
	db 0 ; coord events
	
	db 0 ; bg events

	db 0 ; object events
