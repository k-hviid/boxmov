
_hero:

	rem The game over sprite
	Global 	skullIMG as integer
	skullIMG = loadImage ("skull.png")
	Global skullSID as integer
	skullSID = createSprite (skullIMG)
	setSpriteSize(skullSID, 24,24)
	setSpriteColor (skullSID, 255,255,255,255)
	setSpriteDepth (skullSID, 7)
	setSpriteVisible(skullSID, FALSE)

	rem The collision shape
	Global heroSID as integer
	heroSID = createSprite (0)
	setSpriteColor (heroSID, 255,0,0,255)
	setSpriteSize (heroSID, 4,4)
	setSpriteDepth (heroSID, 7)
	setSpriteVisible(heroSID, FALSE)
		
return


