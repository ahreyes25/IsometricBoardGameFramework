/// @description Draw white cursor on the board that follows the mouse
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

// The cursor follows the mouse around constantly. Because of this, we need to get the 
// mouse's position and convert its x,y coordinates into u,v coordinates
var gridCoords = WorldToGrid(mouse_x, mouse_y);

// Once we have the grid coordinates for the mouse cursor, we want to then conver that
// back into world coordinates. Essentially, WorldToGrid above snaps our mouse to a specific
// board position so that the mouse cannot freely roam, it must exist on a board space.
// And now we want to get those snapped gridCoords and convert them back into world
// coordinates so that we can draw the cursor sprite at the location on our screen.
var worldCoords  = GridToWorld(gridCoords[0], gridCoords[1]);

// Draw Cursor sprite with slight transparency
draw_sprite_ext(sCursor, 0, worldCoords[0], worldCoords[1], 1, 1, 0, c_white, 0.5);