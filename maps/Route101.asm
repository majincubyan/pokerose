	const_def 2 ; object constants
	const ROUTE101_POKE_BALL
	const ROUTE101_GUARD
	const ROUTE101_CLERK

Route101_MapScripts:
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
	turnobject ROUTE101_GUARD, LEFT
	end
	
SlowDown:
	showemote EMOTE_SHOCK, ROUTE101_GUARD, 15
	turnobject PLAYER, RIGHT
	opentext
	writetext SlowDownKid_Text
	waitbutton
	closetext
	applymovement PLAYER, ToMaple
	end
	
IWorkAtThePokeMart:
	checkevent EVENT_GOT_SAMPLE_ITEMS
	iftrue .ComeVisitUs
	faceplayer
	opentext
	writetext HereHaveASampleText
	waitbutton
	verbosegiveitem ANTIDOTE
	verbosegiveitem POTION
	setevent EVENT_GOT_SAMPLE_ITEMS
	writetext ExplainHealingKitText
	waitbutton
	closetext
	end
	
.ComeVisitUs:
	faceplayer
	opentext
	writetext PleaseVisitText
	waitbutton
	closetext
	end
	
Route29Potion:
	itemball TM_ENDURE
	
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

HereHaveASampleText:
	text "Hey there! I"
	line "work at the #"
	
	para "Mart in Secunda"
	line "City."
	
	para "We're not too"
	line "far from here,"
	cont "so stop by!"
	
	para "In fact, here"
	line "take these as a"
	cont "free sample!"
	done
	
ExplainHealingKitText:
	text "We got plenty more"
	line "of those, so make"
	cont "sure you visit!"
	done

PleaseVisitText:
	text "Please visit us"
	line "sometime!"
	done

Route101_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 2 ; coord events
	coord_event 12, 19, SCENE_ROUTE101_GUY, SlowDown
	coord_event 13, 19, SCENE_ROUTE101_GUY, SlowDown
	
	db 0 ; bg events

	db 3 ; object events
	object_event  6, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route29Potion, EVENT_ROUTE_29_POTION
	object_event 14, 19, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, StandingGuy, -1
	object_event  9, 44, SPRITE_CLERK, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IWorkAtThePokeMart, -1
