global.loaded_file[? SAVE_CHNUM]++;
global.loaded_file[? SAVE_LINENUM] = 0;

if (global.loaded_file[? SAVE_CHNUM] > SCENE_TOTAL ) {
	room_goto(rm_ending);
} else {
	scr_files_save( SAVE_AUTOSAVE );
	global.autosave_load = true;
	room_goto(rm_loader);
}