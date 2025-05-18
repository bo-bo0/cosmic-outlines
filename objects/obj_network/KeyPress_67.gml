if(!is_client and !is_server) {

	if(!instance_exists(obj_default_gui)) {
	
		var curr_gui = instance_create_layer(0,0,"Instances",obj_default_gui); 
	
		obj_player.is_gui_open = true;
	
		with(curr_gui) {
	
			x = 378;
			y = 96;
		
			image_xscale = 9.3;
		
			image_yscale = 7.4;
	
			depth = -100;
		
			online_state = "client";
	
		}
	
	}

}