function draw_text_ext_transformed_color_border(_x, _y, _string, _sep, _w, _xscale, _yscale, _angle, _c1, _c2, _c3, _c4, _alpha, _border_width, _border_color) {
	draw_text_ext_transformed_color(_x - _border_width, _y - _border_width, _string, _sep, _w, _xscale, _yscale, _angle, _border_color, _border_color, _border_color, _border_color, _alpha);
	draw_text_ext_transformed_color(_x - _border_width, _y + _border_width, _string, _sep, _w, _xscale, _yscale, _angle, _border_color, _border_color, _border_color, _border_color, _alpha);
	draw_text_ext_transformed_color(_x + _border_width, _y - _border_width, _string, _sep, _w, _xscale, _yscale, _angle, _border_color, _border_color, _border_color, _border_color, _alpha);
	draw_text_ext_transformed_color(_x + _border_width, _y + _border_width, _string, _sep, _w, _xscale, _yscale, _angle, _border_color, _border_color, _border_color, _border_color, _alpha);
	draw_text_ext_transformed_color(_x, _y, _string, _sep, _w, _xscale, _yscale, _angle, _c1, _c2, _c3, _c4, _alpha);
	return;
}