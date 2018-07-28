/// @description If Unit Is Clicked On And They Can Be Selected, Then Make That The Current Turn
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

var tUnit = noone;

if (mouse_check_button_pressed(mb_left)) {													// Check that we clicked the mouse button
	
	var gridCoords = WorldToGrid(mouse_x, mouse_y);											// Find out where our mouse is on the board
																							// MouseX,MouseY -> GridU,GridV
	
	if (HasUnit(gridCoords[0], gridCoords[1])) {											// make sure there is a unit at that location
		if (oGameController.turnController.currentPlayerTurn.state == unitState.idle ||
			oGameController.turnController.currentPlayerTurn.state == unitState.waiting) {	// check to make sure current unit is in 
																							// an acceptable state to transfer control
																							// to it.
				
				tUnit = GetUnitAtPosition(gridCoords[0], gridCoords[1]);					// Get the unit at position that we clicked
				if (tUnit != noone) {														// make sure GetUnitAtPosition() didnt return null
					if (UnitOnCurrentTeam(tUnit)) {											// If Unit is on the team of the current team
						if (!tUnit.hasAttacked && !tUnit.hasMoved) {						// If unit hasnt moved and hasnt attacked
							oGameController.turnController.currentPlayerTurn = tUnit;		// Set the current player control to this unit
							tUnit.state = unitState.idle;									// Set its state 
							
							UpdateTeamOrder();												// Since the team order could have potentially changed
																							// at this point, we should call UpdateTeamOrder()
						}
					}
				}
		}
	}
}