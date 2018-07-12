/// @description	This script iterates onto the next player in line. We have to first check
//					to make sure that we have the next player in line setup, and we do that with
//					our script calls at the top of this script here. Then we move to the next player,
//					set current player to that object, and then update the previous and next in line again.

UpdateTeamOrder();
UpdatePlayerOrder();

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Next Player

// If we arent at the end of our list, then increment our index by 1
if (oGameController.turnController.currentPlayerIndex < ds_list_size(oGameController.turnController.currentTeamTurn) - 1) {
	oGameController.turnController.currentPlayerIndex++;
}
// If we are at the end of the list, set the index to 0 and move onto the next team in line
else {
	// Set current team to next team, set current player index to 0 which will just be the first
	// player object that is in the next team list.
	oGameController.turnController.currentTeamTurn			= oGameController.turnController.nextTeamTurn;
	oGameController.turnController.currentPlayerIndex	= 0;
	
	// We have now moved onto the next team, so we need to update our team index.
	// If we arent at the end of our teams list, then incrememnt our team index by 1
	if (oGameController.turnController.currentTeamIndex < ds_list_size(oGameController.turnController.teams) - 1) {
		oGameController.turnController.currentTeamIndex++;
	}
	// If we are at the end of the list, set the team index to 0
	else {
		oGameController.turnController.currentTeamIndex = 0;
	}
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Set Current Player, we need to update who the current player is
oGameController.turnController.currentPlayerTurn = ds_list_find_value(oGameController.turnController.currentTeamTurn, oGameController.turnController.currentPlayerIndex);

// Lastly, update all of our other turn variables before we move on...
UpdateTeamOrder();
UpdatePlayerOrder();