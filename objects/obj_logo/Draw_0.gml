draw_sprite_ext( spr_logo, 0, 320, 180, 4, 4, 0, c_white, min(0.1 * alpha_cycle, 0.1));

draw_set_halign( fa_center );
draw_set_font( fn_logo_large );
draw_text_color( 320, 30,		"The following is a Touhou Project fan-game\n" 
							+	"Touhou Project belongs to Team Shanghai Alice."
						, c_lime, c_green, c_lime, c_green, alpha_cycle);
				
				
draw_set_font( fn_logo_small );
draw_set_halign( fa_center );
draw_text_color( 320, 230,	"POST-JAM BUILD\n"
						+	"Originally created for Touhou Pride Jam 5\n"
						+	"1 June 2023 ~ 14 June 2023", c_lime, c_green, c_lime, c_green, alpha_cycle);

draw_set_halign( fa_right );
draw_text_color( 630, 260,		"\n\n\n\n"
							+	"Created by magicalfeyfenny\n"
							+	"https://fenny.space\n"
							, c_lime, c_lime, c_green, c_green, alpha_cycle);

draw_set_halign( fa_left );
draw_text_color( 10, 260,		"\n\n\n\n"
							+	"Team Shanghai Alice:\n"
							+	"https://touhou-project.news\n"
						, c_lime, c_lime, c_green, c_green, alpha_cycle);





