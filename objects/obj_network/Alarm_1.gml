//connect as host (server)

if (!is_client and !is_server) {
	
	server_socket = network_create_server(socket_type,port,max_clients); //attempt to create server
	
	if (server_socket > -1) {
		
		//server creation was succesfull
		
		is_server = true;
		server_buffer = buffer_create(server_buffer_size,server_buffer_type,server_buffer_alignment);
		show_message("Server connected.");
		
	}
	else //server creation failed
		show_message("Connection failed (server).");
}

instance_destroy(obj_default_gui);

obj_player.is_gui_open = false;
