/// @description Draw text values to visualize what is stored in each space of the board
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

for (var u = 0; u < oGameController.boardWidth; u++) {
	for (var v = 0; v < oGameController.boardHeight; v++) {
		var worldCoords = GridToWorld(u, v);
		draw_text_transformed(worldCoords[0], worldCoords[1], ds_grid_get(oGameController.board, u, v), 0.5, 0.5, 0);
	}
}