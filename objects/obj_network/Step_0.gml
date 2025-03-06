//data sending

	//server sending
	if (is_server and connected_clients > 0) {
		
		//for cycle to send packet to each client
		for(var i = 0; i < connected_clients; i++) {
			
			current_server_target_socket_index = i;
			send_packet_to_client(server_buffer,buffer_data_type,ds_list_find_value(buffer_server_got_socket,i));
		}
		
		//debug
		/*
		var cont = 0;
		
		for(var i = 0; i < connected_clients; i++) {
		
			var found = instance_find(obj_connected_player,i);
			
			if(found != noone)
				show_debug_message(string_concat("id connected player",i + 1,": ",found.player_online_id));
							
		} */
		
		
		
		
		
	}
		
		
	//client sending
	else if (is_client) 
		send_packet_to_server(client_buffer,buffer_data_type,client_socket);
		
		
		