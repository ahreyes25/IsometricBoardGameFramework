// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Create Team Manager
teams		= ds_list_create();

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Create Teams
redTeam		= ds_list_create();
blueTeam	= ds_list_create();

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Add Teams to Team Manager, the order that these teams get added are
// important as they will define the startng order for when you iterated
// to next and previous teams. You can randomize this with ds_list_shuffle(teams);
ds_list_add(teams, redTeam);
ds_list_add(teams, blueTeam);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Create Players and Add Them to the Correct Team, this script should
// be deleted and replaced with your own code.

/*
CreatePlayers();

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Tracking Turns
currentTeamTurn			= noone;
nextTeamTurn			= noone;
previousTeamTurn		= noone;
currentTeamIndex		= 0;

currentPlayerTurn		= noone;
nextPlayerTurn			= noone;
previousPlayerTurn		= noone;
currentPlayerIndex		= 0;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Set starting team to the first team in the list
currentTeamTurn = ds_list_find_value(teams, currentTeamIndex);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Set Starting Player
currentPlayerTurn = ds_list_find_value(currentTeamTurn, currentPlayerIndex);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Get Order Info
UpdateTeamOrder();
UpdatePlayerOrder();
*/