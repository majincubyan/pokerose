	const_def 2 ; object constants
	const MINUTTOWN_TEACHER
	const MINUTTOWN_FISHER
	const MINUTTOWN_RIVAL


NewBarkTown_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_NEW_BARK
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	return

MINUTTOWN_TeacherStopsYouScene1:
	playmusic MUSIC_MOBILE_ADAPTER_MENU
	showemote EMOTE_SHOCK, MINUTTOWN_RIVAL, 15
	applymovement MINUTTOWN_RIVAL, Movement_TeacherRunsToYou1_NBT
	opentext
	writetext Text_WhatDoYouThinkYoureDoing
	waitbutton
	closetext
	showemote EMOTE_SHOCK, MINUTTOWN_RIVAL, 15
	pause 10
	opentext
	writetext Text_MeetMaple
	waitbutton
	closetext
	turnobject MINUTTOWN_RIVAL, DOWN
	applymovement MINUTTOWN_RIVAL, Movement_TeacherBringsYouBack2_NBT
	disappear MINUTTOWN_RIVAL
	setevent EVENT_NEL_MINUT_TOWN
	clearevent EVENT_NEL_IN_ELMS_LAB
	special RestartMapMusic
	setscene SCENE_FINISHED
	setmapscene ROUTE_29, SCENE_ROUTE101_GUY
	end


MINUTTOWNTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_ATM_FIRST_TIME
	iftrue .CallMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .TellMomYoureLeaving
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .MonIsAdorable
	writetext Text_GearIsImpressive
	waitbutton
	closetext
	end

.MonIsAdorable:
	writetext Text_YourMonIsAdorable
	waitbutton
	closetext
	end

.TellMomYoureLeaving:
	writetext Text_TellMomIfLeaving
	waitbutton
	closetext
	end

.CallMom:
	writetext Text_CallMomOnGear
	waitbutton
	closetext
	end

MINUTTOWNFisherScript:
	jumptextfaceplayer Text_ElmDiscoveredNewMon

MINUTTOWNSilverScript:
	end
	
MineGuardScript:
	jumptextfaceplayer MineGuardText

MINUTTOWNSign:
	jumptext MINUTTOWNSignText

MINUTTOWNPlayersHouseSign:
	jumptext MINUTTOWNPlayersHouseSignText

MINUTTOWNElmsHouseSign:
	jumptext MINUTTOWNElmsHouseSignText

Movement_TeacherRunsToYou1_NBT:
	step UP
	step UP
	step UP
	step_end

Movement_TeacherBringsYouBack2_NBT:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

Text_GearIsImpressive:
	text "Hello, welcome to"
	line "Tsuji!"
	done

Text_WhatDoYouThinkYoureDoing:
	text "???: You must be"
	line "the new neighbor!"
	
	para "My name is Nel!"
	line "Nice to meetcha!"
	
	para "Nel: I hear you"
	line "moved here from"
	cont "Kalos right?"
	
	para "I know its"
	line "quieter here but"
	cont "don't let that fool"
	cont "you!"

	para "Theres so much to"
	line "explore and tons"
	cont "of #mon to meet" 
	cont "in Tsuji!"
	
	done

	
Text_MeetMaple:
	text "Oh, I know!"
	
	para "My brother and I"
	line "are getting our"
	cont "first #mon!"
	
	para "You should visit"
	line "Prof. Maple too!"
	
	para "Her lab is just"
	line "southeast of town."
	
	para "I'll meet you"
	line "there! See ya!"
	done


Text_YourMonIsAdorable:
	text "Oh! Your #MON"
	line "is adorable!"
	cont "I wish I had one!"
	done

Text_TellMomIfLeaving:
	text "Hi, <PLAY_G>!"
	line "Leaving again?"

	para "You should tell"
	line "your mom if you"
	cont "are leaving."
	done

Text_CallMomOnGear:
	text "Make sure you come"
	line "home sometimes."

	para "Sure your grandma"
	line "will worry."
	done

Text_ElmDiscoveredNewMon:
	text "I used to work"
	line "in the mine but I"
	cont "injured my back."
	done
	
MineGuardText:
	text "Sorry, but no"
	line "children are"
	
	para "allowed in the"
	line "mine."
	done

MINUTTOWNSignText:
	text "Minut Town"

	para "The Town Where the"
	line "Minutes of "
	cont "Adventure Begin"
	done

MINUTTOWNPlayersHouseSignText:
	text "<PLAYER>'s House"
	done

MINUTTOWNElmsHouseSignText:
	text "Nel and <RIVAL>'s"
	line "House"
	done

NewBarkTown_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 13,  5, PLAYERS_HOUSE_1F, 1
	warp_event 15, 11, PLAYERS_NEIGHBORS_HOUSE, 1
	warp_event 	3,  9, REDS_HOUSE_1F, 1

	db 1 ; coord events
	coord_event  13,  6, SCENE_DEFAULT, MINUTTOWN_TeacherStopsYouScene1

	db 3 ; bg events
	bg_event 11, 11, BGEVENT_READ, MINUTTOWNSign
	bg_event 14,  6, BGEVENT_READ, MINUTTOWNPlayersHouseSign
	bg_event  9, 13, BGEVENT_READ, MINUTTOWNElmsHouseSign

	db 4 ; object events
	object_event  10,  8, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MINUTTOWNTeacherScript, -1
	object_event   8, 12, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MINUTTOWNFisherScript, -1
	object_event  13, 10, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MINUTTOWNSilverScript, EVENT_NEL_MINUT_TOWN
	object_event   6,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MineGuardScript, -1
	