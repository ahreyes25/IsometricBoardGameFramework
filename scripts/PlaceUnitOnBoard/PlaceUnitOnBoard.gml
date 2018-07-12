Input();

var b  = oGameController.boardController.board;
var bx = oGameController.boardController.currentBoardX;
var by = oGameController.boardController.currentBoardY;

if (mouseLeftPressed) {
	if (ds_grid_get(b, bx, by) < 20) {
		ds_grid_set(b, bx, by, ds_grid_get(b, bx, by) + 20);
	
		var worldCoords = GridToWorld(bx, by);
		var u = instance_create_layer(worldCoords[0], worldCoords[1], "Units", oUnitParent);
	
		// Modify unit variables here
		u.sprite_index = sBlueUnit;
	}
}