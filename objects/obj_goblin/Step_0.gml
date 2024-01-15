/// @desc  Decide what goblin should do

switch(current_state){
	case GOBLIN_STATE.CHILL:
		//Perception Check
		if(perception_cooldown <= 0){
			//reset cooldown
			perception_cooldown = irandom_range(min_perception_cooldown, max_perception_cooldown);	
			//Create collision_rectangle looking for propoganda object. 
			//If collision with propaganda is detected, set it as the target and start walking toward it.
			//If nothing is detected, reset starting_point_x and starting_point_y to current location.
			//If player is detected, do a wave or cheer possibly
		}
		
		break;
	case GOBLIN_STATE.CHASING:
		//TODO: Move toward target
		break;
	case GOBLIN_STATE.CONSUMING:
		
		break;
	case GOBLIN_STATE.FULL_GOBLIN:
		//TODO: display raged out sprite
		//TODO: detect player and attempt to attack
		break;
}

perception_cooldown--;