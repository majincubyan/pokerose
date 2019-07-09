	const_def 0 ; object constants


Route104Landing_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


Route104Landing_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 6, 18, ROUTE_104_WEST, 1
	
	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
