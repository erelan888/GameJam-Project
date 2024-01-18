enum GOBLIN_STATE { CHILL, CHASING, CALMING, FULL_GOBLIN };
/*
	CHILL -> Idle state, basically just hanging out.
	CHASING -> has a target and is moving toward it.
	CONSUMING -> Turning back into a villager
	ATTACKING -> Performing attacks on the enemy 
*/

current_state = GOBLIN_STATE.CHASING;

perception_radius = 500;
perception_cooldown = 20; // number of frames between checks
min_perception_cooldown = 5;
max_perception_cooldown = 60;

max_hp = 5;
hit_points = max_hp;

damage = 1;
attack_cooldown = 30;
attack_distance = 5;
target = noone;
looking_for = [obj_player]; 

target_x = x;
target_y = y;

walk_speed = 4;
horizontal_speed = walk_speed;
vertical_speed = 0;
gravity_modifier = 0.3;
