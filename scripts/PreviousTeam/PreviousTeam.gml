/// @description	This script immediately skips to the previous team, skipping past all of the other
//					players in line. It skips to the previous team, and sets the current player to the 
//					first player in that list.

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Previous Team

// If the current team is not the first team in the team manager list, then move onto the previous team
if (oGameController.turnController.currentTeamIndex > 0) {
	oGameController.turnController.currentTeamIndex--;
}
// If the current team is the first team in the team manager list, then move onto the last team
else {
	oGameController.turnController.currentTeamIndex = ds_list_size(oGameController.turnController.teams) - 1;
}
// Set the current player to be the first player in that list
oGameController.turnController.currentPlayerIndex = 0;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Update current team and current player
oGameController.turnController.currentTeamTurn		= ds_list_find_value(oGameController.turnController.teams, oGameController.turnController.currentTeamIndex);
oGameController.turnController.currentPlayerTurn	= ds_list_find_value(oGameController.turnController.currentTeamTurn, oGameController.turnController.currentPlayerIndex);

// Update all of our other variables before moving on...
UpdateTeamOrder();
UpdatePlayerOrder();