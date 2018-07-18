// If we already have a state stored in our current position
if (HasState(currentBoardX, currentBoardY)) {
	// Erase all state values stored in current position
	while (ds_grid_get(oGameController.board, currentBoardX, currentBoardY) > 1000) {
		ds_grid_set(oGameController.board, currentBoardX, currentBoardY, ds_grid_get(oGameController.board, currentBoardX, currentBoardY) - 1000);
	}
	// And then update new state in current position
	ds_grid_set(oGameController.board, currentBoardX, currentBoardY, ds_grid_get(oGameController.board, currentBoardX, currentBoardY) + state);
}
// If we dont have any state stored  in our current position
else {
	// Update new state in current position
	ds_grid_set(oGameController.board, currentBoardX, currentBoardY, ds_grid_get(oGameController.board, currentBoardX, currentBoardY) + state);
}
	
// If we moved from old spot and it still holds a state value
if (HasState(startBoardX, startBoardY)) {
	// Erase all state values in old spot
	while (ds_grid_get(oGameController.board, startBoardX, startBoardY) > 1000) {
		ds_grid_set(oGameController.board, startBoardX, startBoardY, ds_grid_get(oGameController.board, startBoardX, startBoardY) - 1000);
	}
}