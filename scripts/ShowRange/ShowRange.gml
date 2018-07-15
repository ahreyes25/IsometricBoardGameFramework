var gi		= argument0;
var gj		= argument1;
var range	= argument2;
var col		= argument3;
var ti;
var tj;
var worldCoords;

// stretch out left and right
for (var i = -range; i <= range; i++) {
	ti = gi + i;
	
	// stretch up & down
	for (var j = range - abs(i); j > 0; j--) {
		tj = gj - j;
		
		if (ti < oGameController.boardWidth  && 
			tj < oGameController.boardHeight &&
			ti >= 0 && tj >= 0) {
				worldCoords = GridToWorld(ti, tj);
				draw_sprite_ext(sCursor, 0, worldCoords[0], worldCoords[1], 1, 1, 0, col, 0.5);
		}
		
		tj = gj + j;
		
		if (ti < oGameController.boardWidth  && 
			tj < oGameController.boardHeight &&
			ti >= 0 && tj >= 0) {
				worldCoords = GridToWorld(ti, tj);
				draw_sprite_ext(sCursor, 0, worldCoords[0], worldCoords[1], 1, 1, 0, col, 0.5);
		}
	}
}


// draw middle line
for (var i = -range; i <= range; i++) {
	ti = gi + i;
	tj = gj;
	
	if (ti < oGameController.boardWidth  && 
		tj < oGameController.boardHeight &&
		ti >= 0 && tj >= 0) {
			worldCoords = GridToWorld(ti, tj);
			draw_sprite_ext(sCursor, 0, worldCoords[0], worldCoords[1], 1, 1, 0, col, 0.5);
	}
}