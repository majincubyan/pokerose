	const_def 2 ; object constants
	const RUINS_PEON1
	const RUINS_PEON2
	const RUINS_PEON3
	const RUINS_HEADPEON

SecundaRuins1F_MapScripts:
	db 2 ; scene scripts
	scene_script .Dummy0 ; SCENE_RUINS_NOTHING
	scene_script .Dummy0 ; SCENE_RUINS_ETERNAL_TAKEOVER
	
	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .ClearRocks
	

.Dummy0:
	end
	
.ClearRocks:
	checkevent EVENT_RUINS_1F_ROCKS_CLEARED
	iffalse .DoNothing
	changeblock 18, 20, $01 ;floor
	changeblock 20, 20, $12 ;floor
.DoNothing:
	return
	
RuinsEternalPeon1:
	trainer GRUNTM, PEONM_1, EVENT_BEAT_ETERNAL_PEONM_1, Peon1SeenText, Peon1BeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext Peon1AfterText
	waitbutton
	closetext
	end

RuinsEternalPeon2:
	trainer GRUNTM, PEONM_2, EVENT_BEAT_ETERNAL_PEONM_2, Peon2SeenText, Peon2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Peon2AfterText
	waitbutton
	closetext
	end
	
RuinsEternalPeon3:
	trainer GRUNTF, PEONF_1, EVENT_BEAT_ETERNAL_PEONF_1, Peon3SeenText, Peon3BeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext Peon3AfterText
	waitbutton
	closetext
	end

PlayerWalksScript2:
	applymovement PLAYER, PlayerWalksLeft
PlayerWalksScript1:
	applymovement PLAYER, PlayerWalksUp
	turnobject PLAYER, RIGHT
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, RUINS_HEADPEON, 15
	turnobject RUINS_HEADPEON, LEFT
	opentext
	writetext HeadPeonSeenText
	waitbutton
	closetext
	winlosstext HeadPeonBeatenText, HeadPeonSeenText
	setlasttalked RUINS_HEADPEON
	loadtrainer GRUNTM, PEONM_3
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_RUINS_ADMIN
	opentext
	writetext HeadPeonAfterText
	waitbutton
	closetext
	special FadeBlackQuickly
	pause 30
	special FadeInQuickly
	opentext
	writetext TheAirIsHeavyText
	waitbutton
	closetext
HeadPeonScript:
	end

; Movement

PlayerWalksUp:
	step UP
	step UP
	step UP
	step_end

PlayerWalksLeft:
	step LEFT
	step_end

; Text

Peon1SeenText:
	text "Like we told that"
	line "other guy;"
	
	para "The ruins belong"
	line "to Team Eternal!"
	done
	
Peon1BeatenText:
	text "What!? You little"
	line "sneak!"
	done
	
Peon1AfterText:
	text "You really wanna"
	line "stand against us?"
	done
	
Peon2SeenText:
	text "Once we learn the"
	line "secrets of the"
	cont "ruins, our true"
	
	para "plans can truly"
	line "begin."
	done
	
Peon2BeatenText:
	text "Oh no, the plan!"
	done
	
Peon2AfterText:
	text "Should have been"
	line "focused on the"
	cont "here and now."
	done
	
Peon3SeenText:
	text "What gives you"
	line "the right to just"
	cont "barge in here?!"
	done
	
Peon3BeatenText:
	text "I can't believe"
	line "this happened!"
	done
	
Peon3AfterText:
	text "Grrr… You'll get"
	line "yours, punk…"
	done
	
HeadPeonSeenText:
	text "Orders came from"
	line "the Admins to"
	cont "secure the ruins."
	
	para "This is as far as"
	line "you go, child."
	done
	
HeadPeonBeatenText:
	text "I have to report"
	line "this right away!"
	done
	
HeadPeonAfterText:
	text "We'll retreat for"
	line "now. But I assure"
	cont "you, we will take"
	cont "back the ruins…"
	done
	
TheAirIsHeavyText:
	text "The air feels"
	line "strangely heavy…"
	done
	
HusbandThanksText:
	text "<PLAYER>!"
	line "You're amazing!"
	
	para "You chased out all"
	line "those creeps out"
	cont "alone."
	
	para "You have real"
	line "talent. You ought"
	
	para "to try for the"
	line "Tsuji League!"
	
	para "The closest gym"
	line "is in Secunda"
	cont "City."
	
	para "I'll have my wife"
	line "let your family"
	cont "know, so go on!"
	
	para "But first, let me"
	line "get that tablet"
	cont "from you."
	done

HusbandGreatHelpText:
	text "You're a great"
	line "help, <PLAYER>!"
	
	para "Oh, something else"
	line "happened?"
	
	para "<……><……><……>"
	line "<……><……><……>"
	done
	
CelebiGaveThisText:
	text "WHAT!?"
	
	para "Y-you… You saw"
	line "Celebi?!"
	
	para "That's incredible!"
	
	para "These ruins were"
	line "built to honor"
	cont "Celebi, so it"
	
	para "makes sense but"
	line "thats amazing!"
	
	para "And you say this"
	line "was given to you"
	cont "by Celebi?"
	
	para "I can't say what"
	line "what it for, but"
	
	para "you should keep"
	line "it for now."
	
	para "Perhaps our work"
	line "here will shed"
	cont "some light on it."
	done
	
HandedStoneTabletText:
	text "<PLAYER> handed"
	line "over the Stone"
	cont "Tablet."
	done
	
HusbandWorkingText:
	text "<……><……><……>"
	line "<……><……><……>"
	
	para "He doesn't seem"
	line "to notice you…"
	done

CelebiPlacesInHandText:
	text "Something floats"
	line "down from Celebi."
	done

SecundaRuins1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 26, 11, SECUNDA_FOREST, 3
	warp_event 27, 11, SECUNDA_FOREST, 4
	
	db 0 ; coord events
	
	db 0 ; bg events

	db 4 ; object events
	object_event 25,  6, SPRITE_ETERNAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, RuinsEternalPeon1, EVENT_BEAT_RUINS_ADMIN
	object_event 16, 15, SPRITE_ETERNAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, RuinsEternalPeon2, EVENT_BEAT_RUINS_ADMIN
	object_event  4, 16, SPRITE_ETERNAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, RuinsEternalPeon3, EVENT_BEAT_RUINS_ADMIN
	object_event  5,  4, SPRITE_ETERNAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HeadPeonScript, EVENT_BEAT_RUINS_ADMIN
	