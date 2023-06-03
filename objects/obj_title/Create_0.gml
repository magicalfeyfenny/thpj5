title_xscale = 1;
title_yscale = 1;
fade_in_time = 150;
title_angle = 0;

scroller_angle = 20;
scroller = 0;

gallery_select_x = 0;
gallery_select_y = 0;

gallery_menu = [
	[CG_MENU_SPRITE_A,CG_MENU_SPRITE_B,CG_MENU_CHOICE_BACK],
	[CG_MENU_SPRITE_C,CG_MENU_SPRITE_D,0],
	[CG_MENU_SPRITE_E,CG_MENU_SPRITE_F,0],
	[CG_MENU_SPRITE_G,CG_MENU_SPRITE_H,0],
	[CG_MENU_SPRITE_I,CG_MENU_SPRITE_J,0],
	[CG_MENU_SPRITE_K,CG_MENU_SPRITE_L,0]
]
cg_drawer = -1;
cg_choice = NONE;
gallery_top_y = 0;



title_mode = TITLE_MODE_START_FADEIN;

title_switch_timer = 100;

menu_position = 1;
menu_wait = MENU_DELAY;

music_select = -1;
music_top = 1;

temp_options = ds_map_create();

scr_files_load_preview();

confirm = false;
confirm_choice = false;