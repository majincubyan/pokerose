	const_def 2 ; object constants
	const CEMETARY_SHUPPET
	const CEMETARY_CURMUDGEON1
	const CEMETARY_FLOWERGRANDMA
	const CEMETARY_CURMUDGEON2
	const CEMETARY_YOUNGSTER
	const CEMETARY_DELINQUENT
	const CEMETARY_CLEANSETAG
	const CEMETARY_PROTECT


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
	
LeslieScript:
	trainer CURMUDGEON, LESLIE, EVENT_BEAT_CURMUDGEON_LESLIE, CurmudgeonLeslieSeenText, CurmudgeonLeslieWinLossText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext CurmudgeonLeslieAfterText
	waitbutton
	closetext
	end
	
LionelScript:
	trainer CURMUDGEON, LIONEL, EVENT_BEAT_CURMUDGEON_LIONEL, CurmudgeonLionelSeenText, CurmudgeonLionelWinLossText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CurmudgeonLionelAfterText
	waitbutton
	closetext
	end
	
ShinjiScript:
	trainer DELINQUENT, SHINJI, EVENT_BEAT_DELINQUENT_SHINJI, DelinquentShinjiSeenText, DelinquentShinjiWinLossText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DelinquentShinjiAfterText
	waitbutton
	closetext
	end
	
AlbertScript:
	trainer YOUNGSTER, ALBERT, EVENT_BEAT_YOUNGSTER_ALBERT, AlbertSeenText, AlbertWinLossText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext AlbertAfterText
	waitbutton
	closetext
	end

FlowerGrandmaScript:
	faceplayer
	opentext
	writetext FlowerGrandmaText1
	waitbutton
	writetext FlowerGrandmaText2
	waitbutton
	verbosegiveitem PINK_ROSE
	setevent EVENT_GOT_PINK_ROSE
	writetext FlowerGrandmaText3
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear CEMETARY_FLOWERGRANDMA
	clearevent EVENT_FLOWER_GRANDMA_GONE
	pause 30
	special FadeInQuickly
	end
	
CemetaryCleanseTag:
	itemball CLEANSE_TAG, 1
	
CemetaryGreatBall:
	hiddenitem GREAT_BALL, EVENT_GOT_CEMETARY_GREAT_BALL
	
CemetaryTMProtect:
	itemball TM_PROTECT, 1
	
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
	done
	
DelinquentShinjiAfterText:
	text "I've got a tough"
	line "guy reputation."
	
	para "Rather people not"
	line "know I'm a sap."
	done
	
CurmudgeonLionelSeenText:
	text "I come here to"
	line "enjoy the peace"
	cont "and quiet."
	done
	
CurmudgeonLionelWinLossText:
	text "Shhhhh!"
	done
	
CurmudgeonLionelAfterText:
	text "Silence is golden"
	line "or so they say."
	done
	
AlbertSeenText:
	text "I was scolded for"
	line "playing in the"
	cont "cemetary!"
	
	para "Boy, I'm angry!"
	done
	
AlbertWinLossText:
	text "Now I'm gonna get"
	line "scolded for losing"
	cont "too!"
	done
	
AlbertAfterText:
	text "Zigzagoon belongs"
	line "to my brother."
	
	para "Man, he's gonna be"
	line "mad at me!"
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
	text "It's a pink rose,"
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

	db 1 ; warp events
	warp_event 14, 21, FLOWER_HOUSE, 1
	
	db 0 ; coord events
	
	db 1 ; bg events
	bg_event 10, 3, BGEVENT_ITEM, CemetaryGreatBall

	db 8 ; object events
	object_event 4, 5, SPRITE_SHUPPET, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ShuppetScript, EVENT_UNION_CAVE_B2F_LAPRAS
	object_event 8, 15, SPRITE_OLD_MAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 3, LeslieScript, -1
	object_event 11, 5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FlowerGrandmaScript, EVENT_GOT_PINK_ROSE
	object_event 4, 11, SPRITE_OLD_MAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 1, LionelScript, -1
	object_event 3, 24, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, AlbertScript, -1
	object_event 10, 7, SPRITE_DELINQUENT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, ShinjiScript, -1
	object_event 3, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CemetaryCleanseTag, EVENT_GOT_CLEANSE_TAG
	object_event 10, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CemetaryTMProtect, EVENT_GOT_CEMETARY_PROTECT
