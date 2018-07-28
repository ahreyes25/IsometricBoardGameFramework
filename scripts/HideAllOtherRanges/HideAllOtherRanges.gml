/// @description	Turn off everyone else except the current player's showMovement and showAttack.
//					You could modify this script to turn of the current players ranges as well, or set
//					it to read a parameter that decides if it should turn of the current player's or not.
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// Iterate through all of the teams, and all of the units in their teams and turn off their range values.
// This script call can get expensive if there are a ton of units in the current scene, so make sure to 
// only use this when necessary.

for (var i = 0; i < ds_list_size(oGameController.turnController.teams); i++) {		// iterate through all the teams
	var currentTeam = ds_list_find_value(oGameController.turnController.teams, i);	// get the current team 
	
	for (var j = 0; j < ds_list_size(currentTeam); j++) {							// iterate through all the units in the
																					// the current team
																					
		var tUnit = ds_list_find_value(currentTeam, j);								// get the current unit
		
		if (tUnit != oGameController.turnController.currentPlayerTurn) {			// check to see if that unit is not the
																					// current active unit
			tUnit.showMovementRange = false;
			tUnit.showAttackRange   = false;
		}
	}
}