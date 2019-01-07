RedsHouse2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RedsHouse2FN64Script:
	jumptext RedsHouse2FN64Text

RedsHouse2FPCScript:
	jumptext RedsHouse2FPCText
	
DresserScript:
	jumptext FilledWithPokedollsText
	
TrainerBooksScript:
	jumptext TrainerBooksText

RedsHouse2FN64Text:
	text "<PLAYER> played the"
	line "N64."

	para "Better get going--"
	line "no time to lose!"
	done

RedsHouse2FPCText:
	text "Booted up PC…"
	
	para "<……><……><……>"
	line "<……><……><……>"
	
	para "Wait! You need a"
	line "password to login!"
	done
	
FilledWithPokedollsText:
	text "The drawers are"
	line "stuffed full of"
	cont "#mon toys!"
	done

TrainerBooksText:
	text "There are lots of"
	line "books on #mon"
	cont "typing and"
	cont "strategy!"
	done

RedsHouse2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  0, REDS_HOUSE_1F, 3

	db 0 ; coord events

	db 4 ; bg events
	bg_event  3,  5, BGEVENT_READ, RedsHouse2FN64Script
	bg_event  0,  1, BGEVENT_READ, RedsHouse2FPCScript
	bg_event  1,  6, BGEVENT_READ, DresserScript
	bg_event  6,  6, BGEVENT_READ, TrainerBooksScript
	
	db 0 ; object events
