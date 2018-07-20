/// @description	Whenever a player does anything, we want to add to the board its current value to its current
//					board psotion so that the board is able to keep track of the states associated to the player
//					at that position.
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

// If we already have a state stored in our current position
if (HasState(oGameController.turnController.currentPlayerTurn.currentBoardU, oGameController.turnController.currentPlayerTurn.currentBoardV)) {
	// Erase all state values stored in current position
	while (ds_grid_get(oGameController.board, oGameController.turnController.currentPlayerTurn.currentBoardU, oGameController.turnController.currentPlayerTurn.currentBoardV) > 1000) {
		ds_grid_set(oGameController.board, oGameController.turnController.currentPlayerTurn.currentBoardU, oGameController.turnController.currentPlayerTurn.currentBoardV, ds_grid_get(oGameController.board, oGameController.turnController.currentPlayerTurn.currentBoardU, oGameController.turnController.currentPlayerTurn.currentBoardV) - 1000);
	}
	// And then update new state in current position
	ds_grid_set(oGameController.board, oGameController.turnController.currentPlayerTurn.currentBoardU, oGameController.turnController.currentPlayerTurn.currentBoardV, ds_grid_get(oGameController.board, oGameController.turnController.currentPlayerTurn.currentBoardU, oGameController.turnController.currentPlayerTurn.currentBoardV) + oGameController.turnController.currentPlayerTurn.state);
}
// If we dont have any state stored  in our current position
else {
	// Update new state in current position
	ds_grid_set(oGameController.board, oGameController.turnController.currentPlayerTurn.currentBoardU, oGameController.turnController.currentPlayerTurn.currentBoardV, ds_grid_get(oGameController.board, oGameController.turnController.currentPlayerTurn.currentBoardU, oGameController.turnController.currentPlayerTurn.currentBoardV) + oGameController.turnController.currentPlayerTurn.state);
}
	
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// If we moved from old spot and it still holds a state value
if (oGameController.turnController.currentPlayerTurn.startBoardU != noone && oGameController.turnController.currentPlayerTurn.startBoardV != noone) {
	if (HasState(oGameController.turnController.currentPlayerTurn.startBoardU, oGameController.turnController.currentPlayerTurn.startBoardV)) {
		// Erase all state values in old spot
		while (ds_grid_get(oGameController.board, oGameController.turnController.currentPlayerTurn.startBoardU, oGameController.turnController.currentPlayerTurn.startBoardV) > 1000) {
			ds_grid_set(oGameController.board, oGameController.turnController.currentPlayerTurn.startBoardU, oGameController.turnController.currentPlayerTurn.startBoardV, ds_grid_get(oGameController.board, oGameController.turnController.currentPlayerTurn.startBoardU, oGameController.turnController.currentPlayerTurn.startBoardV) - 1000);
		}
	}
}