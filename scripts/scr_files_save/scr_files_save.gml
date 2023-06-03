function scr_files_save( _filename ){
	var file = file_text_open_write( working_directory + _filename );
	var output_string = json_encode( global.loaded_file );
	file_text_write_string(file, output_string);
	file_text_close(file);
}