	const_def 2 ; object constants
	const SECUNDAGYM_WHITNEY
	const VIOLETGYM_YOUNGSTER1
	const VIOLETGYM_YOUNGSTER2
	const VIOLETGYM_GYM_GUY

SecundaGym_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_GOLDENRODGYM_NOTHING
	scene_script .DummyScene1 ; SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING

	db 0 ; callbacks
	
.DummyScene0:
	end

.DummyScene1:
	end

VioletGymFalknerScript:
	opentext
	checkevent EVENT_GOT_FORESTBADGE
	iftrue .FightDone
	checkevent EVENT_BEAT_FALKNER
	iftrue .WhitneyCrying
	checkevent EVENT_GAVE_PINK_ROSE
	iftrue .WhitneyBattle
	checkevent EVENT_GOT_PINK_ROSE
	iftrue .WhitneyAttention
	writetext WhitneyDistractedText
	waitbutton
	closetext
	end
.WhitneyAttention:
	faceplayer
	writetext WhitneyAttentionText
	waitbutton
	writetext GaveRoseText
	waitbutton
	takeitem PINK_ROSE, 1
	setevent EVENT_GAVE_PINK_ROSE
	writetext WhitneyThanksText
	waitbutton
.WhitneyBattle:
	writetext FalknerIntroText
	waitbutton
	closetext
	winlosstext FalknerWinLossText, 0
	loadtrainer WHITNEY, WHITNEY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FALKNER
	setscene SCENE_SECUNDA_GYM_WHITNEY_STOPS_CRYING
	opentext
.WhitneyCrying:
	faceplayer
	writetext WhitneyKidsAreMeanText
	waitbutton
	closetext
	end
.FightDone:
	checkevent EVENT_GOT_TM45_ATTRACT
	iftrue .SpeechAfterTM
	setevent EVENT_BEAT_LASS_LINDA
	setevent EVENT_BEAT_YOUNGSTER_KEN
	writetext WhitneyForestBadgeText
	buttonsound
	verbosegiveitem TM_ATTRACT
	iffalse .NoRoomForMudSlap
	setevent EVENT_GOT_TM45_ATTRACT
	writetext WhitneyAttractText
	waitbutton
	closetext
	end
.SpeechAfterTM:
	faceplayer
	writetext FalknerFightDoneText
	waitbutton
.NoRoomForMudSlap:
	closetext
	end

WhitneyHoldOnScript1:
	setscene SCENE_SECUNDA_GYM_NOTHING
	faceplayer
	showemote EMOTE_SHOCK, SECUNDAGYM_WHITNEY, 20
	opentext
	writetext WhitneyWaitText
	waitbutton
	closetext
	turnobject PLAYER, UP
	applymovement PLAYER, WhitneySteps1
	faceplayer
	opentext
	writetext WhitneySorryText
	waitbutton
	buttonsound
	waitsfx
	writetext ReceivedForestBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FORESTBADGE
	setevent EVENT_GOT_FORESTBADGE
	setevent EVENT_BEAT_LASS_LINDA
	setevent EVENT_BEAT_YOUNGSTER_KEN
	writetext WhitneyForestBadgeText
	buttonsound
	verbosegiveitem TM_ATTRACT
	iffalse .NoRoomForMudSlap
	setevent EVENT_GOT_TM45_ATTRACT
	writetext WhitneyAttractText
	waitbutton
.NoRoomForMudSlap:
	closetext
	end
	
WhitneyHoldOnScript2:
	setscene SCENE_SECUNDA_GYM_NOTHING
	faceplayer
	showemote EMOTE_SHOCK, SECUNDAGYM_WHITNEY, 20
	opentext
	writetext WhitneyWaitText
	waitbutton
	closetext
	turnobject PLAYER, UP
	applymovement PLAYER, WhitneySteps2
	opentext
	writetext WhitneySorryText
	waitbutton
	buttonsound
	waitsfx
	writetext ReceivedForestBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FORESTBADGE
	setevent EVENT_GOT_FORESTBADGE
	setevent EVENT_BEAT_LASS_LINDA
	setevent EVENT_BEAT_YOUNGSTER_KEN
	writetext WhitneyForestBadgeText
	buttonsound
	verbosegiveitem TM_ATTRACT
	iffalse .NoRoomForMudSlap
	setevent EVENT_GOT_TM45_ATTRACT
	writetext WhitneyAttractText
	waitbutton
.NoRoomForMudSlap:
	closetext
	end

TrainerBirdKeeperRod:
	trainer LASS, LINDA, EVENT_BEAT_LASS_LINDA, BirdKeeperRodSeenText, BirdKeeperRodBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRodAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperAbe:
	trainer YOUNGSTER, KEN2, EVENT_BEAT_YOUNGSTER_KEN, BirdKeeperAbeSeenText, BirdKeeperAbeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperAbeAfterBattleText
	waitbutton
	closetext
	end

VioletGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .VioletGymGuyWinScript
	writetext VioletGymGuyText
	waitbutton
	closetext
	end

.VioletGymGuyWinScript:
	writetext VioletGymGuyWinText
	waitbutton
	closetext
	end

VioletGymStatue:
	checkflag ENGINE_FORESTBADGE
	iftrue .Beaten
	trainertotext WHITNEY, WHITNEY1, MEM_BUFFER_1
	jumpstd gymstatue1
