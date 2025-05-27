function receive_packet_from_server(buffer,socket){
	
	var current_message;
	
	//enum jumpState {isJumping = 1,isNotJumping = 0};

	buffer_seek(buffer,buffer_seek_start,0); //set pointer at the start of the buffer

	current_message = buffer_read(buffer,self.buffer_data_type); //random number for server actitvity

	self.ranBuffer = current_message;

		
		if(self.count_same_buffer == 300) { self.server_is_sending_data = false; }

	//create connected player

	current_message = buffer_read(buffer,self.buffer_data_type); //reads number of connected clients
	
	if(obj_player.player_online_id == 0) { obj_player.player_online_id = current_message; }

	buffer_receive_player(buffer); //creates the connected player (if it wasn't already created)
	
	
	
	//movement of connected player
	 
	 current_message = buffer_read(buffer,self.buffer_data_type);
	 obj_connected_player.x = current_message; //set the x position
	 
	 current_message = buffer_read(buffer,self.buffer_data_type);
	 obj_connected_player.y = current_message; //set the y position
	 
	current_message = buffer_read(buffer,self.buffer_data_type); //gets player speed in the first bits
	
	obj_connected_player.current_speed = current_message;
	
	//player jump
	current_message = buffer_read(buffer,self.buffer_data_type);
	
	if (current_message == jumpState.isJumping)  //if player is jumping, show jump to other players
		///jump animation
		with(obj_connected_player) {
		animate_jump(right_sprite,left_sprite,right_sprite_animated,left_sprite_animated,right_sprite_jump,left_sprite_jump);
		}
		
		
		
		
		
		
		////////////////////managing of other clients string:
		
		var main_ds_list = ds_list_create();

		current_message = buffer_read(buffer,self.buffer_data_type); //read how many other clients there are

		for(var i = 0; i < current_message; i++) {
		
			//show_debug_message(" buffer_pos = " + string(buffer_tell(buffer)));
			
			var buffer_pos = buffer_tell(buffer);
			var current_dslist_string = buffer_read(buffer,buffer_string);
			//buffer_seek(buffer,buffer_pos + 20,0);
			
			//show_debug_message(" buffer_pos = " + string(buffer_tell(buffer)));
			
			//fix initial comma bug
			if(string_char_at(current_dslist_string,1) == ",") 
				current_dslist_string = string_copy(current_dslist_string,2,string_length(current_dslist_string) - 1);
				
			//fix iitial previous buffer sniff
			if(string_char_at(current_dslist_string,2) != ",")
				current_dslist_string = string_copy(current_dslist_string,2,string_length(current_dslist_string) - 1);
				
			////////
			show_debug_message(current_dslist_string);
			
			var sub_list = ds_list_create();
			//list read
			
			var par_counter = 0; //counts to what parameter it's arrived
			var phS = "";
			
			
			for(var j = 1; j <= string_length(current_dslist_string); j++) {
			
				if(string_char_at(current_dslist_string,j) != ",") {
				
					phS += string_char_at(current_dslist_string,j)
				
				}
				
				else if(phS != "") {
				
					if(par_counter != 1) 
						ds_list_add(sub_list,real(phS));
					
					
					else 
						ds_list_add(sub_list,bool(phS));
						
					//if(par_counter == 0)show_debug_message("last id received: "+ string(phS));
			
					par_counter++;
					phS = "";
					

				}
				
				else 
					break;
			
			}
			
			///////////////////////finalize
			
			ds_list_add(main_ds_list,sub_list);
			ds_list_mark_as_list(main_ds_list,ds_list_size(main_ds_list) - 1);
			
			manage_clients_on_client_side(main_ds_list);
		}
		
		ds_list_destroy(main_ds_list); //erase local list when finished
}

