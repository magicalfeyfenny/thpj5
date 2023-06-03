dx = camera_get_view_x(view_camera[0]);
dy = camera_get_view_y(view_camera[0]);

if (pause) {
	if (!surface_exists(paused_surface)) {
		if (paused_surface == -1) {
			instance_deactivate_all(true);
		}
		surface_mult = global.options[? OPTIONS_WINDOWMULT];
		paused_surface = surface_create(view_get_wport(view_camera[0]) * surface_mult, view_get_wport(view_camera[0]) * surface_mult);
		surface_set_target(paused_surface);
		draw_surface(application_surface, 0, 0);
		surface_reset_target();
	} else {
		draw_surface_ext(paused_surface, dx, dy, 0.5, 0.5, 0, c_white, 1);
		draw_set_alpha(0.5);
		draw_set_color(c_black);
		draw_rectangle(0, 0, room_width, room_height, false);
		draw_set_alpha(1);
		draw_set_halign(fa_center);
		draw_set_color(c_fuchsia);
		draw_text(dx + 320, dy + 170, "Paused, press P to continue");
		draw_set_color(c_white);
		draw_set_halign(fa_left);
	}
}