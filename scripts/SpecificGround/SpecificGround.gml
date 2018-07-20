/// @description Check the index at the given uv position on the board for a specific ground piece.
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

/// @param u
/// @param v
/// @param ground

var u = argument0;
var v = argument1;
var p = argument2;

// Return boolean
return (ds_grid_get(oGameController.board, u, v) mod 10 == p);