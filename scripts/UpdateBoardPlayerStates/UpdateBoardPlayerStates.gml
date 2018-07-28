/// @description	Whenever a player does anything, we want to add to the board its current value to its current
//					board psotion so that the board is able to keep track of the states associated to the player
//					at that position.
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

// Normally I like to create my scripts so that they avoid local variable referencing for instance
// variables, but these update board scripts cannot have this flexibility. These scripts can only be called
// from a oUnitParent object, otherwise you start having non active units effecting the board values and 
// this creates a lot of issues.

if (HasState(currentBoardU, currentBoardV)) {
	
	// Erase all state data stored in current position. I'll take a second to explain what's happening here:
	// In each board slot, it holds data. If the value of that data is > 1000 that means that there is player
	// state data stored there. We want to remove that data. We cannot simply subtract a fixed value from that
	// slot because we dont know what that number currently is, and it can change. So we just subtract 1000 from
	// it until it is less than 1000. This allows us to preserve our other data that is stored there while still
	// removing the state data from that slot. 
	while (ds_grid_get(oGameController.board, currentBoardU, currentBoardV) > 1000) {
		ds_grid_set(oGameController.board, currentBoardU, currentBoardV,
			ds_grid_get(oGameController.board, currentBoardU, currentBoardV) - 1000);
	}
	
	// And then update new state data in current position
	ds_grid_set(oGameController.board, currentBoardU, currentBoardV,
		ds_grid_get(oGameController.board, currentBoardU, currentBoardV) + state);
}

// If we dont have any state data stored in our current position
else {
	
	// Update new state data in current position
	ds_grid_set(oGameController.board, currentBoardU, currentBoardV,
		ds_grid_get(oGameController.board, currentBoardU, currentBoardV) + state);
}