function list_find_not_und(list,index){

	var value = ds_list_find_value(list,index);
	
	if(!is_undefined(value))
		return value;
		
	else
		return noone;

}