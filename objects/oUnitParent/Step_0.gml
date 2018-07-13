depth = -y;

var unitGridCoords = WorldToGrid(x, y);
currentBoardX  = unitGridCoords[0];
currentBoardY  = unitGridCoords[1];

// Currently player turn
if (oGameController.turnController.currentPlayerTurn.id == id) {
	active = true;	
}
else {
	active = false;	
}