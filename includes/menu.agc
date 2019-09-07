
_menu:


	rem todo build menu, then hide

return


function menu()
	
	REM todo show pretty menu
	
do
	print("click to begin")
	
	if GetPointerPressed() = TRUE
		gameState = GAMESTATE_PLAY
		exit
	endif
	
	sync()
loop

	REM todo hide pretty menu
	
endfunction
