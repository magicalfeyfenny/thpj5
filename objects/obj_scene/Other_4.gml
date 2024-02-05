fade_in = 50;

if (global.loaded_file[? SAVE_CHNUM] > SCENE_TOTAL ) {
	room_goto(rm_ending);
}

if (!global.scene_mode && global.loaded_file[? SAVE_CHNUM] == SCENE_NOSCENE) {	
	global.scene_mode = true;
	global.scene_number = SCENE_NOSCENE;
	timeline_position = 0;
	timeline_index = tml_scene_test;
	timeline_running = true;
}
if (!global.scene_mode && global.loaded_file[? SAVE_CHNUM] == SCENE_TEST) {	
	global.scene_mode = true;
	global.scene_number = SCENE_TEST;
	timeline_position = 0;
	timeline_index = tml_scene_test;
	timeline_running = true;
}
if (!global.scene_mode && global.loaded_file[? SAVE_CHNUM] == SCENE_C1_SISMAD) {	
	global.scene_mode = true;
	global.scene_number = SCENE_C1_SISMAD;
	timeline_position = 0;
	timeline_index = tml_scene_c1;
	timeline_running = true;
}
if (!global.scene_mode && global.loaded_file[? SAVE_CHNUM] == SCENE_C2_SHRINEMAD) {	
	global.scene_mode = true;
	global.scene_number = SCENE_C2_SHRINEMAD;
	timeline_position = 0;
	timeline_index = tml_scene_c2;
	timeline_running = true;
}
if (!global.scene_mode && global.loaded_file[? SAVE_CHNUM] == SCENE_C3_THERAPY1) {	
	global.scene_mode = true;
	global.scene_number = SCENE_C3_THERAPY1;
	timeline_position = 0;
	timeline_index = tml_scene_c3;
	timeline_running = true;
}
if (!global.scene_mode && global.loaded_file[? SAVE_CHNUM] == SCENE_C4_LAKE) {	
	global.scene_mode = true;
	global.scene_number = SCENE_C4_LAKE;
	timeline_position = 0;
	timeline_index = tml_scene_c4;
	timeline_running = true;
}
if (!global.scene_mode && global.loaded_file[? SAVE_CHNUM] == SCENE_C5_SORRY) {	
	global.scene_mode = true;
	global.scene_number = SCENE_C5_SORRY;
	timeline_position = 0;
	timeline_index = tml_scene_c5;
	timeline_running = true;
}
if (!global.scene_mode && global.loaded_file[? SAVE_CHNUM] == SCENE_C6_SISSORRY) {	
	global.scene_mode = true;
	global.scene_number = SCENE_C6_SISSORRY;
	timeline_position = 0;
	timeline_index = tml_scene_c6;
	timeline_running = true;
}


