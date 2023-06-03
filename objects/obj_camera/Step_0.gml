if ( global.scene_mode ) {
	if (instance_exists( obj_camera_anchor )) {
		target = instance_nearest(x, y, obj_camera_anchor );
	} else {
		target = self;
	}
} else {
	target = self;
}
	
if ( instance_exists(target) ) {
	target_camera_x =	target.x;
	target_camera_y =	target.y - 64;

	if ( mouse_check_button(mb_left)) {
		target_camera_x = (target.x + target.x + mouse_x) / 3;
		target_camera_y = (target.y + target.y + mouse_y) / 3;
	}
}


x = x + lengthdir_x( abs(0.2 * (target_camera_x - x)), point_direction(x, y, target_camera_x, target_camera_y) );
y = y + lengthdir_y( abs(0.2 * (target_camera_y - y)), point_direction(x, y, target_camera_x, target_camera_y) );







