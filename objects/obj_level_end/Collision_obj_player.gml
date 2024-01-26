/// @description Move to next room

with(obj_player){
	if(hascontrol){
		hascontrol = false;
		slide_transition(TRANS_MODE.GOTO, other.target);
	}
}


