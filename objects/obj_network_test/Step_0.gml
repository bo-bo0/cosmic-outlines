if (is_host) {
    var host_player = instance_find(obj_player, 0);
    if (host_player != noone) {
        var buffer = buffer_create(8, buffer_fixed, 1);
        buffer_seek(buffer, buffer_seek_start, 0);
        buffer_write(buffer, buffer_f32, host_player.x);
        buffer_write(buffer, buffer_f32, host_player.y);
        network_send_packet(server_socket, buffer, network_socket_tcp);
        buffer_delete(buffer);
    }
}
