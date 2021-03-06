	const_def 2 ; object constants
	const CHERRYGROVEMART_CLERK
	const CHERRYGROVEMART_COOLTRAINER_M
	const CHERRYGROVEMART_YOUNGSTER

CherrygroveMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CherrygroveMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE_DEX
	closetext
	end

CherrygroveMartCooltrainerMScript:
	faceplayer
	opentext
	writetext AboutMartATM_Text
	waitbutton
	closetext
	end

CherrygroveMartYoungsterScript:
	jumptextfaceplayer CherrygroveMartYoungsterText



CherrygroveMartYoungsterText:
	text "When I was walking"
	line "in the grass, a"

	para "bug #mon"
	line "poisoned mine!"

	para "I just kept going"
	line "and it barely"
	
	para "survived the"
	line "the poisoning."

	para "You should keep an"
	line "Antidote with you."
	done
	
AboutMartATM_Text:
	text "Every #mart has"
	line "an ATM in it."
	
	para "You can open an"
	line "account on the"
	cont "spot and start" 
	cont "saving!"
	done
	
ATMScript:
	jumpstd martatm

CherrygroveMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SECUNDA_CITY, 1
	warp_event  3,  7, SECUNDA_CITY, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 3, 1, BGEVENT_READ, ATMScript
	
	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveMartClerkScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveMartCooltrainerMScript, -1
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveMartYoungsterScript, -1
