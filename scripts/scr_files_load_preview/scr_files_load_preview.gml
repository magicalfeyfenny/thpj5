//scr_files_load_preview
function scr_files_load_preview() {
	global.file_A_preview = "---";
	global.file_B_preview = "---";
	global.file_C_preview = "---";
	if ( scr_files_load( SAVE_FILE_NAME_A ) == FILE_LOAD_SUCCESS ) {
		global.file_A_preview = "chapter " + string(global.loaded_file[? SAVE_POINT]);
		//TODO: add chapter names
	}
	if ( scr_files_load( SAVE_FILE_NAME_B ) == FILE_LOAD_SUCCESS ) {
		global.file_B_preview = "chapter " + string(global.loaded_file[? SAVE_POINT]);
		//TODO: add chapter names
	}
	if ( scr_files_load( SAVE_FILE_NAME_C ) == FILE_LOAD_SUCCESS ) {
		global.file_C_preview = "chapter " + string(global.loaded_file[? SAVE_POINT]);
		//TODO: add chapter names
	}
	scr_files_load( SAVE_DEFAULTS );
}