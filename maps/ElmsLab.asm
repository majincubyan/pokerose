	const_def 2 ; object constants
	const ELMSLAB_ELM
	const ELMSLAB_ELMS_AIDE
	const ELMSLAB_POKE_BALL1
	const ELMSLAB_POKE_BALL2
	const ELMSLAB_POKE_BALL3
	const ELMSLAB_NEL

ElmsLab_MapScripts:
	db 6 ; scene scripts
	scene_script .MeetElm ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_ELMSLAB_CANT_LEAVE
	scene_script .DummyScene2 ; SCENE_ELMSLAB_NOTHING
	scene_script .DummyScene3 ; SCENE_ELMSLAB_MEET_OFFICER
	scene_script .DummyScene4 ; SCENE_ELMSLAB_UNUSED
	scene_script .DummyScene5 ; SCENE_ELMSLAB_AIDE_GIVES_POTION

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MoveElmCallback

.MeetElm:
	priorityjump .WalkUpToElm
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

.DummyScene4:
	end

.DummyScene5:
	end

.MoveElmCallback:
	checkscene
	iftrue .Skip ; not SCENE_DEFAULT
	moveobject ELMSLAB_ELM, 5, 3
.Skip:
	return

.WalkUpToElm:
	applymovement PLAYER, ElmsLab_WalkUpToElmMovement
	showemote EMOTE_SHOCK, ELMSLAB_NEL, 15
	turnobject ELMSLAB_NEL, LEFT
	opentext
	writetext NelText_Intro
	waitbutton
	closetext
	applymovement ELMSLAB_ELM, MapleToPlayer1Movement
	turnobject PLAYER, UP
	opentext
	writetext MapleText_Hello
	waitbutton
	writetext NelText_BrotherAndI
	waitbutton
	writetext MapleText_AskPlayer
.MustSayYes:
	yesorno
	iftrue .ElmGetsEmail
	writetext MapleText_Refused
	jump .MustSayYes

.ElmGetsEmail:
	writetext MapleText_Accepted
	buttonsound
	writetext MapleText_ResearchAmbitions
	waitbutton
	closetext
	playsound SFX_GLASS_TING
	pause 30
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 10
	applymovement ELMSLAB_ELM, MapleToPCMovement
	opentext
	writetext MapleText_GotAnEmail
	waitbutton
	closetext
	applymovement ELMSLAB_ELM, MapleToDeskMovement
	pause 30
	applymovement ELMSLAB_ELM, MapleToPlayer2Movement
	opentext
	writetext MapleText_Husband
	waitbutton
	closetext
	opentext
	writetext MapleText_ChooseAPokemon
	waitbutton
	setscene SCENE_ELMSLAB_CANT_LEAVE
	closetext
	end

ProfElmScript:
	faceplayer
	opentext
	writetext ElmDescribesMrPokemonText
	waitbutton
	closetext
	end


LabTryToLeaveScript:
	turnobject ELMSLAB_NEL, DOWN
	opentext
	writetext LabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, ElmsLab_CantLeaveMovement
	end

CyndaquilPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic CYNDAQUIL
	cry CYNDAQUIL
	waitbutton
	closepokepic
	opentext
	writetext TakeCyndaquilText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem CYNDAQUIL, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CYNDAQUIL, 5, BERRY
	closetext
	checkcode VAR_FACING
	ifequal RIGHT, ElmDirectionsScript
	applymovement PLAYER, AfterCyndaquilMovement
	jump ElmDirectionsScript

TotodilePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic TOTODILE
	cry TOTODILE
	waitbutton
	closepokepic
	opentext
	writetext TakeTotodileText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem TOTODILE, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke TOTODILE, 5, BERRY
	closetext
	applymovement PLAYER, AfterTotodileMovement
	jump ElmDirectionsScript

ChikoritaPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic ROWLET
	cry ROWLET
	waitbutton
	closepokepic
	opentext
	writetext TakeChikoritaText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL3
	setevent EVENT_GOT_ROWLET_FROM_ELM
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem ROWLET, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke ROWLET, 5, BERRY
	closetext
	applymovement PLAYER, AfterChikoritaMovement
	jump ElmDirectionsScript

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	closetext
	end

ElmDirectionsScript:
	turnobject PLAYER, UP
	opentext
	writetext ElmDirectionsText1
	buttonsound
	waitsfx
	giveitem MYSTERY_EGG
	writetext GotStoneTablet
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	closetext
	opentext
	writetext AlsoTakeThisText
	waitbutton
	writetext PlayerGetsDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	waitbutton
	writetext MapleExplainsDexText
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, LEFT
	opentext
	writetext ElmDirectionsText2
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext ElmDirectionsText3
	waitbutton
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_ELM
	setevent EVENT_NEL_LAB_OUTSIDE
	setscene SCENE_ELMSLAB_AIDE_GIVES_POTION
	setmapscene MAPLE_LAB, SCENE_LAB_OUTSIDE_BATTLE
	end

LookAtElmPokeBallScript:
	opentext
	writetext ElmPokeBallText
	waitbutton
	closetext
	end

ElmsLabHealingMachine:
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .CanHeal
	writetext ElmsLabHealingMachineText1
	waitbutton
	closetext
	end

.CanHeal:
	writetext ElmsLabHealingMachineText2
	yesorno
	iftrue ElmsLabHealingMachine_HealParty
	closetext
	end

ElmsLabHealingMachine_HealParty:
	special StubbedTrainerRankings_Healings
	special HealParty
	playmusic MUSIC_NONE
	writebyte HEALMACHINE_ELMS_LAB
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	closetext
	end

AideScript_WalkPotion1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkPotion2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GivePotion:
	opentext
	writetext AideText_GiveYouPotion
	buttonsound
	verbosegiveitem POTION
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_NOTHING
	end

AideScript_ReceiveTheBalls:
	jumpstd receiveitem
	end

ElmsAideScript:
	faceplayer
	opentext
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	end

NelScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue NelChooseScript
	writetext NelText1
	waitbutton
	closetext
	end

NelChooseScript:
	writetext NelText2
	waitbutton
	closetext
	end

ElmsLabWindow:
	opentext
	writetext ElmsLabWindowText1
	waitbutton
	closetext
	end

ElmsLabTravelTip1:
	jumptext ElmsLabTravelTip1Text

ElmsLabTravelTip2:
	jumptext ElmsLabTravelTip2Text

ElmsLabTravelTip3:
	jumptext ElmsLabTravelTip3Text

ElmsLabTravelTip4:
	jumptext ElmsLabTravelTip4Text

ElmsLabTrashcan:
	jumptext ElmsLabTrashcanText

ElmsLabPC:
	jumptext ElmsLabPCText

StrangeStones:
	jumptext StrangeStonesText
	
ElmsLabTrashcan2:
; unused
	jumpstd trashcan

ElmsLabBookshelf:
	jumpstd difficultbookshelf

ElmsLab_WalkUpToElmMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

ElmsLab_CantLeaveMovement:
	step UP
	step_end


AideWalksRight1:
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksRight2:
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksLeft1:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

AideWalksLeft2:
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

AfterCyndaquilMovement:
	step DOWN
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

AfterTotodileMovement:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end
	
AfterChikoritaMovement:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end
	
MapleToPlayer1Movement:
	step LEFT
	turn_head DOWN
	step_end
	
MapleToPCMovement:
	step LEFT
	step DOWN
	step_end
	
MapleToDeskMovement:
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end
	
MapleToPlayer2Movement:
	step LEFT
	step LEFT
	step DOWN
	step_end

NelText_Intro:
	text "Nel: <PLAY_G>!"
	line "There you are!"

	para "This is Professor"
	line "Maple."
	done

