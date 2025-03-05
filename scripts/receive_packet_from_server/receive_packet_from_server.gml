function receive_packet_from_server(buffer,socket){
	
	var current_message;
	
	//enum jumpState {isJumping = 1,isNotJumping = 0};

	buffer_seek(buffer,buffer_seek_start,0); //set pointer at the start of the buffer

	//create connected player

	current_message = buffer_read(buffer,self.buffer_data_type); //reads number of connected clients
	
	if(obj_player.player_online_id == 0)
		obj_player.player_online_id = current_message;

	buffer_receive_player(buffer); //creates the connected player (if it wasn't already created)
	
	
	
	//movement of connected player
	 
	 current_message = buffer_read(buffer,self.buffer_data_type);
	 obj_connected_player.x = current_message; //set the x position
	 
	 current_message = buffer_read(buffer,self.buffer_data_type);
	 obj_connected_player.y = current_message; //set the y position
	 
	current_message = buffer_read(buffer,self.buffer_data_type); //gets player speed in the first bits
	
	obj_connected_player.current_speed = current_message;
	
	//player jump
	current_message = buffer_read(buffer,self.buffer_data_type);
	
	if (current_message == jumpState.isJumping)  //if player is jumping, show jump to other players
		///jump animation
		with(obj_connected_player) {
		animate_jump(right_sprite,left_sprite,right_sprite_animated,left_sprite_animated,right_sprite_jump,left_sprite_jump);
		}
}