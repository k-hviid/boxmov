
_init:

	#constant TRUE	1
	#constant FALSE	0
	
	#constant GAMESTATE_MENU	0
	#constant GAMESTATE_PLAY	1


	SetErrorMode(2)					rem 2 = show all errors

	// set window properties
	SetWindowTitle( "boxmov" )
	SetWindowSize( 800, 800, 0 )
	SetWindowAllowResize( 1 ) // allow the user to resize the window

	// Display properties
	SetVirtualResolution( 1024, 768 ) // doesn't have to match the window
	SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
	setVsync(TRUE)
	SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
	UseNewDefaultFonts(TRUE)


return
