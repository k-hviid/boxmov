
_init:

	#option_explicit

	#constant TRUE	1
	#constant FALSE	0
	
	#constant GAMESTATE_MENU	0
	#constant GAMESTATE_PLAY	1
	
	#constant ARENA_WIDTH			800
	#constant ARENA_HEIGHT		800
	
	global gameState as Integer
	gameState = GAMESTATE_MENU


	SetErrorMode(2)					rem 2 = show all errors

	// set window properties
	SetWindowTitle( "boxmov" )
	SetWindowSize( ARENA_WIDTH, ARENA_HEIGHT, 0 )
	SetWindowAllowResize( 1 ) // allow the user to resize the window

	// Display properties
	SetVirtualResolution( ARENA_WIDTH, ARENA_HEIGHT ) // doesn't have to match the window
	SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
	setVsync(TRUE)
	SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
	UseNewDefaultFonts(TRUE)
	SetAntialiasMode( TRUE )		//  0=off, 1=4xMSAA


return
