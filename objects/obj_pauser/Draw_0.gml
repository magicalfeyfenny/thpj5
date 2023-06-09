dx = camera_get_view_x(view_camera[0]);
dy = camera_get_view_y(view_camera[0]);

if (pause) {
	if (!surface_exists(paused_surface)) {
		if (paused_surface == -1) {
			instance_deactivate_all(true);
		}
		paused_surface = surface_create(view_get_wport(view_camera[0]) * surface_mult, view_get_wport(view_camera[0]) * surface_mult);
		surface_set_target(paused_surface);
			draw_surface(application_surface, 0, 0);
		surface_reset_target();
	} else {
		draw_surface_ext(paused_surface, dx, dy, 1, 1, 0, c_white, 1);
		draw_set_alpha(0.5);
		draw_set_color(c_black);
		draw_rectangle(0, 0, room_width, room_height, false);
		draw_set_alpha(1);
		draw_rectangle(dx - 1, dy - 1, dx + 641, dy + 30, false);
		draw_rectangle(dx - 1, dy + 335, dx + 641, dy + 361, false);
		draw_set_halign(fa_right);
		draw_set_color(c_fuchsia);
		draw_text(dx + 630, dy + 340, "Paused, press P to continue, press S to save, press ESC to exit");
		draw_set_color(c_orange);
		draw_set_halign(fa_left);
		draw_text(dx + 10, dy + 10, "Log mode");
		if (!surface_exists(log_surface)) {
			log_surface = surface_create(620,260);
		}
		surface_set_target(log_surface);
			draw_clear_alpha(c_black, 1);
			textlinescount = 0;
			textline = "";
			for (var i = 0; i < 6; i++) {
				if (log_dy + i < LOG_LIMIT) {
					if (global.log_text[log_dy + i] != 0) {
						draw_set_color(c_aqua);
						draw_text(20, textlinescount * 20, global.log_names[log_dy + i]);
						textlinescount++; 
						draw_set_color(c_ltgray);
						draw_text(40, textlinescount * 20, global.log_text[log_dy + i]);
						textlinescount++;
						textline = global.log_text[log_dy + i];
						for(var j = 0; j < string_length(textline); j++) {
							if (string_char_at(textline, j) == "\n") {
								textlinescount++;
							}
						}
						textlinescount++;
					}
				}
			}
		surface_reset_target();
		draw_set_color(c_black);
		draw_set_alpha(0.5);
		draw_rectangle(dx + 10, dy + 35, dx + 630, dy + 295, false);
		draw_set_alpha(1);
		gpu_set_blendmode(bm_add);
		draw_surface_ext(log_surface, dx + 10, dy + 35, 1, 1, 0, c_white, 1);
		gpu_set_blendmode(bm_normal);
		surface_free(log_surface);
		if ( log_dy > 0) {
			draw_sprite(spr_uparrow, 0, 320, 10);
		}
		if ( log_dy < global.loaded_file[? SAVE_LINENUM] ) {
			draw_sprite(spr_downarrow, 0, 320, 310);
		}
	}
}

if (save_display > 0) {
	draw_set_halign(fa_right);
	draw_text_ext_transformed_color_border(dx + 600, dy + 10, "Saving...", 20, 150, 1, 1, 0, c_green, c_orange, c_green, c_orange, 1, 1, c_fuchsia);
	draw_set_halign(fa_left);
}