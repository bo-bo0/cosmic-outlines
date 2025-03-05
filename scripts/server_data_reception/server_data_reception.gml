function server_data_reception(buffer_type){

	var current_socket = ds_map_find_value(async_load,"socket"); //identify which client sent the data
	
	
	//different server actions based on what was sent by client
	
	switch(buffer_type) {
		
		//client conncted
		
		case network_type_connect:
		
			{	
				//client ids settings
				
				self.connected_clients++;
				
				
				
				 //save client socket in the list		
				ds_list_add(self.buffer_server_got_socket,current_socket);
			
				//remember in this client there is no server player
				ds_list_add(self.server_already_player_created,false);
				
				//remember in the server there is no player for this client
				ds_list_add(self.client_already_player_created,false);
			
				show_message(string_concat("Player"," joined the game."));
			
			break;
			}
			
			//client disconncted
			
			case network_type_disconnect:
		
			{
				self.connected_clients--;
				
				//find which client disconnected and remove it from clients list
				var disconnect_index = ds_list_find_index(self.buffer_server_got_socket,current_socket);
				if (disconnect_index != -1) {
					ds_list_delete(self.buffer_server_got_socket,disconnect_index);
					
					ds_list_delete(self.server_already_player_created,disconnect_index);
					
				}
				
				show_message(string_concat("Player"," left the game."));
				
			break;
			}
			
			//client sent data
			
			case network_type_data:
		
			{
			
			self.buffer_server_got = ds_map_find_value(async_load,"buffer");
			
			receive_packet_from_client(self.buffer_server_got,current_socket);
			
			break;
			}
	
	
	
	}

}