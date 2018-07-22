/// @description Return the unit that exists at a specific locat
/// @param u
/// @param v

var u = argument0;
var v = argument1;

// double check we have a unit at that point
if (IsUnit(u, v)) {

	// unit is on white team
	if (SpecificUnit(u, v, unit.white)) {
				
		// Loop through white team units to find the one sitting at that space 
		for (var i = 0; i < ds_list_size(oGameController.turnController.whiteTeam); i++) {
			var tUnit = ds_list_find_value(oGameController.turnController.whiteTeam, i);
					
			// If unit on white team is at the point we clicked on 
			if (tUnit.currentBoardU == u && tUnit.currentBoardV == v) {
				return tUnit;
				break;
			}
		}
	}
	
	// unit is on black team
	else if (SpecificUnit(u, v, unit.black)) {
		
		// Loop through white team units to find the one sitting at that space 
		for (var i = 0; i < ds_list_size(oGameController.turnController.blackTeam); i++) {
			var tUnit = ds_list_find_value(oGameController.turnController.blackTeam, i);
					
			// If unit on black team is at the point we clicked on
			if (tUnit.currentBoardU == u && tUnit.currentBoardV == v) {
				return tUnit;
				break;
			}
		}
	}
}