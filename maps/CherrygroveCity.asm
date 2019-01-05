	const_def 2 ; object constants
	const SECUNDA_SHANNON

CherrygroveCity_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_SECUNDACITY_NOTHING
	scene_script .DummyScene1 ; SCENE_SECUNDACITY_MEET_RIVAL

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_CHERRYGROVE
	return
	
SecundaCitySign:
	jumptext SecundaCitySignText
	
SecundaRivalScript:
	end

SecundaRivalBattle3:
	special FadeOutMusic
	moveobject SECUNDA_SHANNON, 10, 14
	appear SECUNDA_SHANNON
	applymovement SECUNDA_SHANNON, RivalStep
	pause 15
	playmusic MUSIC_RIVAL_ENCOUNTER
	showemote EMOTE_SHOCK, SECUNDA_SHANNON, 15
	turnobject SECUNDA_SHANNON, RIGHT
	turnobject PLAYER, LEFT
	applymovement SECUNDA_SHANNON, RivalApproch
	opentext
	writetext RivalMyNameIsText
	waitbutton
	special NameRival
	writetext RivalNameText
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile3
	checkevent EVENT_GOT_ROWLET_FROM_ELM
	iftrue .Chikorita3
	setevent EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	winlosstext RivalWinText, RivalLossText
	setlasttalked SECUNDA_SHANNON
	loadtrainer RIVAL2, RIVAL2_1_TOTODILE
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterYourDefeat3
	jump .AfterVictorious3

.Totodile3:
	setevent EVENT_ROWLET_POKEBALL_IN_ELMS_LAB
	winlosstext RivalWinText, RivalLossText
	setlasttalked SECUNDA_SHANNON
	loadtrainer RIVAL2, RIVAL2_1_ROWLET
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterYourDefeat3
	jump .AfterVictorious3

.Chikorita3:
	setevent EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	winlosstext RivalWinText, RivalLossText
	setlasttalked SECUNDA_SHANNON
	loadtrainer RIVAL2, RIVAL2_1_CYNDAQUIL
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterYourDefeat3
	jump .AfterVictorious3

.AfterVictorious3:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext RivalText_YouWon
	waitbutton
	closetext
	jump .FinishRival3

.AfterYourDefeat3:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext RivalText_YouLost
	waitbutton
	closetext
.FinishRival3:
	applymovement PLAYER, PlayerMovesUp
	turnobject PLAYER, DOWN
	applymovement SECUNDA_SHANNON,RivalLeaves
	applymovement PLAYER, PlayerMovesBackDown
	disappear SECUNDA_SHANNON
	setmapscene CHERRYGROVE_CITY, SCENE_SECUNDACITY_NOTHING
	special HealParty
	playmapmusic
	end

	
SecundaRivalBattle2:
	special FadeOutMusic
	moveobject SECUNDA_SHANNON, 10, 14
	appear SECUNDA_SHANNON
	special FadeOutMusic
	pause 15
	showemote EMOTE_SHOCK, SECUNDA_SHANNON, 15
	playmusic MUSIC_RIVAL_ENCOUNTER
	turnobject SECUNDA_SHANNON, RIGHT
	turnobject PLAYER, LEFT
	applymovement SECUNDA_SHANNON, RivalApproch
	opentext
	writetext RivalMyNameIsText
	waitbutton
	special NameRival
	writetext RivalNameText
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_ROWLET_FROM_ELM
	iftrue .Chikorita
	setevent EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	winlosstext RivalWinText, RivalLossText
	setlasttalked SECUNDA_SHANNON
	loadtrainer RIVAL2, RIVAL2_1_TOTODILE
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterYourDefeat
	jump .AfterVictorious

.Totodile:
	setevent EVENT_ROWLET_POKEBALL_IN_ELMS_LAB
	winlosstext RivalWinText, RivalLossText
	setlasttalked SECUNDA_SHANNON
	loadtrainer RIVAL2, RIVAL2_1_ROWLET
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterYourDefeat
	jump .AfterVictorious

.Chikorita:
	setevent EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	winlosstext RivalWinText, RivalLossText
	setlasttalked SECUNDA_SHANNON
	loadtrainer RIVAL2, RIVAL2_1_CYNDAQUIL
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterYourDefeat
	jump .AfterVictorious

.AfterVictorious:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext RivalText_YouWon
	waitbutton
	closetext
	jump .FinishRival

.AfterYourDefeat:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext RivalText_YouLost
	waitbutton
	closetext
.FinishRival:
	applymovement PLAYER, PlayerMovesUp
	turnobject PLAYER, DOWN
	applymovement SECUNDA_SHANNON,RivalLeaves
	applymovement PLAYER, PlayerMovesBackDown
	disappear SECUNDA_SHANNON
	setmapscene CHERRYGROVE_CITY, SCENE_SECUNDACITY_NOTHING
	special HealParty
	playmapmusic
	end


;==========MOVEMENT====================
	
RivalStep:
	step DOWN
	step_end

RivalLeaves:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end
	
PlayerMovesUp:
	step UP
	step_end
	
PlayerMovesBackDown:
	step DOWN
	step_end

RivalApproch:
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

;============TEXT======================	

SecundaCitySignText:
	text "Secunda City"
	
	para "The timeless"
	line "hamlet of the"
	cont "forest."
	done

RivalMyNameIsText:
	text "<……><……><……>"
	line "<……><……><……>"
	
	para "???: You must be"
	line "<PLAYER>."
	
	para "I heard from my"
	line "brother, Nel, you"
	cont "got a #mon."
	
	para "My name is…"
	done

RivalNameText:
	text "<RIVAL>."
	
	para "So let's how good"
	line "you are."
	done
	
RivalLossText:
	text "I expected as much"
	line "from you…"
	done
	
RivalWinText:
	text "You look pretty"
	line "pleased…"
	done
	
RivalText_YouWon:
	text "You're better than"
	line "I thought."
	
	para "One loss doesn't"
	line "matter though."
	
	para "I'll get stronger"
	line "and become the"
	cont "Tsuji League"
	cont "Champion."
	
	para "<PLAYER>, it"
	line "won't be the same"
	cont "next time."
	done

RivalText_YouLost:
	text "My #mon and I"
	line "trained hard."

	para "One win doesn't"
	line "matter though."
	
	para "I'll get stronger"
	line "and become the"
	cont "Tsuji League"
	cont "Champion."
	
	para "<PLAYER>, you"
	line "should work harder"
	cont "if you want to win."
	done

CherrygroveCity_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 23,  9, CHERRYGROVE_MART, 2
	warp_event 27,  9, CHERRYGROVE_POKECENTER_1F, 1
	warp_event 31, 10, SECUNDA_FOREST_GATE2, 1
	warp_event 31, 11, SECUNDA_FOREST_GATE2, 2
	warp_event 10, 13, SECUNDA_GYM, 1

	db 2 ; coord events
	coord_event 14, 14, SCENE_SECUNDACITY_MEET_RIVAL, SecundaRivalBattle2
	coord_event 14, 15, SCENE_SECUNDACITY_MEET_RIVAL, SecundaRivalBattle3

	db 1 ; bg events
	bg_event 21,  9, BGEVENT_READ, SecundaCitySign

	
	db 1 ; object events
	object_event 10, 11, SPRITE_SHANNON, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SecundaRivalScript, EVENT_NEL_LAB_OUTSIDE
