/// @desc  Decide what goblin should do

#region "Distance Check"
//distance check for attack/chase
var _distance = abs(target.x - x);

if(target != noone){
	if(_distance > attack_distance){
		//too far - chase
		current_state = GOBLIN_STATE.CHASING;	
	} else {
		//close enough attack!
		current_state = GOBLIN_STATE.FULL_GOBLIN;
	}	
} else {
	current_state = GOBLIN_STATE.CHILL;	
}
#endregion

switch(current_state){
	case GOBLIN_STATE.CHILL:
		
		break;
	case GOBLIN_STATE.CHASING:
		if(sprite_index != spr_goblin_walk){
			sprite_index = spr_goblin_walk;	
		}
		target_x = target.x;
		target_y = target.y;
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

		x += horizontal_speed + (variable_speed);
		
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
			if(_distance <= other.attack_distance){
				var _attack_result = collision_rectangle(x-other.attack_distance, y-other.attack_distance, x+other.attack_distance, y+other.attack_distance, obj_player, false, true);
				//TODO: Play attack sound
				if(_attack_result != noone){
					with(_attack_result){
						_attack_result.hit_points--;	
					}
				} else {
					//attack missed
				}
			}
			attack_cooldown = irandom_range(attack_cooldown, attack_cooldown + 20);
		}
		break;
}

if(horizontal_speed != 0) image_xscale = -sign(horizontal_speed);

//talk_timer--;

//if(talk_timer <= 0){
	
//	var _choice = irandom_range(1,10);
//	if(_choice > 3){
//		sprite_index = spr_full_goblin;
//	} else if(_choice > 3 && _choice < 7){
//		sprite_index = spr_full_goblin_with_sign
//	} else if(_choice >= 7) {
//		sprite_index = spr_full_goblin_with_sign_7
//	} else{
//		sprite_index = spr_full_goblin;
//	}
	
//	talk_timer = max_talk_cooldown;
//}