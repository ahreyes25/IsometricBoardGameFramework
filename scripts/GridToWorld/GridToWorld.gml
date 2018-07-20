/// @description Convert Grid Space to World Space
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

var gx = argument0;
var gy = argument1;
var uw = oGameController.unitWidth;
var uh = oGameController.unitHeight;

var wx = (((-gy * uw) + (8 * uw) + (gx * uw)) / 2) + 64;
var wy = (((wx * uh) / uw) + (gy * uh)) - 48;

// Return array of two points
return [wx, wy];