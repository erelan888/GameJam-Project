/// @desc  Decide what goblin should do

switch(current_state){
	case GOBLIN_STATE.CHILL:
		//Perception Check
		if(perception_cooldown <= 0){
			//reset cooldown
			perception_cooldown = irandom_range(min_perception_cooldown, max_perception_cooldown);	
			
		}
		
		break;
	case GOBLIN_STATE.CHASING:
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
	case GOBLIN_STATE.CALMING:
		
		break;
	case GOBLIN_STATE.FULL_GOBLIN:
		attack_cooldown--;
		if(attack_cooldown <= 0){
			with(obj_player){
				//TODO: Attack player with hit box check.			
			}
		}
		break;
}
#region "Perception Check"
perception_cooldown--;
//perception check
if(target == noone && perception_cooldown <= 0){
	show_debug_message("GOBLIN Perception Check");
	//reset cooldown
	perception_cooldown = irandom_range(min_perception_cooldown, max_perception_cooldown);	
	//Create collision_rectangle looking for player.
	var _perception_result = collision_rectangle(x-perception_radius, y-perception_radius, x+perception_radius, y+perception_radius, looking_for, false, true);
	if(_perception_result != noone){
		with(_perception_result){
			if (_perception_result  == obj_player){
				other.current_state = GOBLIN_STATE.CHASING;
				other.target_x = x;
				other.target_y = y;
				//If player is detected, chase to attack
				show_debug_message("Detected player in perception check");
			} else {
				show_debug_message("GOBLIN - Nothing detected!");
			}
		}
	}
}
//end 
#endregion

#region "Distance Check"
//distance check for attack/chase
if(target != noone){
	var _distance = abs(target.x - x);
	if(_distance > attack_distance){
		//too far - chase
		current_state = GOBLIN_STATE.CHASING;	
	} else {
		//close enough attack!
		current_state = GOBLIN_STATE.FULL_GOBLIN;
	}	
}
#endregion