function scr_files_init(){
	if (!variable_global_exists( "global.default_save" ) ) {
		global.default_save = -1;
	}
	if (!ds_exists(global.default_save, ds_type_map) ) {
		global.default_save = ds_map_create();
	}
	if (!variable_global_exists( "global.loaded_file" ) ) {
		global.loaded_file = -1;
	}
	if (!ds_exists(global.loaded_file, ds_type_map) ) {
		global.loaded_file = ds_map_create();
	}	
	
	//initialize default save data 
	global.default_save[? SAVE_POINT ] = SAVE_POINT_START;
	scr_files_load( SAVE_DEFAULTS );
	
	//initialize save files
	if ( !file_exists(SAVE_FILE_NAME_A) ) {
		scr_files_save(SAVE_FILE_NAME_A);
	}
	if (!file_exists(SAVE_FILE_NAME_B) ) {
		scr_files_save(SAVE_FILE_NAME_B);
	}
	if (!file_exists(SAVE_FILE_NAME_C) ) {
		scr_files_save(SAVE_FILE_NAME_C);
	}
		
}