/// @description controls player movement

var _key_attack = keyboard_check_pressed(ord("E"));
//Get player input for movement
if(hascontrol){
	var _key_left  = keyboard_check(vk_left) || keyboard_check(ord("A"));
	var _key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	var _key_jump  = keyboard_check_pressed(vk_space);
	
	
	//calculate movement
	var _move = _key_right - _key_left;
} else {
	var _key_left = 0;
	var _key_right = 0;
	var _key_jump = 0;
	var _move = 0;
}


current_slap_timer--;

switch(player_state){
	case PLAYERSTATE.FREE:
		horizontal_speed = _move * walk_speed;
		vertical_speed = vertical_speed + gravity_modifer;

		if(place_meeting(x, y+1, obj_wall)) && (_key_jump){
			if(jump_count < 2){
				vertical_speed += jump_speed;
				jump_count++;
				show_debug_message("Jumping!");
			}
		}

		//Horizontal Collision
		if(place_meeting(x + horizontal_speed, y, obj_wall)){
			while(!place_meeting(x + sign(horizontal_speed), y, obj_wall)){
				x += sign(horizontal_speed);	
			}
			horizontal_speed = 0;
		}

		x += horizontal_speed;

		//Vertical Collision
		if(place_meeting(x, y + vertical_speed, obj_wall)){
			while(!place_meeting(x, y + sign(vertical_speed), obj_wall)){
				y += sign(vertical_speed);	
			}
			vertical_speed = 0;
			jump_count = 0;
		}

		y += vertical_speed;
		//change sprite
		if(sprite_index == spr_player_slap){
			sprite_index = spr_player;	
		}
		//but did you attack tho?
		if(_key_attack) player_state = PLAYERSTATE.ATTACK_SLASH;
		break;
	case PLAYERSTATE.ATTACK_SLASH:
		if(current_slap_timer <= 0){
			show_debug_message("Slapping the shit out of someone");
			current_slap_timer = slap_reset;
			sprite_index = spr_player_slap;
			//do the actual attack?
			var _attack_result = collision_rectangle(x - attack_distance, y - attack_distance, x + attack_distance, y + attack_distance, obj_citizen, false, true);
			if(_attack_result != noone){
				with(_attack_result){
					_attack_result.current_state = CITIZEN_STATE.CHILL;	
					_attack_result.consumption_countdown = _attack_result.consumption_countdown_max;
					_attack_result.sprite_index = spr_citizen;
				}
			} else {
				//attack missed
			}
		}
		player_state = PLAYERSTATE.FREE;
		break;
}
if(horizontal_speed != 0) image_xscale = -sign(horizontal_speed);