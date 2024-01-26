horizontal_speed = 0;
vertical_speed = 0;
gravity_modifer = 0.2;
walk_speed = 4;
hascontrol = true;

max_hit_points = 10;
hit_points = max_hit_points;

slap_radius = 60;
slap_reset = 60;
current_slap_timer = slap_reset;
looking_for = [obj_citizen];

jump_count = 0;
jump_speed = -10;

player_state = PLAYERSTATE.FREE;
attack_distance = 160;

enum PLAYERSTATE {
	FREE,
	ATTACK_SLASH,
	ATTACK_COMBO
}