if (!oGameController.debugging) {
	if (active)
		draw_self();
	else
		draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, c_gray, 1);
}
else {
	draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, c_white, 0.25);
	draw_text_transformed_color(x, y - 16, state, 1, 1, 0, c_red, c_red, c_red, c_red, 1);
}

if (oGameController.turnController.currentPlayerTurn.id == id) {
	var targetCoords	= GridToWorld(moveToTargetX, moveToTargetY);
	var currentCoords	= GridToWorld(currentBoardX, currentBoardY);
	var dirVector		= point_direction(currentCoords[0], currentCoords[1], targetCoords[0], targetCoords[1]);
	var lenVector		= point_distance(targetCoords[0], targetCoords[1], currentCoords[0], currentCoords[1]);
	var moveVector		= [lengthdir_x(lenVector, dirVector), lengthdir_y(lenVector, dirVector)];
	var normVector		= [moveVector[0] / lenVector, moveVector[1] / lenVector];

	draw_line_color(x, y, x + moveVector[0], y, c_red, c_red);
	draw_line_color(x, y, x, y + moveVector[1], c_blue, c_blue);
	draw_line_color(currentCoords[0], currentCoords[1], targetCoords[0], targetCoords[1], c_green, c_green);
}