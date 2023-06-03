/// @function:							scr_dialogue_start( _filename );
/// @param	{string}	_filename		The filename of the dialogue branch

// Requirements: An instance of obj_dialogue must exist in the room

function scr_dialogue_start( _filename ) {
	if (!instance_exists(obj_dialogue) ) {
		return -1;
	}
	
//VERSION 3 FILE FORMAT
//NOT COMPATIBLE WITH PRIOR DIALOGUE SCRIPTS (Wriggle, Sunflowers, Cirno)
		
//file format for dialogue:
/*
	each line of dialogue goes as follows:
			variable			type		ds_map
========================================================
line 1		bg_id				{int}		bg_test
	 2		mus_id				{int}		mus_test
	 3		sound_id			{int}		sound_test
	 4		display_mode		{int}		display_test
	 5		actor_A_sprite		{int}		sprite_test
	 6		actor_A_pos			{real}		pos_test
	 7		actor_B_sprite		{int}		sprite_test
	 8		actor_B_pos			{real}		pos_test
	 9		actor_C_sprite		{int}		sprite_test
	 10		actor_C_pos			{real}		pos_test
	 11		speaker_name		{string}	speaker_test
	 12		texttarget			{string}	text_test
	
	the ints contained in lines 1-3,5,7,9 refer to the macro ID 
	listed in scr_initialize() that refer to background image, 
	music, sound, and portrait sprite resources used by obj_dialogue.
	
	line 4 refers to text display modes in obj_dialogue. 
	0	no text, background + portrait sprites only
	1	adventure mode, where texttarget appears in boxes 
		that appear under the character. this displays the speaker_name 
		in line 11.
	2	narration mode, where texttarget appears in the center
		of the screen with a 50% alpha rectangle drawn over bg_id.
		speaker_name is not displayed
	3	::TODO::
		CG mode, where texttarget appears with an image referenced in 
		bg_id that pans	across the image slowly to end at a final point. 
		this is for scenes that have larger detailed CG images rather
		than a static background scene
		
	lines 6,8,10 are the horizontal position of the preceding portrait
	sprite resource, where 0 is 'centered' (x=320), -1 is 'left' (x=120),
	and 1 is 'right' (x=520).
	
	lines 11 and 12 are lines of text, intended as the current line's 
	speaker (11, speaker_name) and the text they are speaking (12, 
	texttarget). # acts as a newline delimiter for texttarget
*/	

	//clear all queues
	ds_queue_clear( obj_dialogue.bg_test );
	ds_queue_clear( obj_dialogue.mus_test );
	ds_queue_clear( obj_dialogue.sound_test );
	ds_queue_clear( obj_dialogue.display_test );
	ds_queue_clear( obj_dialogue.sprite_test );
	ds_queue_clear( obj_dialogue.pos_test );
	ds_queue_clear( obj_dialogue.speaker_test);
	ds_queue_clear( obj_dialogue.text_test );

	//open dialogue file matching _filename
	file = file_text_open_read( _filename );

	//enqueue dialogue
	while (!file_text_eof(file) ) {
		ds_queue_enqueue( obj_dialogue.bg_test, file_text_read_real(file) );
		file_text_readln(file);
		ds_queue_enqueue( obj_dialogue.mus_test, file_text_read_real(file) );
		file_text_readln(file);
		ds_queue_enqueue( obj_dialogue.sound_test, file_text_read_real(file) );
		file_text_readln(file);
		ds_queue_enqueue( obj_dialogue.display_test, file_text_read_real(file) );
		file_text_readln(file);
		ds_queue_enqueue( obj_dialogue.sprite_test, file_text_read_real(file) );
		file_text_readln(file);
		ds_queue_enqueue( obj_dialogue.pos_test, file_text_read_real(file) );
		file_text_readln(file);
		ds_queue_enqueue( obj_dialogue.sprite_test, file_text_read_real(file) );
		file_text_readln(file);
		ds_queue_enqueue( obj_dialogue.pos_test, file_text_read_real(file) );
		file_text_readln(file);
		ds_queue_enqueue( obj_dialogue.sprite_test, file_text_read_real(file) );
		file_text_readln(file);
		ds_queue_enqueue( obj_dialogue.pos_test, file_text_read_real(file) );
		file_text_readln(file);
		ds_queue_enqueue( obj_dialogue.speaker_test, file_text_read_string(file) );
		file_text_readln(file);
		ds_queue_enqueue( obj_dialogue.text_test, file_text_read_string(file) );
		file_text_readln(file);
	}
	
	//close dialogue file
	file_text_close( file );
		
	//enter dialogue mode and set variables
	global.dialogue_mode = true;
	obj_dialogue.textspew = "";
	obj_dialogue.texttarget = "";
	obj_dialogue.textload = "";
	obj_dialogue.textlines = ["","","","","","",""];
	obj_dialogue.spewlength = 0;
	obj_dialogue.textlinecount = 0;
	obj_dialogue.textlinefadein = 0;
	obj_dialogue.text_advance_ready = TEXT_LOADING;
	obj_dialogue.text_auto_mode = AUTO_OFF;
	obj_dialogue.text_auto_timer = 60;
	obj_dialogue.speaker_name = "";
	obj_dialogue.bg_id = BG_NONE;
	obj_dialogue.bg_id_last = BG_NONE;
	obj_dialogue.bg_sprite = -1;
	obj_dialogue.mus_id = MUS_NONE;
	obj_dialogue.mus_id_last = MUS_NONE;
	obj_dialogue.mus_playing = -1;
	obj_dialogue.sound_id = SOUND_NONE;
	obj_dialogue.sound_playing = -1;
	obj_dialogue.display_mode = DISPLAY_NOTEXT;
	obj_dialogue.actor_A_sprite_id = TALK_NOSPRITE;
	obj_dialogue.actor_A_sprite_id_last = TALK_NOSPRITE;
	obj_dialogue.actor_A_sprite = -1;
	obj_dialogue.actor_A_anim_frame = 0;
	obj_dialogue.actor_A_pos = POSITION_LEFT;
	obj_dialogue.actor_B_sprite_id = TALK_NOSPRITE;
	obj_dialogue.actor_B_sprite_id_last = TALK_NOSPRITE;
	obj_dialogue.actor_B_sprite = -1;
	obj_dialogue.actor_B_anim_frame = 0;
	obj_dialogue.actor_B_pos = POSITION_LEFT;
	obj_dialogue.actor_C_sprite_id = TALK_NOSPRITE;
	obj_dialogue.actor_C_sprite_id_last = TALK_NOSPRITE;
	obj_dialogue.actor_C_sprite = -1;
	obj_dialogue.actor_C_anim_frame = 0;
	obj_dialogue.actor_C_pos = POSITION_LEFT;
}