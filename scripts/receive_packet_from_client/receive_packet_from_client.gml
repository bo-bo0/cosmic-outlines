function receive_packet_from_client(buffer,socket){
	
	var current_message;
	var client_id;
	var current_client;
	var current_index;
	
	enum jumpState {isJumping = 1,isNotJumping = 0};

	buffer_seek(buffer,buffer_seek_start,0); //set pointer at the start of the buffer

	//create connected player

	client_id = buffer_read(buffer,self.buffer_data_type); //get id of client that is sending data to the server
	
	//buffer_receive_player(buffer); //creates the connected player (if it wasn't already created)
	
	
	//create new player
	if(ds_list_find_value(client_already_player_created,client_id) == false) {
		
			ds_list_insert(client_already_player_created,client_id,true);
			
			var new_player = instance_create_layer(obj_player.x,obj_player.y,"Instances",obj_connected_player);
			new_player.player_online_id = client_id;
				//show_debug_message(client_id);
		}
	
	//verify which connected player is being changed
	
	
	show_debug_message(string_concat("client_id: ",client_id));
	
	for(var i = 0; i < self.connected_clients; i++){
		
	    current_client = instance_find(obj_connected_player,i);
		
		if(current_client != noone) {
		
			if(current_client.player_online_id == client_id) {
				
				current_index = current_client.player_online_id;
				show_debug_message(string_concat("current_index: ",current_index));
				
				
				break;
			}
		}
	}
	
	if current_client != noone {
		
		
	
		with(current_client) {
	
		//movement of connected player
		
	 
		 current_message = buffer_read(buffer,obj_network.buffer_data_type);
		 obj_connected_player.x = current_message; //set the x position
	 
		 current_message = buffer_read(buffer,obj_network.buffer_data_type);
		 obj_connected_player.y = current_message; //set the y position
	 
		current_message = buffer_read(buffer,obj_network.buffer_data_type); //gets player speed in the first bits
	
		obj_connected_player.current_speed = current_message;
	
		//player jump
		current_message = buffer_read(buffer,obj_network.buffer_data_type);
	
		if (current_message == jumpState.isJumping)  //if player is jumping, show jump to other players
			///jump animation
		
			animate_jump(right_sprite,left_sprite,right_sprite_animated,left_sprite_animated,right_sprite_jump,left_sprite_jump);
		
		}
	}
		

}