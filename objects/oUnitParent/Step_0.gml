depth = -y;

var unitGridCoords = WorldToGrid(x, y);
currentBoardX  = unitGridCoords[0];
currentBoardY  = unitGridCoords[1];

/*
Input();
if (mouseLeftPressed) {
	var mouseGridCoords = WorldToGrid(mouse_x, mouse_y);
	
	// Mouse Clicked On Ourselves
	if (mouseGridCoords[0] == currentBoardX &&
		mouseGridCoords[1] == currentBoardY) {
				
	}
}
*/