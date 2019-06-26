	const_def 0 ; object constants


Route103_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


Route103_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 11, 5, ROUTE_102, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
