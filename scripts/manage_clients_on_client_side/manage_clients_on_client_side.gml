function manage_clients_on_client_side(clients_data_list){

	enum clientDatai { Id, CreatedP, X, Y, Speed, IsJumping };

	var current_client = noone; //this variable will contain the current (other)client that is being managed
	var current_list = ds_list_create(); //this will contain the list of the client that is being currently managed
	var flag = false;
	var sameFlag = false;
	

	if(!is_undefined(clients_data_list) and clients_data_list != noone and clients_data_list != "" and clients_data_list != " ") {

		for(var i = 0; i < ds_list_size(clients_data_list); i++) {
	
			try {
				current_list =  ds_list_find_value(clients_data_list,i);
			
				//show_message(ds_list_size(clients_data_list));////////////
				//show_message(ds_list_find_value(clients_data_list,i));
	
				for(var j = 0; j < instance_number(obj_connected_player); j++) {
		
					var current_connected_player = instance_find(obj_connected_player,j);
				
				
					if(current_connected_player.player_online_id == ds_list_find_value(current_list,clientDatai.Id)) {
			
						flag = true;
						break;
			
					}
				
					//check if the data is from this same client
					if(obj_player.player_online_id == ds_list_find_value(current_list,clientDatai.Id)){
						sameFlag = true;
						break;
					}
				}
			
				if(!sameFlag) {//if it's same client don't do anything
	
					if(!flag) 
						current_client = instance_create_layer(x,y,"Instances",obj_connected_player); //create connected player if it doesn't exist
		
		
					else { //if other client already exists, find its connected player
		
						for(var j = 0; j < instance_number(obj_connected_player); j++) {
			
							var current_connected_player = instance_find(obj_connected_player,j);
				
							if(current_connected_player.player_online_id == ds_list_find_value(current_list,clientDatai.Id)) {
				
								current_client = current_connected_player; //store found connected player
								break;
				
							}
			
						}
		
					}
		
					//assign data from current other client to current connected player
		
					if(current_client != noone and current_list != noone) {
		
						with(current_client) {
			
							//show_message(list_find_not_und(current_list,clientDatai.Id));
							//show_message(list_find_not_und(current_list,clientDatai.X));
							//show_message(list_find_not_und(current_list,clientDatai.IsJumping));
							player_online_id = list_find_not_und(current_list,clientDatai.Id);
					
							x = list_find_not_und(current_list,clientDatai.X); 
							y = list_find_not_und(current_list,clientDatai.Y);
							current_speed = list_find_not_und(current_list,clientDatai.Speed);
				
							if(list_find_not_und(current_list,clientDatai.IsJumping) == jumpState.isJumping)
								animate_jump(right_sprite,left_sprite,right_sprite_animated,left_sprite_animated,right_sprite_jump,left_sprite_jump);
			
						}
		
					}
				}
				
					ds_list_destroy(current_list);
			}
			
			catch (e) { continue; }
		}
	
	}
		
}
