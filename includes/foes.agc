
_foes:

	type foe
		SID as integer
		xMov as float			rem The distance it moves per second, in pixels. Can be negative
		yMov as float			rem  -||-
	endtype

	Global Foes as Foe[]

return


function foe_create(x as integer, y as integer, xMov as float, yMov as float, sprW as float, sprH as float, r as integer, g as integer, b as integer)

    local TmpFoe as foe
    TmpFoe.xMov = xMov
    TmpFoe.yMov = yMov
    TmpFoe.SID = createSprite(0)
    setSpriteColor(TmpFoe.SID, r, g, b, 255)
    setSPriteSize(TmpFoe.SID, sprW, sprH)
    SetSpritePosition (TmpFoe.SID, x, y)
    Foes.insert(TmpFoe)
endfunction


function foe_update ()

Index as integer
for Index=0 to Foes.length
	
	rem bounce foes when hitting walls
	if getSpriteX(foes[Index].SID) + (GetSpriteWidth(foes[Index].SID)) > ARENA_WIDTH		rem if leaving right
		if foes[Index].xMov > 0.0 then foes[Index].xMov = foes[Index].xMov*-1.0
	endif
	if getSpriteY(foes[Index].SID) < 0.0																								rem if leaving top
		if foes[Index].yMov < 0.0 then foes[Index].yMov = foes[Index].yMov*-1.0
	endif
	if getSpriteX(foes[Index].SID) < 0.0																								rem if leaving left
		if foes[Index].xMov < 0.0 then foes[Index].xMov = foes[Index].xMov*-1.0
	endif
	if getSpriteY(foes[Index].SID) + (GetSpriteHeight(foes[Index].SID)) > ARENA_HEIGHT	rem if leaving bottom
		if foes[Index].yMov > 0.0 then foes[Index].yMov = foes[Index].yMov*-1.0
	endif
	
	rem move foes
	setSpritePosition(foes[Index].SID, getSpriteX(foes[Index].SID)+(foes[Index].xMov*deltaTime#), getSpriteY(foes[Index].SID)+(foes[Index].yMov*deltaTime#))
	
	rem move hero
	setSpritePosition(heroSID, getRawMouseX()+(getSpriteWidth(heroSID)), getRawMouseY()+(getSpriteHeight(heroSID))) 
	
next

endfunction


/*
SetPhysicsGravity( 0.0, 0.0 )
SetPhysicsWallBottom(TRUE)
SetPhysicsWallLeft(TRUE)
SetPhysicsWallRight(TRUE)
SetPhysicsWallTop(TRUE)
*/

remstart
  SetSpritePhysicsCanRotate( iSpriteIndex, FALSE ) 
SetSpritePhysicsDamping( iSpriteIndex, 0.0 )
SetSpriteGroup( iSpriteIndex, group, shapeID )
SetSpritePhysicsOn( iSpriteIndex, mode ) // 1=static, 2=dynamic, 3=kinematic
remend
 



