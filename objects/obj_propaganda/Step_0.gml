if(total_uses <= 0){
	instance_destroy();	
}
vertical_speed = vertical_speed + gravity_modifier;

//handle vertical collision
if(place_meeting(x, y+vertical_speed, obj_wall)){
	while(!place_meeting(x, y + sign(vertical_speed), obj_wall)){
		y += sign(vertical_speed);	
	}
	vertical_speed = 0;
}
y += vertical_speed ;