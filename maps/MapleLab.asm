	const_def 2 ; object constants
	const LAB_NEL

MapleLab_MapScripts:
	db 2 ; scene scripts
	scene_script .nothing ; SCENE_LAB_OUTSIDE_NOTHING
	scene_script .nothing ; SCENE_LAB_OUTSIDE_BATTLE

	db 0 ; callbacks

.nothing:
	end

NelApprochScript2:
	moveobject LAB_NEL, 10, 11
NelApprochScript1:
	special FadeOutMusic
	pause 15
	playmusic MUSIC_MOBILE_ADAPTER_MENU
	opentext
	writetext NelCallsOutText
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	appear LAB_NEL
	turnobject PLAYER, RIGHT
	applymovement LAB_NEL, NelApproch1
	opentext
	writetext NelLetsBattleText
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_ROWLET_FROM_ELM
	iftrue .Chikorita
	winlosstext NelLabWinText, NelLabLossText
	setlasttalked LAB_NEL
	loadtrainer RIVAL1, RIVAL1_1_ROWLET
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterYourDefeat
	jump .AfterVictorious

.Totodile:
	winlosstext NelLabWinText, NelLabLossText
	setlasttalked LAB_NEL
	loadtrainer RIVAL1, RIVAL1_1_CYNDAQUIL
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterYourDefeat
	jump .AfterVictorious

.Chikorita:
	winlosstext NelLabWinText, NelLabLossText
	setlasttalked LAB_NEL
	loadtrainer RIVAL1, RIVAL1_1_TOTODILE
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterYourDefeat
	jump .AfterVictorious

.AfterVictorious:
	playmusic MUSIC_MOBILE_ADAPTER_MENU
	opentext
	writetext NelLabText_YouWon
	waitbutton
	closetext
	jump .FinishRival

.AfterYourDefeat:
	playmusic MUSIC_MOBILE_ADAPTER_MENU
	opentext
	writetext NelLabText_YouLost
	waitbutton
	closetext
.FinishRival:
	applymovement PLAYER, PlayerMovesDown
	turnobject PLAYER, LEFT
	applymovement LAB_NEL, NelLeaves
	applymovement PLAYER, PlayerMovesBack
	disappear LAB_NEL
	setscene SCENE_LAB_OUTSIDE_NOTHING
	setmapscene ROUTE_29, SCENE_ROUTE101_NOTHING
	special HealParty
	playmapmusic
	end
	
MapleLabSign:
	jumptext MapleLabSignText

NelApproch1:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
NelApproch2:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
NelLeaves:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end
	
PlayerMovesDown:
	step DOWN
	turn_head UP
	step_end
	
PlayerMovesBack:
	step UP
	turn_head LEFT
	step_end
	
NelCallsOutText:
	text "Hey, wait up!"
	done
	
NelLetsBattleText:
	text "Nel: I decided on"
	line "a #mon!"
	
	para "<PLAYER>, let's"
	line "have a battle!"
	done
	
MapleLabSignText:
	text "Prof. Maple's"
	line "Lab"
	done
	
NelLabWinText:
	text "Whoa! You're"
	line "pretty good!"
	done

NelLabText_YouLost:
	text "Haha, guess I"
	line "picked the right"
	cont "#mon!"
	
	para "I'm heading home"
	line "quick to get a"
	cont "few things."
	
	para "Have fun in"
	line "Secunda Forest and"
	cont "keep an eye out"
	cont "for my bro!"
	
	para "See ya!"
	done

NelLabLossText:
	text "Yes!! Way to"
	line "go, buddy!"
	done

NelLabText_YouWon:
	text "Wow, you and your"
	line "#mon rock!"

	para "I'm heading home"
	line "quick to get a"
	cont "few things."
	
	para "Have fun in"
	line "Secunda Forest and"
	cont "keep an eye out"
	cont "for my bro!"
	
	para "See ya!"
	done

MapleLab_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 10, 5, ELMS_LAB, 1

	db 2 ; coord events
	coord_event 4, 10, SCENE_LAB_OUTSIDE_BATTLE, NelApprochScript1
	coord_event 4, 11, SCENE_LAB_OUTSIDE_BATTLE, NelApprochScript2

	db 1 ; bg events
	bg_event 12, 6, BGEVENT_READ, MapleLabSign

	db 1 ; object events
	object_event 10, 10, SPRITE_SILVER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_NEL_LAB_OUTSIDE