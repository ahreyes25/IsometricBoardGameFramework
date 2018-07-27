/// @description If Unit Is Clicked On And They Can Be Selected, Then Make That The Current Turn

if (mouse_check_button_pressed(mb_left)) {
	var gridCoords = WorldToGrid(mouse_x, mouse_y);
	
	// make sure there is a unit at that location
	if (IsUnit(gridCoords[0], gridCoords[1])) {
		
		// Check to make sure unit is in its idle or waiting state
		if (oGameController.turnController.currentPlayerTurn.state == unitState.idle || oGameController.turnController.currentPlayerTurn.state == unitState.waiting) {
			var tUnit = GetUnitAtPosition(gridCoords[0], gridCoords[1]);
		
			// make sure GetUnitAtPosition() didnt return null
			if (tUnit != noone) {
			
				// If Unit is on the team of the current team
				if (UnitOnCurrentTeam(tUnit)) {
		
					// If unit hasnt moved and hasnt attacked
					if (!tUnit.hasAttacked && !tUnit.hasMoved) {
						oGameController.turnController.currentPlayerTurn = tUnit;
						tUnit.state = unitState.idle;
						UpdateTeamOrder();
					}
				}
			}
		}
	}
}