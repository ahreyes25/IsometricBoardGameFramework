/// @description Draw ground tiles such as grass, dirt, water, etc.
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

// Search through every index in the board and look at its value,
// then check to see if there is ground data being stored there.
// If so, draw the appropriate ground sprites there.

for (var u = 0; u < oGameController.boardWidth; u++)  {
	for (var v = 0; v < oGameController.boardHeight; v++) {	
		
		if (HasGround(u, v)) {									// Check if we have ANY ground data
																// stored at this index on the board
			var worldCoords = GridToWorld(u, v);				// get the grid position in world
																// space so we can draw the tile at
																// the appropriate world space.
																// This is converting u,v -> x,y
			
			// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
			// NOTE: HasGround(u,v) and HasSpecificGround(u,v,groundType)
			// both return boolean variables. So this script will tell us true 
			// or false, if there is corresponding data stored at that index.
			// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
			
			
			if (HasSpecificGround(u, v, ground.grass)) {		// If there is grass data stored, 
																// then draw a grass tile at that location
				draw_sprite(sGrassTile, 0, 
							worldCoords[0], worldCoords[1]);
			}
			
			else if (HasSpecificGround(u, v, ground.dirt)) {	// If there is dirt data stored, 
																// then draw a dirt tile at that location
				draw_sprite(sDirtTile, 0, 
							worldCoords[0], worldCoords[1]);
			}
				
			else if (HasSpecificGround(u, v, ground.water)) {	// If there is water data stored, 
																// then draw a water tile at that location
				image_speed = 0.04;								// water tiles are animated
				draw_sprite(sWaterTile, image_index, 
							worldCoords[0], worldCoords[1]);
			}
		}
	}	
}