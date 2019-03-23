	const_def 2 ; object constants
	const CEMETARY_SHUPPET
	const CEMETARY_CURMUDGEON1


SecundaCemetary_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Shuppet

.Shuppet:
	checkflag ENGINE_UNION_CAVE_LAPRAS
	iftrue .NoAppear
	checkcode VAR_WEEKDAY
	ifequal FRIDAY, .CheckTime
.CheckTime:
	checkcode VAR_TIMEOFDAY
	ifequal NITE_F, .Appear
.NoAppear:
	disappear CEMETARY_SHUPPET
	return

.Appear:
	appear CEMETARY_SHUPPET
	return

ShuppetScript:
	faceplayer
	cry SHUPPET
	loadwildmon SHUPPET, 10
	startbattle
	disappear CEMETARY_SHUPPET
	setflag ENGINE_UNION_CAVE_LAPRAS
	reloadmapafterbattle
	end
	
GrampsScript:
	end

	
; Text

CurmudgeonLeslieSeenText:
	text "This is no place"
	line "for children to"
	cont "play!"
	done
	
CurmudgeonLeslieWinLossText:
	text "Hmph! Kids."
	done
	
CurmudgeonLeslieAfterText:
	text "Fine, but be sure"
	line "to be respectful."
	done
	
DelinquentShinjiSeenText:
	text "I cut class to"
	line "visit my old"
	cont "#mon."
	done
	
DelinquentShinjiWinLossText:
	text "Don't tell anyone"
	line "I'm here."
	
DelinquentShinjiAfterText:
	text "I've got a tough"
	line "guy reputation."
	
	para "Rather people not"
	line "know I'm a sap."
	done
	
CurmudgeonSimonSeenText:
	text "I come here to"
	line "enjoy the peace"
	cont "and quiet."
	done
	
CurmudgeonSimonWinLossText:
	text "Shhhhh!"
	done
	
CurmudgeonSimonAfterText:
	text "Silence is golden"
	line "or so they say."
	done
	
FlowerGrandmaText1:
	text "Oh, hello dear."
	
	para "I grow flowers and"
	line "place them on the"
	cont "graves of those"
	
	para "whose spirits rest"
	line "here."
	
	para "You're a sweet"
	line "child, take this."
	done

FlowerGrandmaText2:
	text "It's a pink rose"
	line "dear. I'm sure"
	cont "there is someone"
	
	para "out there who"
	line "would love one."
	done
	
FlowerGrandmaText3:
	text "Come see me at my"
	line "home after your"
	cont "first gym battle."
	done

SecundaCemetary_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events
	
	db 0 ; coord events
	
	db 0 ; bg events

	db 2 ; object events
	object_event 4, 5, SPRITE_SHUPPET, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ShuppetScript, EVENT_UNION_CAVE_B2F_LAPRAS
	object_event 8, 15, SPRITE_DELINQUENT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, GrampsScript, -1