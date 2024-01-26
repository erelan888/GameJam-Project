var _x_offset = -5;
var _y_offset = -27;

x = obj_player.x + _x_offset;
y = obj_player.y + _y_offset;

image_angle = point_direction(x,y, mouse_x, mouse_y);

firing_delay = firing_delay -1;
recoil = max(0, recoil - 1);

if(mouse_check_button(mb_left) && firing_delay < 0)
{
	firing_delay = 5;
	recoil = 4;
	
	with (instance_create_layer(x,y,"Projectiles",obj_arrow))
	{
		speed = other.projectile_speed;
		direction = other.image_angle + random_range(-3,3);
		image_angle = direction;
	}
}

x = x - lengthdir_x(recoil, image_angle);
y = y - lengthdir_y(recoil, image_angle);

if(image_angle > 90 && image_angle < 270)
{
	image_yscale = -1;
} else {
	image_yscale = 1;	
}

