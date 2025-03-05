buffer_data_type = buffer_f16; 

already_player_created = false;


//server variables

port = 50326;

max_clients = 1;

connected_clients = 0;

is_server = false;

socket_type = network_socket_tcp;

server_socket = -1;

	//test server variables
	
	socket_connected = 0;

	//server buffer variables
	
	server_buffer = 0;
	
	server_buffer_size = 1024; //1 KiB
	
	server_buffer_type = buffer_fixed;
	
	server_buffer_alignment = 2;
	
	

	
	
	//server message got variables
	
	buffer_server_got = 0;
	
	buffer_server_got_type = 0;
	
	buffer_server_got_socket = 0;

//client variables

is_client = false;

client_socket = -1;

	//client buffer variables
	
	client_buffer = 0;
	
	client_buffer_size = 1024; //1 KiB
	
	client_buffer_type = buffer_fixed;
	
	client_buffer_alignment = 2;
	

	//client message got variables
	
	buffer_client_got = 0;
	
		//of course this will always be the server socket, this is only needed for compatibility
	buffer_client_got_socket = 0; 