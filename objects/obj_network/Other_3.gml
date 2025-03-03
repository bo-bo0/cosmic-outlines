// Chiudi connessioni alla chiusura del gioco
if (server_socket != -1) network_destroy(server_socket);
if (client_socket != -1) network_destroy(client_socket);
