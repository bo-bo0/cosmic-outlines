// Creazione del server sulla porta 5000
server_socket = network_create_server(network_socket_tcp, 5000, 4); // 4 connessioni massime

is_host = true;

show_debug_message(server_socket)