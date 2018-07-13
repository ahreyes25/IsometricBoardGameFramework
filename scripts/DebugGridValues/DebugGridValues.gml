for (var i = 0; i < oGameController.boardWidth; i++) {
	for (var j = 0; j < oGameController.boardHeight; j++) {
		var worldCoords = GridToWorld(i, j);
		draw_text_transformed(worldCoords[0], worldCoords[1], ds_grid_get(oGameController.board, i, j), 0.5, 0.5, 0);
	}
}