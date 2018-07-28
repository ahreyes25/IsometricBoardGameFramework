/// @description	Check the index at the given uv position on the board to see
//					if there is any ground piece there.
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

/// @param u
/// @param v

var u = argument0;
var v = argument1;

if (ds_grid_get(oGameController.board, u, v) mod 10 == ground.grass ||
	ds_grid_get(oGameController.board, u, v) mod 10 == ground.dirt  ||
	ds_grid_get(oGameController.board, u, v) mod 10 == ground.water) {
		return true;
	}
else {
	return false;
}