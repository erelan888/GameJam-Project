enum CITIZEN_STATE { CHILL, CHASING, CONSUMING };
/*
	CHILL -> Idle state, basically just hanging out.
	CHASING -> has a target and is moving toward it.
	CONSUMING -> Actively reading propaganda, in danger of becoming full goblin
	Once consumption code reaches 0, this spawns a goblin
*/

current_state = CITIZEN_STATE.CHILL;
consumption_countdown_max = 120;
consumption_countdown = 0;
played_consuming_flip = false;

//Perception
perception_radius = 20;
perception_cooldown = 20; // number of frames between checks
min_perception_cooldown = 5;
max_perception_cooldown = 60;
looking_for = [obj_player, obj_propaganda];

max_hp = 3;
hit_points = max_hp;

target_x = x;
target_y = y;

distance_from_target = 0;

starting_point_x = x;
starting_point_y = y;
wander_distance = 120;

//Walking Around
walk_speed = 3;
horizontal_speed = walk_speed;
vertical_speed = 0;
gravity_modifier = 0.3;

//Slapping & Conversion
has_been_slapped = false;
conversion_radius = 100;