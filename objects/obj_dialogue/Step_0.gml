tutorial_fadeout--;
actor_A_anim_frame += TALK_ANIM_SPEED;
actor_B_anim_frame += TALK_ANIM_SPEED;
actor_C_anim_frame += TALK_ANIM_SPEED;


if (global.dialogue_mode) {

	if ( keyboard_check_pressed(ord("C")) ) {
		if (text_auto_mode == AUTO_ON) {
			text_auto_mode = AUTO_OFF;
		} else {
			text_auto_mode = AUTO_ON;
		}
	}
		

	if (text_advance_ready ==  TEXT_LOADING //&& all ds_queues contain a value
							&& !ds_queue_empty(bg_test)
							&& !ds_queue_empty(mus_test) 
							&& !ds_queue_empty(sound_test)
							&& !ds_queue_empty(display_test)
							&& !ds_queue_empty(sprite_test)
							&& !ds_queue_empty(pos_test)
							&& !ds_queue_empty(speaker_test)
							&& !ds_queue_empty(text_test)
		) {
		text_advance_ready = TEXT_TYPING;
		
		//bg files
		bg_id_last = bg_id;
		bg_id = ds_queue_dequeue(bg_test);
		switch ( bg_id ) {
			case BG_NONE: {
				bg_sprite = -1;
				break;
			}
			case BG_TEST: {
				bg_sprite = spr_bg_PLACEHOLDER;
				break;
			}
			case BG_KOMEIJI_LIBRARY: {
				bg_sprite = spr_bg_PLACEHOLDER;
				break;
			}
			case BG_KOMEIJI_OUTSIDE: {
				bg_sprite = spr_bg_PLACEHOLDER;
				break;
			}
			case BG_JOB_AGENCY: {
				bg_sprite = spr_bg_PLACEHOLDER;
				break;
			}
			case BG_OFFICE_PLAIN: {
				bg_sprite = spr_bg_PLACEHOLDER;
				break;
			}
			case BG_OFFICE_DECOR: {
				bg_sprite = spr_bg_PLACEHOLDER;
				break;
			}
			case BG_OFFICE_WAITING: {
				bg_sprite = spr_bg_PLACEHOLDER;
				break;
			}
			case BG_MISTY_LAKE: {
				bg_sprite = spr_bg_PLACEHOLDER;
				break;
			}
			case BG_BAMBOO_FOREST: {
				bg_sprite = spr_bg_PLACEHOLDER;
				break;
			}
			case BG_MORIYA_SHRINE: {
				bg_sprite = spr_bg_PLACEHOLDER;
				break;
			}
			case BG_HUMAN_VILLAGE: {
				bg_sprite = spr_bg_PLACEHOLDER;
				break;
			}

			default: {
				bg_sprite = -1;
				break;
			}
		}
		
		//music files
		mus_id_last = mus_id;
		mus_id = ds_queue_dequeue(mus_test);
		if ( mus_id_last != mus_id ) {
			if ( audio_is_playing(mus_playing) ) {
				audio_stop_sound(mus_playing);
			}
			switch ( mus_id ) {
				case MUS_NONE: {
					mus_playing = -1;
					break;
				}
				case MUS_TEST: {
					mus_playing = mus_PLACEHOLDER;
					break;
				}
				default: {
					mus_playing = -1;
					break;
				}
			}
			if ( audio_exists(mus_playing) ) {
				audio_play_sound( mus_playing, 0, true );
			}
		}
		
		
		//sound effects
		sound_id = ds_queue_dequeue(sound_test);
		switch ( sound_id ) {
			case SOUND_NONE: {
				sound_playing = -1;
				break;
			}
			case SOUND_TEST: {
				sound_playing = snd_PLACEHOLDER;
				break;
			}
			default: {
				sound_playing = -1;
				break;
			}
		}
		if ( audio_exists(sound_playing) ) {
			audio_play_sound( sound_playing, 1, false );
		}
		
		//display modes
		display_mode = ds_queue_dequeue(display_test);
		if ( display_mode == DISPLAY_NOTEXT && text_auto_mode == AUTO_OFF ) {
			text_auto_mode = AUTO_NEXT;
		}
		
		
		//portrait sprites
		actor_A_pos = ds_queue_dequeue(pos_test);
		actor_A_sprite_id_last = actor_A_sprite_id;
		actor_A_sprite_id = ds_queue_dequeue(sprite_test);
		if ( actor_A_sprite_id_last != actor_A_sprite_id ) {
			actor_A_anim_frame = 0;
		}
		switch (actor_A_sprite_id) {
			case TALK_NOSPRITE: {
				actor_A_sprite = -1;
				break;
			}
			case TALK_TEST: {
				actor_A_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_KOISHI: {
				actor_A_sprite = spr_talk_koishi;
				break;
			}
			case TALK_SATORI: {
				actor_A_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_SAKUYA: {
				actor_A_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_CIRNO: {
				actor_A_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_DAIYOUSEI: {
				actor_A_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_KAGUYA: {
				actor_A_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_MOKOU: {
				actor_A_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_RIN: {
				actor_A_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_UTSUHO: {
				actor_A_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_KANOKO: {
				actor_A_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_SUWAKO: {
				actor_A_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_SANAE: {
				actor_A_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			
			default: {
				actor_A_sprite = -1;
				break;
			}
		}
		
		actor_B_pos = ds_queue_dequeue(pos_test);
		actor_B_sprite_id_last = actor_B_sprite_id;
		actor_B_sprite_id = ds_queue_dequeue(sprite_test);
		if ( actor_B_sprite_id_last != actor_B_sprite_id) {
			actor_B_anim_frame = 0;
		}
		switch (actor_B_sprite_id) {
			case TALK_NOSPRITE: {
				actor_B_sprite = -1;
				break;
			}
			case TALK_TEST: {
				actor_B_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_KOISHI: {
				actor_B_sprite = spr_talk_koishi;
				break;
			}
			case TALK_SATORI: {
				actor_B_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_SAKUYA: {
				actor_B_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_CIRNO: {
				actor_B_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_DAIYOUSEI: {
				actor_B_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_KAGUYA: {
				actor_B_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_MOKOU: {
				actor_B_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_RIN: {
				actor_B_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_UTSUHO: {
				actor_B_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_KANOKO: {
				actor_B_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_SUWAKO: {
				actor_B_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_SANAE: {
				actor_B_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			
			default: {
				actor_B_sprite = -1;
				break;
			}
		}
		
		actor_C_pos = ds_queue_dequeue(pos_test);
		actor_C_sprite_id_last = actor_C_sprite_id;
		actor_C_sprite_id = ds_queue_dequeue(sprite_test);
		if ( actor_C_sprite_id_last != actor_C_sprite_id ) {
			actor_C_anim_frame = 0;
		}
		switch (actor_C_sprite_id) {
			case TALK_NOSPRITE: {
				actor_C_sprite = -1;
				break;
			}
			case TALK_TEST: {
				actor_C_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_KOISHI: {
				actor_C_sprite = spr_talk_koishi;
				break;
			}
			case TALK_SATORI: {
				actor_C_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_SAKUYA: {
				actor_C_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_CIRNO: {
				actor_C_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_DAIYOUSEI: {
				actor_C_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_KAGUYA: {
				actor_C_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_MOKOU: {
				actor_C_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_RIN: {
				actor_C_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_UTSUHO: {
				actor_C_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_KANOKO: {
				actor_C_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_SUWAKO: {
				actor_C_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			case TALK_SANAE: {
				actor_C_sprite = spr_talk_PLACEHOLDER;
				break;
			}
			
			default: {
				actor_C_sprite = -1;
				break;
			}
		}
		
		//speaker name
		speaker_name = ds_queue_dequeue(speaker_test);
		
		//spoken text
		textload = ds_queue_dequeue(text_test);
		texttarget = string_replace_all(textload, "#", "\n" );
		
		textspew = "";
		textlines = [ "", "", "", "", "", "", "" ];
		textlinecount = 1;
		spewlength = 1;
	} 
	
	if (text_advance_ready == TEXT_TYPING ) {
		if ( display_mode == DISPLAY_NOTEXT ) {
			text_advance_ready = TEXT_READY;
		}
		
		if ( display_mode == DISPLAY_NARRATOR ) {
			for( var i = 1; i <= string_length(texttarget); i++ ) {
				textlines[textlinecount] += string_char_at(texttarget, spewlength);
				if (string_char_at(texttarget, spewlength) == "\n") {
					textlinecount++;
				}
				spewlength++;
			}
			textlinefadein++;
			if (keyboard_check_pressed(ord("Z")) || keyboard_check(vk_control) || text_loader_skip > 0) {
				textlinefadein = 1000;
				keyboard_clear(ord("Z"));
				keyboard_clear(vk_control);
			}
			if ( textlinefadein >= 60 + (90 * textlinecount) ) {
				text_advance_ready = TEXT_READY;
			}	
		}
		
		if ( display_mode == DISPLAY_ADV ) {
			textspew += string_char_at(texttarget, spewlength);
			audio_play_sound( snd_typewriter, 0, false );
			spewlength++;
			if (keyboard_check_pressed(ord("Z")) || keyboard_check(vk_control) || text_loader_skip > 0) {
				textspew = texttarget;
				keyboard_clear(ord("Z"));
				keyboard_clear(vk_control);
			}
			if (textspew == texttarget) {
				text_advance_ready = TEXT_READY;
			}
		}
	}
	
	if (text_advance_ready == TEXT_READY) {
		text_auto_timer--;
		if ( keyboard_check_pressed(ord("Z")) || keyboard_check(vk_control) || text_loader_skip > 0 || (text_auto_timer <= 0 && (text_auto_mode == AUTO_NEXT || text_auto_mode == AUTO_ON)) ) {
			if (text_auto_mode == AUTO_NEXT ) {
				text_auto_mode = AUTO_OFF;
			}
			if (text_loader_skip > 0) {
				text_loader_skip--;
			} else {
				global.loaded_file[? SAVE_LINENUM]++;
			}
			text_auto_timer = AUTO_SPEED;
			textlinefadein = 0;
			text_advance_ready = TEXT_LOADING;
			if ( ds_queue_empty(bg_test)
				&& ds_queue_empty(mus_test) 
				&& ds_queue_empty(sound_test)
				&& ds_queue_empty(display_test)
				&& ds_queue_empty(sprite_test)
				&& ds_queue_empty(pos_test)
				&& ds_queue_empty(speaker_test)
				&& ds_queue_empty(text_test)
				) {
				global.dialogue_mode = false;
			}
		}
	}
	
}




































