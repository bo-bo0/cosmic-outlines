function send_packet_to_client(buffer,buffer_data_type,socket){

		buffer_seek(buffer,buffer_seek_start,0); //set pointer to start of buffer
			
		buffer_write(buffer,buffer_data_type,random(100)); //random number to check server activity
			
		//check what id to assign

		var sentID = self.connected_clients;
		
		for(var i = 1; i <= instance_number(obj_connected_player); i++) {
			
			var flag = false;
			
		
			for(var j = 0; j < instance_number(obj_connected_player); j++) {
			
				var currConnPlayer = instance_find(obj_connected_player,j);
				
				if (currConnPlayer.player_online_id == i) { flag = true; break; }
				
			}
		
			if(!flag) { sentID = i; break; }
		
		}
		
		buffer_write(buffer,buffer_data_type,sentID); //tells clients what id they have
		
		buffer_send_player(buffer);
		
		//send movement
		
		buffer_write(buffer,buffer_data_type,obj_player.x); //send x position
		buffer_write(buffer,buffer_data_type,obj_player.y); //send y position
		
		buffer_write(buffer,buffer_data_type,obj_player.current_speed); //send player current speed
		
		 //send jump
		if (obj_player.jump) 
			buffer_write(buffer,buffer_data_type,1); //send 1 if is jumping
			
			
		else 
			buffer_write(buffer,buffer_data_type,0); //send 0 if is not jumping
		
		//send size (how many clients)
		buffer_write(buffer,buffer_data_type,ds_list_size(self.stored_clients_data));
		
		//convert lists to strings to send them
		
		for(var i = 0; i < ds_list_size(self.stored_clients_data); i++) {
			
			var actual_sub_list = ds_list_find_value(self.stored_clients_data,i);
			
			var dslist_string = "";	
			
			for (var j = 0; j < ds_list_size(actual_sub_list); j++) {
				dslist_string += string(ds_list_find_value(actual_sub_list,j));
				
				if(j == 0)show_debug_message("last id sent: " + string(dslist_string));
				
				if (j < ds_list_size(actual_sub_list)) { dslist_string += ","; }
			}

			//show_message(ds_list_size(actual_sub_list));
			//show_message(dslist_string);
			
			buffer_write(buffer,buffer_string,dslist_string); //send each dslist string
			
		}
		
		
		network_send_packet(socket,buffer,buffer_get_size(buffer)); //send buffer as a packet

}