// Inherit the parent event
event_inherited();
//walk animation

if (place_meeting(x, y  + fallspd, par_block))  //make it only work if player is touching ground
	animate_walk(spr_playerRight,spr_playerLeft,spr_player_walkRight,spr_player_walkLeft,current_speed,spd); 