/// @param i
/// @param j
/// @decoration

var i = argument0;
var j = argument1;
var u = argument2;

return (floor(ds_grid_get(oGameController.board, i, j) / 100) mod 10 == u / 100)