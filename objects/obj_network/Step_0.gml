//data sending

	//server sending
	if (is_server and connected_clients > 0) {
		
		//for cycle to send packet to each client
		for(var i = 0; i < connected_clients; i++) {
			
			current_server_target_socket_index = i;
			send_packet_to_client(server_buffer,buffer_data_type,ds_list_find_value(buffer_server_got_socket,i));
		}
		disconnected_client = 0;
		
	}
		
		
	//client sending (and detecting server activity)
	else if (is_client) {
		send_packet_to_server(client_buffer,buffer_data_type,client_socket);
		
		//check if server has stopped sending data
		
		
		if(ranBuffer == ranBuffer_backup)  
			count_same_buffer++; 
		else {
		
			count_same_buffer = 0;
			ranBuffer_backup = ranBuffer;
		}
		
		if(count_same_buffer >= 140)
			server_is_sending_data = false;
		
	}
		


//if server stops sending data disconnect client

if(is_client and !server_is_sending_data) { 
	
	 show_message("Lost connection to the server.");
	
	 obj_player.player_online_id = 0;
	 
	 is_client = false;
	 
	 network_destroy(client_socket);
	 
	 //reset variables for next connection
	 count_same_buffer = 0;
	 
	 server_is_sending_data = true;
	
}
	 
	 
if(not(is_client or is_server)) {
	 
	for(var i = 0; i < instance_number(obj_connected_player); i++) {
	 
		var currConnPlayer = instance_find(obj_connected_player,i);
	 
		instance_destroy(currConnPlayer);
	}
	 
}

//remove disconnected client from other clients

if(is_client) {
	if(disconnected_client != 0) {
		for(var j = 0; j < instance_number(obj_connected_player); j++) {
		
			var curr = instance_find(obj_connected_player,j);
			
			if(curr.player_online_id == disconnected_client) {
			
				instance_destroy(curr); 
				break;
			
			}
		
		}
	}
}