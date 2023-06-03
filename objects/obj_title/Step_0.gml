title_xscale = 1 / max(1, fade_in_time );
title_yscale = 1 / max(1, fade_in_time );

title_angle = 10 * dsin( fade_in_time );

scroller = fade_in_time % sprite_get_width(spr_temp_art);

fade_in_time -= 1;




title_switch_timer -= 1;

if (title_switch_timer <= 0 && title_mode == TITLE_MODE_START_FADEIN ) {
	title_mode = TITLE_MODE_START_READY;
}

if ( title_mode == TITLE_MODE_START_READY ) {
	var input = scr_input_get(INPUT_ANY);
	if (input) {
		title_switch_timer = MENU_TRANSITION;
		title_mode = TITLE_MODE_MENU_FADEIN;
	}
}

if (title_switch_timer <= 0 && title_mode == TITLE_MODE_MENU_FADEIN ) {
	title_mode = TITLE_MODE_MENU_READY;
}

if (title_mode == TITLE_MODE_MENU_READY ) {
	menu_wait--;
	var input_up = scr_input_get( INPUT_UP );
	var input_down = scr_input_get( INPUT_DOWN );
	var input_select = ( scr_input_get( INPUT_A ) );

	if (input_up ) {
		if (menu_wait < 0) {
			menu_position--;
			if (menu_position <= 0) {
				menu_position = TITLE_MENU_CHOICES;
			}
			menu_wait = MENU_DELAY;
		}
	}
	if (input_down) {
		if (menu_wait < 0) {
			menu_position++;
			if (menu_position > TITLE_MENU_CHOICES ) {
				menu_position = 1;
			}
			menu_wait = MENU_DELAY;
		}
	}
	if ( input_select ) {
		menu_wait = MENU_DELAY;
		switch (menu_position) {
			case TITLE_MENU_CHOICE_FILES: {
				title_switch_timer = MENU_TRANSITION;
				title_mode = TITLE_MODE_FILES_FADEIN;
				scr_files_load_preview();
				break;
			}
			case TITLE_MENU_CHOICE_CG: {
				title_switch_timer = MENU_TRANSITION;
				title_mode = TITLE_MODE_CG_FADEIN;
				break;
			}			
			case TITLE_MENU_CHOICE_MUSIC: {
				title_switch_timer = MENU_TRANSITION;
				title_mode = TITLE_MODE_MUSIC_FADEIN;
				menu_wait = MENU_DELAY;
				break;
			}
			case TITLE_MENU_CHOICE_OPTIONS: {
				title_switch_timer = MENU_TRANSITION;
				title_mode = TITLE_MODE_OPTIONS_FADEIN;
				menu_wait = MENU_DELAY;
				break;
			}
			case TITLE_MENU_CHOICE_EXIT_GAME: {
				game_end();
				break;
			}
			default: {
				break;
			}
		}
	}
}


if ( title_switch_timer <= 0 && title_mode == TITLE_MODE_FILES_FADEIN ) {
	//add loading file summary
	title_mode = TITLE_MODE_FILES_READY;
	keyboard_clear(vk_anykey);
}

if ( title_mode == TITLE_MODE_FILES_READY ) {
	menu_wait--;
	var input_up = scr_input_get( INPUT_UP );
	var input_down = scr_input_get( INPUT_DOWN );
	var input_select = ( scr_input_get( INPUT_A ) );

	if (input_up ) {
		if (menu_wait < 0) {
			menu_position--;
			if (menu_position <= 0) {
				menu_position = LOAD_MENU_CHOICES;
			}
			menu_wait = MENU_DELAY;
		}
	}
	if (input_down) {
		if (menu_wait < 0) {
			menu_position++;
			if (menu_position > LOAD_MENU_CHOICES ) {
				menu_position = 1;
			}
			menu_wait = MENU_DELAY;
		}
	}
	if ( input_select ) {
		if (menu_wait < 0) {
			
			switch (menu_position) {
				case LOAD_CHOICE_FILE_A: {
					title_switch_timer = MENU_TRANSITION;
					global.load_file_name = SAVE_FILE_NAME_A;
					title_mode = TITLE_MODE_FILES_FADEAWAY;
					menu_wait = MENU_DELAY;
					break;
				}
				case LOAD_CHOICE_FILE_B: {
					title_switch_timer = MENU_TRANSITION;
					global.load_file_name = SAVE_FILE_NAME_B;
					title_mode = TITLE_MODE_FILES_FADEAWAY;
					menu_wait = MENU_DELAY;
					break;
				}
				case LOAD_CHOICE_FILE_C: {
					title_switch_timer = MENU_TRANSITION;
					global.load_file_name = SAVE_FILE_NAME_C;
					title_mode = TITLE_MODE_FILES_FADEAWAY;
					menu_wait = MENU_DELAY;
					break;
				}
				case LOAD_CHOICE_CLEAR: {
					title_switch_timer = MENU_TRANSITION;
					menu_position = 1;
					title_mode = TITLE_MODE_FILES_CLEAR;
					menu_wait = MENU_DELAY;
					break;
				}
				case LOAD_CHOICE_BACK: {
					title_switch_timer = MENU_TRANSITION;
					title_mode = TITLE_MODE_FILES_FADEOUT;
					menu_wait = MENU_DELAY;
					break;
				}
				default: {
					break;
				}
			}
		}
	}
}


