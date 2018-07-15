/// @description	This script immediately skips to the next team, skipping past all of the other
//					players in line. It skips to the next team, and sets the current player to the 
//					first player in that list.

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Next Team

oGameController.turnController.currentPlayerTurn.state  = unitState.waiting;

// If the current team is not the last team in the team manager list, then move onto the next team
if (oGameController.turnController.currentTeamIndex < ds_list_size(oGameController.turnController.teams) - 1) {
	oGameController.turnController.currentTeamIndex++;
}
// If the current team is the last team in the team manager list, then move onto the first team 
else {
	oGameController.turnController.currentTeamIndex = 0;
}
// Set the current player to be the first player in that list
oGameController.turnController.currentPlayerIndex = 0;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Update current team and current player
oGameController.turnController.currentTeamTurn		= ds_list_find_value(oGameController.turnController.teams, oGameController.turnController.currentTeamIndex);
oGameController.turnController.currentPlayerTurn	= ds_list_find_value(oGameController.turnController.currentTeamTurn, oGameController.turnController.currentPlayerIndex);

oGameController.turnController.currentPlayerTurn.state  = unitState.selectingMovement;

// Update all of our other variables before moving on...
UpdateTeamOrder();
UpdatePlayerOrder();