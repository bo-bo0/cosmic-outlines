
if(!loading) {

	//ip insertion or max clients
	if(state == "ip") {

		//if inserting max clients prevent user from inserting 0
		if(online_state == "server" and keyboard_lastchar == "0" and string_length(keyboard_string) == 1) {
			keyboard_string = string_copy(keyboard_string,0,string_length(keyboard_string) - 1);
			keyboard_lastchar = "";
		}

		text_inserted = string_digits(keyboard_string)

		keyboard_string = string_digits(keyboard_string)

		var max_size = 0;

		if(online_state == "client") { max_size = 11; } else { max_size = 3; }

		if(string_length(text_inserted) > max_size) {

			actual_online_ip = string_copy(text_inserted,0,max_size);
			keyboard_string = string_copy(keyboard_string,0,max_size);

		}

		else 
			actual_online_ip = text_inserted;
	
		//dots insertion in ip
		var i = 3;

		while(i <= 10) {

			if(string_length(actual_online_ip) >= i + 1 and string_char_at(actual_online_ip,i + 1) != ".")
				actual_online_ip = string_insert(".",actual_online_ip,i + 1);
		
			if(i == 3) { i += 4; } else { i += 3; }
		
		
		}

	}

	//port insertion
	else if(state == "port") {

		text_inserted = string_digits(keyboard_string)

		keyboard_string = string_digits(keyboard_string)
	
	
		if(string_length(text_inserted) > 5) {

			actual_port = string_copy(text_inserted,0,5);
			keyboard_string = string_copy(keyboard_string,0,5);

		}
	
		else 
			actual_port = text_inserted;

	}

	//field selection

		//ip
	if(mouse_x > x + 80 and mouse_x < 650 and mouse_y > y + 310 and mouse_y < 443) {

		window_set_cursor(cr_handpoint)
	
		if(mouse_check_button_pressed(mb_left)) {
		
			ip_color = c_yellow;
			state = "ip";
			keyboard_string = "";
			port_color = c_white;
		
		}	

	}

	else if (!(mouse_x > x + 80 and mouse_x < 650 and mouse_y > y + 110 and mouse_y < 238)){

		window_set_cursor(cr_arrow)

	}
	
		//port
	
	if(mouse_x > x + 80 and mouse_x < 650 and mouse_y > y + 110 and mouse_y < 238) {

		window_set_cursor(cr_handpoint)

		if(mouse_check_button_pressed(mb_left)) {
		
			port_color = c_yellow;
			state = "port";
			keyboard_string = "";
			ip_color = c_white;
		}
	}

	else if(!(mouse_x > x + 80 and mouse_x < 650 and mouse_y > y + 310 and mouse_y < 443)){

		window_set_cursor(cr_arrow)
	}
	
		//done
	
	if(mouse_x > x + 260 and mouse_x < 720 and mouse_y > y + 390 and mouse_y < 515) {

			window_set_cursor(cr_handpoint);
		
			if(mouse_check_button_pressed(mb_left)) {
		
				window_set_cursor(cr_arrow);
				
				loading = true; //start loading data and connecting
		
				if(actual_online_ip != "") { //if ip/max clients field is not empty
		
					//take values from fields and set them in the network variables
					if(online_state == "client")
						obj_network.ip = actual_online_ip;
					else 
						obj_network.max_clients = real(actual_online_ip);
						
				}
				
				//if fields are empty set default values
				else {
				
					obj_network.ip = "127.0.0.1";
					obj_network.max_clients = 3;
				
				}
				
				if(actual_port != "") 
					obj_network.port = real(actual_port);
				
				else 	
					obj_network.port = 50326;
					
				
				//attempt to connect client or server
				
				if(online_state == "client")
					obj_network.alarm[0] = 1;
				else
					obj_network.alarm[1] = 1;
		
			}

	}

}