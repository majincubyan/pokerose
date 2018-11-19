	const_def 2 ; object constants
	const ROUTE29_POKE_BALL

Route29_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

Route29Potion:
	itemball POTION

Route29_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 6, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route29Potion, EVENT_ROUTE_29_POTION
