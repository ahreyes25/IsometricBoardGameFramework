/// @param i
/// @param j

var i = argument0;
var j = argument1;

if (ds_grid_get(oGameController.board, i, j) mod 10 == ground.grass ||
	ds_grid_get(oGameController.board, i, j) mod 10 == ground.dirt  ||
	ds_grid_get(oGameController.board, i, j) mod 10 == ground.water) {
		return true;
	}
else
	return false;