/// @function							scr_initialize();

#region //define global constants
	#macro LEFT -1
	#macro RIGHT 1
	#macro TOP -1
	#macro BOTTOM 1
	#macro CIRCLE 360
	#macro NONE 0
	
	//inputs
	#macro INPUT_UP "input_up"
	#macro INPUT_DOWN "input_down"
	#macro INPUT_LEFT "input_left"
	#macro INPUT_RIGHT "input_right"
	#macro INPUT_A "input_a"
	#macro INPUT_B "input_b"
	#macro INPUT_C "input_c"
	#macro INPUT_D "input_d"
	#macro INPUT_PAUSE "input_pause"
	#macro INPUT_ANY "input_any"

	//window
	#macro WINDOW_BASE_WIDTH 640
	#macro WINDOW_BASE_HEIGHT 360
	#macro WINDOW_HEIGHT_720 2

	//options
	#macro OPTIONS_INPUT_TYPE "options_input"
	#macro OPTIONS_FULLSCREEN "options_full_toggle"
	#macro OPTIONS_WINDOWMULT "options_window_height"
		
	//title menu
	#macro MENU_DELAY 15
	#macro MENU_TRANSITION 50
	
	#macro TITLE_MODE_START_FADEIN -2
	#macro TITLE_MODE_START_READY -1
	#macro TITLE_MODE_MENU_FADEIN 0
	#macro TITLE_MODE_MENU_READY 1
	#macro TITLE_MODE_FILES_FADEIN 2
	#macro TITLE_MODE_FILES_READY 3
	#macro TITLE_MODE_FILES_FADEOUT 4
	#macro TITLE_MODE_FILES_CLEAR 5
	#macro TITLE_MODE_FILES_FADEAWAY 6
	#macro TITLE_MODE_MUSIC_FADEIN 7
	#macro TITLE_MODE_MUSIC_READY 8
	#macro TITLE_MODE_MUSIC_FADEOUT 9
	#macro TITLE_MODE_CG_FADEIN 10
	#macro TITLE_MODE_CG_READY 11
	#macro TITLE_MODE_CG_FADEOUT 12
	#macro TITLE_MODE_OPTIONS_FADEIN 13
	#macro TITLE_MODE_OPTIONS_READY 14
	#macro TITLE_MODE_OPTIONS_FADEOUT 15
	#macro TITLE_MODE_EXIT_FADEAWAY 16
	
	#macro MENU_PLACEHOLDER -1
	#macro MENU_LOGO 0
	#macro MENU_START 1
	#macro MENU_TITLE 2
	#macro MENU_FILE 3
	#macro MENU_CLEAR 4
	#macro MENU_MUSIC 5
	#macro MENU_CG 6
	#macro MENU_OPTIONS 7
	#macro MENU_EXIT 8
	
	#macro TITLE_MENU_CHOICES 3
	#macro TITLE_MENU_TEXT_FILES "Start Game"
//	#macro TITLE_MENU_TEXT_CG "Gallery"
//	#macro TITLE_MENU_TEXT_MUSIC "Music Room"
	#macro TITLE_MENU_TEXT_OPTIONS "Options"
	#macro TITLE_MENU_TEXT_EXIT_GAME "Exit"
	#macro TITLE_MENU_CHOICE_FILES 1
