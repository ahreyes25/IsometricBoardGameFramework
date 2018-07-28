/// @desription		When we switch back to our team, we want to set all of the units to 
//					active, and we do this by resetting their flags, in this case, it is
//					simply hasAttacked and hasMoved that is check to see if the unit is 
//					active or deactivated
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

/// @param team

var team = argument0;

for (var i = 0; i < ds_list_size(team); i++) {
	var tUnit = ds_list_find_value(team, i);
	tUnit.hasAttacked = false;
	tUnit.hasMoved    = false;
}

// This gets called in NextTeam and PreviousTeam scripts