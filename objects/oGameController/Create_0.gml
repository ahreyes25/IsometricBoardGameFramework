// Create game board
boardWidth  = 10;
boardHeight = 10;
board = ds_grid_create(boardWidth, boardHeight);

// Clear board to 0's
for (var i = 0; i < boardWidth; i++)  {
	for (var j = 0; j < boardHeight; j++) {
		// set to one
		ds_grid_set(board, i, j, 1);
	}
}

// Unit size
unitWidth  = 64;
unitHeight = 32;

debugging  = false;

// Controllers
boardController = instance_create_layer(0, 0, "Controllers", oBoardController);
turnController  = instance_create_layer(0, 0, "Controllers", oTurnController);

// Create white team
for (var i = 0; i < 2; i++) {
	var gi = irandom_range(0, 9);
	var gj = irandom_range(0, 9);
	
	// Reroll until we get a valid spot
	while (IsTerrain(gi, gj) || SpecificGround(gi, gj, ground.water) || IsUnit(gi, gj)) {
		var gi = irandom_range(0, 9);
		var gj = irandom_range(0, 9);
	}
	
	var worldCoords = GridToWorld(gi, gj);
	var u = instance_create_layer(worldCoords[0], worldCoords[1], "World", oUnitParent);
	u.sprite_index = sPlayer1Idle;
	u.state = unitState.waiting;
	u.team = unit.white;
	ds_list_add(turnController.whiteTeam, u);
	ds_grid_set(board, gi, gj, ds_grid_get(board, gi, gj) + u.team);
	ds_grid_set(board, gi, gj, ds_grid_get(board, gi, gj) + u.state);
}

// Create black team
for (var i = 0; i < 2; i++) {
	var gi = irandom_range(0, 9);
	var gj = irandom_range(0, 9);
	
	// Reroll until we get a valid spot
	while (IsTerrain(gi, gj) || SpecificGround(gi, gj, ground.water) || IsUnit(gi, gj)) {
		var gi = irandom_range(0, 9);
		var gj = irandom_range(0, 9);
	}
	
	var worldCoords = GridToWorld(gi, gj);
	var u = instance_create_layer(worldCoords[0], worldCoords[1], "World", oUnitParent);
	u.sprite_index = sPlayer2Idle;
	u.state = unitState.waiting;
	u.team = unit.black;
	ds_list_add(turnController.blackTeam, u);
	ds_grid_set(board, gi, gj, ds_grid_get(board, gi, gj) + u.team);
	ds_grid_set(board, gi, gj, ds_grid_get(board, gi, gj) + u.state);
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Set starting team to the first team in the list
turnController.currentTeamTurn = ds_list_find_value(turnController.teams, turnController.currentTeamIndex);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Set Starting Player
turnController.currentPlayerTurn = ds_list_find_value(turnController.currentTeamTurn, turnController.currentPlayerIndex);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Get Order Info
UpdateTeamOrder();
UpdatePlayerOrder();

// Create camera
camera = instance_create_layer(0, 0, "Controllers", oCamera);