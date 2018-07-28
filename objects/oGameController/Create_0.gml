boardWidth  = 10;
boardHeight = 10;
tileWidth   = 64;
tileHeight  = 32;
debugging   = false;
board		= ds_grid_create(boardWidth, boardHeight);

// Set the board to 1 by default, which represents a grass tile
for (var u = 0; u < boardWidth; u++)  {
	for (var v = 0; v < boardHeight; v++) {
		ds_grid_set(board, u, v, 1);
	}
}

// Controllers
boardController = instance_create_layer(0, 0, "Controllers", oBoardController);
turnController  = instance_create_layer(0, 0, "Controllers", oTurnController);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Create white team
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
for (var i = 0; i < 2; i++) {
	var gi = irandom_range(0, 9);								// Pick a randon spot on the board
	var gj = irandom_range(0, 9);								// Pick a randon spot on the board
	
	while ( HasSpecificGround(gi, gj, ground.water) ||
			HasTerrain(gi, gj) ||						
			HasUnit(gi, gj)) {									// Reroll until we get a valid spot that is not
																// terrain, not water, and isn't occupied by another
																// unit already
				
				var gi = irandom_range(0, 9);					// Pick a randon spot on the board
				var gj = irandom_range(0, 9);					// Pick a randon spot on the board
	}
	
	var worldCoords = GridToWorld(gi, gj);						// Get world coordinates
	
	var u = instance_create_layer(worldCoords[0],				// Create unit at point
								  worldCoords[1], 
								  "World", oUnitParent);
								  
	u.sprite_index	= sPlayer1Idle;								// Set unit starting sprite
	u.state			= unitState.waiting;						// Set unit starting state
	u.team			= oGameController.turnController.whiteTeam; // Set unit team
	u.unitType		= unit.white;								// Set unit type
	
	ds_list_add(turnController.whiteTeam, u);					// Add unit to team list
	
	ds_grid_set(board, gi, gj,									// Add unit value to board info
		ds_grid_get(board, gi, gj) + u.unitType);
		
	ds_grid_set(board, gi, gj,									// Add unit value to board info
		ds_grid_get(board, gi, gj) + u.state);
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Create black team
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
for (var i = 0; i < 2; i++) {
	var gi = irandom_range(0, 9);								// Pick a randon spot on the board
	var gj = irandom_range(0, 9);								// Pick a randon spot on the board
	
	while ( HasTerrain(gi, gj) || 
			HasSpecificGround(gi, gj, ground.water) || 
			HasUnit(gi, gj)) {									// Reroll until we get a valid spot that is not
																// terrain, not water, and isn't occupied by another
																// unit already
																
				var gi = irandom_range(0, 9);					// Pick a randon spot on the board
				var gj = irandom_range(0, 9);					// Pick a randon spot on the board
	}
	
	var worldCoords = GridToWorld(gi, gj);						// Get world coordinates

	var u = instance_create_layer(worldCoords[0],				// Create unit at point
								  worldCoords[1], 
								  "World", oUnitParent);
								  
	u.sprite_index	= sPlayer2Idle;								// Set unit starting sprite
	u.state			= unitState.waiting;						// Set unit starting state
	u.team			= oGameController.turnController.blackTeam; // Set unit team
	u.unitType		= unit.black;								// Set unit type
	
	ds_list_add(turnController.blackTeam, u);					// Add unit to team lit
	
	ds_grid_set(board, gi, gj,									// Add unit value to board info
		ds_grid_get(board, gi, gj) + u.unitType);
		
	ds_grid_set(board, gi, gj,									// Add unit value to board info
		ds_grid_get(board, gi, gj) + u.state);
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Set starting team and starting player
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
turnController.currentTeamTurn = ds_list_find_value(turnController.teams, turnController.currentTeamIndex);
turnController.currentPlayerTurn = ds_list_find_value(turnController.currentTeamTurn, 0);
UpdateTeamOrder();

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Create camera
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
camera = instance_create_layer(0, 0, "Controllers", oCamera);