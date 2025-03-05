//data sending

	//server sending
	if (is_server and connected_clients > 0) 
		send_packet(server_buffer,buffer_data_type,buffer_server_got_socket);
	
	
	//client sending
	else if (is_client) 
		send_packet(client_buffer,buffer_data_type,client_socket);
		