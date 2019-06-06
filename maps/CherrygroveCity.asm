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
	moveobject SECUNDA_SHANNON, 10, 14
	appear SECUNDA_SHANNON
	applymovement SECUNDA_SHANNON, RivalStep
	special FadeOutMusic
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
	pause 30
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
	
SecundaCityPokecenterSign:
	jumpstd pokecentersign

SecundaCityMartSign:
	jumpstd martsign
	
SecundaCityCemetarySign:
	opentext
	writetext ToCemetaryText
	waitbutton
	closetext
	end

SecundaCityGymSign:
	opentext
	writetext SecundaGymSignText
	waitbutton
	closetext
	end
	
OldManScript:
	faceplayer
	opentext
	writetext OldManText
	waitbutton
	closetext
	end
	
SecundaTrainerScript:
	faceplayer
	opentext
	writetext ICameToBattleText
	waitbutton
	closetext
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
	
	para "The Timeless"
	line "Hamlet of the"
	cont "Forest"
	done

ToCemetaryText:
	text "North to Secunda"
	line "Cemetary"
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
	
	para "So, let's see how"
	line "good you are."
	done
	
RivalLossText:
	text "I expected as much"
	line "from you…"
	done
	
RivalWinText:
	text "Impressive…"
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
	line "have worked hard."

	para "One win doesn't"
	line "matter though."
	
	para "I'll get stronger"
	line "and become the"
	cont "Tsuji League"
	cont "Champion."
	
	para "<PLAYER>, you"
	line "should work harder"
	cont "if you want any"
	cont "hope to win."
	done

SecundaGymSignText:
	text "Secunda City"
	line "#mon Gym"
	cont "Leader: Whitney"
	
	para "The Incredibly"
	line "Beautiful Woman!"
	done
	
OldManText:
	text "The cemetary was"
	line "built to honor the"
	cont "lives of #mon"
	cont "and trainers."
	
	para "The city was built"
	line "years later as"
	
	para "more people wanted"
	line "to stay close to"
	
	para "their loved ones."
	done

ICameToBattleText:
	text "I heard there was"
	line "new leader at the"
	cont "gym from Johto."
	
	para "I went to battle"
	line "her, but all she"
	cont "wanted to do was"
	cont "redecorate."
	
	para "Is she really a"
	line "gym leader?"
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

	db 4 ; bg events
	bg_event 18, 10, BGEVENT_READ, SecundaCitySign
	bg_event 24,  9, BGEVENT_READ, SecundaCityMartSign
	bg_event 28,  9, BGEVENT_READ, SecundaCityPokecenterSign
	bg_event 21,  3, BGEVENT_READ, SecundaCityCemetarySign
	
	db 3 ; object events
	object_event 10, 11, SPRITE_SHANNON, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SecundaRivalScript, EVENT_NEL_LAB_OUTSIDE
	object_event 24, 11, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OldManScript, -1
	object_event 12,  7, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SecundaTrainerScript, -1
	