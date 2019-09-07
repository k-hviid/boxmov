
_play:



return

function play()
	
	SetRawMouseVisible( 0 )
	foe_create(400, 400, 3.0, 1.2, 63, 63, 128, 200, 100)
	
do
	print("play")
	
	foe_update ()
	
	sync()
loop
	
endfunction
