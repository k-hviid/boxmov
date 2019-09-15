
// Project: boxmov 
// Created: 2019-09-07

REMSTART
TODO
[v] Colors
[v] Timer
[v] Round shapes
[v] Progressively harder levels
[v] Freeze-frame
[v] Html-export
[v] Planning enemies
		wide one
		fast
		slow
		big
[v] Avoid starting inside enemies
[v] Tint at front
[v] Main menu with description and logo
[v] Itch io settings
[v] gameover if touching edge frame (immobile sprites)
[ ] figure out the problem with the lack of mouse cursor
REMEND

#include "includes/init.agc"
gosub _init
#include "includes/title.agc"
gosub _title
#include "includes/menu.agc"
gosub _menu
#include "includes/play.agc"
gosub _play
#include "includes/hero.agc"
gosub _hero
#include "includes/foes.agc"
gosub _foes



do
	currentFrameTime# = Timer()											REM remember the time
	deltaTime# = currentFrameTime# - lastFrameTime#	REM set the deltaTime to how much time has passed, in fractions of a second
	lastFrameTime# = currentFrameTime#							REM store the current time for use in the next cycle
	
	select gameState
		case GAMESTATE_TITLE:
			menu_play()
		endcase
		case GAMESTATE_MENU:
			menu()
		endcase
		case GAMESTATE_PLAY:
			play()
		endcase
	endselect
	
	sync()

loop
