
if(instance_exists(follow)){
	xTo = follow.x;
	yTo = follow.y;
}

x += (xTo - x) / 25;
y += (yTo - y) / 25;

x = clamp(x, view_w_half + shake_buffer, room_width - view_w_half - shake_buffer);
y = clamp(y, view_h_half + shake_buffer, room_height - view_h_half - shake_buffer);

x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1/shake_length) * shake_magnitude));

camera_set_view_pos(cam, x - view_w_half, y - view_h_half);