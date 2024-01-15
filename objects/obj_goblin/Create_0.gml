enum GOBLIN_STATE { CHILL, CHASING, CONSUMING, FULL_GOBLIN };
/*
	CHILL -> Idle state, basically just hanging out.
	CHASING -> has a target and is moving toward it.
	CONSUMING -> Actively reading propaganda, in danger of becoming full goblin
	FULL_GOBLIN -> Converted and convinced the player is the enemy. 
*/

current_state = GOBLIN_STATE.CHILL;

perception_radius = 1;
perception_cooldown = 20; // number of frames between checks
min_perception_cooldown = 5;
max_perception_cooldown = 60;

max_hp = 3;
hit_points = max_hp;

damage = 1;

target_x = x;
target_y = y;

starting_point_x = x;
starting_point_y = y;
wander_distance = 10;
