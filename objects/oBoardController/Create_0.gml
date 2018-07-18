enum ground {
	grass = 1,
	dirt  = 2,
	water = 3,
}

enum terrain {
	buildings = 10,
	trees	  = 20,
	mountain  = 30,
}

enum unit {
	white = 100,
	black = 200,
}

// Board management variables
currentBoardX = noone;
currentBoardY = noone;

// Create random terrain and decoration on top

// Set board to random terrain and decoration
for (var i = 0; i < oGameController.boardWidth; i++)  {
	for (var j = 0; j < oGameController.boardHeight; j++) {		
		// add terrain on top of that
		ds_grid_set(oGameController.board, i, j, RandomGround());
		
		// add decoration on top of that if it is a grass or dirt piece
		if (SpecificGround(i, j, ground.grass) || SpecificGround(i, j, ground.dirt)) {
			if (Chance(30)) { // 30% chance to add a decoration piece
				ds_grid_set(oGameController.board, i, j, ds_grid_get(oGameController.board, i, j) + RandomTerrain());
			}
		}
	}
}

// Create objects in the environment
for (var i = 0; i < oGameController.boardWidth; i++)  {
	for (var j = 0; j < oGameController.boardHeight; j++) {	
		if (IsTerrain(i, j)) {
			var worldCoords = GridToWorld(i, j);
			if (SpecificTerrain(i, j, terrain.buildings))
				instance_create_layer(worldCoords[0], worldCoords[1], "World", oBuildings);
			else if (SpecificTerrain(i, j, terrain.trees))
				instance_create_layer(worldCoords[0], worldCoords[1], "World", oTrees);
			else if (SpecificTerrain(i, j, terrain.mountain))
				instance_create_layer(worldCoords[0], worldCoords[1], "World", oMountain);
		}
	}
}