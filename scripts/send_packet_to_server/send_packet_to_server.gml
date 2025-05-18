function send_packet_to_server(buffer,buffer_data_type,socket){

		buffer_seek(buffer,buffer_seek_start,0); //set pointer to start of buffer
		
		buffer_write(buffer,buffer_data_type,obj_player.player_online_id); //send id of client which is operating to server
		
		
		//send movement
		
		buffer_write(buffer,buffer_data_type,obj_player.x); //send x position
		buffer_write(buffer,buffer_data_type,obj_player.y); //send y position
		
		buffer_write(buffer,buffer_data_type,obj_player.current_speed); //send player current speed
		
		 //send jump
		if (obj_player.jump) 
			buffer_write(buffer,buffer_data_type,1); //send 1 if is jumping
			
			
		
		else 
			buffer_write(buffer,buffer_data_type,0); //send 0 if is not jumping
		
		
		
		network_send_packet(socket,buffer,buffer_get_size(buffer)); //send buffer as a packet

}