draw_self();

if(consumption_countdown > 0){
	draw_healthbar(x, y-22, x+64, y-13, ((consumption_countdown)/ consumption_countdown_max) * 100, c_black, c_green, c_red, 0, true, true);	
}


