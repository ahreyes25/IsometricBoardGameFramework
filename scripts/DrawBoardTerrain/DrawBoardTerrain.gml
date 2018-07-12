for (var i = 0; i < oGameController.boardController.boardWidth; i++)  {
	for (var j = 0; j < oGameController.boardController.boardHeight; j++) {
		var gridCoords = GridToWorld(i, j);
		
		// Draw Dirt
		if (ds_grid_get(oGameController.boardController.board, i, j) == 1) {
			draw_sprite(sDirtTile, 0, gridCoords[0], gridCoords[1]);
		}
		// Draw Water
		else if (ds_grid_get(oGameController.boardController.board, i, j) == 2) {
			image_speed = 0.03;
			draw_sprite(sWaterTile, image_index, gridCoords[0], gridCoords[1]);
		}
	}
}