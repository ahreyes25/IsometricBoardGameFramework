/// @descriptuon Using range values, draw a "circle" like pattern to visualize a unit's range
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

var gu		= argument0;	// grid u
var gv		= argument1;	// grid v
var range	= argument2;	// range amount
var type	= argument3;	// type to distinguish draw color
var tu;						// temp u
var tv;						// temp v
var worldCoords;			

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Set draw color
if (type == "movement") {
	var col = c_blue;
}
else if (type == "attack") {
	var col = c_red;	
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// draw circle range around unit
for (var u = -range; u <= range; u++) {
	tu = gu + u; // temp u index is grid u index plus current loop iteration u
	
	for (var v = range - abs(u); v > 0; v--) {
		// draw range circle to the left
		tv = gv - v;									// temp v index is grid v index minus current loop iteration v
		
		// make sure current temp index is within the bounds of our board
		if (IndexInBounds(tu, tv)) {
			if (type == "movement") {					// draw movement range blue
				if (!IsUnit(tu, tv)) {					// dont draw movemenet options on other units, since we cannot move on other units
					worldCoords = GridToWorld(tu, tv);	// get world position of out board position at (tu, tv)
					draw_sprite_ext(sCursor, 0, worldCoords[0], worldCoords[1], 1, 1, 0, col, 0.5);
				}
			}
			else if (type == "attack") {				// draw attack range red
				worldCoords = GridToWorld(tu, tv);		// get world position of out board position at (tu, tv)
				draw_sprite_ext(sCursor, 0, worldCoords[0], worldCoords[1], 1, 1, 0, col, 0.5);
			}
		}
		
		// draw range circle to the right
		tv = gv + v;									// temp v index is grid v index plus current loop iteration v
		
		// make sure current temp index is within the bounds of our board
		if (IndexInBounds(tu, tv)) {
			if (type == "movement") {					// draw movement range blue
				if (!IsUnit(tu, tv)) {					// dont draw movemenet options on other units, since we cannot move on other units
					worldCoords = GridToWorld(tu, tv);	// get world position of out board position at (tu, tv)
					draw_sprite_ext(sCursor, 0, worldCoords[0], worldCoords[1], 1, 1, 0, col, 0.5);
				}
			}
			else if (type == "attack") {				// draw attack range red
				worldCoords = GridToWorld(tu, tv);		// get world position of out board position at (tu, tv)
				draw_sprite_ext(sCursor, 0, worldCoords[0], worldCoords[1], 1, 1, 0, col, 0.5);
			}
		}
	}
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// draw middle line
for (var u = -range; u <= range; u++) {
	tu = gu + u;
	tv = gv;
	
	// make sure current temp index is within the bounds of our board
	if (IndexInBounds(tu, tv)) {
		if (type == "movement") {						// draw movement range blue
			if (!IsUnit(tu, tv)) {						// dont draw movemenet options on other units, since we cannot move on other units
				worldCoords = GridToWorld(tu, tv);		// get world position of out board position at (tu, tv)
				draw_sprite_ext(sCursor, 0, worldCoords[0], worldCoords[1], 1, 1, 0, col, 0.5);
			}
		}
		else if (type == "attack") {					// draw attack range red
			worldCoords = GridToWorld(tu, tv);			// get world position of out board position at (tu, tv)
			draw_sprite_ext(sCursor, 0, worldCoords[0], worldCoords[1], 1, 1, 0, col, 0.5);
		}
	}
}