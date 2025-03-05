//stop communication

if (is_client)
	network_destroy(client_socket);
	
else if (is_server)
	network_destroy(server_socket);