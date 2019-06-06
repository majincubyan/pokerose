	const_def 2 ; object constants
	const RUINS_PEON1
	const RUINS_PEON2
	const RUINS_PEON3
	const RUINS_HEADPEON
	const RUINS_CELEBI
	const RUINS_HUSBAND

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
	moveobject RUINS_HUSBAND, 5, 9
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
	setscene SCENE_RUINS_NOTHING
	opentext
	writetext HeadPeonAfterText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear RUINS_HEADPEON
	disappear RUINS_PEON1
	disappear RUINS_PEON2
	disappear RUINS_PEON3
	pause 30
	special FadeInQuickly
	opentext
	writetext TheAirIsHeavyText
	waitbutton
	closetext
	waitsfx
	playsound SFX_WARP_TO
	appear RUINS_CELEBI
	pause 30
	showemote EMOTE_SHOCK, PLAYER, 20
	turnobject PLAYER, UP
	opentext
	writetext CelebiPlacesInHandText
	waitbutton
	verbosegiveitem SQUARE_STONE
	closetext
	showemote EMOTE_SHOCK, PLAYER, 20
	waitsfx
	playsound SFX_WARP_FROM
	disappear RUINS_CELEBI
	pause 30
	appear RUINS_HUSBAND
	clearevent EVENT_HUSBAND_OUTSIDE_RUINS
	applymovement RUINS_HUSBAND, WalkToPlayer
	turnobject RUINS_HUSBAND, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext HusbandThanksText
	waitbutton
	takeitem MYSTERY_EGG
	writetext HandedStoneTabletText
	waitbutton
	writetext HusbandGreatHelpText
	waitbutton
	showemote EMOTE_SHOCK, RUINS_HUSBAND, 20
	writetext CelebiGaveThisText
	waitbutton
	closetext
	applymovement RUINS_HUSBAND, StepUp
HeadPeonScript:
	end

DistractedScript:
	turnobject RUINS_HUSBAND, UP
	opentext
	writetext HusbandWorkingText
	waitbutton
	closetext
	end
	
HoOhPuzzle:
	checkevent EVENT_HOOH_PUZZLE_SECUNDA_OPEN
	iffalse .TilesAreStuck
	refreshscreen
	writebyte UNOWNPUZZLE_HO_OH
	special UnownPuzzle
	closetext
	iftrue .PuzzleComplete
	end

.TilesAreStuck:
	opentext
	writetext TilesAreStuckText
	waitbutton
	closetext
.PuzzleComplete:
	end

StrangeSymbols:
	opentext
	writetext NoIdeaText
	waitbutton
	closetext
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

WalkToPlayer:
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end
	
StepUp:
	step UP
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
	
	para "plans can really"
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
	
	para "You chased all"
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
	line "a #mon that"
	cont "looks like the"
	
	para "one on the"
	line "statues?!"
	
	para "That's incredible!"
	
	para "These ruins were"
	line "built to honor"
	cont "Celebi, so it"
	
	para "makes sense but"
	line "that's amazing!"
	
	para "And you say this"
	line "was given to you"
	cont "by Celebi?"
	
	para "I can't say what"
	line "it's for, but"
	
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
	line "down from the"
	cont "#mon."
	done

NoIdeaText:
	text "So many stange"
	line "symbols…"
	
	para "No way to know"
	line "what they mean."
	done

TilesAreStuckText:
	text "The tiles appear"
	line "to be stuck in"
	cont "place."
	done

SecundaRuins1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 26, 11, SECUNDA_FOREST, 3
	warp_event 27, 11, SECUNDA_FOREST, 4
	
	db 2 ; coord events
	coord_event 4, 7, SCENE_RUINS_ETERNAL_TAKEOVER, PlayerWalksScript1
	coord_event 5, 7, SCENE_RUINS_ETERNAL_TAKEOVER, PlayerWalksScript2
	
	db 2 ; bg events
	bg_event 4, 2, BGEVENT_UP, HoOhPuzzle
	bg_event 4, 3, BGEVENT_UP, StrangeSymbols

	db 6 ; object events
	object_event 25,  6, SPRITE_ETERNAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, RuinsEternalPeon1, EVENT_BEAT_RUINS_ADMIN
	object_event 16, 15, SPRITE_ETERNAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, RuinsEternalPeon2, EVENT_BEAT_RUINS_ADMIN
	object_event  4, 16, SPRITE_ETERNAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, RuinsEternalPeon3, EVENT_BEAT_RUINS_ADMIN
	object_event  5,  4, SPRITE_ETERNAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HeadPeonScript, EVENT_BEAT_RUINS_ADMIN
	object_event  4,  2, SPRITE_CELEBI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HeadPeonScript, EVENT_RUINS_CELEBI_1
	object_event  5,  3, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DistractedScript, EVENT_HUSBAND_OUTSIDE_RUINS
