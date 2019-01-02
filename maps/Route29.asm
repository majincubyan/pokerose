	const_def 3 ; object constants
	const ROUTE29_POKE_BALL
	const ROUTE29_GUARD
	const ROUTE29_SILVER

Route29_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE101_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE101_GUY
	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end
	


StandingGuy:
	opentext
	writetext WaitingForGF_Text
	waitbutton
	closetext
	turnobject ROUTE29_GUARD, LEFT
	end
	
SlowDown2:
	showemote EMOTE_SHOCK, ROUTE29_GUARD, 15
	turnobject PLAYER, RIGHT
	applymovement ROUTE29_GUARD, StepToPlayer
	opentext
	writetext SlowDownKid_Text
	waitbutton
	closetext
	applymovement ROUTE29_GUARD, StepBack
	applymovement PLAYER, ToMaple
	end

SlowDown1:
	showemote EMOTE_SHOCK, ROUTE29_GUARD, 15
	turnobject PLAYER, RIGHT
	opentext
	writetext SlowDownKid_Text
	waitbutton
	closetext
	applymovement PLAYER, ToMaple
	end
	
Route29Potion:
	itemball POTION
	
StepToPlayer:
	step LEFT
	step_end

StepBack:
	step RIGHT
	turn_head LEFT
	step_end
	
ToMaple:
	step UP
	step UP
	step_end
	
SlowDownKid_Text:
	text "Whoa, slow down"
	line "there kid!"
	
	para "Wild #mon"
	line "are that way."
	
	para "Without a #mon"
	line "of your own, its"
	cont "way too dangerous!"
	done
	
WaitingForGF_Text:
	text "I'm waiting for"
	line "my girlfriend."
	
	para "<……><……><……>"
	
	para "I might be here"
	line "awhile…"
	done


Route29_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 2 ; coord events
	coord_event 12, 19, SCENE_ROUTE101_GUY, SlowDown2
	coord_event 13, 19, SCENE_ROUTE101_GUY, SlowDown1
	
	db 0 ; bg events

	db 2 ; object events
	object_event  6, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route29Potion, EVENT_ROUTE_29_POTION
	object_event 14, 19, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, StandingGuy, -1
	