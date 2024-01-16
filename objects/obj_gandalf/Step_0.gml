//TODO: Move between one side of the screen and the other
//TODO: If hit with a number of arrows, give a temporary repreive.

//Drop Propadanda
if(drop_timer <= 0){
	if(should_drop_propanda){
		instance_create_layer(x, y, "Propaganda", obj_propaganda);
		drop_timer = irandom_range(40, 180);	
	}
}

if(follow != noone){
	target_x = follow.x + follow_offset;
	
	if(follow_state == FOLLOW_STATE.INCREASING){
		follow_offset++;
		if(follow_offset >= follow_max){
			follow_state = FOLLOW_STATE.DECREASING;	
			horizontal_speed = -horizontal_speed;
		}
	} else if (follow_state == FOLLOW_STATE.DECREASING){
		follow_offset--;
		if(follow_offset <= follow_min){
			follow_state = FOLLOW_STATE.INCREASING;	
			horizontal_speed = abs(horizontal_speed);
		}
	}
}

x += horizontal_speed;
drop_timer--;