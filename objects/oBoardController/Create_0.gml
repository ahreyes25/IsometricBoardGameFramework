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


// Set board to random ground and terrain
for (var u = 0; u < oGameController.boardWidth; u++)  {
	for (var v = 0; v < oGameController.boardHeight; v++) {		
		ds_grid_set(oGameController.board, u, v, RandomGround());
		
		// If grass or dirt there, then possibly add terrain 
		if (SpecificGround(u, v, ground.grass) || SpecificGround(u, v, ground.dirt)) {
			if (Chance(30)) { // 30% chance to add a decoration piece
				ds_grid_set(oGameController.board, u, v, ds_grid_get(oGameController.board, u, v) + RandomTerrain());
			}
		}
	}
}

// Create objects in the environment to represent terrain
for (var u = 0; u < oGameController.boardWidth; u++)  {
	for (var v = 0; v < oGameController.boardHeight; v++) {	
		
		// if board value is storing a terrain
		if (IsTerrain(u, v)) {
			var worldCoords = GridToWorld(u, v);
			
			// create actual terrain objects
			if (SpecificTerrain(u, v, terrain.buildings)) {
				instance_create_layer(worldCoords[0], worldCoords[1], "World", oBuildings);
			}
			else if (SpecificTerrain(u, v, terrain.trees)) {
				instance_create_layer(worldCoords[0], worldCoords[1], "World", oTrees);
			}
			else if (SpecificTerrain(u, v, terrain.mountain)) {
				instance_create_layer(worldCoords[0], worldCoords[1], "World", oMountain);
			}
		}
	}
}