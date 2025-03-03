// Creazione del client e connessione al server
client_socket = network_create_socket(network_socket_tcp);
connection = network_connect(client_socket, "127.0.0.1", 5000);
if (connection != -1) {
    is_client = true;
    show_message("Connesso al server locale!");
} else {
    show_message("Errore nella connessione al server.");
}
