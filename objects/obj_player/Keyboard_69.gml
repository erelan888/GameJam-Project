/// @description Executes a slap
show_debug_message("Slapping the shit outta something!");


if(current_slap_timer <= 0){
	current_slap_timer = slap_reset;
	
	var _slap_results = collision_rectangle(x-slap_radius, y-slap_radius, x+slap_radius, y+slap_radius, looking_for, false, true);
	if(_slap_results != noone){
		with(_slap_results){
			if (_slap_results  == obj_citizen){
				show_debug_message("Slapped Citizen");
				_slap_results.has_been_slapped = true;
			}
		}
	}
}