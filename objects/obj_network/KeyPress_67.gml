//connect as guest (client)

if (!is_client and !is_server) {

	client_socket = network_create_socket(socket_type); //set client socket
	var connection = network_connect(client_socket,"127.0.0.1",port); //attempt to connect client
	
	if (connection > -1) {
	
		//client connection was succesfull
	
		is_client = true;
		client_buffer = buffer_create(client_buffer_size,client_buffer_type,client_buffer_alignment);
		show_message("Client connected.");
	
	}
	else //client connection failed
		show_message("Connection failed (client).")
	

}