if ( title_mode == TITLE_MODE_FILES_CLEAR ) {
	menu_wait--;
	var input_up = scr_input_get( INPUT_UP );
	var input_down = scr_input_get( INPUT_DOWN );
	var input_left = scr_input_get( INPUT_LEFT );
	var input_right = scr_input_get( INPUT_RIGHT );
	var input_select = ( scr_input_get( INPUT_A ) );

	if (!confirm) {
		if (input_up ) {
			if (menu_wait < 0) {
				menu_position--;
				if (menu_position <= 0) {
					menu_position = CLEAR_MENU_CHOICES;
				}
				menu_wait = MENU_DELAY;
			}
		}
		if (input_down) {
			if (menu_wait < 0) {
				menu_position++;
				if (menu_position > CLEAR_MENU_CHOICES ) {
					menu_position = 1;
				}
				menu_wait = MENU_DELAY;
			}
		}
		if ( input_select ) {
			if (menu_wait < 0) {
				menu_wait = MENU_DELAY;
				switch (menu_position) {
					case CLEAR_CHOICE_FILE_A: {
						title_switch_timer = MENU_TRANSITION;
						global.load_file_name = SAVE_FILE_NAME_A;
						confirm = true;
						confirm_choice = false;
						break;
					}
					case CLEAR_CHOICE_FILE_B: {
						title_switch_timer = MENU_TRANSITION;
						global.load_file_name = SAVE_FILE_NAME_B;
						confirm = true;
						confirm_choice = false;
						break;
					}
					case CLEAR_CHOICE_FILE_C: {
						title_switch_timer = MENU_TRANSITION;
						global.load_file_name = SAVE_FILE_NAME_C;
						confirm = true;
						confirm_choice = false;
						break;
					}
					case CLEAR_CHOICE_CANCEL: {
						title_switch_timer = MENU_TRANSITION;
						title_mode = TITLE_MODE_FILES_READY;
						confirm = false;
						confirm_choice = false;
						menu_position = LOAD_CHOICE_FILE_A;
						break;
					}
					default: {
						break;
					}
				}
			}
		}
	}
	
	if (confirm) {
		if ( input_right ) {
			if (menu_wait < 0) {
				confirm_choice = !confirm_choice;
				menu_wait = MENU_DELAY;
			}
		}
		if ( input_left ) {
			if (menu_wait < 0) {
				confirm_choice = !confirm_choice;
				menu_wait = MENU_DELAY;
			}
			
		}
		if ( input_select ) {
			if (menu_wait < 0) {
				menu_wait = MENU_DELAY;
				if (!confirm_choice) {
					confirm = false;
					confirm_choice = false;
				}
				if (confirm_choice) {
					scr_files_load(global.load_file_name);
					if (ds_exists( global.loaded_file, ds_type_map ) ) {
						ds_map_clear( global.loaded_file );
						ds_map_copy( global.loaded_file, global.default_save );
					}
					scr_files_save( global.load_file_name);
					
					confirm = false;
					confirm_choice = false;
				}
			}
			scr_files_load_preview();
		}
	}		
}

if (title_switch_timer <= 0 && title_mode == TITLE_MODE_FILES_FADEOUT) {
	title_mode = TITLE_MODE_MENU_READY;
	menu_wait = 5;
	keyboard_clear(vk_anykey);
}

if (title_switch_timer <= 0 && title_mode == TITLE_MODE_FILES_FADEAWAY ) {
	//add loading for selected file
	room_goto(rm_loader);
}	

if ( title_switch_timer <= 0 && title_mode == TITLE_MODE_CG_FADEIN ) {
	title_mode = TITLE_MODE_CG_READY;
	menu_position = 1;
	menu_wait = 5;
	gallery_select_x = 0;
	gallery_select_y = 0;
	cg_drawer = -1;
	cg_choice = NONE;
	gallery_top_y = 0;
	keyboard_clear(vk_anykey);
}

