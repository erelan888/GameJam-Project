draw_self();

if(consumption_countdown < consumption_countdown_max){
	draw_healthbar(x, y-22, x+64, y-13, (consumption_countdown/consumption_countdown_max) * 100, c_black, c_red, c_green, 0, true, true);	
}


