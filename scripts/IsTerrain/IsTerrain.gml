/// @param i
/// @param j

var i = argument0;
var j = argument1;

if (floor(ds_grid_get(oGameController.board, i, j) / 10) mod 10 == terrain.buildings / 10 ||
	floor(ds_grid_get(oGameController.board, i, j) / 10) mod 10 == terrain.trees	 / 10 ||
	floor(ds_grid_get(oGameController.board, i, j) / 10) mod 10 == terrain.mountain  / 10) {
		return true;
	}
else
	return false;