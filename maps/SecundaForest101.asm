	const_def 2 ; object constants
	const ROUTE101_ETERNAL
	const ROUTE101_ITEMBALL

SecundaForest101_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LostEternalPeon:
	faceplayer
	opentext
	writetext WhereIsEveryoneText
	waitbutton
	closetext
	end

AntidoteItemball:
	itemball ANTIDOTE

WhereIsEveryoneText:
	text "They said to meet"
	line "outside the forest"
	cont "but no one's here."
	
	para "Gah, where is"
	line "everyone!?"
	done

SecundaForest101_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 4, 12, SECUNDA_FOREST_GATE1, 1
	warp_event 4, 13, SECUNDA_FOREST_GATE1, 2
	
	db 0 ; coord events
	
	db 0 ; bg events

	db 2 ; object events
	object_event  9, 10, SPRITE_ETERNAL, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LostEternalPeon, -1
	object_event  2,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AntidoteItemball, EVENT_ROUTE_101_ANTIDOTES