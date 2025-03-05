function buffer_receive_player(buffer){

	 var current_message;

	 current_message = buffer_read(buffer,self.buffer_data_type);
	 
	 if(current_message == 1) 
		instance_create_layer(obj_player.x,obj_player.y,"Instances",obj_connected_player);

	 
}	