//	#macro TITLE_MENU_CHOICE_CG 2
//	#macro TITLE_MENU_CHOICE_MUSIC 3
	#macro TITLE_MENU_CHOICE_OPTIONS 2
	#macro TITLE_MENU_CHOICE_EXIT_GAME 3
	
	#macro LOAD_MENU_CHOICES 5
	#macro LOAD_CHOICE_FILE_A 1
	#macro LOAD_CHOICE_FILE_B 2
	#macro LOAD_CHOICE_FILE_C 3
	#macro LOAD_CHOICE_CLEAR 4
	#macro LOAD_CHOICE_BACK 5
	
	#macro CLEAR_MENU_CHOICES 4
	#macro CLEAR_CHOICE_FILE_A 1
	#macro CLEAR_CHOICE_FILE_B 2
	#macro CLEAR_CHOICE_FILE_C 3
	#macro CLEAR_CHOICE_CANCEL 4
	
	//TODO: add CG menu choices
	#macro CG_MENU_PER_ROW 2
	#macro CG_MENU_CHOICES_ENTRIES 12
	#macro CG_MENU_CHOICE_BACK -1
	#macro CG_MENU_CHOICE_A 1
	#macro CG_MENU_CHOICE_B 2
	#macro CG_MENU_CHOICE_C 3
	#macro CG_MENU_CHOICE_D 4
	#macro CG_MENU_CHOICE_E 5
	#macro CG_MENU_CHOICE_F 6
	#macro CG_MENU_CHOICE_G 7
	#macro CG_MENU_CHOICE_H 8
	#macro CG_MENU_CHOICE_I 9
	#macro CG_MENU_CHOICE_J 10
	#macro CG_MENU_CHOICE_K 11
	#macro CG_MENU_CHOICE_L 12
	#macro CG_MENU_SPRITE_A spr_cg_PLACEHOLDER
	#macro CG_MENU_SPRITE_B spr_cg_PLACEHOLDER
	#macro CG_MENU_SPRITE_C spr_cg_PLACEHOLDER
	#macro CG_MENU_SPRITE_D spr_cg_PLACEHOLDER
	#macro CG_MENU_SPRITE_E spr_cg_PLACEHOLDER
	#macro CG_MENU_SPRITE_F spr_cg_PLACEHOLDER
	#macro CG_MENU_SPRITE_G spr_cg_PLACEHOLDER
	#macro CG_MENU_SPRITE_H spr_cg_PLACEHOLDER
	#macro CG_MENU_SPRITE_I spr_cg_PLACEHOLDER
	#macro CG_MENU_SPRITE_J spr_cg_PLACEHOLDER
	#macro CG_MENU_SPRITE_K spr_cg_PLACEHOLDER
	#macro CG_MENU_SPRITE_L spr_cg_PLACEHOLDER
	#macro CG_MENU_NAME_A "Placeholder CG Title 1"
	#macro CG_MENU_NAME_B "Placeholder CG Title 2"
	#macro CG_MENU_NAME_C "Placeholder CG Title 3"
	#macro CG_MENU_NAME_D "Placeholder CG Title 4"
	#macro CG_MENU_NAME_E "Placeholder CG Title 5"
	#macro CG_MENU_NAME_F "Placeholder CG Title 6"
	#macro CG_MENU_NAME_G "Placeholder CG Title 7"
	#macro CG_MENU_NAME_H "Placeholder CG Title 8"
	#macro CG_MENU_NAME_I "Placeholder CG Title 9"
	#macro CG_MENU_NAME_J "Placeholder CG Title 10"
	#macro CG_MENU_NAME_K "Placeholder CG Title 11"
	#macro CG_MENU_NAME_L "Placeholder CG Title 12"
	
	
	#macro MUSIC_MENU_CHOICES 6
	#macro MUSIC_MENU_CHOICE_A 1
	#macro MUSIC_MENU_CHOICE_B 2
	#macro MUSIC_MENU_CHOICE_C 3
	#macro MUSIC_MENU_CHOICE_D 4
	#macro MUSIC_MENU_CHOICE_E 5
	#macro MUSIC_MENU_CHOICE_F 6
	#macro MUSIC_MENU_SOUND_A mus_PLACEHOLDER
	#macro MUSIC_MENU_SOUND_B mus_PLACEHOLDER
	#macro MUSIC_MENU_SOUND_C mus_PLACEHOLDER
	#macro MUSIC_MENU_SOUND_D mus_PLACEHOLDER
	#macro MUSIC_MENU_SOUND_E mus_PLACEHOLDER
	#macro MUSIC_MENU_SOUND_F mus_PLACEHOLDER
	#macro MUSIC_MENU_TITLE_A "Placheolder Music Title 1"
	#macro MUSIC_MENU_TITLE_B "Placeholder Music Title 2"
	#macro MUSIC_MENU_TITLE_C "Placeholder Music Title 3"
	#macro MUSIC_MENU_TITLE_D "Placeholder Music Title 4"
	#macro MUSIC_MENU_TITLE_E "Placeholder Music Title 5"
	#macro MUSIC_MENU_TITLE_F "Placeholder Music Title 6"
	#macro MUSIC_MENU_DESC_A "Line 1\nLine 2\nLine 3"
	#macro MUSIC_MENU_DESC_B "Line 1\nLine 2\nLine 3"
	#macro MUSIC_MENU_DESC_C "Line 1\nLine 2\nLine 3"
	#macro MUSIC_MENU_DESC_D "Line 1\nLine 2\nLine 3"
	#macro MUSIC_MENU_DESC_E "Line 1\nLine 2\nLine 3"
	#macro MUSIC_MENU_DESC_F "Line 1\nLine 2\nLine 3"
	
	#macro OPTIONS_MENU_CHOICES 4
	#macro OPTIONS_MENU_CHOICE_FULLSCREEN 1
