/// @param i
/// @param j
/// @decoration

var i = argument0;
var j = argument1;
var d = argument2;

return (floor(ds_grid_get(oGameController.board, i, j) / 10) mod 10 == d / 10)