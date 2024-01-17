/// @description Colliding with Citizen, start conversion process


if(other.current_state != CITIZEN_STATE.CONSUMING){
	other.current_state = CITIZEN_STATE.CONSUMING;
	total_uses--;
}