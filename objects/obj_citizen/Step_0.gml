/// @desc  Decide what the citizen should do
vertical_speed = vertical_speed + gravity_modifier;

switch(current_state){
	case CITIZEN_STATE.CHILL:
		if(sprite_index != spr_villager_walk){
			sprite_index = spr_villager_walk;	
		}
		target_x = irandom_range(x - wander_distance, x + wander_distance);
		current_state = CITIZEN_STATE.CHASING;
		
		break;
	case CITIZEN_STATE.CHASING:
		if(sprite_index != spr_villager_walk){
			sprite_index = spr_villager_walk;	
		}
		distance_from_target = x - target_x;
		//Check if at target location
		if(abs(distance_from_target) < 2){
			current_state = CITIZEN_STATE.CHILL;
			break;
		} 
		
		//choose direction based on target
		if( x > target_x && horizontal_speed > 0){
			horizontal_speed = -horizontal_speed;	
		} else if (x < target_x && horizontal_speed < 0){
			horizontal_speed = abs(horizontal_speed);	
		}
		
		//COLLISIONS
		//handle horizontal collision
		if (place_meeting(x + horizontal_speed, y, obj_wall)){
			while (!place_meeting(x+sign(horizontal_speed), y, obj_wall)) {
				x += sign(horizontal_speed);	
			}
			current_state = CITIZEN_STATE.CHILL;
		}

		x += horizontal_speed;

		//handle vertical collision
		if(place_meeting(x, y+vertical_speed, obj_wall)){
			while(!place_meeting(x, y + sign(vertical_speed), obj_wall)){
				y += sign(vertical_speed);	
			}
			vertical_speed = 0;
		}
		y += vertical_speed;
		
		break;
	case CITIZEN_STATE.CONSUMING:
		consumption_countdown++;
		if(played_consuming_flip == false){
			sprite_index = spr_villager_consuming;
		}
		
		//TODO: play consuming animation
		if(has_been_slapped == true){
			current_state = CITIZEN_STATE.CHILL;
			sprite_index = spr_citizen;
			played_consuming_flip = false;
			consumption_countdown = 0;
			has_been_slapped = false;
			//Start converting villagers close by
			var _conversion_event = collision_rectangle(x-perception_radius, y-perception_radius, x+perception_radius, y+perception_radius, obj_citizen, false, true);
			if(_conversion_event != noone){
				with(_conversion_event){
					if(_conversion_event  == obj_citizen){
						//Found a thing.. but only one. NEED THEM ALL
					}
				}
			}
		}
		//transform
		if(consumption_countdown >= consumption_countdown_max){
			instance_create_layer(x, y - 70, "Citizens", obj_goblin);
			show_debug_message("Converting to Goblin");
			instance_destroy();
		}
		break;
}

perception_cooldown--;

//Perception Check
if(perception_cooldown <= 0){
	//reset cooldown
	perception_cooldown = irandom_range(min_perception_cooldown, max_perception_cooldown);	
	//Create collision_rectangle looking for propoganda object.
	var _perception_result = collision_rectangle(x-perception_radius, y-perception_radius, x+perception_radius, y+perception_radius, looking_for, false, true);
	if(_perception_result != noone){
		with(_perception_result){
			if(_perception_result  == obj_propaganda){
				//If collision with propaganda is detected
				//Set it as the target and start walking toward it.
				other.target_x = x;
				other.target_y = y;
				other.current_state = CITIZEN_STATE.CHASING;
			} else if (_perception_result  == obj_player){
				//If player is detected, do a wave or cheer possibly
				show_debug_message("Detected player in perception check");
			}
		}
	}
	//If nothing is detected, reset starting_point_x and starting_point_y to current location.
}
if(horizontal_speed != 0) image_xscale = -sign(horizontal_speed);