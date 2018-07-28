/// @description Check's a current unit to see if it is on the same team as the active team
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

/// @param Unit

var tUnit = argument0;

return (tUnit.team == oGameController.turnController.currentTeamTurn);