
_menu:
	
	global tintSID as integer
	tintSID = createSprite(0)
  setSpriteColor(tintSID, 255, 0, 0, 70)
  setSPriteSize(tintSID, ARENA_WIDTH, ARENA_HEIGHT)
  SetSpritePosition (tintSID, 0, 0)
	setSpriteVisible(tintSID, TRUE)
	setSpriteDepth(tintSID, 10)
	setSpriteVisible (tintSID, FALSE)
	SetSpriteTransparency( tintSID, 1 ) //  0=off, 1=alpha transparency, 2=additive blending
	
	Global playIMG as integer
	playIMG = loadiMage("play.png")
	
	Global playhIMG as integer
	playhIMG = loadiMage("play_h.png")
	

	
	global playSID as integer
	playSID = createSprite(playIMG)
	setSpriteSize(playSID, 93, 41)
	SetSpriteSnap ( playSID, TRUE )
	setSpritePosition (playSID, ARENA_WIDTH*0.5-getSpriteWidth(playSID)*0.5, ARENA_HEIGHT*0.5-getSpriteHeight(playSID)*0.5)

	
return


function menu()
	
	print(chr(10) + "     TIME: " + str(stopWatch#,0) + " seconds")
	
	REM todo show pretty menu

	rem print("click to begin")
	
	rem if GetPointerPressed() = TRUE
	rem	play_init()
	rem	gameState = GAMESTATE_PLAY
	rem endif
	menu_play()

	REM todo hide pretty menu
	
endfunction

function menu_play()
	
	if GetSpriteHit( getPointerX(), getPointerY() ) = playSID
		setSpriteImage(playSID, playhIMG, FALSE)
		if GetRawMouseLeftPressed() = TRUE
			SetSpriteVisible(titleSID, FALSE)
			SetSpriteVisible(playSID, FALSE)
			SetSpriteVisible(tintSID, FALSE)
			play_init()
			gameState = GAMESTATE_PLAY
		endif
	else
		setSpriteImage(playSID, playIMG, FALSE)
	endif
	
endfunction
