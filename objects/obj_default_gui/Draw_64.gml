draw_set_font(defaultFont);

if(!loading) {	
	
	var set_text = "";
	
	if(online_state == "client") { 	set_text = "Server IPv4: "; } else { set_text = "Max clients: "; }
	
	draw_text_transformed_color(x+80,y+310,string_concat(set_text,actual_online_ip),2,2,0,ip_color,ip_color,ip_color,ip_color,1);

	draw_text_transformed_color(x+80,y+110,string_concat("Server port: ",actual_port),2,2,0,port_color,port_color,port_color,port_color,1);

	draw_set_color(c_red);
	draw_text_transformed(x+260, y+390,"Done",2,2,0);
}

else {
	draw_set_color(c_white);
	draw_text_transformed(x+220,y+240,"Loading...",2,2,0);
}

draw_set_font(noone);

draw_set_color(c_white);