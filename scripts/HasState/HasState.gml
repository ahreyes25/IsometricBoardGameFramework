/// @param i
/// @param j

var i = argument0;
var j = argument1;

if (ds_grid_get(oGameController.board, i, j) >= 1000) {
	if (floor(ds_grid_get(oGameController.board, i, j) / 1000) mod 10 != 0)
		return true;
	else
		return false;
}
else
	return false;