if ( title_switch_timer <= 0 && title_mode == TITLE_MODE_MUSIC_FADEIN ) {
	title_mode = TITLE_MODE_MUSIC_READY;
	menu_position = 1;
	music_top = 1;
	music_select = -1;
	keyboard_clear(vk_anykey);
}

if ( title_mode == TITLE_MODE_MUSIC_READY ) {
	menu_wait--;
	
	var input_up = scr_input_get( INPUT_UP );
	var input_down = scr_input_get( INPUT_DOWN );
	var input_select = ( scr_input_get( INPUT_A ) );
	var input_back = ( scr_input_get( INPUT_B ) );

	if (input_up ) {
		if (menu_wait < 0) {
			menu_position--;
			if (menu_position <= 0) {
				menu_position = MUSIC_MENU_CHOICES;
			}
			if (music_top > menu_position) {
				music_top = menu_position;
			}
			if (music_top < menu_position - 3) {
				music_top = menu_position - 3;
			}
			menu_wait = MENU_DELAY;
		}
	}
	if (input_down) {
		if (menu_wait < 0) {
			menu_position++;
			if (menu_position > MUSIC_MENU_CHOICES ) {
				menu_position = 1;
			}
			if (music_top > menu_position) {
				music_top = menu_position;
			}
			if (music_top < menu_position - 3) {
				music_top = menu_position - 3;
			}
			menu_wait = MENU_DELAY;
		}
	}
	if (input_back) {
		if (menu_wait < 0) {
			audio_stop_all();
			title_switch_timer = MENU_TRANSITION;
			menu_position = 1;
			title_mode = TITLE_MODE_MUSIC_FADEOUT;
		}
	}
	if ( input_select ) {
		switch (menu_position) {
			case MUSIC_MENU_CHOICE_A: {
				music_select = MUSIC_MENU_CHOICE_A;
				audio_stop_all();
				audio_play_sound( MUSIC_MENU_SOUND_A, 0, true );
				break;
			}
			case MUSIC_MENU_CHOICE_B: {
				music_select = MUSIC_MENU_CHOICE_B;
				audio_stop_all();
				audio_play_sound( MUSIC_MENU_SOUND_B, 0, true );
				break;
			}			
			case MUSIC_MENU_CHOICE_C: {
				music_select = MUSIC_MENU_CHOICE_C;
				audio_stop_all();
				audio_play_sound( MUSIC_MENU_SOUND_C, 0, true );
				break;
			}
			case MUSIC_MENU_CHOICE_D: {
				music_select = MUSIC_MENU_CHOICE_D;
				audio_stop_all();
				audio_play_sound( MUSIC_MENU_SOUND_D, 0, true );
				break;
			}
			case MUSIC_MENU_CHOICE_E: {
				music_select = MUSIC_MENU_CHOICE_E;
				audio_stop_all();
				audio_play_sound( MUSIC_MENU_SOUND_E, 0, true );
				break;
			}
			case MUSIC_MENU_CHOICE_F: {
				music_select = MUSIC_MENU_CHOICE_F;
				audio_stop_all();
				audio_play_sound( MUSIC_MENU_SOUND_F, 0, true );
				break;
			}
			default: {
				break;
			}
		}
	}
}

if (title_switch_timer <= 0 && title_mode == TITLE_MODE_MUSIC_FADEOUT) {
	title_mode = TITLE_MODE_MENU_READY;
	menu_wait = MENU_DELAY;
	keyboard_clear(vk_anykey);
}


if ( title_switch_timer <= 0 && title_mode == TITLE_MODE_OPTIONS_FADEIN ) {
	//add loading options
	if (ds_exists(temp_options, ds_type_map)) {
		ds_map_destroy(temp_options);
		temp_options = ds_map_create();
	}
	ds_map_copy(temp_options, global.options);
	menu_position = 1;
	title_mode = TITLE_MODE_OPTIONS_READY;
	keyboard_clear(vk_anykey);
}

