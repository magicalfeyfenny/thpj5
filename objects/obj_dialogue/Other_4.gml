textspew = "";
texttarget = "";
textload = "";
textlines = ["","","","","","",""];
spewlength = 0;
textlinecount = 0;
textlinefadein = 0;
text_advance_ready = TEXT_LOADING;
text_auto_mode = AUTO_OFF;
text_auto_timer = AUTO_SPEED;
text_loader_skip = global.loaded_file[? SAVE_LINENUM];
speaker_name = "";

bg_id = BG_NONE;
bg_id_last = BG_NONE;
bg_sprite = -1;
mus_id = MUS_NONE;
mus_id_last = MUS_NONE;
mus_playing = -1;
sound_id = SOUND_NONE;
sound_playing = -1;
display_mode = DISPLAY_NOTEXT;
actor_A_sprite_id = TALK_NOSPRITE;
actor_A_sprite_id_last = TALK_NOSPRITE;
actor_A_sprite = -1;
actor_A_anim_frame = 0;
actor_A_pos = POSITION_LEFT;
actor_B_sprite_id = TALK_NOSPRITE;
actor_B_sprite_id_last = TALK_NOSPRITE;
actor_B_sprite = -1;
actor_B_anim_frame = 0;
actor_B_pos = POSITION_LEFT;
actor_C_sprite_id = TALK_NOSPRITE;
actor_C_sprite_id_last = TALK_NOSPRITE;
actor_C_sprite = -1;
actor_C_anim_frame = 0;
actor_C_pos = POSITION_LEFT;

global.log_text[LOG_LIMIT] = array_create(LOG_LIMIT);
global.log_names[LOG_LIMIT] = array_create(LOG_LIMIT);

bg_test = ds_queue_create();
mus_test = ds_queue_create();
sound_test = ds_queue_create();
display_test = ds_queue_create();
sprite_test = ds_queue_create();
pos_test = ds_queue_create();
speaker_test = ds_queue_create();
text_test = ds_queue_create();


loopdoop = 0;
tutorial_fadeout = 400;
narrator_alpha = 0;