.Beaten:
	trainertotext WHITNEY, WHITNEY1, MEM_BUFFER_1
	jumpstd gymstatue2
	
WhitneySteps1:
	step UP
	step UP
	turn_head RIGHT
	step_end
	
WhitneySteps2:
	step UP
	step_end


WhitneyDistractedText:
	text "Ugh, it's just"
	line "so drab in here."
	
	para "Pink here! Oh and"
	line "there too!"
	
	para "<……><……><……>"
	
	para "She doesn't seem"
	line "to notice you."
	done

WhitneyAttentionText:
	text "Oh my!"
	line "That rose…"
	
	para "It's beautiful!"
	line "May I have it?"
	done
	
WhitneyThanksText:
	text "So you got it"
	line "from a woman in"
	cont "town?"
	
	para "Thanks so much!"
	
	para "Anyways…"
	done

FalknerIntroText:
	text "Hiya!"
	
	para "I'm Whitney,"
	line "Secunda #mon"
	cont "Gym's new leader!"

	para "I came here from"
	line "Johto on vacation"
	cont "and was asked to"
	cont "fill this vacancy."
	
	para "So I said yes and"
	line "moved here!"

	para "I can't wait to"
	line "make this gym as"
	cont "beautiful as me!"
	
	para "Oh, you want to"
	line "challenge me?"
	
	para "I accept!"
	
	para "But I'm good, so"
	line "don't cry when I"
	cont "win!"
	done

FalknerWinLossText:
	text "I… Lost…?"
	line "Sniff… I-I'm not…"
	cont "gonna…"
	
	para "Waaaaaaaaah!"
	done

WhitneyKidsAreMeanText:
	text "Why are kids here"
	line "so mean!?"
	
	para "Waaaaaah!"
	done
	
WhitneyWaitText:
	text "Sniff… Hang on!"
	line "Wait one sec!"
	done
	
WhitneySorryText:
	text "I'm sorry about"
	line "that, I don't"
	cont "take losses well."
	
	para "But, you did give"
	line "me that rose so"
	cont "please take this!"
	done
	
ReceivedForestBadgeText:
	text "<PLAYER> received"
	line "ForestBadge."
	done

WhitneyForestBadgeText:
	text "ForestBadge"
	line "raises the attack"
	cont "power of #mon."

	para "It also enables"
	line "#mon to use"

	para "Flash, if they"
	line "have it, anytime."

	para "Oh, take this"
	line "too."
	done

WhitneyAttractText:
	text "It's ATTRACT!"
	line "It makes full use"

	para "of a #MON's"
	line "charm."

	para "Isn't it just"
	line "perfect for a"
	cont "cutie like me?"
	done

FalknerFightDoneText:
	text "I'm not a little"
	line "kid anymore, but"
	cont "I still have some"
	cont "growing up to do."
	
	para "<PLAYER>, you have"
	line "what it takes to"
	cont "go all the way!"
	
	para "Don't let anything"
	line "slow you down!"
	done

BirdKeeperRodSeenText:
	text "I hope I can be"
	line "as cute as our"
	cont "new leader!"

	done

BirdKeeperRodBeatenText:
	text "Oh no! Rude!"
	done

BirdKeeperRodAfterBattleText:
	text "I hope I can be"
	line "as good a trainer"
	cont "as her too!"
	done

BirdKeeperAbeSeenText:
	text "The new leader is"
	line "pretty good."
	
	para "I'm not too sure"
	line "about her decor"
	cont "ideas though…"
	done

BirdKeeperAbeBeatenText:
	text "I'm just not a fan"
	line "of pink…"
	done

BirdKeeperAbeAfterBattleText:
	text "I guess it doesn't"
	line "matter in the end."
	
	para "Our leader is good!"
	done

VioletGymGuyText:
	text "Hey!" 
	
	para "I'm no trainer"
	line "but I can give"
	cont "some advice!"

	para "Believe me!"
	line "If you believe, a"

	para "championship dream"
	line "can come true."

	para "You believe?"
	line "Then listen."

	para "Normal types have"
	line "virtually no"
	cont "weaknesses!"
	
	para "That said, they"
	line "have no real type"
	cont "advantage."
	
	para "Either way, bring"
	line "your best!"
	done

VioletGymGuyWinText:
	text "Nice battle! Keep"
	line "it up, and you'll"

	para "be the Champ in no"
	line "time at all!"
	done
	
GaveRoseText:
	text "You gave Whitney"
	line "the Pink Rose!"
	done
	

SecundaGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, SECUNDA_CITY, 5
	warp_event  5, 15, SECUNDA_CITY, 5

	db 2 ; coord events
	coord_event 4, 4, SCENE_SECUNDA_GYM_WHITNEY_STOPS_CRYING, WhitneyHoldOnScript1
	coord_event 5, 4, SCENE_SECUNDA_GYM_WHITNEY_STOPS_CRYING, WhitneyHoldOnScript2
	
	db 2 ; bg events
	bg_event  3, 13, BGEVENT_READ, VioletGymStatue
	bg_event  6, 13, BGEVENT_READ, VioletGymStatue

	db 4 ; object events
	object_event  5,  2, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletGymFalknerScript, -1
	object_event  7,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRod, -1
	object_event  7,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperAbe, -1
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletGymGuyScript, -1
