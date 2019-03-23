	const_def 2 ; object constants
	const VIOLETGYM_FALKNER
	const VIOLETGYM_YOUNGSTER1
	const VIOLETGYM_YOUNGSTER2
	const VIOLETGYM_GYM_GUY

SecundaGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VioletGymFalknerScript:
	opentext
	checkevent EVENT_GOT_ROUNDBADGE
	iftrue .FightDone
	checkevent EVENT_BEAT_FALKNER
	iftrue .FightDone
	writetext WhitneyDistractedText
	waitbutton
	faceplayer
	writetext WhitneyAttentionText
	waitbutton
	writetext GaveRoseText
	waitbutton
	writetext WhitneyThanksText
	waitbutton
	writetext FalknerIntroText
	waitbutton
	closetext
	winlosstext FalknerWinLossText, 0
	loadtrainer FALKNER, FALKNER1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FALKNER
.WhitneyCrying:
	writetext WhitneyKidsAreMeanText
	waitbutton
	closetext
	end
.FightDone:
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue .SpeechAfterTM
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	writetext FalknerZephyrBadgeText
	buttonsound
	verbosegiveitem TM_MUD_SLAP
	iffalse .NoRoomForMudSlap
	setevent EVENT_GOT_TM31_MUD_SLAP
	writetext FalknerTMMudSlapText
	waitbutton
	closetext
	end

.SpeechAfterTM:
	writetext FalknerFightDoneText
	waitbutton
.NoRoomForMudSlap:
	closetext
	end

TrainerBirdKeeperRod:
	trainer BIRD_KEEPER, ROD, EVENT_BEAT_BIRD_KEEPER_ROD, BirdKeeperRodSeenText, BirdKeeperRodBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRodAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperAbe:
	trainer BIRD_KEEPER, ABE, EVENT_BEAT_BIRD_KEEPER_ABE, BirdKeeperAbeSeenText, BirdKeeperAbeBeatenText, 0, .Script

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
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .Beaten
	trainertotext WHITNEY, WHITNEY1, MEM_BUFFER_1
	jumpstd gymstatue1
.Beaten:
	trainertotext WHITNEY, WHITNEY1, MEM_BUFFER_1
	jumpstd gymstatue2

WhitneyDistractedText:
	text "Ugh, it's just"
	line "drab in here."
	
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
	
	para "But you did give"
	line "me that rose so"
	cont "please take this!"
	done
	
ReceivedZephyrBadgeText:
	text "<PLAYER> received"
	line "ROUNDBADGE."
	done

FalknerZephyrBadgeText:
	text "ROUNDBADGE"
	line "raises the attack"
	cont "power of #MON."

	para "It also enables"
	line "#MON to use"

	para "FLASH, if they"
	line "have it, anytime."

	para "Oh, take this"
	line "too."
	done

FalknerTMMudSlapText:
	text "TM31 contains"
	line "MUD-SLAP."

	para "It reduces the"
	line "enemy's accuracy"

	para "while it causes"
	line "damage."

	para "In other words, it"
	line "is both defensive"
	cont "and offensive."
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
	line "pink…"
	done

BirdKeeperAbeAfterBattleText:
	text "I guess it doesn't"
	line "matter in the end."
	
	para "Our leader is good!"
	done

VioletGymGuyText:
	text "Hey! I'm no train-"
	line "er but I can give"
	cont "some advice!"

	para "Believe me!"
	line "If you believe, a"

	para "championship dream"
	line "can come true."

	para "You believe?"
	line "Then listen."

	para "Normal types have"
	line "almost no weakness."
	
	para "That said, they have"
	line "no type advantage."
	
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
	warp_event  4, 15, CHERRYGROVE_CITY, 5
	warp_event  5, 15, CHERRYGROVE_CITY, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 13, BGEVENT_READ, VioletGymStatue
	bg_event  6, 13, BGEVENT_READ, VioletGymStatue

	db 4 ; object events
	object_event  5,  2, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletGymFalknerScript, -1
	object_event  7,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRod, -1
	object_event  7,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperAbe, -1
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletGymGuyScript, -1
