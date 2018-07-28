/// @description Return the unit that exists at a specific location
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/// @param u
/// @param v

var u = argument0;
var v = argument1;

var tUnit = noone;

// We want to be able to get a unit and manipulate it regardless of where it exists. So
// we create a script that allows us to do that easily. This script takes in a board u
// and v position and returns the unit at that location if it exists. Wecan then store that
// unit inside of a variable outside of this script, and manipulate it accordingly.
// You will see this a lot as we do the following:
// var tUnit = GetUnitAtPosition(u,v); 
// This gets the unit at that specific positon, and stores it in a variable called
// temporary unit, which we can then modify like "tUnit.state = unitState.idle;"
// which sets that unit's state to the idle state.

if (HasUnit(u, v)) {																		// double check we have a unit at that point
	
	// Here is specifically check to see what team the unit exists on to reduce
	// iteration loops. theoretically i could loop through every team and every unit
	// in that team to check to see if it is the unit that we want, but that causes
	// this function to be more costly, by first checking the appropriate team,
	// and then searching through just that team for the matching unit, we are 
	// reducing unit calls. So if you add more teams, make sure to create more
	// conditional checks in this script because this will not naturally search
	// through every team. Only the teams we specify.
	
	if (HasSpecificUnit(u, v, unit.white)) {												// unit is on white team
		 
		for (var i = 0; i < ds_list_size(oGameController.turnController.whiteTeam); i++) {	// Loop through white team units to find the one
																							// sitting at that space
																							
			tUnit = ds_list_find_value(oGameController.turnController.whiteTeam, i);		// get the unit at that position and store in in tUnit
					
			if (tUnit.currentBoardU == u && tUnit.currentBoardV == v) {						// If unit on white team is at the point we clicked on the board
				return tUnit;																// return that unit
				break;																		// break from the loop
			}
		}
	}
	
	else if (HasSpecificUnit(u, v, unit.black)) {											// unit is on black team
		
		for (var i = 0; i < ds_list_size(oGameController.turnController.blackTeam); i++) {	// Loop through white team units to find the one
																							// sitting at that space 
																							
			tUnit = ds_list_find_value(oGameController.turnController.blackTeam, i);		// get the unit at that position and store in in tUnit
					
			if (tUnit.currentBoardU == u && tUnit.currentBoardV == v) {						// If unit on black team is at the point we clicked on
				return tUnit;																// return that unit
				break;																		// break from the loop
			}
		}
	}
}