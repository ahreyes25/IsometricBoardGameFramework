// Create game board
boardWidth  = 10;
boardHeight = 10;
board = ds_grid_create(boardWidth, boardHeight);

// Clear board to 0's
for (var i = 0; i < boardWidth; i++)  {
	for (var j = 0; j < boardHeight; j++) {
		ds_grid_set(board, i, j, 0);	
	}
}

// Unit size
unitWidth  = 64;
unitHeight = 32;

// Board management variables
currentBoardX = noone;
currentBoardY = noone;