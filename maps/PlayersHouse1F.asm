	const_def 2 ; object constants
	const PLAYERSHOUSE1F_MOM1
	const PLAYERSHOUSE1F_MOM2
	const PLAYERSHOUSE1F_MOM3
	const PLAYERSHOUSE1F_MOM4
	const PLAYERSHOUSE1F_POKEFAN_F

PlayersHouse1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

MeetMomLeftScript:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1

MeetMomRightScript:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
	turnobject PLAYER, LEFT
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .OnRight
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsTowardPlayerMovement
	jump MeetMomScript

.OnRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksToPlayerMovement
MeetMomScript:
	opentext
	writetext ElmsLookingForYouText
	buttonsound
	waitsfx
	giveitem TOWN_MAP
	playsound SFX_KEY_ITEM
	writetext GotTownMap
	waitsfx
	itemnotify
	setscene SCENE_FINISHED
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	writetext MomGivesPokegearText
	buttonsound
	special SetDayOfWeek
.SetDayOfWeek:
	writetext IsItDSTText
	yesorno
	iffalse .WrongDay
	special InitialSetDSTFlag
	yesorno
	iffalse .SetDayOfWeek
	jump .DayOfWeekDone

.WrongDay:
	special InitialClearDSTFlag
	yesorno
	iffalse .SetDayOfWeek
.DayOfWeekDone:
	writetext ComeHomeForDSTText
	yesorno
	iffalse .ExplainPhone
	jump .KnowPhone

.KnowPhone:
	writetext KnowTheInstructionsText
	buttonsound
	jump .FinishPhone

.ExplainPhone:
	writetext DontKnowTheInstructionsText
	buttonsound
	jump .FinishPhone

.FinishPhone:
	writetext InstructionsNextText
	waitbutton
	closetext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .FromRight
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iffalse .FromLeft
	jump .Finish

.FromRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsBackMovement
	jump .Finish

.FromLeft:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksBackMovement
	jump .Finish

.Finish:
	special RestartMapMusic
	turnobject PLAYERSHOUSE1F_MOM1, LEFT
	end

MeetMomTalkedScript:
	playmusic MUSIC_MOM
	jump MeetMomScript


GotTownMap:
	text "<PLAYER> received"
	line "Town Map!"
	prompt

MomScript:
	faceplayer
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	checkscene
	iffalse MeetMomTalkedScript ; SCENE_DEFAULT
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	iftrue .FirstTimeBanking
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .BankOfMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .GaveMysteryEgg
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .GotAPokemon
	writetext HurryUpElmIsWaitingText
	waitbutton
	closetext
	end

.GotAPokemon:
	writetext SoWhatWasProfElmsErrandText
	waitbutton
	closetext
	end

.FirstTimeBanking:
	writetext ImBehindYouText
	waitbutton
	closetext
	end

.GaveMysteryEgg:
	setevent EVENT_FIRST_TIME_BANKING_WITH_MOM
.BankOfMom:
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	special BankOfMom
	waitbutton
	closetext
	end

NeighborScript:
	faceplayer
	opentext
	checktime MORN
	iftrue .MornScript
	checktime DAY
	iftrue .DayScript
	checktime NITE
	iftrue .NiteScript

.MornScript:
	writetext NeighborMornIntroText
	buttonsound
	jump .Main

.DayScript:
	writetext NeighborDayIntroText
	buttonsound
	jump .Main

.NiteScript:
	writetext NeighborNiteIntroText
	buttonsound
	jump .Main

.Main:
	writetext NeighborText
	waitbutton
	closetext
	turnobject PLAYERSHOUSE1F_POKEFAN_F, RIGHT
	end

TVScript:
	jumptext TVText

StoveScript:
	jumptext StoveText

SinkScript:
	jumptext SinkText

FridgeScript:
	jumptext FridgeText

MomTurnsTowardPlayerMovement:
	turn_head RIGHT
	step_end

MomWalksToPlayerMovement:
	slow_step RIGHT
	step_end

MomTurnsBackMovement:
	turn_head LEFT
	step_end

MomWalksBackMovement:
	slow_step LEFT
	step_end

