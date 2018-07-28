/// @descriptuon Using range values, draw a "circle" like pattern to visualize a unit's range
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

var gu		= argument0;	// grid u
var gv		= argument1;	// grid v
var range	= argument2;	// range amount

var type	= argument3;	// type to distinguish draw color
							// i.e. attack is red, move is blue
							
var tu;						// temp u
var tv;						// temp v			

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Set draw color
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
if (type == "movement") {
	var col = c_blue;
}
else if (type == "attack") {
	var col = c_red;	
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Draw Everything Except the middle line
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
for (var i = -range; i <= range; i++) {						// stretch to the left and right of the player by the range amount
	
	tu = gu + i;											// temp u index is grid u index plus current loop iteration i
	
	for (var j = range - abs(i); j > 0; j--) {				// stretch up and down by a staggered amount depending on the amount of range remaining
		
		tv = gv - j;										// temp v index is grid v index minus current loop iteration j
		if (IndexInBounds(tu, tv)) {						// make sure current temp index is within the bounds of our board
			if (type == "movement") {						// draw movement range blue
				if (!HasUnit(tu, tv)) {						// dont draw movement tiles under other units, since we cannot move onto other units
					var worldCoords = GridToWorld(tu, tv);	// get world position of our board position at (tu, tv)
					draw_sprite_ext(sCursor, 0, 
									worldCoords[0], 
									worldCoords[1], 
									1, 1, 0, col, 0.5);
				}
			}
			else if (type == "attack") {					// draw attack range red
				var worldCoords = GridToWorld(tu, tv);		// get world position of our board position at (tu, tv)
				draw_sprite_ext(sCursor, 0, 
								worldCoords[0], 
								worldCoords[1], 
								1, 1, 0, col, 0.5);
			}
		}
		
		tv = gv + j;										// temp v index is grid v index plus current loop iteration j
		if (IndexInBounds(tu, tv)) {						// make sure current temp index is within the bounds of our board
			if (type == "movement") {						// draw movement range blue
				if (!HasUnit(tu, tv)) {						// dont draw movement tiles under other units, since we cannot move onto other units
					var worldCoords = GridToWorld(tu, tv);	// get world position of our board position at (tu, tv)
					draw_sprite_ext(sCursor, 0, 
									worldCoords[0], 
									worldCoords[1], 
									1, 1, 0, col, 0.5);
				}
			}
			else if (type == "attack") {					// draw attack range red
				var worldCoords = GridToWorld(tu, tv);		// get world position of our board position at (tu, tv)
				draw_sprite_ext(sCursor, 0, 
								worldCoords[0], 
								worldCoords[1], 
								1, 1, 0, col, 0.5);
			}
		}
	}
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Draw middle line (comment this out to see what happens),
// we do this to prevent overlapping sprites being drawn on top
// of each other.
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
for (var i = -range; i <= range; i++) {
	tu = gu + i;
	tv = gv;
	
	if (IndexInBounds(tu, tv)) {							// make sure current temp index is within the bounds of our board
		if (type == "movement") {							// draw movement range blue
			if (!HasUnit(tu, tv)) {							// dont draw movement tiles under other units, since we cannot move onto other units
				var worldCoords = GridToWorld(tu, tv);		// get world position of our board position at (tu, tv)
				draw_sprite_ext(sCursor, 0,			
								worldCoords[0], 
								worldCoords[1], 
								1, 1, 0, col, 0.5);
			}
		}
		else if (type == "attack") {						// draw attack range red
			var worldCoords = GridToWorld(tu, tv);			// get world position of our board position at (tu, tv)
			draw_sprite_ext(sCursor, 0, 
							worldCoords[0], 
							worldCoords[1], 
							1, 1, 0, col, 0.5);
		}
	}
}