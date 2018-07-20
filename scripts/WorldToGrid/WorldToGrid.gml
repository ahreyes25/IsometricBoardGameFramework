/// @description Convert World Space to Grid Space
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

var wx = argument0;
var wy = argument1;
var uw = oGameController.unitWidth;
var uh = oGameController.unitHeight;

var gx = floor((wy / uh) + (wx / uw) - 8);
var gy = floor((1 - ((wx / uw) - (wy / uh))) + 1);

// We clamp the value to 0 - 9 because the board only has spaces from 0 - 9
// Return array of two points
return [clamp(gx, 0, 9), clamp(gy, 0, 9)];