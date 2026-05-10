extends Node2D

## background colour and grid size
# dark background like speed tickers
var background_color = Color("050508") 
# darker, cleaner blue lines
var grid_color = Color("1a2a3a")       
# needs to match tilemap size
var grid_size = 64.0                   

func _draw():
	# grab the screen size from the parent parallax layer
	var screen_size = get_parent().motion_mirroring
	 
	# just in case it isn't set, default to standard hd
	if screen_size == Vector2.ZERO:
		screen_size = Vector2(1152, 648)

	# void background
	# theres a big rectangle and you basically draw all of the lines on top of it
	draw_rect(Rect2(Vector2.ZERO, screen_size), background_color, true)

	# vertical lines
	# drawing them thin (1.0) makes them look way sharper
	for x in range(0, int(screen_size.x), int(grid_size)):
		draw_line(Vector2(x, 0), Vector2(x, screen_size.y), grid_color, 1.0)

	# horizontal lines
	for y in range(0, int(screen_size.y), int(grid_size)):
		draw_line(Vector2(0, y), Vector2(screen_size.x, y), grid_color, 1.0)
