counter++;

if (counter > 120) {
	alpha_cycle = (300 - counter) / 120;
} else {
	alpha_cycle = counter / 120;
}

if ( counter >= countermax ) {
	room_goto_next();
}
	
if ( scr_input_get( INPUT_PAUSE ) ) {
//	game_end();
}
