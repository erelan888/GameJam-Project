current_duration--;

if(current_duration <= 0){
	instance_destroy();
}

if(creator > -1){
	x = creator.x;
	y = creator.y;
}
if(choice > 5){
	sprite_index = spr_goblin_sign_7;
} else {
	sprite_index = spr_goblin_sign;
}