ElmsLookingForYouText:
	text "Oh, <PLAYER>…! Have"
	line "you gotten all"
	cont "settled in?"

	para "I know you miss"
	line "Kalos but change"
	cont "is a good thing!"

	para "Your grandfather"
	line "and I are so happy"
	cont "to have you here."

	para "I know you want"
	line "to go explore but"
	cont "take this town map"
	cont "along with you."
	
	para "Wouldn't want you"
	line "to get lost!"

	para "Here you go!"
	done

MomGivesPokegearText:
	text "We just got the"
	line "clock set moments"
	cont "ago."
	
	para "Took longer than"
	line "we'd like though…"
	
	para "Oh, we forgot day" 
	line "of the week!"

	para "Could you help me"
	line "get it set?"
	done

IsItDSTText:
	text "Is it Daylight"
	line "Saving Time now?"
	done

ComeHomeForDSTText:
	text "Come home to"
	line "adjust the clock"

	para "for Daylight"
	line "Saving Time."
	
	para "Oh, I see you got"
	line "your running"
	cont "shoes on!"
	
	para "Do you know how"
	line "they work?"
	done

KnowTheInstructionsText:
	text "Pretty simple to"
	line "use, isn't it?"
	done

DontKnowTheInstructionsText:
	text "I'll read the"
	line "instructions."

	para "Simply hold down"
	line "the B button and"
	cont "off you go!"
	done

InstructionsNextText:
	text "Okay, honey, go"
	line "have fun!"
	done

HurryUpElmIsWaitingText:
	text "Why don't you head"
	line "out and explore?"
	
	para "We will be right"
	line "here waiting."
	done


SoWhatWasProfElmsErrandText:
	text "Oh my! You got a"
	line "#mon!?"
	
	para "… … …"
	
	para "So Prof. Maple"
	line "gave you a #mon"
	cont "and sent you on"
	cont "an errand?"
	
	para "Wow, just like"
	line "your parents, so"
	cont "responsible!"
	done

ImBehindYouText:
	text "<PLAYER>, do it!"

	para "I'm behind you all"
	line "the way!"
	done

NeighborMornIntroText:
	text "Good morning,"
	line "<PLAY_G>!"

	para "I just love"
	line "breakfast!"
	done

NeighborDayIntroText:
	text "Hello, <PLAY_G>!"
	line "What a beautiful"
	cont "day!"
	done

NeighborNiteIntroText:
	text "Good evening,"
	line "<PLAY_G>!"

	para "Nothing like a"
	line "reading the paper!"
	done

NeighborText:
	text "I understand you"
	line "miss your parents,"
	cont "<PLAYER>."

	para "But their work as"
	line "#mon Rangers is"
	cont "important."

	para "Who knows, you"
	line "might run into"
	cont "them someday!"

	para "Ho, ho, ho!"
	done

StoveText:
	text "YUM!"

	para "CINNABAR VOLCANO"
	line "BURGERS!"
	done

SinkText:
	text "The sink is spot-"
	line "less. Grandma"
	cont "likes it clean."
	done

FridgeText:
	text "Let's see what's"
	line "in the fridge…"

	para "FRESH WATER and"
	line "tasty LEMONADE!"
	done

TVText:
	text "A documentary is "
	line "on TV: Seems to"
	cont "be about Tsuji"
	cont "ruins…"

	para "I'd love to see"
	line "the ruins myself!"
	done

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  10, 7, NEW_BARK_TOWN, 2
	warp_event  11, 7, NEW_BARK_TOWN, 2
	warp_event  13, 0, PLAYERS_HOUSE_2F, 1

	db 2 ; coord events
	coord_event  12, 4, SCENE_DEFAULT, MeetMomLeftScript
	coord_event  13, 4, SCENE_DEFAULT, MeetMomRightScript

	db 4 ; bg events
	bg_event  4,  1, BGEVENT_READ, StoveScript
	bg_event  5,  1, BGEVENT_READ, SinkScript
	bg_event  6,  1, BGEVENT_READ, FridgeScript
	bg_event  8,  1, BGEVENT_READ, TVScript

	db 5 ; object events
	object_event  11, 4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  6,  2, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  11, 4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  4,  2, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  8,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NeighborScript, -1
