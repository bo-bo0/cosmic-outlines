function receive_packet_from_client(buffer,socket){
	
	var current_message;
	var client_id;
	var current_client;
	var current_index;
	
	enum jumpState {isJumping = 1,isNotJumping = 0};
	
	var client_data = ds_list_create(); //list that will contain all the data this client is sending

	buffer_seek(buffer,buffer_seek_start,0); //set pointer at the start of the buffer

	//create connected player

	client_id = buffer_read(buffer,self.buffer_data_type); //get id of client that is sending data to the server
	ds_list_add(client_data,client_id); //stores id of the client
	
	//create new player
	
	var list_id = client_id - 1; //id to use for list of clients state (since client ids start from 1 but list ids start from 0)
	
	if(ds_list_find_value(client_already_player_created,list_id) == false){
		
		
			ds_list_add(client_data,false); //this client still did not create the player
			
			ds_list_insert(client_already_player_created,list_id,true);
			if(instance_number(obj_connected_player) < self.connected_clients) {
			
			var new_player = instance_create_layer(obj_player.x,obj_player.y,"Instances",obj_connected_player);
			new_player.player_online_id = client_id;
			}
		
		}
		
		else 
			ds_list_add(client_data,true); //this client already created the player
	
	//verify which connected player is being changed
	
	for(var i = 0; i < self.connected_clients; i++){
		
	    current_client = instance_find(obj_connected_player,i);
		
		if(current_client != noone) {
		
			if(current_client.player_online_id == client_id) {
				
				current_index = current_client.player_online_id;
				
				break;
			}
		}
	}
	
	if current_client != noone {
		
		
	//all of the following actions will only be executed on the client that is currently sending data
		with(current_client) { 
	
		//movement of connected player
		
	 
		 current_message = buffer_read(buffer,obj_network.buffer_data_type);
		 x = current_message; //set the x position
		 ds_list_add(client_data,current_message); //stores x of the client
	 
		 current_message = buffer_read(buffer,obj_network.buffer_data_type);
		 y = current_message; //set the y position
		 ds_list_add(client_data,current_message); //stores y of the client
	 
		current_message = buffer_read(buffer,obj_network.buffer_data_type); //gets player speed in the first bits
	
		current_speed = current_message;
		ds_list_add(client_data,current_message); //stores speed of the client
	
		//player jump
		current_message = buffer_read(buffer,obj_network.buffer_data_type);
		ds_list_add(client_data,current_message); //stores if client is jumping
	
		if (current_message == jumpState.isJumping)  //if player is jumping, show jump to other players
			///jump animation
		
			animate_jump(right_sprite,left_sprite,right_sprite_animated,left_sprite_animated,right_sprite_jump,left_sprite_jump);
		
		}
	}
		
		if(client_id - 1 <= ds_list_size(self.stored_clients_data) and client_id > 0) {
		
			var find = ds_list_find_value(self.stored_clients_data,client_id - 1);
		
			if(not(is_undefined(find) or find == 0))	
				ds_list_replace(self.stored_clients_data,client_id - 1,client_data); //insert data of current client in main clients list
			else 
				ds_list_add(self.stored_clients_data,client_data);
		}
}



