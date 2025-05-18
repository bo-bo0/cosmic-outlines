buffer_data_type = buffer_f32; //huge buffer for better precision with coordinates


//server variables

port = 50326;

max_clients = 0;

connected_clients = 0;

last_connected_id = 0;

is_server = false;

socket_type = network_socket_tcp;

server_socket = -1;

current_server_target_socket_index = 0;



	//server buffer variables
	
	server_buffer = 0;
	
	server_buffer_size = 1024; //1 KiB
	
	server_buffer_type = buffer_fixed;
	
	server_buffer_alignment = 2;
	
	
	
	//server message got variables
	
	buffer_server_got = 0;
	
	buffer_server_got_type = 0;
	
	
	//initialize list of connected clients
	buffer_server_got_socket = ds_list_create();
	
	//list to store in which clients the server player is already created
server_already_player_created = ds_list_create(); 
	
client_already_player_created = ds_list_create();


//list containing all the data of each client in each element/position
stored_clients_data = ds_list_create();


	//json buffer variables
	json_buffer_data_type = buffer_string;
	
	json_server_buffer = 0;


//client variables

ip = "127.0.0.1"

is_client = false;

client_socket = -1;

server_is_sending_data = true;

ranBuffer = 0;

ranBuffer_backup = 0;

count_same_buffer = 0;

	//client buffer variables
	
	client_buffer = 0;
	
	client_buffer_size = 1024; //1 KiB
	
	client_buffer_type = buffer_fixed;
	
	client_buffer_alignment = 2;
	

	//client message got variables
	
	buffer_client_got = 0;
	
		//of course this will always be the server socket, this is only needed for compatibility
	buffer_client_got_socket = 0; 
	
randomize();