function animate_walk(right_sprite,left_sprite,right_sprite_animated,left_sprite_animated,spd,max_spd){
	//right animation

	if (spd > 0) {

		sprite_index = right_sprite_animated;
		image_speed = 1/max_spd * spd;
	}

	//left animation

	else if (spd < 0) {

		sprite_index = left_sprite_animated;
		image_speed = 1/max_spd * spd;

	}

	else /*if spd is 0 set to left or right not animated*/ {

		if(sprite_index == right_sprite_animated) 
			sprite_index = right_sprite;
	
	
		else if (sprite_index == left_sprite_animated)
			sprite_index = left_sprite;

	}


}