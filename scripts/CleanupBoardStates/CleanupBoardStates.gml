/// @description	Check for board spaces that are holding a state but dont have a unit
//					And clear them of their value
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// Search through every space on the board and check to see if two things are met 1:
// there is a state value stored there, and 2: there is not a unit there. There should never 
// be a situation where a space on the board holds state data but not player data, since the
// state data is connected to the unit specifically.

for (var u = 0; u < oGameController.boardWidth; u++) {						// iterate through board
	for (var v = 0; v < oGameController.boardHeight; v++) {
		if (HasState(u, v)) {												// if there is state data
			if (!HasUnit(u, v)) {											// if there is no unit data
				
				while(ds_grid_get(oGameController.board, u, v) > 1000) {
					ds_grid_set(oGameController.board, u, v,			
						ds_grid_get(oGameController.board, u, v) - 1000);	// while there exists state data
																			// continuously subtract 1000 from it
																			// until we have no state data, but 
																			// preserve all the other data in that
																			// index.
				}
			}
		}
	}
}