//	#macro OPTIONS_MENU_CHOICE_TYPEWRITER 2
	#macro OPTIONS_MENU_CHOICE_DEFAULTS 2
	#macro OPTIONS_MENU_CHOICE_SAVE 3
	#macro OPTIONS_MENU_CHOICE_DISCARD 4
	
	//savefiles
	#macro FILE_LOAD_NEW 2
	#macro FILE_LOAD_FAIL 1
	#macro FILE_LOAD_SUCCESS 0
	
	#macro SAVE_FILE_NAME_A "save_A.json"
	#macro SAVE_FILE_NAME_B "save_B.json"
	#macro SAVE_FILE_NAME_C "save_c.json"
	#macro SAVE_DEFAULTS "defaults.json"
	#macro SAVE_AUTOSAVE "autosave.json"
	
	#macro SAVE_CHNUM "save_chnum"
	#macro SAVE_LINENUM "save_linenum"
	
	//dialogue
	#macro TEXT_LOADING -1
	#macro TEXT_TYPING 0
	#macro TEXT_READY 1
	#macro AUTO_OFF 0
	#macro AUTO_NEXT 1
	#macro AUTO_ON 2
	#macro AUTO_SPEED 180
	#macro TALK_ANIM_SPEED 0.1
	
	#macro DISPLAY_NOTEXT 0
	#macro DISPLAY_ADV 1
	#macro DISPLAY_NARRATOR 2
	#macro DISPLAY_CG 3
	#macro DISPLAY_ADV_SHOUT 4
	#macro DISPLAY_WRITER 5
	
	#macro LOG_LIMIT 1000
	
	#macro POSITION_LEFT -1
	#macro POSITION_LEFTCENTER -0.5
	#macro POSITION_CENTER 0
	#macro POSITION_RIGHTCENTER 0.5
	#macro POSITION_RIGHT 1
	
	#macro BG_TEST -1
	#macro BG_NONE 0
	#macro BG_CHIREIDEN 1
	#macro BG_MORIYA_SHRINE 2
	#macro BG_THERAPY_OFFICE 3
	#macro BG_MISTY_LAKE 4
	
	#macro MUS_TEST -1
	#macro MUS_NONE 0
	
	#macro SOUND_TEST -1
	#macro SOUND_NONE 0
	
	#macro TALK_TEST -1
	#macro TALK_NOSPRITE 0
	#macro TALK_KOISHI 1
	#macro TALK_SATORI 2
	#macro TALK_SANAE 3
	#macro TALK_RIN 4
	#macro TALK_UTSUHO 5
	#macro TALK_KANOKO 6
	#macro TALK_SUWAKO 7
	
	//scene
	#macro SCENE_TOTAL 5
	#macro SCENE_TEST -1
	#macro SCENE_NOSCENE 0
	#macro SCENE_C1_SISMAD 1
	#macro SCENE_C2_SHRINEMAD 2
	#macro SCENE_C3_THERAPY1 3
	#macro SCENE_C4_LAKE 4
	#macro SCENE_C5_SORRY 5
	#macro SCENE_C6_SISSORRY 6
	
	
#endregion

function scr_initialize() {
	randomize();
	scr_options_init();
	scr_input_init();
	scr_files_init();
	global.scene_mode = false;
	global.scene_number = SCENE_NOSCENE;
	global.dialogue_mode = false;
	global.combat_mode = false;
	global.autosave_load = false;
	global.savepoint_numbers = 0;
	global.savepoint_instances[255] = 0;
	global.log_text[LOG_LIMIT] = array_create(LOG_LIMIT);
	global.log_names[LOG_LIMIT] = array_create(LOG_LIMIT);
	global.load_file_name = "defaults.json";
	global.file_A_preview_line1 = "---";
	global.file_B_preview_line1 = "---";
	global.file_C_preview_line1 = "---";
	global.file_A_preview_line2 = "---";
	global.file_B_preview_line2 = "---";
	global.file_C_preview_line2 = "---";
}




















