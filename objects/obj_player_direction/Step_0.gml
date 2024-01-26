if(float_state == SIGN_FLOAT_STATE.RAISING){
	y++;

	if(y == vertical_max){
		float_state = SIGN_FLOAT_STATE.LOWERING;
	}
} else {
	y--;
	if(y == vertical_min){
		float_state = SIGN_FLOAT_STATE.RAISING	
	}
}
x = obj_player.x + 500;