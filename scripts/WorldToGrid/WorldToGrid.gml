// Convert World Space to Grid Space
var wx = argument0;
var wy = argument1;
var uw = oGameController.boardController.unitWidth;
var uh = oGameController.boardController.unitHeight;

var gx = floor((wy / uh) + (wx / uw) - 8);
var gy = floor((1 - ((wx / uw) - (wy / uh))) + 1);

return [clamp(gx, 0, 9), clamp(gy, 0, 9)];