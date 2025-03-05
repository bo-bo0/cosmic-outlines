function server_data_reception(buffer_type){

	
	
	//different server actions based on what was sent by client
	
	switch(buffer_type) {
		
		//client conncted
		
		case network_type_connect:
		
			{	
				self.connected_clients++;
				self.buffer_server_got_socket = ds_map_find_value(async_load,"socket"); //identify which client sent the data
				show_message(string_concat("Player"," joined the game."));
			
			break;
			}
			
			//client disconncted
			
			case network_type_disconnect:
		
			{
				self.connected_clients--;
				show_message(string_concat("Player"," left the game."));
				
			break;
			}
			
			//client sent data
			
			case network_type_data:
		
			{
			
			self.buffer_server_got = ds_map_find_value(async_load,"buffer");
			
			receive_packet(self.buffer_server_got,self.buffer_server_got_socket);
			
			break;
			}
	
	
	
	}

}