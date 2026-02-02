draw_set_alpha(1-timer/100);


draw_self();
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_font(fnt_pixelFont);
draw_text_transformed(x, y-10, value, 0.4, 0.4, image_angle);


//reset alpha
draw_set_alpha(1);