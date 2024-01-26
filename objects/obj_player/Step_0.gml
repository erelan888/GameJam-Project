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
		//Animation - TODO
	
		if(_key_attack) player_state = PLAYERSTATE.ATTACK_SLASH;
		break;
	case PLAYERSTATE.ATTACK_SLASH:
		PlayerState_Attack_Slash();
		break;
	case PLAYERSTATE.ATTACK_COMBO:
		PlayerState_Attack_Combo();
		break;
}
if(horizontal_speed != 0) image_xscale = -sign(horizontal_speed);