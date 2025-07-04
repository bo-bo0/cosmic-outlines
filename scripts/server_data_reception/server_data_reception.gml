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
				ds_list_insert(self.buffer_server_got_socket,current_socket - 1,current_socket);
				
				//remember in this client there is no server player
				ds_list_insert(self.server_already_player_created,current_socket - 1,false);
				
				//remember in the server there is no player for this client
				ds_list_insert(self.client_already_player_created,current_socket - 1,false);
				
				show_message_async(string_concat("Player ",current_socket," joined the game."));
				
			
			break;
			}
			
			//client disconncted
			
			case network_type_disconnect:
		
			{
				self.connected_clients--;
				
				//find which client disconnected and remove it from clients list
				var disconnect_index = ds_list_find_index(self.buffer_server_got_socket,current_socket);
				if (disconnect_index != -1) {
					
					self.disconnected_client = disconnect_index + 1; //remember who disconnected to tell other clients
					
					ds_list_delete(self.buffer_server_got_socket,disconnect_index);
					ds_list_delete(self.server_already_player_created,disconnect_index);
					
					ds_list_delete(self.client_already_player_created,disconnect_index);
					
					ds_list_delete(self.stored_clients_data,disconnect_index);
					
					//delete obj connected player that disconnected
					
					for(var i = 0; i <= connected_clients; i++) {
					
						var current_player = instance_find(obj_connected_player,i);
						
						if(current_player != noone) {
						
							if(current_player.player_online_id == current_socket) {
							
								show_message_async(string_concat("Player ",current_player.player_online_id," left the game."));
							
								instance_destroy(current_player);
								
								break;
							
							}
						
						}
					
					} 
					
				}
				
				
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