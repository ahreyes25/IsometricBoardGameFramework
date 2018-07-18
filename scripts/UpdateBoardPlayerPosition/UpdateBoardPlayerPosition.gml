// Update new position by adding player to it
ds_grid_set(oGameController.board, moveToTargetX, moveToTargetY, ds_grid_get(oGameController.board, moveToTargetX, moveToTargetY) + team);

// Update old position by removing player from it
ds_grid_set(oGameController.board, startBoardX, startBoardY, ds_grid_get(oGameController.board, startBoardX, startBoardY) - team);