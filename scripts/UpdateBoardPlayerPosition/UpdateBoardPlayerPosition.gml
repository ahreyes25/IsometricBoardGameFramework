/// @description	Whenever a player moves, we want to add to the board its current value to its current
//					board psotion so that the board is able to keep track of what players are where.
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

// Normally I like to create my scripts so that they avoid local variable referencing for instance
// variables, but these update board scripts cannot have this flexibility. These scripts can only be called
// from a oUnitParent object, otherwise you start having non active units effecting the board values and 
// this creates a lot of issues.

// Update new position by adding player data to the board
ds_grid_set(oGameController.board, moveToTargetU, moveToTargetV,
	ds_grid_get(oGameController.board, moveToTargetU, moveToTargetV) + unitType);

// Update old position by removing player data from the board
ds_grid_set(oGameController.board, startBoardU, startBoardV,
	ds_grid_get(oGameController.board, startBoardU, startBoardV) - unitType);