// Create game board
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
boardWidth  = 10;
boardHeight = 10;
board = ds_grid_create(boardWidth, boardHeight);

// Clear board to 0's
for (var u = 0; u < boardWidth; u++)  {
	for (var v = 0; v < boardHeight; v++) {
		// set to one
		ds_grid_set(board, u, v, 1);
	}
}

// Unit size
tileWidth  = 64; // tile width
tileHeight = 32; // tile height

debugging  = false;

// Controllers
boardController = instance_create_layer(0, 0, "Controllers", oBoardController);
turnController  = instance_create_layer(0, 0, "Controllers", oTurnController);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Create white team
for (var i = 0; i < 2; i++) {
	var gi = irandom_range(0, 9);
	var gj = irandom_range(0, 9);
	
	// Reroll until we get a valid spot
	while (IsTerrain(gi, gj) || SpecificGround(gi, gj, ground.water) || IsUnit(gi, gj)) {
		var gi = irandom_range(0, 9);
		var gj = irandom_range(0, 9);
	}
	
	// Get world coordinates
	var worldCoords = GridToWorld(gi, gj);
	
	// Create unit at point
	var u = instance_create_layer(worldCoords[0], worldCoords[1], "World", oUnitParent);
	u.sprite_index = sPlayer1Idle;
	u.state = unitState.waiting;
	u.team = oGameController.turnController.whiteTeam;
	u.unitType = unit.white;
	
	// Add unit to team
	ds_list_add(turnController.whiteTeam, u);
	
	// Add unit value to board info
	ds_grid_set(board, gi, gj, ds_grid_get(board, gi, gj) + u.unitType);
	ds_grid_set(board, gi, gj, ds_grid_get(board, gi, gj) + u.state);
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Create black team
for (var i = 0; i < 2; i++) {
	var gi = irandom_range(0, 9);
	var gj = irandom_range(0, 9);
	
	// Reroll until we get a valid spot
	while (IsTerrain(gi, gj) || SpecificGround(gi, gj, ground.water) || IsUnit(gi, gj)) {
		var gi = irandom_range(0, 9);
		var gj = irandom_range(0, 9);
	}
	
	// Get world coordinates
	var worldCoords = GridToWorld(gi, gj);
	
	// Create unit at point
	var u = instance_create_layer(worldCoords[0], worldCoords[1], "World", oUnitParent);
	u.sprite_index = sPlayer2Idle;
	u.state = unitState.waiting;
	u.team  = oGameController.turnController.blackTeam;
	u.unitType = unit.black;
	
	// Add unit to team
	ds_list_add(turnController.blackTeam, u);
	
	// Add unit value to board info
	ds_grid_set(board, gi, gj, ds_grid_get(board, gi, gj) + u.unitType);
	ds_grid_set(board, gi, gj, ds_grid_get(board, gi, gj) + u.state);
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Set starting team and starting player
turnController.currentTeamTurn = ds_list_find_value(turnController.teams, turnController.currentTeamIndex);
turnController.currentPlayerTurn = ds_list_find_value(turnController.currentTeamTurn, 0);
UpdateTeamOrder();

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Create camera
camera = instance_create_layer(0, 0, "Controllers", oCamera);