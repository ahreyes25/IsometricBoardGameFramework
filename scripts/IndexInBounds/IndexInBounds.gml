/// @description Check if a board index is within bounds

/// @param u
/// @param v

var u = argument0;
var v = argument1;

if (u < oGameController.boardWidth && v < oGameController.boardHeight &&
	u >= 0 && v >= 0) {
		return true;	
}
else {
	return false;	
}