MapleText_Hello:
	text "Maple: Hello,"
	line "<PLAY_G>!"

	para "I'm Maple, I study"
	line "the Tsuji ruins"

	para "and their link to"
	line "#mon migration."

	para "But there are some"
	line "things I don't"

	para "quite understand"
	line "yet."
	done

NelText_BrotherAndI:
	text "Nel: Yep! So she"
	line "asked my brother"
	cont "and I to help!"
	done
	
MapleText_AskPlayer:
	text "Maple: As I"
	line "understand, you"
	
	para "just arrived in"
	line "Tsuji."
	
	para "New places can be"
	line "both exciting and"
	cont "scary at times."
	
	para "Sooo…"
	
	para "I'd like you to"
	line "raise a #MON"

	para "that I recently"
	line "caught also!"
	done

MapleText_Accepted:
	text "Great, <PLAY_G>!"

	para "You'll be helping"
	line "my research and"
	
	para "can learn about"
	line "your new home."
	done

MapleText_Refused:
	text "Come now, no need"
	line "to be shy!"
	done

MapleText_ResearchAmbitions:
	text "When I announce my"
	line "findings, I'm sure"

	para "we'll delve a bit"
	line "deeper into the"

	para "many mysteries of"
	line "#MON."

	para "You can count on"
	line "it!"
	done

MapleText_GotAnEmail:
	text "Oh, hey! I got an"
	line "e-mail!"

	para "<……><……><……>"
	line "Hm… Uh-huh…"

	para "Oh no…"
	done

MapleText_Husband:
	text "Hey, listen."

	para "My husband helps"
	line "with my research"
	
	para "by studying"
	line "on-site."
	
	para "But he forgot this"
	line "stone tablet and"

	para "its critcal for"
	line "his translations."

	para "I want to bring it"
	line "to him, but we're"
	cont "just so busy"

	para "with our #mon"
	line "research here…"

	para "Wait!"

	para "I know!"

	para "<PLAY_G>, can you"
	line "go in our place?"
	done

MapleText_ChooseAPokemon:
	text "I want you to"
	line "raise one of the"

	para "#mon contained"
	line "in these balls."

	para "You'll be that"
	line "#mon's first"
	cont "partner, <PLAY_G>!"

	para "Go on. Pick one!"
	done

MapleText_LetYourMonBattleIt:
	text "If a wild #mon"
	line "appears, let your"
	cont "#mon battle it!"
	done

LabWhereGoingText:
	text "Nel: Wait! Where"
	line "are you going?"
	done

TakeCyndaquilText:
	text "Maple: You'll take"
	line "Chimchar, the"
	cont "fire #mon?"
	done

TakeTotodileText:
	text "Maple: Do you want"
	line "Oshawott, the"
	cont "water #mon?"
	done

TakeChikoritaText:
	text "Maple: So, you"
	line "like Rowlet, the"
	cont "grass #mon?"
	done

DidntChooseStarterText:
	text "Maple: Think it"
	line "over carefully."

	para "Your partner is"
	line "important."
	done

ChoseStarterText:
	text "Maple: I think"
	line "that's a great"
	cont "#mon too!"
	done

ReceivedStarterText:
	text "<PLAYER> received"
	line "@"
	text_from_ram wStringBuffer3
	text "!"
	done

ElmDirectionsText1:
	text "My husband is at"
	line "the ruins in the"

	para "Secunda Forest,"
	line "south on 101."

	para "It's almost a"
	line "direct route"

	para "there, so you"
	line "can't miss it."

	para "Please be careful"
	line "with this, <PLAY_G>."
	done

ElmDirectionsText2:
	text "If your #MON is"
	line "hurt, you should"

	para "heal it with this"
	line "machine."

	para "Feel free to use"
	line "it anytime."
	done

ElmDirectionsText3:
	text "<PLAY_G>, I'm"
	line "counting on you!"
	done

GotElmsNumberText:
	text "<PLAYER> got ELM's"
	line "phone number."
	done

