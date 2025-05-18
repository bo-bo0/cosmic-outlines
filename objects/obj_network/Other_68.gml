//data reception 

	//server reception
	if (is_server) {
	
		buffer_server_got_type = ds_map_find_value(async_load,"type");
	
		server_data_reception(buffer_server_got_type);
	}


	//client reception
	
	else if (is_client) { 
		
		buffer_client_got = ds_map_find_value(async_load,"buffer");
		
			//of course this will always be the server socket, this is only needed for compatibility
		buffer_client_got_socket = ds_map_find_value(async_load,"socket");
		
		receive_packet_from_server(buffer_client_got,buffer_client_got_socket);
		
	}