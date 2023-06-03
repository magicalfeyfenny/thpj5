/// @function							scr_input_init();

function scr_input_init() {
	
	//create default keyboard json
	if (!variable_global_exists("global.keyboard" ) ) {
		global.keyboard = -1;
	}
	if (!ds_exists(global.keyboard, ds_type_map) ) {
		global.keyboard = ds_map_create();
	}
	
	global.keyboard[? INPUT_UP]				= vk_up;
	global.keyboard[? INPUT_DOWN]			= vk_down;
	global.keyboard[? INPUT_LEFT]			= vk_left;
	global.keyboard[? INPUT_RIGHT]			= vk_right;
	global.keyboard[? INPUT_A]				= ord("Z");
	global.keyboard[? INPUT_B]				= ord("X");
	global.keyboard[? INPUT_C]				= ord("C");
	global.keyboard[? INPUT_D]				= vk_shift;
	global.keyboard[? INPUT_PAUSE]			= vk_escape;
	global.keyboard[? INPUT_ANY]			= vk_anykey;
	
	//load keyboard json, if it doesn't exist or doesn't load right, save a fresh one  
	if (!file_exists(working_directory + "keyboard.json") ) { 
		var file = file_text_open_write(working_directory + "keyboard.json");
		var output_string = json_encode( global.keyboard );
		file_text_write_string(file, output_string);
		file_text_close(file);
	} else {
		var input_string = "";
		var test_key = ds_map_create();
		var read_file = file_text_open_read( working_directory + "keyboard.json" );
		input_string = file_text_read_string( read_file );
		test_key = json_decode( input_string );
		file_text_close( read_file );
		if ( test_key != -1 ) {
			if ( ds_exists( global.keyboard, ds_type_map ) ) {  //0-9 is the numeric range of the macros
				global.keyboard = json_decode( input_string );
			} else {
				var write_file = file_text_open_write( working_directory + "keyboard.json" );
				var output_string = json_encode( global.keyboard );
				file_text_write_string(write_file, output_string);
				file_text_close( write_file );
			}
		}
		ds_map_destroy( test_key );
	}
}


