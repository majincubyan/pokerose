	const_def 2 ; object constants
	const GATE_GUARD
	const GATE_COACH

SecundaForestGate1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GuardScript:
	opentext
	writetext ThisWayToText
	waitbutton
	closetext
	end
	
CoachScript:
	faceplayer
	opentext
	checkevent EVENT_FOREST_COACH_BEAT
	iftrue .ExplainSwift
	checkevent EVENT_FOREST_COACH_TALKED
	iftrue .LetsBattle
	writetext ExplainCoachTrainerText
	waitbutton
	setevent EVENT_FOREST_COACH_TALKED
.LetsBattle:
	writetext SoLetsBattleText
	yesorno
	iffalse .Done
	closetext
	winlosstext CoachTextWin, CoachTextLoss
	setlasttalked GATE_COACH
	loadtrainer COACHM, LOUIS
	startbattle
	reloadmapafterbattle
	setevent EVENT_FOREST_COACH_BEAT
	opentext
	writetext HereTakeThisText
	waitbutton
	verbosegiveitem TM_SWIFT
.ExplainSwift:
	writetext ItsSwiftText
	waitbutton
.Done:
	closetext
	end

ThisWayToText:
	text "This way to"
	line "Secunda Forest."
	
	para "Careful, lots of"
	line "#mon call the"
	cont "forest home."
	done

ExplainCoachTrainerText:
	text "Hey there! You're"
	line "a rookie trainer,"
	cont "I can tell."
	
	para "Me? I'm a #mon"
	line "Coach!"
	
	para "Myself and other"
	line "coaches hang out"
	cont "all over Tsuji"
	
	para "and if you beat"
	line "us, you can get"
	cont "sweet rewards!"
	
	para "But we aren't"
	line "gonna make it"
	cont "easy for you!"
	done

SoLetsBattleText:
	text "So, now you know"
	line "all about us. We"
	cont "should battle!"
	done
	
CoachTextWin:
	text "Whew, you're"
	line "something else."
	done
	
CoachTextLoss:
	text "Too bad kid."
	done
	
HereTakeThisText:
	text "I knew you'd be"
	line "able to beat me,"
	cont "moment I saw you!"
	
	para "Kid, I want you"
	line "to take this."
	done
	
ItsSwiftText:
	text "That TM contains"
	line "Swift!"
	
	para "Swift will always"
	line "hit the opposing"
	cont "#mon!"
	
	para "Also TMs can be"
	line "used as many times"
	cont "as you want."
	
	para "Hope that helps on"
	line "your journey!"
	done

SecundaForestGate1_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 9, 4, SECUNDA_FOREST_101, 1
	warp_event 9, 5, SECUNDA_FOREST_101, 2
	warp_event 0, 4, SECUNDA_FOREST, 1
	warp_event 0, 5, SECUNDA_FOREST, 2
	
	db 0 ; coord events
	
	db 0 ; bg events

	db 2 ; object events
	object_event 5, 2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GuardScript, -1
	object_event 1, 3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CoachScript, -1
