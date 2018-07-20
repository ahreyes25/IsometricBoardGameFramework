/// @description Decide which ground tile to place at each space on the board
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

var grassWeight = 60;
var dirtWeight  = 30;
var waterWeigth = 10;
var rand		= random_range(0, 100);

if (rand > 0 && rand <= grassWeight) {
	return ground.grass;
}
else if (rand > grassWeight && rand <= grassWeight + dirtWeight) {
	return ground.dirt;
}
else if (rand > grassWeight + dirtWeight && rand <= 100) {
	return ground.water;
}