function animate_jump(right_sprite, left_sprite, right_sprite_animated, left_sprite_animated, right_sprite_jump, left_sprite_jump) {

    if (self.sprite_index == right_sprite or self.sprite_index == right_sprite_animated) {
        if (self.sprite_index != right_sprite_jump) { // reset only once
            self.sprite_index = right_sprite_jump;
            self.image_index = 0; 
        }
    } 
    
    else if (self.sprite_index == left_sprite or self.sprite_index == left_sprite_animated) {
        if (self.sprite_index != left_sprite_jump) { // reset only once
            self.sprite_index = left_sprite_jump;
            self.image_index = 0; 
        }
    }

    // animation progression
    if (self.sprite_index == right_sprite_jump or self.sprite_index == left_sprite_jump) {
        var frame_max = sprite_get_number(self.sprite_index) - 1;
        if (image_index < frame_max) { 
            image_index += 0.35;
            if (image_index > frame_max) { // set last frame
                image_index = frame_max;
            }
        }
    } 
	
	//change direction while jumping
	
	if(self.current_speed > 0)
		sprite_index = right_sprite_jump;
		
	else if(self.current_speed < 0)
		sprite_index = left_sprite_jump;
	

	
}
