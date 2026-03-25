draw_sprite_stretched(spr_gold, 0, display_get_gui_width()/2 - 220, 10,  200, 200)

draw_set_color(c_white);

draw_set_font(fnt_pixelFont23);
draw_set_halign(fa_left);
//draw_set_valign(fa_top);
//draw_text(display_get_gui_width()/2 - 40, 70, global.Money);
draw_text_transformed(display_get_gui_width()/2 - 60, 70, global.Money, 2, 2, 0);