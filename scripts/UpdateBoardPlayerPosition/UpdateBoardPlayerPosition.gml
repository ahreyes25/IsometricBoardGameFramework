/// @description	Whenever a player moves, we want to add to the board its current value to its current
//					board psotion so that the board is able to keep track of what players are where.
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

// Update new position by adding player to it
ds_grid_set(oGameController.board, oGameController.turnController.currentPlayerTurn.moveToTargetU, oGameController.turnController.currentPlayerTurn.moveToTargetV,
			ds_grid_get(oGameController.board, oGameController.turnController.currentPlayerTurn.moveToTargetU, oGameController.turnController.currentPlayerTurn.moveToTargetV) + oGameController.turnController.currentPlayerTurn.team);

// Update old position by removing player from it
ds_grid_set(oGameController.board, oGameController.turnController.currentPlayerTurn.startBoardU, oGameController.turnController.currentPlayerTurn.startBoardV,
			ds_grid_get(oGameController.board, oGameController.turnController.currentPlayerTurn.startBoardU, oGameController.turnController.currentPlayerTurn.startBoardV) - oGameController.turnController.currentPlayerTurn.team);