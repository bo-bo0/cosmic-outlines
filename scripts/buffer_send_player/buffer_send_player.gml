function buffer_send_player(buffer){
	//create server player on current client
	if (self.is_server) {
	
		//if it was not already created
	if(ds_list_find_value(self.server_already_player_created,self.current_server_target_socket_index) == false) {
		
		//remember it's now created
		ds_list_insert(self.server_already_player_created,self.current_server_target_socket_index,true);
		
		buffer_write(buffer,self.buffer_data_type,1); //send 1 if it's time to create player
	
	}
	
	else /*if current client already has server player*/ 
		buffer_write(buffer,self.buffer_data_type,0); //send 0 if player was already created
	
	}

}