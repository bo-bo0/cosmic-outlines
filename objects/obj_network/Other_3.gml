//stop communication
	
if (is_server) {
	
	//for cycle to delete each stored client socket
    for (var i = 0; i < ds_list_size(buffer_server_got_socket); i++) {
        var current_socket = ds_list_find_value(buffer_server_got_socket, i);
        network_destroy(current_socket);
    }
    ds_list_destroy(buffer_server_got_socket); //delete connected clients socket list
    network_destroy(server_socket); //delete server socket
}


else if (is_client)
	network_destroy(client_socket);