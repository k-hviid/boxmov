
_init:

	#option_explicit

	#constant TRUE	1
	#constant FALSE	0

	#constant GAMESTATE_TITLE	0	
	#constant GAMESTATE_MENU	1
	#constant GAMESTATE_PLAY	2
	
	#constant ARENA_WIDTH			640
	#constant ARENA_HEIGHT		480
	
	SetErrorMode(2)					rem 2 = show all errors
	
	global gameState as Integer
	gameState = GAMESTATE_TITLE
	
	SetPrintColor(128, 200, 100, 255)
	setPrintSize(22.0)

	rem SET WINDOW PROPERTIES
	SetWindowTitle( "boxmov" )
	SetWindowSize( ARENA_WIDTH, ARENA_HEIGHT, 0 )
	SetWindowAllowResize( FALSE ) // allow the user to resize the window

	rem DISPLAY PROPERTIES
	SetVirtualResolution( ARENA_WIDTH, ARENA_HEIGHT ) // doesn't have to match the window
	SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
	setVsync(TRUE)
	SetScissor( 0,0,0,0 ) 		rem use the maximum available screen space, no black borders
	UseNewDefaultFonts(TRUE)
	SetAntialiasMode( FALSE )	rem  0=off, 1=4xMSAA
	
	SetDefaultMagFilter( 0 )	rem 0=nearest, 1=linear
	SetDefaultMinFilter( 0 )	rem 0=nearest, 1=linear
	
	SetClearColor(60,50,40)
	
	rem ==========================================================================================
	rem TIMING
	rem ==========================================================================================
	
	currentFrameTime# as float
	lastFrameTime# as float
	lastFrameTime# = Timer()
	global deltaTime# as float

return
