/// @function							scr_menu_draw( _menu, _t, _pos )
/// @param	{real}	_menu
/// @param	{real}	_t
/// @param	{real}	_pos

function scr_menu_draw( _menu, _t, _pos) {
	switch (_menu) {
		case MENU_LOGO: {
			draw_sprite_ext(spr_temp_art, 0, 320, 180, title_xscale, title_yscale, title_angle, c_white, 1);
			break;
		}
		case MENU_START: {
			draw_set_halign(fa_center);
			draw_set_font(fn_menu_main);
			draw_text_ext_transformed_color_border(320, 250, "== press any key ==", 15, 1000, 1, 1, 0, c_silver, c_silver, c_white, c_white, 0.3 + dsin(abs(title_switch_timer) * 2), 1, c_dkgray);
			break;
		}
		case MENU_TITLE: {		
			draw_set_color(c_black);
			draw_set_alpha(.25);
			draw_triangle(641, -400, 641, 760, 390, 370, false);
			draw_triangle(641, -600, 641, 960, 340, -30, false);
			draw_triangle(641, -800, 641, 1160, 440, -5, false);
			draw_triangle(641, -720, 641, 1080, 490, 365, false);
			draw_rectangle(-1, 361, 641, 361 - 20, false);
			draw_rectangle(-1, 361, 641, 361 - 20, false);
			draw_set_alpha(1);
		
			draw_sprite(spr_menuselect, 0, 600 + (3 * _pos) , 100 + (30 * _pos) );
		
			draw_set_halign(fa_right);
			draw_set_font(fn_menu_main);
			
			//implemented menu functions:		
			draw_text_ext_transformed_color_border( 580 + (3 * TITLE_MENU_CHOICE_FILES		), 90 + (30 * TITLE_MENU_CHOICE_FILES		),	TITLE_MENU_TEXT_FILES		,15, 1000, 1, 1, 0, c_silver, c_silver, c_white, c_white, 1, 1, c_dkgray);	//1
//			draw_text_ext_transformed_color_border( 580 + (3 * TITLE_MENU_CHOICE_CG			), 90 + (30 * TITLE_MENU_CHOICE_CG			),	TITLE_MENU_TEXT_CG			,15, 1000, 1, 1, 0, c_silver, c_silver, c_white, c_white, 1, 1, c_dkgray); //2
			draw_text_ext_transformed_color_border( 580 + (3 * TITLE_MENU_CHOICE_MUSIC		), 90 + (30 * TITLE_MENU_CHOICE_MUSIC		),	TITLE_MENU_TEXT_MUSIC		,15, 1000, 1, 1, 0, c_silver, c_silver, c_white, c_white, 1, 1, c_dkgray); //3
			draw_text_ext_transformed_color_border( 580 + (3 * TITLE_MENU_CHOICE_OPTIONS	), 90 + (30 * TITLE_MENU_CHOICE_OPTIONS		),	TITLE_MENU_TEXT_OPTIONS		,15, 1000, 1, 1, 0, c_silver, c_silver, c_white, c_white, 1, 1, c_dkgray); //4
			draw_text_ext_transformed_color_border( 580 + (3 * TITLE_MENU_CHOICE_EXIT_GAME	), 90 + (30 * TITLE_MENU_CHOICE_EXIT_GAME	),	TITLE_MENU_TEXT_EXIT_GAME	,15, 1000, 1, 1, 0, c_silver, c_silver, c_white, c_white, 1, 1, c_dkgray); //5
			//unimplemented menu functions:
			draw_text_ext_transformed_color_border( 580 + (3 * TITLE_MENU_CHOICE_CG			), 90 + (30 * TITLE_MENU_CHOICE_CG			),	TITLE_MENU_TEXT_CG			,15, 1000, 1, 1, 0, c_silver, c_silver, c_white, c_white, 1, 1, c_gray); //2

			draw_set_font(fn_menu_help);
			draw_set_halign(fa_left);
			draw_text_ext_transformed_color_border( 5, 345, "up/down: choose, Z: select", 9, 620, 1, 1, 0, c_silver, c_silver, c_white, c_white, 1, 1, c_dkgray); 
			draw_set_color(c_white);
			break;
		}
		case MENU_FILE: {
			draw_set_color(c_black);
			draw_set_alpha(.25);
			draw_triangle(641,	-400,	641,	760,	-110,	370,	false);
			draw_triangle(641,	-600,	641,	960,	-160,	-30,	false);
			draw_triangle(641,	-800,	641,	1160,	-60,	-5,		false);
			draw_triangle(641,	-720,	641,	1080,	-10,	365,	false);	
			draw_rectangle(-1, 361, 641, 341, false);
			draw_rectangle(-1, 361, 641, 341, false);
		
			draw_set_halign(fa_left);
			draw_set_font(fn_menu_large);
			draw_set_color(c_white);
			draw_set_alpha(1);
			draw_text(100, 30, "Load Game\n");
			if (_pos >= LOAD_CHOICE_BACK) {
				draw_sprite(spr_menuselect, 0, 90, 305 + (30 * (_pos - LOAD_CHOICE_BACK)));
			} else {
				draw_sprite(spr_menuselect, 0, 90, 5 + (60 * (_pos)));
			}
			draw_text( 120, 60, "File A:");
			draw_text( 120, 120, "File B:");
			draw_text( 120, 180, "File C:");
			draw_text( 120, 240, "Erase file");
			draw_text( 120, 300, "Back to title");
			
			draw_set_halign( fa_right );
			draw_text( 350, 60, global.file_A_preview_line1);
			draw_text( 350, 85, global.file_A_preview_line2);
			draw_text( 350, 120, global.file_B_preview_line1);
			draw_text( 350, 145, global.file_B_preview_line2);
			draw_text( 350, 180, global.file_C_preview_line1);
			draw_text( 350, 205, global.file_C_preview_line2);
		
			draw_set_font(fn_menu_help);
			draw_set_halign(fa_left);
			draw_text_ext_transformed_color_border( 5, 345, "up/down: choose, Z: select", 9, 620, 1, 1, 0, c_silver, c_silver, c_white, c_white, 1, 1, c_dkgray); 
			
			draw_set_color(c_white);
			break;
		}
		case MENU_CLEAR: {
			draw_set_color(c_black);
			draw_set_alpha(.25);
			draw_triangle(641,	-400,	641,	760,	-110,	370,	false);
			draw_triangle(641,	-600,	641,	960,	-160,	-30,	false);
			draw_triangle(641,	-800,	641,	1160,	-60,	-5,		false);
			draw_triangle(641,	-720,	641,	1080,	-10,	365,	false);	
			draw_rectangle(-1, 361, 641, 341, false);
			draw_rectangle(-1, 361, 641, 341, false);
		
			draw_set_halign(fa_left);
			draw_set_font(fn_menu_large);
			draw_set_color(c_white);
			draw_set_alpha(1);
			draw_text(100, 30, "Erase File\n");
			if (!confirm) {
				if (_pos >= CLEAR_CHOICE_CANCEL) {
					draw_sprite(spr_menuselect, 0, 90, 305 + (30 * (_pos - CLEAR_CHOICE_CANCEL)));
				} else {
					draw_sprite(spr_menuselect, 0, 90, 5 + (60 * (_pos)));
				}
			}
			draw_text( 120, 60, "File A:");
			draw_text( 120, 120, "File B:");
			draw_text( 120, 180, "File C:");
			draw_text( 120, 300, "Cancel");
			
			draw_set_halign( fa_right );
			draw_text( 350, 60, global.file_A_preview_line1);
			draw_text( 350, 120, global.file_B_preview_line1);
			draw_text( 350, 180, global.file_C_preview_line1);
			
			if (confirm) {
				draw_set_color(c_black);
				draw_set_alpha(0.5);
				draw_roundrect(150, 120, 490, 240, false);
				draw_roundrect(153, 123, 487, 237, true);
				draw_set_color(c_white);
				draw_set_alpha(1);
				draw_roundrect(150, 120, 490, 240, true);
				draw_roundrect(153, 123, 487, 237, true);
				draw_set_color(c_fuchsia);
				draw_set_halign(fa_center);
				draw_set_font(fn_menu_main);
				draw_text( 320, 130, "Erase file?" );
				draw_set_color(c_white);
				draw_text( 210, 200, "Yes");
				draw_text( 430, 200, "No");
				
				if (confirm_choice) {
					draw_sprite(spr_menuselect, 0, 180, 200);
				} else {
					draw_sprite(spr_menuselect, 0, 400, 200);
				}
			
			}
		
			draw_set_font(fn_menu_help);
			draw_set_halign(fa_left);
			draw_text_ext_transformed_color_border( 5, 345, "up/down: choose, Z: select", 9, 620, 1, 1, 0, c_silver, c_silver, c_white, c_white, 1, 1, c_dkgray); 
		
			draw_set_color(c_white);
			break;
		}
		case MENU_CG: {
			draw_set_color(c_black);
			draw_set_alpha(.25);
			draw_triangle(641,	-400,	641,	760,	-110,	370,	false);
			draw_triangle(641,	-600,	641,	960,	-160,	-30,	false);
			draw_triangle(641,	-800,	641,	1160,	-60,	-5,		false);
			draw_triangle(641,	-720,	641,	1080,	-10,	365,	false);	
			draw_rectangle(-1, 361, 641, 341, false);
			draw_rectangle(-1, 361, 641, 341, false);
			
			draw_set_halign(fa_left);
			draw_set_font(fn_menu_large);
			draw_set_color(c_white);
			draw_set_alpha(1);
			draw_text(100, 30,	  "Illustrations <3\n" );
			draw_sprite(spr_leftarrow, 0, 30, 180);
			draw_sprite(spr_rightarrow, 0, 610, 180);
			
			for (var j = 0; j < CG_MENU_CHOICES_ENTRIES / CG_MENU_PER_ROW; j++) {
				for (var i = 0; i < CG_MENU_PER_ROW; i++ ) {
					switch (gallery_menu[gallery_top_y + j][i]) {
						case CG_MENU_CHOICE_A:{
							cg_drawer = CG_MENU_SPRITE_A;
							cg_choice = CG_MENU_CHOICE_A;
							break;
						}
						case CG_MENU_CHOICE_B:{
							cg_drawer = CG_MENU_SPRITE_B;
							cg_choice = CG_MENU_CHOICE_B;
							break;
						}
						case CG_MENU_CHOICE_C:{
							cg_drawer = CG_MENU_SPRITE_C;
							cg_choice = CG_MENU_CHOICE_C;
							break;
						}
						case CG_MENU_CHOICE_D:{
							cg_drawer = CG_MENU_SPRITE_D;
							cg_choice = CG_MENU_CHOICE_D;
							break;
						}
						case CG_MENU_CHOICE_E:{
							cg_drawer = CG_MENU_SPRITE_E;
							cg_choice = CG_MENU_CHOICE_E;
							break;
						}						
						case CG_MENU_CHOICE_F:{
							cg_drawer = CG_MENU_SPRITE_F;
							cg_choice = CG_MENU_CHOICE_F;
							break;
						}						
						case CG_MENU_CHOICE_G:{
							cg_drawer = CG_MENU_SPRITE_G;
							cg_choice = CG_MENU_CHOICE_G;
							break;
						}						
						case CG_MENU_CHOICE_H:{
							cg_drawer = CG_MENU_SPRITE_H;
							cg_choice = CG_MENU_CHOICE_H;
							break;
						}						
						case CG_MENU_CHOICE_I:{
							cg_drawer = CG_MENU_SPRITE_I;
							cg_choice = CG_MENU_CHOICE_I;
							break;
						}
						case CG_MENU_CHOICE_J:{
							cg_drawer = CG_MENU_SPRITE_J;
							cg_choice = CG_MENU_CHOICE_J;
							break;
						}
						case CG_MENU_CHOICE_K:{
							cg_drawer = CG_MENU_SPRITE_K;
							cg_choice = CG_MENU_CHOICE_K;
							break;
						}
						case CG_MENU_CHOICE_L:{
							cg_drawer = CG_MENU_SPRITE_L;
							cg_choice = CG_MENU_CHOICE_L;
							break;
						}
						default: {
							break;
						}
					}
					if (sprite_exists(cg_drawer) ) {
						draw_sprite_stretched(cg_drawer, 0, 45 + (120 * (cg_choice - (gallery_top_y / CG_MENU_PER_ROW))), 60 + (120 * (cg_choice % CG_MENU_PER_ROW)), 128, 72);
					}
				}
			}
			break;
		}
		
		case MENU_MUSIC: {
			draw_set_color(c_black);
			draw_set_alpha(.25);
			draw_triangle(641,	-400,	641,	760,	-110,	370,	false);
			draw_triangle(641,	-600,	641,	960,	-160,	-30,	false);
			draw_triangle(641,	-800,	641,	1160,	-60,	-5,		false);
			draw_triangle(641,	-720,	641,	1080,	-10,	365,	false);	
			draw_rectangle(-1, 361, 641, 341, false);
			draw_rectangle(-1, 361, 641, 341, false);
			
			draw_set_halign(fa_left);
			draw_set_font(fn_menu_large);
			draw_set_color(c_white);
			draw_set_alpha(1);
			draw_text(100, 30,	  "Music Room <3\n" );
			if (music_top > 1) {
				draw_sprite(spr_uparrow, 0, 320, 45);
			}
			if (music_top < MUSIC_MENU_CHOICES - 3) {
				draw_sprite(spr_downarrow, 0, 320, 185);
			}
			draw_sprite(spr_menuselect, 0, 90, 75 + (30 * (_pos - music_top)));
			for (var i = 0; i <= 3; i++ ) {
				switch (music_top + i) {
					case MUSIC_MENU_CHOICE_A: {
						draw_text( 120, 60 + (30 * i), MUSIC_MENU_TITLE_A);
						break;
					}
					case MUSIC_MENU_CHOICE_B: {
						draw_text( 120, 60 + (30 * i), MUSIC_MENU_TITLE_B);
						break;
					}
					case MUSIC_MENU_CHOICE_C: {
						draw_text( 120, 60 + (30 * i), MUSIC_MENU_TITLE_C);
						break;
					}
					case MUSIC_MENU_CHOICE_D: {
						draw_text( 120, 60 + (30 * i), MUSIC_MENU_TITLE_D);
						break;
					}
					case MUSIC_MENU_CHOICE_E: {
						draw_text( 120, 60 + (30 * i), MUSIC_MENU_TITLE_E);
						break;
					}
					case MUSIC_MENU_CHOICE_F: {
						draw_text( 120, 60 + (30 * i), MUSIC_MENU_TITLE_F);
						break;
					}
					default: {
						break;
					}
				}
			}
			switch ( music_select ) {
				case MUSIC_MENU_CHOICE_A: {
					draw_text( 80, 200, MUSIC_MENU_TITLE_A);
					draw_text( 100, 230, MUSIC_MENU_DESC_A);
					break;
				}
				case MUSIC_MENU_CHOICE_B: {
					draw_text( 80, 200, MUSIC_MENU_TITLE_B);
					draw_text( 100, 230, MUSIC_MENU_DESC_B);
					break;
				}
				case MUSIC_MENU_CHOICE_C: {
					draw_text( 80, 200, MUSIC_MENU_TITLE_C);
					draw_text( 100, 230, MUSIC_MENU_DESC_C);
					break;
				}
				case MUSIC_MENU_CHOICE_D: {
					draw_text( 80, 200, MUSIC_MENU_TITLE_D);
					draw_text( 100, 230, MUSIC_MENU_DESC_D);
					break;
				}
				case MUSIC_MENU_CHOICE_E: {
					draw_text( 80, 200, MUSIC_MENU_TITLE_E);
					draw_text( 100, 230, MUSIC_MENU_DESC_E);
					break;
				}
				case MUSIC_MENU_CHOICE_F: {
					draw_text( 80, 200, MUSIC_MENU_TITLE_F);
					draw_text( 100, 230, MUSIC_MENU_DESC_F);
					break;
				}
				case -1:
				default: {
					break;
				}
			}
			
			draw_set_font(fn_menu_help);
			draw_set_halign(fa_left);
			draw_text_ext_transformed_color_border( 5, 345, "up/down: choose, Z: select, X: go back", 9, 620, 1, 1, 0, c_silver, c_silver, c_white, c_white, 1 , 1, c_dkgray); 
			
			draw_set_color(c_white);
			break;
		}
		case MENU_OPTIONS: {
			draw_set_color(c_black);
			draw_set_alpha(.25);
			draw_triangle(641,	-400,	641,	760,	-110,	370,	false);
			draw_triangle(641,	-600,	641,	960,	-160,	-30,	false);
			draw_triangle(641,	-800,	641,	1160,	-60,	-5,		false);
			draw_triangle(641,	-720,	641,	1080,	-10,	365,	false);	
			draw_rectangle(-1, 361, 641, 341, false);
			draw_rectangle(-1, 361, 641, 341, false);
			
			draw_set_halign(fa_left);
			draw_set_font(fn_menu_large);
			draw_set_color(c_white);
			draw_set_alpha(1);
			draw_text(100, 30,	 "Options\n" );
			if (_pos >= OPTIONS_MENU_CHOICE_DEFAULTS) {
				draw_sprite(spr_menuselect, 0, 90, 255 + (30 * (_pos - OPTIONS_MENU_CHOICE_DEFAULTS)));
			} else {
				draw_sprite(spr_menuselect, 0, 90, 45 + (30 * (_pos)));
			}
			if (_pos == OPTIONS_MENU_CHOICE_FULLSCREEN ) {
				draw_sprite(spr_leftarrow, 0, 300, 45 + (30 * (_pos)));
				draw_sprite (spr_rightarrow, 0, 600, 45 + (30 * (_pos)));
			}
			draw_text( 120, 60, "Display:");
			draw_text( 120, 240, "Defaults");
			draw_text( 120, 270, "Save changes & exit");
			draw_text( 120, 300, "Discard changes & exit");
			
			draw_set_halign( fa_center );
			switch (temp_options[? OPTIONS_FULLSCREEN] ) {
				case true: {
					draw_text( 450, 60, "Fullscreen");
					break;
				}
				case false:	{
					draw_text( 450, 60, "Windowed");
					break;
				}
				default: {
					break;
				}
			}
			
			draw_set_font(fn_menu_help);
			draw_set_halign(fa_left);
			draw_text_ext_transformed_color_border( 5, 345, "up/down: choose, left/right: switch,  Z: select/switch, X: discard changes & go back", 9, 620, 1, 1, 0, c_silver, c_silver, c_white, c_white, 1, 1, c_dkgray); 
			
			draw_set_color(c_white);
			break;	
		}
		case MENU_PLACEHOLDER: {
			draw_set_color(c_black);
			draw_set_alpha(.25);
			draw_triangle(641,	-400,	641,	760,	-110,	370,	false);
			draw_triangle(641,	-600,	641,	960,	-160,	-30,	false);
			draw_triangle(641,	-800,	641,	1160,	-60,	-5,		false);
			draw_triangle(641,	-720,	641,	1080,	-10,	365,	false);	
			draw_rectangle(-1, 361, 641, 341, false);
			draw_rectangle(-1, 361, 641, 341, false);
		
			draw_set_halign(fa_left);
			draw_set_font(fn_menu_large);
			draw_set_color(c_white);
			draw_set_alpha(1);
			draw_text(100, 30,	  "this is test text asdgdfg \n"
								+ "i love testing text it is fun \n"
								+ "sing along if you wanna come \n"
								+ "be the world, be the legend, be you \n"
								+ "cuties win every time don'tcha know? \n"
								+ "idk this is gonna get erased anyway, right? \n"
								+ "i mean, yeah, but come and play anyway! \n"
								+ "love the little pleasures in our life \n"
								+ "it's all we need it's all we got \n"
								+ "now press forward without a thought! \n" );
		
			draw_set_font(fn_menu_help);
			draw_set_halign(fa_left);
			draw_text_ext_transformed_color_border( 5, 345, "press any key to go back", 9, 620, 1, 1, 0, c_silver, c_silver, c_white, c_white, 1 * ((100 - (4 * _t)) / 100) , 1, c_dkgray);
			
			draw_set_color(c_white);
			break;	
		}
		default: {
			break;
		}
	}
}