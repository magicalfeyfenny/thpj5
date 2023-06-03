/// @function							scr_input_get( _input )
/// @param	{real}	_input

function scr_input_get( _input ) {
	
var keycheck = false;
//TODO: add multiple control methods
	if ( global.options[? OPTIONS_INPUT_TYPE] == "keyboard" ) {
		switch ( _input ) {
			#region continuous inputs
				case INPUT_UP:
				case INPUT_DOWN:
				case INPUT_LEFT:
				case INPUT_RIGHT:
				case INPUT_C:
				case INPUT_A:
				case INPUT_B:
					keycheck = keyboard_check( global.keyboard[? _input] );
					break;
			#endregion
			#region pressed inputs
				case INPUT_D:
				case INPUT_PAUSE:
				case INPUT_ANY:
					keycheck = keyboard_check_pressed( global.keyboard[? _input] );
					break;
			#endregion
				default:
					break;
		}
	}

	return keycheck;
}





