enum FOLLOW_STATE { INCREASING, DECREASING };

hit_points = 20;
drop_timer = 120;
should_drop_propanda = true;

target_x = xstart;
target_y = ystart;

walk_speed = 6;
horizontal_speed = walk_speed;
vertical_speed = 0;
gravity_modifier = 0.1;

follow = obj_player;
follow_offset = 30;
follow_min = 5;
follow_max = 300;

follow_state = FOLLOW_STATE.INCREASING;