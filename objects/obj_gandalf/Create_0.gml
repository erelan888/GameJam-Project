enum FOLLOW_STATE { INCREASING, DECREASING };
enum FLOAT_STATE { RAISING, LOWERING};

max_hit_points = 20;
hit_points = max_hit_points;
flash = 0;
drop_timer = 60;
should_drop_propanda = true;

target_x = xstart;
target_y = ystart;

walk_speed = 6;
horizontal_speed = walk_speed;
vertical_speed = 0;
gravity_modifier = 0.1;

follow = obj_player;
follow_max = 300;
retarget_cooldown = 8;
float_state = FLOAT_STATE.RAISING;

vertical_max = ystart + 30;
vertical_min = ystart - 30;
