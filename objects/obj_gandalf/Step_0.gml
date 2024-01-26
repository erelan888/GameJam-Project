//TODO: Move between one side of the screen and the other

//Drop Propadanda
if(drop_timer <= 0){
	sprite_index = spr_gandalf_throw
	if(should_drop_propanda){
		instance_create_layer(x, y, "Propaganda", obj_propaganda);
		drop_timer = irandom_range(20, 60);	
	}
}

if(follow != noone){
	if(retarget_cooldown <= 0){
		target_x = obj_player.x  + irandom_range(-follow_max , (follow_max * 3));
		retarget_cooldown = 8;
	}
	
	if(target_x > x){
		horizontal_speed = abs(horizontal_speed);	
	} else {
		horizontal_speed = - horizontal_speed;	
	}
}

x += horizontal_speed;

if(float_state == FLOAT_STATE.RAISING){
	y++;

	if(y == vertical_max){
		float_state = FLOAT_STATE.LOWERING;
	}
} else {
	y--;
	if(y == vertical_min){
		float_state = FLOAT_STATE.RAISING	
	}
}




drop_timer--;
retarget_cooldown--;