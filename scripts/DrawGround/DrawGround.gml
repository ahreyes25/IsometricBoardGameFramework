for (var i = 0; i < oGameController.boardWidth; i++)  {
	for (var j = 0; j < oGameController.boardHeight; j++) {	
		if (IsGround(i, j)) {
			var worldCoords = GridToWorld(i, j);
			
			if (SpecificGround(i, j, ground.dirt))
				draw_sprite(sDirtTile, 0, worldCoords[0], worldCoords[1]);
				
			image_speed = 0.04;
			if (SpecificGround(i, j, ground.water))
				draw_sprite(sWaterTile, image_index, worldCoords[0], worldCoords[1]);
		}
	}	
}