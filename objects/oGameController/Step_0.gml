// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Change between character by clicking on them

if (mouse_check_button_pressed(mb_left)) {
	// Check to make sure unit is in its idle or waiting state
	if (turnController.currentPlayerTurn.state == unitState.idle || turnController.currentPlayerTurn.state == unitState.waiting) {
		var gridCoords = WorldToGrid(mouse_x, mouse_y);

		// double check we have a unit at that point
		if (IsUnit(gridCoords[0], gridCoords[1])) { // If there is a unit at that clicked space on the board
			
			// unit is on white team
			if (SpecificUnit(gridCoords[0], gridCoords[1], unit.white)) {
				
				// Loop through white team units to find the one sitting at that space 
				for (var i = 0; i < ds_list_size(turnController.whiteTeam); i++) {
					var tUnit = ds_list_find_value(turnController.whiteTeam, i);
					
					// If unit on white team is at the point we clicked on 
					if (tUnit.currentBoardU == gridCoords[0] && tUnit.currentBoardV == gridCoords[1]) {
						
						// If unit hasnt moved and hasnt attacked
						if (!tUnit.hasAttacked && !tUnit.hasMoved) {
							turnController.currentPlayerTurn = tUnit;
							turnController.currentTeamTurn	 = turnController.whiteTeam;
							tUnit.state = unitState.idle;
							UpdateTeamOrder();
							break;
						}
					}
				}
			}
	
			// unit is on black team
			else if (SpecificUnit(gridCoords[0], gridCoords[1], unit.black)) { // unit is on black team
				
				// Loop through white team units to find the one sitting at that space 
				for (var i = 0; i < ds_list_size(turnController.blackTeam); i++) {
					var tUnit = ds_list_find_value(turnController.blackTeam, i);
					
					// If unit on black team is at the point we clicked on
					if (tUnit.currentBoardU == gridCoords[0] && tUnit.currentBoardV == gridCoords[1]) {
						
						// If unit hasnt moved and hasnt attacked
						if (!tUnit.hasAttacked && !tUnit.hasMoved) {
							turnController.currentPlayerTurn = tUnit;
							turnController.currentTeamTurn	 = turnController.blackTeam;
							tUnit.state = unitState.idle;
							UpdateTeamOrder();
							break;
						}
					}
				}
			}
		}
	}
}