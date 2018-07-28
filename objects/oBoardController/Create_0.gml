#region // Ground Enums
enum ground {
	grass = 1,
	dirt  = 2,
	water = 3,
}
#endregion

#region // Terrain Enums
enum terrain {
	buildings = 10,
	trees	  = 20,
	mountain  = 30,
}
#endregion

#region // Unit Enums
enum unit {
	white = 100,
	black = 200,
}
#endregion

for (var u = 0; u < oGameController.boardWidth; u++)  {									// Iterate through board indexes
	for (var v = 0; v < oGameController.boardHeight; v++) {								// Iterate through board indexes
		
		ds_grid_set(oGameController.board, u, v, RandomGround());						// Set board to random ground and terrain
		
		if (HasSpecificGround(u, v, ground.grass) ||									// If grass or dirt there, then possibly add terrain 
			HasSpecificGround(u, v, ground.dirt)) {
				
				if (Chance(30)) {														// 30% chance to add a decoration piece
					
					ds_grid_set(oGameController.board, u, v,							// Set board to hold random terrain data
						ds_grid_get(oGameController.board, u, v) + RandomTerrain());
						
						
					var worldCoords = GridToWorld(u, v);								// get world coordinates of current board index iteration
					
					if (HasSpecificTerrain(u, v, terrain.buildings)) {					// create building object
						instance_create_layer(
							worldCoords[0], worldCoords[1], "World", oBuildings);
					}
					else if (HasSpecificTerrain(u, v, terrain.trees)) {					// create trees object
						instance_create_layer(
							worldCoords[0], worldCoords[1], "World", oTrees);
					}
					else if (HasSpecificTerrain(u, v, terrain.mountain)) {				// create mountain object
						instance_create_layer(
							worldCoords[0], worldCoords[1], "World", oMountain);
					}
				}
		}
	}
}