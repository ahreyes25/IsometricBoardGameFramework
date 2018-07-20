/// @description	Check the index at the given uv position on the board to see
//					if there is any terrain piece there.
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

/// @param u
/// @param v

var u = argument0;
var v = argument1;

if (floor(ds_grid_get(oGameController.board, u, v) / 10) mod 10 == terrain.buildings / 10 ||
	floor(ds_grid_get(oGameController.board, u, v) / 10) mod 10 == terrain.trees	 / 10 ||
	floor(ds_grid_get(oGameController.board, u, v) / 10) mod 10 == terrain.mountain  / 10) {
		return true;
	}
else {
	return false;
}