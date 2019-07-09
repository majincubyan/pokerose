	const_def 0 ; object constants


Route104West_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


Route104West_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 45, 10, ROUTE_104_LANDING, 1
	
	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
