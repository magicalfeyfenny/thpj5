if (global.dialogue_mode) {
// Draw background image
	draw_set_alpha(1);
	if ( sprite_exists( bg_sprite ) ) {
		draw_sprite( bg_sprite, 0, camera_get_view_x(view_camera), camera_get_view_y(view_camera) );
	}
	
// Draw character portraits
	if ( sprite_exists(actor_A_sprite) ) {
		draw_sprite_ext( actor_A_sprite, min( actor_A_anim_frame, sprite_get_number(actor_A_sprite) ), camera_get_view_x(view_camera) + 320 + (200 * actor_A_pos), camera_get_view_y(view_camera), 1, 1, 0, c_white, 1);
	}
	if ( sprite_exists(actor_B_sprite) ) {
		draw_sprite_ext( actor_B_sprite, min( actor_B_anim_frame, sprite_get_number(actor_B_sprite) ), camera_get_view_x(view_camera) + 320 + (200 * actor_B_pos), camera_get_view_y(view_camera), 1, 1, 0, c_white, 1);
	}
	if ( sprite_exists(actor_C_sprite) ) {
		draw_sprite_ext( actor_C_sprite, min( actor_C_anim_frame, sprite_get_number(actor_C_sprite) ), camera_get_view_x(view_camera) + 320 + (200 * actor_C_pos), camera_get_view_y(view_camera), 1, 1, 0, c_white, 1);
	}
		

// Draw ADV mode (dialogue box)
	if ( display_mode == DISPLAY_ADV ) {
		narrator_alpha = 0;
		draw_set_halign(fa_left);
		draw_sprite(spr_text_box, 0, camera_get_view_x(view_camera) + 30, camera_get_view_y(view_camera) + 220);
	
		draw_set_font(fn_dialogue_names);
		draw_text( camera_get_view_x(view_camera) + 85, camera_get_view_y(view_camera) + 225, speaker_name );
		draw_set_font(fn_dialogue_text);
		draw_text( camera_get_view_x(view_camera) + 75, camera_get_view_y(view_camera) + 265, textspew );
	}
// Draw NVL mode (fade-out full-screen text)
	if ( display_mode == DISPLAY_NARRATOR) {
		draw_set_color(c_black);
		narrator_alpha++;
		draw_set_alpha(0 + min(0.5, narrator_alpha / 25 ));
		draw_rectangle(camera_get_view_x(view_camera) - 1, camera_get_view_y(view_camera) - 1, camera_get_view_x(view_camera) + 641, camera_get_view_y(view_camera) + 361, false);
		draw_set_color(c_white);
		draw_set_font(fn_dialogue_text);
		draw_set_halign(fa_center);
		for(var i = 1; i <= textlinecount + 1; i++) {
			draw_set_alpha( (-10 - (80 * i) + textlinefadein) / 60 );
			draw_text(camera_get_view_x(view_camera) + 320, camera_get_view_y(view_camera) + 180 - (20 * textlinecount) + (40 * (i-1)), textlines[i]);
		}
		draw_set_alpha(1);
	}
	if (text_advance_ready == TEXT_READY && display_mode != DISPLAY_NOTEXT) {
		loopdoop++;
		draw_sprite( spr_text_arrow, round((loopdoop % 160) / 20), camera_get_view_x(view_camera) + 540, camera_get_view_y(view_camera) + 300 ); 
	}	
	if (text_auto_mode == AUTO_ON) {
		draw_sprite( spr_text_auto, 0, camera_get_view_x(view_camera) + 510, camera_get_view_y(view_camera) + 300 );
	}
	if (keyboard_check(vk_control) ) {
		draw_sprite( spr_text_skip, 0, camera_get_view_x(view_camera) + 480, camera_get_view_y(view_camera) + 300 );
	}
		

//draw tutorial text
	draw_set_font(fn_menu_help);
	draw_set_halign(fa_left);
	draw_text_ext_transformed_color_border( 5, 345, "Z: advance text, C: toggle auto, CTRL: skip, P: pause/save/log, ESC: quit", 9, 620, 1, 1, 0, c_blue, c_blue, c_blue, c_blue, tutorial_fadeout / 20, 1, c_white); //6
}