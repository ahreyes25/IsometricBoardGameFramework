// Convert Grid Space to World Space
var gx = argument0;
var gy = argument1;
var uw = oGameController.boardController.unitWidth;
var uh = oGameController.boardController.unitHeight;

var wx = (((-gy * uw) + (8 * uw) + (gx * uw)) / 2) + 64;
var wy = (((wx * uh) / uw) + (gy * uh)) - 48;

return [wx, wy];