/// @param i
/// @param j

var i = argument0;
var j = argument1;

if (floor(ds_grid_get(oGameController.board, i, j) / 100) mod 10 == 1 ||
	floor(ds_grid_get(oGameController.board, i, j) / 100) mod 10 == 2) {
		return true;
	}
else
	return false;