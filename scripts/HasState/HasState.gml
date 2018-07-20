/// @description	Check the index at the given uv position on the board to see
//					if there is a state value for the unit stored there.
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

/// @param u
/// @param v

var u = argument0;
var v = argument1;

if (ds_grid_get(oGameController.board, u, v) >= 1000) {
	if (floor(ds_grid_get(oGameController.board, u, v) / 1000) mod 10 != 0) {
		return true;
	}
	else {
		return false;
	}
}
else {
	return false;
}