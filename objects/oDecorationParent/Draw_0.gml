if (!oGameController.debugging) {
	draw_self();	
}
else {
	draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, c_white, 0.25);
}