switch ( title_mode ) {	
	case TITLE_MODE_START_FADEIN: {
		scr_menu_draw( MENU_LOGO, title_switch_timer, menu_position );
		break;
	}
	case TITLE_MODE_START_READY: {
		scr_menu_draw( MENU_LOGO, title_switch_timer, menu_position );
		scr_menu_draw( MENU_START, title_switch_timer, menu_position );
		break;
	}

	case TITLE_MODE_MENU_FADEIN: {
		scr_menu_draw( MENU_START, title_switch_timer, menu_position );
		scr_menu_draw( MENU_TITLE, title_switch_timer, menu_position );
		break;
	}
	case TITLE_MODE_MENU_READY: {
		scr_menu_draw( MENU_TITLE, title_switch_timer, menu_position );
		break;
	}
		
	case TITLE_MODE_FILES_FADEIN: {
		scr_menu_draw( MENU_TITLE, title_switch_timer, menu_position );
		scr_menu_draw( MENU_FILE, title_switch_timer, menu_position );
		break;
	}
	case TITLE_MODE_FILES_READY: {
		scr_menu_draw( MENU_FILE, title_switch_timer, menu_position );
		break;
	}
	case TITLE_MODE_FILES_FADEOUT: {
		scr_menu_draw( MENU_FILE, title_switch_timer, menu_position );
		scr_menu_draw( MENU_TITLE, title_switch_timer, menu_position );
		break;
	}
	case TITLE_MODE_FILES_FADEAWAY: {
		scr_menu_draw( MENU_FILE, title_switch_timer, menu_position );
		scr_menu_draw( MENU_TRANSITION, title_switch_timer, menu_position );
		break;
	}
	case TITLE_MODE_FILES_CLEAR: {
		scr_menu_draw( MENU_CLEAR, title_switch_timer, menu_position );
		break;
	}

	case TITLE_MODE_OPTIONS_FADEIN: {
		scr_menu_draw( MENU_TITLE, title_switch_timer, menu_position );
		scr_menu_draw( MENU_OPTIONS, title_switch_timer, menu_position );
		break;
	}
	case TITLE_MODE_OPTIONS_READY: {
		scr_menu_draw( MENU_OPTIONS, title_switch_timer, menu_position );
		break;
	}
	case TITLE_MODE_OPTIONS_FADEOUT: {
		scr_menu_draw( MENU_OPTIONS, title_switch_timer, menu_position );
		scr_menu_draw( MENU_TITLE, title_switch_timer, menu_position );
		break;
	}

	case TITLE_MODE_MUSIC_FADEIN: {
		scr_menu_draw( MENU_TITLE, title_switch_timer, menu_position );
		scr_menu_draw( MENU_MUSIC, title_switch_timer, menu_position );
		break;
	}
	case TITLE_MODE_MUSIC_READY: {
		scr_menu_draw( MENU_MUSIC, title_switch_timer, menu_position );
		break;
	}
	case TITLE_MODE_MUSIC_FADEOUT: {
		scr_menu_draw( MENU_MUSIC, title_switch_timer, menu_position );
		scr_menu_draw( MENU_TITLE, title_switch_timer, menu_position );
		break;	
	}
	case TITLE_MODE_CG_FADEIN: {
		scr_menu_draw( MENU_TITLE, title_switch_timer, menu_position );
		scr_menu_draw( MENU_CG, title_switch_timer, menu_position );
		break;
	}
	case TITLE_MODE_CG_READY: {
		scr_menu_draw( MENU_CG, title_switch_timer, menu_position );
		break;
	}
	case TITLE_MODE_CG_FADEOUT: {
		scr_menu_draw( MENU_CG, title_switch_timer, menu_position );
		scr_menu_draw( MENU_TITLE, title_switch_timer, menu_position );
		break;	
	}
	
	default: {
		break;
	}
}

























