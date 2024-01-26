//prevent player movement if dead
if(hit_points <= 0){
	hit_points = 0;
	hascontrol = false;
	
	slide_transition(TRANS_MODE.GOTO, GameOver);
}


