menu_wait--;


if (keyboard_check_pressed(ord("P")) && menu_wait <= 0) {
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