/// @description	Show An Enemy Unit's Movement Range By Left  Clicking On Them
//					Show An Enemy Unit's Attack   Range By Right Clicking On Them
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

var tUnit = noone;

// We do not want to be able to inspect a unit when we are selecting an attack target.
// Since selecting an attack target requires left clicking on a unit, and inspecting
// the movement range of a unit requires left clicking on a unit, these two actions
// can conflict. Instead, we check to make sure that we are not currently in the 
// selectingAttackTarget state before proceeding. If you change the inputs to different
// buttons for these two actions then you could remove this conditional check.
if (oGameController.turnController.currentPlayerTurn.state != unitState.selectingAttackTarget) {
	
	if (mouse_check_button_pressed(mb_left)) {							// check for mouse left clicked
		
		HideAllOtherRanges();											// If any other ranges are visible, we want to
																		// turn them all off so that we dont have a ton
																		// of ranges being drawn all at once. This essentially
																		// makes it so that only one range is visible at a
																		// time. This script can be used in other scenarios
																		// as well.
		
		var gridCoords = WorldToGrid(mouse_x, mouse_y);					// get grid u,v position based off of current mouse x,y
		
		if (HasUnit(gridCoords[0], gridCoords[1])) {					// make sure there is a unit at that location
			tUnit = GetUnitAtPosition(gridCoords[0], gridCoords[1]);	// get that unit and store it in tUnit var
			
			if (tUnit != noone) {										// make sure GetUnitAtPosition() didnt return null
				
				if (!UnitOnCurrentTeam(tUnit)) {						// check that the unit is on opposite team. Technically
																		// you could remove this check if you wanted to be able 
																		// to inspect your own teammates.
					tUnit.showMovementRange = true;
					tUnit.showAttackRange   = false;
				}
			}
		}
	}

	else if (mouse_check_button_pressed(mb_right)) {					// check for mouse right clicked
		
		HideAllOtherRanges();											// If any other ranges are visible, we want to
																		// turn them all off so that we dont have a ton
																		// of ranges being drawn all at once. This essentially
																		// makes it so that only one range is visible at a
																		// time. This script can be used in other scenarios
																		// as well.
		
		var gridCoords = WorldToGrid(mouse_x, mouse_y);					// get grid u,v position based off of current mouse x,y
	
		if (HasUnit(gridCoords[0], gridCoords[1])) {					// make sure there is a unit at that location
			tUnit = GetUnitAtPosition(gridCoords[0], gridCoords[1]);	// get that unit and store it in tUnit var
		
			if (tUnit != noone) {										// make sure GetUnitAtPosition() didnt return null
				
				if (!UnitOnCurrentTeam(tUnit)) {						// check that the unit is on opposite team. Technically
																		// you could remove this check if you wanted to be able 
																		// to inspect your own teammates.
					tUnit.showMovementRange = false;
					tUnit.showAttackRange   = true;
				}
			}
		}
	}
}