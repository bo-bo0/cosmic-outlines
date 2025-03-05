// Gli asset per gli script sono cambiati per la versione 2.3.0; si rimanda a
// https://help.yoyogames.com/hc/en-us/articles/360005277377 per maggiori informazioni
function send_packet(buffer,buffer_data_type,socket){

		buffer_seek(buffer,buffer_seek_start,0); //set pointer to start of buffer
		
		buffer_send_player(buffer);
		
		//send movement
		
		buffer_write(buffer,buffer_data_type,obj_player.current_speed); //send player current speed
		
		 //send jump
		if (obj_player.jump) 
			buffer_write(buffer,buffer_data_type,1); //send 1 if is jumping
			
			
		
		else 
			buffer_write(buffer,buffer_data_type,0); //send 0 if is not jumping
		
		
		
		network_send_packet(socket,buffer,buffer_get_size(buffer)); //send buffer as a packet
	

}