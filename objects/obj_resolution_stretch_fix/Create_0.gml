application_surface_draw_enable(false);

window_width = display_get_width();
window_height = display_get_height();

game_height = window_height;
game_width = game_height * ((1366/2)/(768/2))/*aspect ratio*/;

surface_resize(application_surface,game_width,game_height);

x_offset = (window_width - game_width) / 2;
y_offset = (window_height - game_height) / 2;

display_set_gui_maximize(game_width/1366,game_height/768)