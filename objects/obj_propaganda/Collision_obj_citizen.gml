/// @description Colliding with Citizen, start conversion process
if(obj_citizen.current_state != CITIZEN_STATE.CONSUMING){
	obj_citizen.current_state = CITIZEN_STATE.CONSUMING;
	total_uses--;
}