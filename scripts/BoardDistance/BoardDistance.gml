/// @description	Given two points on the board, return their manhattan distance.
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

/// @param u1
/// @param v1
/// @param u2
/// @param v2

var u1 = argument0;
var v1 = argument1;
var u2 = argument2;
var v2 = argument3;

var du = abs(u1 - u2);
var dv = abs(v1 - v2);

return (du + dv);