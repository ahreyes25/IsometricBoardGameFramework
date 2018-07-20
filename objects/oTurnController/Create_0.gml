// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Create Team Manager
teams		= ds_list_create();

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Create Teams
whiteTeam	= ds_list_create();
blackTeam	= ds_list_create();

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Add Teams to Team Manager, the order that these teams get added are
// important as they will define the startng order for when you iterated
// to next and previous teams. You can randomize this with ds_list_shuffle(teams);
ds_list_add(teams, whiteTeam);
ds_list_add(teams, blackTeam);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Tracking Turns
currentTeamTurn			= noone;
nextTeamTurn			= noone;
previousTeamTurn		= noone;
currentTeamIndex		= 0;

currentPlayerTurn		= noone;