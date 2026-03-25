draw_self();

if(flash > 0){
	flash--;
	shader_set(sha_white);
	draw_self();
	shader_reset();
}


// Draw Event or Draw GUI Event
//draw_set_font(fnt_pixelFont15);
//draw_set_halign(fa_center);
//draw_set_valign(fa_middle);
//draw_text(x, y-150, production);