if ( title_mode == TITLE_MODE_OPTIONS_READY ) {
	menu_wait--;
	//add selecting and toggling options and loading defaults, fadeout when going back, mark whether save and exit or exit wtihout saving
	var input_up = scr_input_get( INPUT_UP );
	var input_down = scr_input_get( INPUT_DOWN );
	var input_left = scr_input_get( INPUT_LEFT );
	var input_right = scr_input_get( INPUT_RIGHT );
	var input_select = ( scr_input_get( INPUT_A ) );
	var input_back = ( scr_input_get( INPUT_B ) );
	
	if (input_up ) {
		if (menu_wait < 0) {
			menu_position--;
			if (menu_position <= 0) {
				menu_position = OPTIONS_MENU_CHOICES;
			}
			menu_wait = MENU_DELAY;
		}
	}
	if (input_down) {
		if (menu_wait < 0) {
			menu_position++;
			if (menu_position > OPTIONS_MENU_CHOICES ) {
				menu_position = 1;
			}
			menu_wait = MENU_DELAY;
		}
	}
	
	if (input_left) {
		if (menu_wait < 0) {
			switch (menu_position) {
				case OPTIONS_MENU_CHOICE_FULLSCREEN: {
					temp_options[? OPTIONS_FULLSCREEN] = !temp_options[? OPTIONS_FULLSCREEN];
					break;
				}
				case OPTIONS_MENU_CHOICE_DEFAULTS: {
					break;
				}
				case OPTIONS_MENU_CHOICE_SAVE: {
					break;
				}
				case OPTIONS_MENU_CHOICE_DISCARD:{
					break;
				}			
				default: {
					break;
				}
			}
		}
		menu_wait = MENU_DELAY;
	}
	if (input_right) {
		if (menu_wait < 0) {
			switch (menu_position) {
				case OPTIONS_MENU_CHOICE_FULLSCREEN: {
					temp_options[? OPTIONS_FULLSCREEN] = !temp_options[? OPTIONS_FULLSCREEN];
					break;
				}
				case OPTIONS_MENU_CHOICE_DEFAULTS: {
					break;
				}
				case OPTIONS_MENU_CHOICE_SAVE: {
					break;
				}
				case OPTIONS_MENU_CHOICE_DISCARD:{
					break;
				}			
				default: {
					break;
				}
			}
		}
		menu_wait = MENU_DELAY;
	}
	if (input_select) {
		if (menu_wait < 0) {
			switch (menu_position) {
				case OPTIONS_MENU_CHOICE_FULLSCREEN: {
					temp_options[? OPTIONS_FULLSCREEN] = !temp_options[? OPTIONS_FULLSCREEN];
					break;
				}
				case OPTIONS_MENU_CHOICE_DEFAULTS: {
					temp_options[? OPTIONS_INPUT_TYPE] = "keyboard";
					temp_options[? OPTIONS_FULLSCREEN] = true;
					temp_options[? OPTIONS_WINDOWMULT] = WINDOW_HEIGHT_720;
					break;
				}
				case OPTIONS_MENU_CHOICE_SAVE: {
					ds_map_copy(global.options, temp_options);
					var file = file_text_open_write(working_directory + "options.json");
					var output_string = json_encode( global.options );
					file_text_write_string(file, output_string);
					file_text_close(file);		
					title_switch_timer = MENU_TRANSITION;
					menu_position = 1;
					discarding = false;
					title_mode = TITLE_MODE_OPTIONS_FADEOUT;
					
					break;
				}
				case OPTIONS_MENU_CHOICE_DISCARD:{
					title_switch_timer = MENU_TRANSITION;
					menu_position = 1;
					discarding = true;
					title_mode = TITLE_MODE_OPTIONS_FADEOUT;
				}			
				default: {
					break;
				}
			}
		}
		menu_wait = MENU_DELAY;
	}
	if (input_back) {
		if (menu_wait < 0) {
			title_switch_timer = MENU_TRANSITION;
			menu_position = 1;
			title_mode = TITLE_MODE_OPTIONS_FADEOUT;
		}
	}
	
}

if (title_switch_timer <= 0 && title_mode == TITLE_MODE_OPTIONS_FADEOUT) {
	if (discarding == false) {
		if (global.options[? OPTIONS_FULLSCREEN]) {
			window_set_fullscreen(true);
			view_set_hport(view_current, WINDOW_BASE_HEIGHT * global.options[? OPTIONS_WINDOWMULT]);
			view_set_wport(view_current, WINDOW_BASE_WIDTH * global.options[? OPTIONS_WINDOWMULT]);
		} else {
			window_set_fullscreen(false);
			view_set_hport(view_current, WINDOW_BASE_HEIGHT * global.options[? OPTIONS_WINDOWMULT]);
			view_set_wport(view_current, WINDOW_BASE_WIDTH * global.options[? OPTIONS_WINDOWMULT]);
		}
	}
	title_mode = TITLE_MODE_MENU_READY;
	menu_wait = MENU_DELAY;
	keyboard_clear(vk_anykey);
}
//TODO: add CG gallery








