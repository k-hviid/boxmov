
_hero:



	Global skullIMG as integer
	//heroIMG = loadImage ("hero.png")
	skullIMG = loadImage ("skull.png")
	

	Global skullSID as integer
	skullSID = createSprite (skullIMG)
	setSpriteColor (skullSID, 255,0,0,255)
	//setSpriteSize (skullSID, 20,20)
	setSpriteDepth (skullSID, 7)
	setSpriteVisible(skullSID, FALSE)

	Global heroSID as integer
	heroSID = createSprite (0)
	setSpriteColor (heroSID, 255,0,0,255)
	setSpriteSize (heroSID, 4,4)
	setSpriteDepth (heroSID, 7)
	setSpriteVisible(heroSID, FALSE)
		
return


