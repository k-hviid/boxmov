
_play:
	Global border as integer = 9

	Global gameOver as integer
	gameOver = FALSE
	
	Global stopWatch# as float
	
	Global boost# as float
	boost# = 1.0
	
	Global boostInc# as float
	boostInc# = 0.02
	
return

function play()
	//print(str(boost#,2))
	//print(str(ScreenFPS(),0))
	
	rem gradually increase the boost
	boost# = boost# + (boostInc#*deltaTime#)
	
	//print(str(getRawMouseX()))
	foe_update ()
	
	if gameOver = TRUE then play_exit()

endfunction


function play_init()
	setSpriteVisible(skullSID, FALSE)
	
	boost# = 1.0

	
	setSpriteVisible(tintSID, FALSE)
	
		rem cleanup
	foes_delete()
	
	gameOver = FALSE	
	
	//SetRawMouseVisible( 0 )
	
	rem													XPOS	YPOS	XSPEED	YSPEED	WIDTH	HEIGHT	RED		GREEN	BLUE
	foe_create(FOETYPE_BOX,			200,	400,	300.0,	100.2,	400,	43,			128,	200,	100)			rem  0	wide
	foe_create(FOETYPE_BOX,			200,	400,	100.0,	350.2,	30,		200,		128,	200,	100)			rem  1	high
	foe_create(FOETYPE_BOX, 		400,	300,	250.0,	190.2,	150,	200,		128,	200,	100)			rem  2	big
	foe_create(FOETYPE_CIRCLE,	100,	150,	200.0,	370.2,	60,		60,			128,	200,	100)			rem  3	circle
	foe_create(FOETYPE_BOX,			300,	border,		600.0,		0.0,	70,		70,			128,	200,	100)			rem  4	GUARD
	

	foe_create(FOETYPE_BOX,			0,		0,		0.0,			0.0,	ARENA_WIDTH,	border,		128,	200,	100)			rem  5	TOP
	foe_create(FOETYPE_BOX,			0,		ARENA_HEIGHT-border,		0.0,			0.0,	ARENA_WIDTH,	border,		128,	200,	100)			rem  5	BOTTOM
	foe_create(FOETYPE_BOX,			0,		border,		0.0,		0.0,		border,	ARENA_HEIGHT-(2*border),		128,	200,	100)			rem  5	LEFT
	foe_create(FOETYPE_BOX,			ARENA_WIDTH-border,		border,		0.0,		0.0,		border,	ARENA_HEIGHT-(2*border),		128,	200,	100)			rem  5	RIGHT
	
	
	
	skullSID = CreateSprite(skullIMG)
	setSpriteColor(skullSID, 255, 0, 0, 255)
	//setSpriteColor(skullSID, 128, 200, 100, 255)
	//setSPriteSize(skullSID, 16, 16)
	SetSpritePosition (skullSID, 400, 400)
	setSpriteDepth (skullSID, 20)
	SetSpriteSnap ( skullSID, TRUE )
	setSpriteVisible(skullSID, FALSE)
	
	
	stopWatch# = timer()
endfunction

function play_exit()
	
		setSpriteVisible(SkullSID, TRUE)
	
	stopWatch# = timer()-stopWatch#
		
	gameState = GAMESTATE_MENU
	SetSpriteVisible(playSID, TRUE)
	setSpriteVisible(tintSID, TRUE)
		setSpriteVisible(skullSID, TRUE)
	SetRawMouseVisible( 1 )
	                                         
	//setSpritePosition(skullSID, getpointerX()+getspriteWidth(skullSID*0.5), getPointerY()+getspriteHeight(skullSID*0.5))
	setSpritePosition(skullSID, getpointerX()+4, getPointerY()+6)

	
endfunction
