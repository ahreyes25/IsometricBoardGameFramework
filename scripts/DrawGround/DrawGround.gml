/// @description Draw ground tiles such as grass, dirt, water, etc.
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

for (var u = 0; u < oGameController.boardWidth; u++)  {
	for (var v = 0; v < oGameController.boardHeight; v++) {	
		
		// Check if we have ground at this position on the board
		if (IsGround(u, v)) {
			var worldCoords = GridToWorld(u, v);
			
			// If it is dirt, draw dirt
			if (SpecificGround(u, v, ground.dirt)) {
				draw_sprite(sDirtTile, 0, worldCoords[0], worldCoords[1]);
			}
				
			// If it water, draw water w/specific image_speed
			image_speed = 0.04;
			if (SpecificGround(u, v, ground.water)) {
				draw_sprite(sWaterTile, image_index, worldCoords[0], worldCoords[1]);
			}
		}
	}	
}