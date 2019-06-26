	const_def 0 ; object constants


Route102_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


Route102_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 55, 16, SECUNDA_CITY, 8
	warp_event 33, 19, ROUTE_103, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