ElmDescribesMrPokemonText:
	text "Maple: So much to"
	line "do and study."

	para "I appreicate your"
	line "help, <PLAY_G>!"
	done

ElmPokeBallText:
	text "It contains a"
	line "#MON caught by"
	cont "PROF.ELM."
	done

ElmsLabHealingMachineText1:
	text "I wonder what this"
	line "does?"
	done

ElmsLabHealingMachineText2:
	text "Would you like to"
	line "heal your #MON?"
	done

AideText_GiveYouPotion:
	text "<PLAY_G>, I want"
	line "you to have this"
	cont "for your errand."
	done

AideText_AlwaysBusy:
	text "We're always busy,"
	line "thanks for helping"
	cont "us out."
	done

NelText1:
	text "Nel: <PLAY_G>,"
	line "you can go ahead"
	cont "and pick first!"
	done

NelText2:
	text "Nel: Oh man, not"
	line "sure who to pick."
	done

ElmsLabWindowText1:
	text "The window's open."

	para "A pleasant breeze"
	line "is blowing in."
	done


ElmsLabTravelTip1Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 1:"

	para "Press START to"
	line "open the MENU."
	done

ElmsLabTravelTip2Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 2:"

	para "Record your trip"
	line "with SAVE!"
	done

ElmsLabTravelTip3Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 3:"

	para "Open your PACK and"
	line "press SELECT to"
	cont "move items."
	done

ElmsLabTravelTip4Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 4:"

	para "Check your #MON"
	line "moves. Press the"

	para "A Button to switch"
	line "moves."
	done

ElmsLabTrashcanText:
	text "It's filled with"
	line "crubbled notes and"
	cont "other trash…"
	done

ElmsLabPCText:
	text "Celebi and"
	line "#mon Migration"

	para "…It says on the"
	line "screen…"
	done
	
StrangeStonesText:
	text "Odd stones and"
	line "artifacts are"
	
	para "scattered all"
	line "over the desk."
	done
	
GotStoneTablet:
	text "<PLAYER> received"
	line "Stone Tablet!"
	prompt
	
PlayerGetsDexText:
	text "<PLAYER> received"
	line "#dex!"
	done
	
AlsoTakeThisText:
	text "Also, take this"
	line "as well!"
	done
	
MapleExplainsDexText:
	text "This is the latest"
	line "model of the"
	cont "#dex."

	para "It automatically"
	line "records data on"

	para "#mon you've"
	line "seen or caught."

	para "It's a hi-tech"
	line "encyclopedia!"
	done

ElmsLab_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 11, MAPLE_LAB, 1
	warp_event  5, 11, MAPLE_LAB, 1

	db 4 ; coord events
	coord_event  4,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  5,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotion1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotion2

	db 16 ; bg events
	bg_event  2,  1, BGEVENT_READ, ElmsLabHealingMachine
	bg_event  6,  1, BGEVENT_READ, StrangeStones
	bg_event  7,  1, BGEVENT_READ, StrangeStones
	bg_event  8,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  0,  7, BGEVENT_READ, ElmsLabTravelTip1
	bg_event  1,  7, BGEVENT_READ, ElmsLabTravelTip2
	bg_event  2,  7, BGEVENT_READ, ElmsLabTravelTip3
	bg_event  3,  7, BGEVENT_READ, ElmsLabTravelTip4
	bg_event  6,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  3, BGEVENT_READ, ElmsLabTrashcan
	bg_event  5,  0, BGEVENT_READ, ElmsLabWindow
	bg_event  3,  5, BGEVENT_DOWN, ElmsLabPC

	db 6 ; object events
	object_event  5,  2, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ProfElmScript, -1
	object_event  2,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ElmsAideScript, EVENT_ELMS_AIDE_IN_LAB
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_ROWLET_POKEBALL_IN_ELMS_LAB
	object_event  5,  4, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, NelScript, EVENT_NEL_IN_ELMS_LAB
