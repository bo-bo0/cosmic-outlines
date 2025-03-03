//set fullscreen

if (!full_screen_delay) {
	if (window_get_fullscreen())
		window_set_fullscreen(false);
	else 
		window_set_fullscreen(true);
		
	//fix fullscreen/window switch bug
	full_screen_delay = true;
	alarm[0] = 10;
}