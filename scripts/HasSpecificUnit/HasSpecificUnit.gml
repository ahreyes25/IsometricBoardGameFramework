/// @description Check the index at the given uv position on the board for a specific unit.
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

/// @param u
/// @param v
/// @param decoration

var u	= argument0;
var v	= argument1;
var uni	= argument2;

var boardValue = floor(ds_grid_get(oGameController.board, u, v) / 100) mod 10;
var unitValue  = uni / 100;

// Return boolean
return (boardValue == unitValue)