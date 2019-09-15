
_foes:

	#constant FOETYPE_BOX	0
	#constant FOETYPE_CIRCLE	1

	type foe
		SID as integer
		xMov as float			rem The distance it moves per second, in pixels. Can be negative
		yMov as float			rem  -||-
	endtype

	Global Foes as Foe[]
	
	Global circleIMG as integer
	circleIMG = loadImage("circle.png")

return


function foe_create(foeType as integer, x as integer, y as integer, xMov as float, yMov as float, sprW as float, sprH as float, r as integer, g as integer, b as integer)
    local TmpFoe as foe
    TmpFoe.xMov = xMov
    TmpFoe.yMov = yMov
    TmpFoe.SID = createSprite(0)
    if foeType = FOETYPE_CIRCLE then setSpriteImage ( TmpFoe.SID, circleIMG)
    SetSpriteTransparency(TmpFoe.SID, 1)
   	SetSpriteSnap ( TmpFoe.SID, TRUE )
    
    setSpriteColor(TmpFoe.SID, r, g, b, 220)
    setSPriteSize(TmpFoe.SID, sprW, sprH)
    SetSpritePosition (TmpFoe.SID, x, y)
    setSpriteDepth (TmpFoe.SID, 30)
    
    if foeType = FOETYPE_CIRCLE then SetSpriteShapeCircle( TmpFoe.SID, 0, 0, getSpriteWidth(TmpFoe.SID)*0.5 ) 
    Foes.insert(TmpFoe)
endfunction


function foe_update ()

	Index as integer
	for Index=0 to Foes.length
		
		if Index = 4	
			if getSpriteX(foes[Index].SID) + (GetSpriteWidth(foes[Index].SID)) > ARENA_WIDTH-border		rem if leaving right
				if foes[Index].xMov > 0.0
					foes[Index].yMov = foes[Index].xMov
					foes[Index].xMov = 0.0
					setSpritePosition(foes[Index].SID,ARENA_WIDTH-(border+GetSpriteWidth(foes[Index].SID)), getSpriteY(foes[Index].SID)) 			rem align to border edge	
				endif
			endif

			if getSpriteY(foes[Index].SID) + (GetSpriteHeight(foes[Index].SID)) > ARENA_HEIGHT-border		rem if leaving bottom
				if foes[Index].yMov > 0.0
					foes[Index].xMov = foes[Index].yMov*-1.0
					foes[Index].yMov = 0.0
					setSpritePosition(foes[Index].SID, getSpriteX(foes[Index].SID), ARENA_HEIGHT-(border+GetSpriteHEIGHT(foes[Index].SID))) 			rem align to border edge
				endif
			endif						
			if getSpriteX(foes[Index].SID) < 0.0 + border	rem if leaving left
				if foes[Index].xMov < 0.0 
					foes[Index].yMov = foes[Index].xMov
					foes[Index].xMov = 0.0
					setSpritePosition(foes[Index].SID, border, getSpriteY(foes[Index].SID))			rem align to border edge
				endif
			endif
			if getSpriteY(foes[Index].SID) < 0.0 + border		rem if leaving top
				if foes[Index].yMov < 0.0
					foes[Index].xMov = foes[Index].yMov*-1.0
					foes[Index].yMov = 0.0
					setSpritePosition(foes[Index].SID, border, getSpriteY(foes[Index].SID))			rem align to border edge
				endif
			endif
		else
			rem bounce foes when hitting walls
			if getSpriteX(foes[Index].SID) + (GetSpriteWidth(foes[Index].SID)) > ARENA_WIDTH-border		rem if leaving right
				if foes[Index].xMov > 0.0 then foes[Index].xMov = foes[Index].xMov*-1.0
			endif
			if getSpriteY(foes[Index].SID) < 0.0 + border																								rem if leaving top
				if foes[Index].yMov < 0.0 then foes[Index].yMov = foes[Index].yMov*-1.0
			endif
			if getSpriteX(foes[Index].SID) < 0.0	+ border																							rem if leaving left
				if foes[Index].xMov < 0.0 then foes[Index].xMov = foes[Index].xMov*-1.0
			endif
			if getSpriteY(foes[Index].SID) + (GetSpriteHeight(foes[Index].SID)) > ARENA_HEIGHT-border	rem if leaving bottom
				if foes[Index].yMov > 0.0 then foes[Index].yMov = foes[Index].yMov*-1.0
			endif
		endif
		
		
		rem move foes
		setSpritePosition(foes[Index].SID, getSpriteX(foes[Index].SID)+(foes[Index].xMov*deltaTime#*boost#), getSpriteY(foes[Index].SID)+(foes[Index].yMov*deltaTime#*boost#))
		
		rem move hero
		heroPosX as float
		heroPosY as float
		heroPosX = getRawMouseX()+3
		heroPosY = getRawMouseY()+8
		
		if heroPosX < 0.0 then heroPosX = border*0.5
		if heroPosX > ARENA_WIDTH then heroPosX = ARENA_WIDTH-getSpriteWidth(heroSID)
		if heroPosY < 0.0 then heroPosy = border*0.5
		if heroPosY > ARENA_HEIGHT then heroPosY = ARENA_HEIGHT-getSpriteHeight(heroSID)
		
		setSpritePosition(heroSID, heroPosX, heroPosY)
		
		rem detect collision with player
		if GetSpriteCollision(heroSID, foes[Index].SID) = TRUE then gameOver = TRUE
		rem if GetSpriteHit( getPointerX(), getPointerY() ) = foes[Index].SID then gameOver = TRUE
		rem print (str(GetSpriteHit( getPointerX()+4, getPointerY()+7 )))
	next

endfunction


function foes_delete()

	While Foes.length > -1
			DeleteSprite(foes[0].SID)
			foes.remove(0)
	endwhile
	
	// DeleteSprite(heroSID)
endfunction


