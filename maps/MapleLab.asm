	const_def 2 ; object constants
	const LAB_NEL
	const LAB_FRUITTREE

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
	writetext NelMapleForgotText
	waitbutton
	buttonsound
	itemtotext POKE_BALL, MEM_BUFFER_1
	scall PlayerReceiveTheBalls
	giveitem POKE_BALL, 10
	writetext NelExplainBalls
	buttonsound
	itemnotify
	writetext NelLetsBattleText
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_ROWLET_FROM_ELM
	iftrue .Chikorita
	setevent EVENT_ROWLET_POKEBALL_IN_ELMS_LAB
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
	setevent EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
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
	setevent EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
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
	setevent EVENT_NEL_IN_ELMS_LAB
	setscene SCENE_LAB_OUTSIDE_NOTHING
	setmapscene ROUTE_29, SCENE_ROUTE101_NOTHING
	setmapscene CHERRYGROVE_CITY, SCENE_SECUNDACITY_MEET_RIVAL
	setmapscene SECUNDA_FOREST, SCENE_FOREST_ETERNITY
	special HealParty
	playmapmusic
	end
	
MapleLabSign:
	jumptext MapleLabSignText
	
MapleLabFruitTree:
	fruittree FRUITTREE_ROUTE_29
	
PlayerReceiveTheBalls:
	jumpstd receiveitem
	end

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
	
NelMapleForgotText:
	text "Nel: One sec!"
	line "Prof. Maple forgot"
	cont "to give you these."
	done

NelExplainBalls:
	text "Have your #mon"
	line "battle wild"
	
	para "#mon to weaken"
	line "'em and then throw"
	cont "your # Ball!"
	done
	
NelLetsBattleText:
	text "Oh yeah, I decided"
	line "on a #mon!"
	
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

	db 2 ; warp events
	warp_event 10, 5, ELMS_LAB, 1
	warp_event 13, 9, ELMS_HOUSE, 1

	db 2 ; coord events
	coord_event 4, 10, SCENE_LAB_OUTSIDE_BATTLE, NelApprochScript1
	coord_event 4, 11, SCENE_LAB_OUTSIDE_BATTLE, NelApprochScript2

	db 1 ; bg events
	bg_event 12, 6, BGEVENT_READ, MapleLabSign

	db 2 ; object events
	object_event 10, 10, SPRITE_SILVER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_NEL_LAB_OUTSIDE
	object_event 15, 10, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MapleLabFruitTree, -1
	