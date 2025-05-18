// Inherit the parent event
event_inherited();

//movement with keys


if (keyboard_check(ord(right_key)) and !place_meeting(x + spd,y,par_block)) {
	
	if (current_speed < spd)
		current_speed += acceleration; //set speed while walking
	
}

else if (current_speed > 0 and !place_meeting(x + spd,y,par_block))
	current_speed -= acceleration; //slowly stop moving
	
else if (current_speed > 0)
	current_speed = 0; //if collision instantly stop moving
	


if (keyboard_check(ord(left_key)) and !place_meeting(x - spd,y,par_block)) {

if (current_speed > -spd)
		current_speed -= acceleration;
	
}

else if (current_speed < 0 and !place_meeting(x - spd,y,par_block))
	current_speed += acceleration; //slowly stop moving

else if (current_speed < 0)
	current_speed = 0; //if collision instantly stop moving
	
if (keyboard_check(ord(right_key)) and x > 1262) { current_speed = 0; }

if (keyboard_check(ord(left_key)) and x < -32) { current_speed = 0; }

if (is_gui_open) { current_speed = 0; }
	
x += current_speed;	//move player

//walk animation

if (place_meeting(x, y  + fallspd, par_block)) //make it only work if player is touching ground
	animate_walk(spr_playerRight,spr_playerLeft,spr_player_walkRight,spr_player_walkLeft,current_speed,spd); 


//jump

	//set jump_try to fix frame perfect jumps
if(keyboard_check_pressed(jump_key))  {
	jump_try = true;
	alarm[0] = 8; //disable jump_try after a while in the air

}

	//execute jump
if (jump_try and place_meeting(x,y+1,par_block)) 
	jump_activate();
	
	
	


//debug

debug_key(player_online_id,"R");