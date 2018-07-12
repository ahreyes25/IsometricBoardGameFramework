/// @description	This script just looks at what our current player is, and the looks at the player before
//					it, and the player after it. These player all exist in our team lists.
//					These team lists are dynamic and can change in size at any point.

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Set Next Player In Line

// If we are not the last player in our team list, then the next player is simply the next player in line
if ((oGameController.turnController.currentPlayerIndex + 1) < ds_list_size(oGameController.turnController.currentTeamTurn)) {
	oGameController.turnController.nextPlayerTurn = ds_list_find_value(oGameController.turnController.currentTeamTurn, oGameController.turnController.currentPlayerIndex + 1);
}
// If we are the last player in our team list, then the next player is the first player in the next team 
else {
	oGameController.turnController.nextPlayerTurn = ds_list_find_value(oGameController.turnController.nextTeamTurn, 0);
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Set Previous Player In Line

// If we are not the first player in our team list, then the previous player is simply the previous player in line
if ((oGameController.turnController.currentPlayerIndex - 1) > 0) {
	oGameController.turnController.previousPlayerTurn = ds_list_find_value(oGameController.turnController.currentTeamTurn, oGameController.turnController.currentPlayerIndex - 1);
}
// If we are the first player in our team list, then the previous player is the last player in the previous team 
else {
	oGameController.turnController.previousPlayerTurn = ds_list_find_value(oGameController.turnController.previousTeamTurn, ds_list_size(oGameController.turnController.previousTeamTurn) - 1);
}