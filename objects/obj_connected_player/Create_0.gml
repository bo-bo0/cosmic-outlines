// Inherit the parent event
event_inherited();

//variables

socket = -1; //a connected player will use this to know which client is using it

spd = 4;

current_speed = 0;

acceleration = 0.4;

max_jump_spd = 6;

jump_spd = max_jump_spd;

jump_try = false;

player_online_id = 0; //networking

/////animate jump arguments

right_sprite = spr_playerRight;

left_sprite = spr_playerLeft;

right_sprite_animated = spr_player_walkRight;

left_sprite_animated = spr_player_walkLeft;

right_sprite_jump = spr_player_jumpRight;

left_sprite_jump = spr_player_jumpLeft;
////////


//debug 

image_xscale = 3;
image_yscale = 3;


