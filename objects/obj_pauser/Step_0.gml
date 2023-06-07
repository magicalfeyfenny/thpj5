menu_wait--;
save_display--;

if menu_wait <= 0 {
	save_allowed = true;
	unpause_allowed = true;
	escape_allowed = true;
}

if (keyboard_check_pressed(ord("S")) && save_allowed == true) {
	save_check = true;
	save_allowed = false;
	menu_wait = MENU_DELAY;
}

if (save_check == true) {
	scr_files_save( global.load_file_name );
	save_check = false;
	save_display = MENU_DELAY;
}


if (keyboard_check_pressed(ord("P")) && unpause_allowed == true) {
	menu_wait = MENU_DELAY;
	pause = !pause;
	if (!pause) {
		instance_activate_all();
		surface_free(paused_surface);
		paused_surface = -1;
	}
}
if (pause) {
	//put things here to prevent alarms from counting down
}

if (keyboard_check_pressed(vk_escape) && escape_allowed == true) {
	menu_wait = MENU_DELAY;
	pause = !pause;
	if (!pause) {
		instance_activate_all();
		surface_free(paused_surface);
		paused_surface = -1;
	}
	room_goto(rm_title);
}