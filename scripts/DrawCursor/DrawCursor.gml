/// @description Draw white cursor on the board that follows the mouse
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

var worldCoords = WorldToGrid(mouse_x, mouse_y);
var gridCoords  = GridToWorld(worldCoords[0], worldCoords[1]);

// Draw Cursor sprite with slight transparency
draw_sprite_ext(sCursor, 0, gridCoords[0], gridCoords[1], 1, 1, 0, c_white, 0.5);