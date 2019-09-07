
// Project: boxmov 
// Created: 2019-09-07

#include "includes/init.agc"
gosub _init
#include "includes/menu.agc"
gosub _menu
#include "includes/play.agc"
gosub _play
#include "includes/hero.agc"
gosub _hero
#include "includes/foes.agc"
gosub _foes

global currentFrameTime# as float
global deltaTime# as float
global lastFrameTime# as float
lastFrameTime# = Timer()
do
	currentFrameTime# = Timer()											REM remember the time
	deltaTime# = currentFrameTime# - lastFrameTime#	REM set the deltaTime to how much time has passed, in fractions of a second
	lastFrameTime# = currentFrameTime#							REM store the current time for use in the next cycle
	
	select gameState
		case GAMESTATE_MENU:
			menu()
		endcase
		case GAMESTATE_PLAY:
			play()
		endcase
	endselect


loop
