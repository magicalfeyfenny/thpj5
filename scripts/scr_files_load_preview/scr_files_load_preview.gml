//scr_files_load_preview
function scr_files_load_preview() {
	global.file_A_preview_line1 = "---";
	global.file_A_preview_line2 = "---";
	global.file_B_preview_line1 = "---";
	global.file_B_preview_line2 = "---";
	global.file_C_preview_line1 = "---";
	global.file_C_preview_line2 = "---";
	if ( scr_files_load( SAVE_FILE_NAME_A ) == FILE_LOAD_SUCCESS ) {
		global.file_A_preview_line1 = "chapter " + string(global.loaded_file[? SAVE_CHNUM]);
		global.file_A_preview_line2 = "line " + string(global.loaded_file[? SAVE_LINENUM]);
		//TODO: add chapter names
	}
	if ( scr_files_load( SAVE_FILE_NAME_B ) == FILE_LOAD_SUCCESS ) {
		global.file_B_preview_line1 = "chapter " + string(global.loaded_file[? SAVE_CHNUM]);
		global.file_B_preview_line2 = "line " + string(global.loaded_file[? SAVE_LINENUM]);
		//TODO: add chapter names
	}
	if ( scr_files_load( SAVE_FILE_NAME_C ) == FILE_LOAD_SUCCESS ) {
		global.file_C_preview_line1 = "chapter " + string(global.loaded_file[? SAVE_CHNUM]);
		global.file_C_preview_line2 = "line " + string(global.loaded_file[? SAVE_LINENUM]);
		//TODO: add chapter names
	}
	scr_files_load( SAVE_DEFAULTS );
}