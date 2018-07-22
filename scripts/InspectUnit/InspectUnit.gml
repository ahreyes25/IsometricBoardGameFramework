/// @description	Show An Enemy Unit's Movement Range By Left  Clicking On Them
//					Show An Enemy Unit's Attack   Range By Right Clicking On Them

// Show Enemy Movement Range
if (mouse_check_button_pressed(mb_left)) {
	
	HideAllOtherRanges();
	
	// Inspect Unit
	var gridCoords = WorldToGrid(mouse_x, mouse_y);
	
	// make sure there is a unit at that location
	if (IsUnit(gridCoords[0], gridCoords[1])) {
		
		var tUnit = GetUnitAtPosition(gridCoords[0], gridCoords[1]);
	
		// make sure GetUnitAtPosition() didnt return null
		if (tUnit != noone) {
			// check that unit is on opposite team
			if (!UnitOnCurrentTeam(tUnit)) {
				tUnit.showMovementRange = true;
				tUnit.showAttackRange   = false;
			}
		}
	}
}

// Show Enemy Attack Range
if (mouse_check_button_pressed(mb_right)) {
	
	HideAllOtherRanges();
	
	// Inspect Unit
	var gridCoords = WorldToGrid(mouse_x, mouse_y);
	
	// make sure there is a unit at that location
	if (IsUnit(gridCoords[0], gridCoords[1])) {
		var tUnit = GetUnitAtPosition(gridCoords[0], gridCoords[1]);
		
		// make sure GetUnitAtPosition() didnt return null
		if (tUnit != noone) {
			// check that unit is on opposite team
			if (!UnitOnCurrentTeam(tUnit)) {
				tUnit.showMovementRange = false;
				tUnit.showAttackRange   = true;
			}
		}
	}
}