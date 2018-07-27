/// @description Check the index at the given uv position on the board for a specific unit.
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

/// @param u
/// @param v
/// @param decoration

var u	= argument0;
var v	= argument1;
var uni	= argument2;

// Return boolean
return (floor(ds_grid_get(oGameController.board, u, v) / 10) mod 10 == uni / 100)