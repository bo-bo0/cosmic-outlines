function receive_packet(buffer,socket){
	
	var current_message;
	
	enum jumpState {isJumping = 1,isNotJumping = 0};

	buffer_seek(buffer,buffer_seek_start,0); //set pointer at the start of the buffer

	//create connected player

	buffer_receive_player(buffer); //creates the connected player
	
	//movement of connected player
	 
	current_message = buffer_read(buffer,self.buffer_data_type); //gets player speed in the first bits
	
	obj_connected_player.current_speed = current_message;
	
	//player jump
	current_message = buffer_read(buffer,self.buffer_data_type);
	
	if (current_message == jumpState.isJumping)  //if player is jumping, show jump to other players
		obj_connected_player.jump = true;
	
}