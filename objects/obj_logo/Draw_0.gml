draw_sprite_ext( spr_logo, 0, 320, 180, 4, 4, 0, c_white, min(0.1 * alpha_cycle, 0.1));

draw_set_halign( fa_center );
draw_set_font( fn_logo_large );
draw_text_color( 320, 30,		"The following is a work of fiction.\n" 
							+	"All entities depicted are figments of a dream."
						, c_lime, c_green, c_lime, c_green, alpha_cycle);
				
				
draw_set_font( fn_logo_small );
draw_set_halign( fa_center );
draw_text_color( 320, 230,	"DEVELOPMENT BUILD", c_lime, c_green, c_lime, c_green, alpha_cycle);

draw_set_halign( fa_right );
draw_text_color( 630, 260,		"\n\n\n\n\n"
							+	"https://fenny.space\n"
							, c_lime, c_lime, c_green, c_green, alpha_cycle);

draw_set_halign( fa_left );
draw_text_color( 10, 260,		"\n\n\n\n\n"
							+	"studio_tiny_leaf 2022-20XX\n"
						, c_lime, c_lime, c_green, c_green, alpha_cycle);





