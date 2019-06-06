	const_def 2 ; object constants
	const FLOWERHOUSE_GRANDMA
	const FLOWERHOUSE_LASS

FlowerHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FlowerHouseGrandma:
	faceplayer
	opentext
	checkevent EVENT_GOT_ODD_EGG
	iftrue .AlreadyHaveOddEgg
	checkflag ENGINE_FORESTBADGE
	iffalse .Goodluck
	writetext FlowerGrandmaText_GiveOddEgg
	buttonsound
	closetext
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	special GiveOddEgg
	opentext
	writetext FlowerGrandmaText_GotOddEgg
	playsound SFX_KEY_ITEM
	waitsfx
	writetext FlowerGrandmaText_DescribeOddEgg
	waitbutton
	closetext
	setevent EVENT_GOT_ODD_EGG
	end
	
.PartyFull:
	writetext FlowerGrandmaText_PartyFull
	waitbutton
	closetext
	end

.AlreadyHaveOddEgg:
	writetext FlowerGrandmaText
	waitbutton
	closetext
	end
	
.Goodluck:
	writetext GoodLuckText
	waitbutton
	closetext
	end
	
FlowerHouseLass:
	faceplayer
	opentext
	checkevent EVENT_GOT_ODD_EGG
	iftrue .WowTheEgg
	checkevent EVENT_GOT_PINK_ROSE
	iftrue .IWonder
	writetext GrandmasFlowersText
	waitbutton
	closetext
	end
	
.IWonder:
	writetext IWonderText
	waitbutton
	closetext
	end

.WowTheEgg:
	writetext ICantBelieveText
	waitbutton
	closetext
	end

IWonderText:
	text "I wonder what"
	line "Granny plans to"
	cont "give you."
	done
	
ICantBelieveText:
	text "Wow! I can't"
	line "believe she gave"
	cont "you an Egg!"
	done
	
GrandmasFlowersText:
	text "My Granny grows"
	line "beautiful flowers"
	cont "for the cemetary."
	
	para "She's there right"
	line "now!"
	done

FlowerGrandmaText:
	text "Be sure to treat"
	line "your #mon with"
	
	para "love and respect!"
	done
	
FlowerGrandmaText_GiveOddEgg:
	text "Oh my! Just look at"
	para "that!"
	
	para "I see you beat"
	line "Whitney!"
	
	para "Now I know you're"
	line "right trainer to"
	cont "raise this."
	done
	
FlowerGrandmaText_GotOddEgg:
	text "<PLAYER> received"
	line "Odd Egg!"
	done
	
FlowerGrandmaText_PartyFull:
	text "Oh dear, you need to"
	line "make room in your"
	cont "party first."
	done
	
FlowerGrandmaText_DescribeOddEgg:
	text "I received that"
	line "from the current"
	cont "Champion, Bekah."
	
	para "She said to find"
	line "it a trainer full"
	
	para "potenial who would"
	line "raise it with love"
	cont "and kindness."
	
	para "I think that"
	line "trainer is you!"
	done
	
GoodLuckText:
	text "Remember to come"
	line "see me after you"
	
	para "get your first"
	line "badge, dear."
	
	para "Good luck!"
	done

FlowerHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SECUNDA_CEMETARY, 1
	warp_event  3,  7, SECUNDA_CEMETARY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FlowerHouseGrandma, EVENT_FLOWER_GRANDMA_GONE
	object_event  2,  2, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FlowerHouseLass, -1
