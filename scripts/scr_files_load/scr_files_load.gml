function scr_files_load( _filename ) {
	if ( _filename = "defaults.json" ) {
		//start from a new game, load default variables, etc.
		if (ds_exists( global.loaded_file, ds_type_map ) ) {
			ds_map_clear( global.loaded_file );
			ds_map_copy(global.loaded_file, global.default_save);
		}
		return FILE_LOAD_NEW;
	} 
	
	if ( file_exists( working_directory + _filename ) ) {
		//load an existing file
		var input_string = "";
		var success = false;
		var test_key = ds_map_create();
		var read_file = file_text_open_read( working_directory + _filename );
		input_string = file_text_read_string( read_file );
		test_key = json_decode( input_string );
		file_text_close( read_file);
		if (test_key != -1 ) {
			if ( ds_exists( global.loaded_file, ds_type_map ) ) {
				ds_map_clear( global.loaded_file );
				global.loaded_file = json_decode( input_string );
				success = true;
			}
		}
		ds_map_destroy( test_key );
		if (success) {
			return FILE_LOAD_SUCCESS;
		} else {
			//file is not a JSON, show error
//			show_message( "Could not load file " + _filename + ", not a JSON" );
			return FILE_LOAD_FAIL;
		}
	} else {
		//file does not exist, show error
//		show_message( "Could not load file " + _filename + ", file not found" );
		return FILE_LOAD_FAIL;
	}
}