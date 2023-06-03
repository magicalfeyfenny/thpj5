fade_in = 50;

if (global.loaded_file[? SAVE_POINT] > SCENE_TOTAL ) {
	room_goto(rm_ending);
}

if (!global.scene_mode && global.loaded_file[? SAVE_POINT] == SAVE_POINT_START) {	
	global.scene_mode = true;
	global.scene_number = scene_TEST;
	timeline_position = 0;
	timeline_index = tml_scene_test;
	timeline_running = true;
}

