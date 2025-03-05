var _id = async_load[? "id"];
var type = async_load[? "type"];

// Se siamo il server e qualcuno si connette
if (is_host && type == network_type_connect) {
    show_message("Un client si è connesso!");
	instance_create_layer(0,0,"Instances",obj_player)
}

// Se riceviamo dati
if (type == network_type_data) {
    var data = async_load[? "data"];
    show_debug_message("Messaggio ricevuto: " + string(data));
}

// Se siamo il client, inviamo un messaggio al server dopo la connessione
if (is_client && type == network_type_connect) {
    network_send_packet(connection, "Ciao server!", network_socket_tcp);
}
