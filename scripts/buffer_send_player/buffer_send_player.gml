function buffer_send_player(buffer){

	if(!self.already_player_created) {
		
			self.already_player_created = true;
			buffer_write(buffer,self.buffer_data_type,1);
		}
		
		else {
		
			buffer_write(buffer,self.buffer_data_type,0);
		
		}

}