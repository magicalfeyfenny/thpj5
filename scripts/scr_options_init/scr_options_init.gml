function scr_options_init(){
	if (!variable_global_exists( "global.options" ) ) {
		global.options = -1;
	}
	if (!ds_exists(global.options, ds_type_map) ) {
		global.options = ds_map_create();
	}
	
	//initialize default values for options
	global.options[? OPTIONS_INPUT_TYPE] = "keyboard";
	global.options[? OPTIONS_FULLSCREEN] = true;
	global.options[? OPTIONS_WINDOWMULT] = WINDOW_HEIGHT_720;
	
	//load options from file
	if (!file_exists(working_directory + "options.json") ) { 
		var file = file_text_open_write(working_directory + "options.json");
		var output_string = json_encode( global.options );
		file_text_write_string(file, output_string);
		file_text_close(file);
	} else {
		var input_string = "";
		var test_key = ds_map_create();
		var read_file = file_text_open_read( working_directory + "options.json" );
		input_string = file_text_read_string( read_file );
		test_key = json_decode( input_string );
		file_text_close( read_file );
		if ( test_key != -1 ) {
			if ( ds_exists( global.options, ds_type_map ) ) {  //0-9 is the numeric range of the macros
				global.options = json_decode( input_string );
			} else {
				var write_file = file_text_open_write( working_directory + "options.json" );
				var output_string = json_encode( global.options );
				file_text_write_string(write_file, output_string);
				file_text_close( write_file );
//				show_message( "Options file verification failed. Storing defaults" );
			}
		}
		ds_map_destroy( test_key );
	}

	//apply options
	if (global.options[? OPTIONS_FULLSCREEN]) {
		window_set_fullscreen(true);
	} else {
		window_set_fullscreen(false);
	}
}