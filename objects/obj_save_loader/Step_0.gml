countdown--;

if (countdown == 0 ) {
	//load file
	var save_check = scr_files_load( global.load_file_name );
	if (save_check == FILE_LOAD_FAIL) {
		scr_files_load( SAVE_DEFAULTS );
	}
	countdown = -1;
}

if (countdown <= -20 ) {
	//send to specified room in save file
	room_goto(rm_scene); //temp
}