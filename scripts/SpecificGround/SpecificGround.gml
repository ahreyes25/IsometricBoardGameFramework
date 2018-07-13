/// @param i
/// @param j
/// @groundPiece

var i = argument0;
var j = argument1;
var p = argument2;

return (ds_grid_get(oGameController.board, i, j) mod 10 == p);