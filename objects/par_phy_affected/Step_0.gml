//fall
if (!jump) {
    if (!place_meeting(x, y + fallspd, par_block) or hit_jump) { 
        y += fallspd;
        fallspd += ga;
        hit_jump = false; 
    } else {
        fallspd = 0;
        if (sprite_index == right_sprite_jump or sprite_index == left_sprite_jump) //disable jump animation when land
            image_index = 0;
    }
}


//jump

else /*jump if jump = true*/ {
	

	if (!place_meeting(x, y - 1, par_block)) { 
	    y -= jump_spd;
	    jump_spd -= ga; 
	} 
	else /*stop if touches something with head during jump*/  {
	    jump = false;
		jump_spd = max_jump_spd;
		hit_jump = true;
	}
    
	
	if (jump_spd <= 0) {
	
		jump = false;
		jump_spd = max_jump_spd;

	  }
  
  
	///jump animation
	animate_jump(right_sprite,left_sprite,right_sprite_animated,left_sprite_animated,right_sprite_jump,left_sprite_jump);

}
	
	