/// @description Go through every unit in a team and set their booleans
//					that keep track of attacking and moving to false

/// @param team

var t = argument0;

for (var i = 0; i < ds_list_size(t); i++) {
	var tUnit = ds_list_find_value(t, i); 
	tUnit.hasAttacked = false;
	tUnit.hasMoved    = false;
}


// This gets called in our NextTeam() and PreviousTeam() Scripts