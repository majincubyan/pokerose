	const_def 2 ; object constants

MapleLab_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MapleLabSign:
	jumptext MapleLabSignText

MapleLabSignText:
	text "Prof. Maple's"
	cont "Lab"
	done

MapleLab_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 10, 5, ELMS_LAB, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 12, 6, BGEVENT_READ, MapleLabSign

	db 0 ; object events
