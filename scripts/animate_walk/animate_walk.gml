function animate_walk(right_sprite,left_sprite,right_sprite_animated,left_sprite_animated,spd,max_spd){

	//right animation

	if (spd > 0) {

		other.sprite_index = right_sprite_animated;
		other.image_speed = 1/max_spd * spd;
	}

	//left animation

	else if (spd < 0) {

		other.sprite_index = left_sprite_animated;
		other.image_speed = 1/max_spd * spd;

	}

	else /*if spd is 0 set to left or right not animated*/ {

		if(other.sprite_index == right_sprite_animated) 
			other.sprite_index = right_sprite;
	
	
		else if (other.sprite_index == left_sprite_animated)
			other.sprite_index = left_sprite;

	}


}