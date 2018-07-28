/// @description Decide which ground tile to place at each space on the board
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

// Assigning weight values to specific tiles allows us to controll the distribution
// of certain ground tiles in the world instead of always having a linear distribution

var grassWeight = 60;
var dirtWeight  = 30;
var waterWeight = 10;
var sum			= grassWeight + dirtWeight + waterWeight;
var rand		= random_range(0, sum);

if (rand > 0 && rand <= grassWeight) {
	return ground.grass;
}
else if (rand > grassWeight && rand <= grassWeight + dirtWeight) {
	return ground.dirt;
}
else if (rand > grassWeight + dirtWeight && rand <= sum) {
	return ground.water;
}