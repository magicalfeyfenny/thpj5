global.loaded_file[? SAVE_POINT]++;
scr_files_save( global.load_file_name );

if (global.loaded_file[? SAVE_POINT] > SCENE_TOTAL ) {
	room_goto(rm_ending);
} else {
	room_goto(rm_loader);
}