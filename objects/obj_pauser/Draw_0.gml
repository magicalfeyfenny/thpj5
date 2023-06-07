dx = camera_get_view_x(view_camera[0]);
dy = camera_get_view_y(view_camera[0]);

if (pause) {
	if (!surface_exists(paused_surface)) {
		if (paused_surface == -1) {
			instance_deactivate_all(true);
		}
		surface_mult = 1;
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
		draw_text(dx + 320, dy + 220, "press S to save");
		draw_text(dx + 320, dy + 270, "press ESC to exit");
		draw_set_color(c_white);
		draw_set_halign(fa_left);
	}
}

if (save_display > 0) {
	draw_set_halign(fa_right);
	draw_text_ext_transformed_color_border(600, 320, "Saving...", 20, 150, 1, 1, 0, c_green, c_orange, c_green, c_orange, 1, 1, c_fuchsia);
	draw_set_halign(fa_left);
}