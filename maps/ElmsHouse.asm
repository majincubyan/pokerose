	const_def 2 ; object constants
	const ELMSHOUSE_ELMS_WIFE
	const ELMSHOUSE_ELMS_SON

ElmsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MapleDaughter:
	faceplayer
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iffalse .ParentsWorking
	checkevent EVENT_GOT_BERRY_FROM_MAPLE_HOUSE
	iftrue .ParentsWorking
	writetext YouGotAPokemonText
	buttonsound
	verbosegiveitem BERRY
	iffalse .NoRoom
	writetext BerriesHealText
	waitbutton
	setevent EVENT_GOT_BERRY_FROM_MAPLE_HOUSE
.ParentsWorking:
	writetext ParentsWorkingText
	waitbutton
.NoRoom:
	closetext
	end
	
MapleSon:
	jumptextfaceplayer ElmsSonText

ElmsHousePC:
	jumptext ElmsHousePCText

ElmsHouseBookshelf:
	jumpstd difficultbookshelf

YouGotAPokemonText:
	text "Oh, you got a"
	line "#mon from my"
	cont "sister?"
	
	para "Why don't you have"
	line "this then?"
	done

BerriesHealText:
	text "#mon can heal"
	line "themselves by"
	cont "eating berries."
	
	para "You can get them"
	line "from fruit trees"

	para "like the one just"
	line "outside!"
	done
	
ParentsWorkingText:
	text "My sister is"
	line "always working,"
	
	para "so I usually"
	line "watch my nephew."
	done
	
ElmsSonText:
	text "When I grow up,"
	line "I'm going to help"
	cont "my mom!"

	para "I'm going to be a"
	line "great #MON"
	cont "professor!"
	done

ElmsHousePCText:
	text "#mon. Why do"
	line "they migrate to"
	cont "Tsuji? "

	para "Is there a"
	line "relation to the"
	cont "ruins?"

	para "I want to know! I"
	line "will dedicate my"

	para "life to the study"
	line "of #mon!"

	para "…"

	para "It's a part of"
	line "Prof. Maple's "
	cont "research papers."
	done

ElmsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, MAPLE_LAB, 2
	warp_event  3,  7, MAPLE_LAB, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, ElmsHousePC
	bg_event  6,  1, BGEVENT_READ, ElmsHouseBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsHouseBookshelf

	db 2 ; object events
	object_event  1,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MapleDaughter, -1
	object_event  5,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MapleSon, -1
