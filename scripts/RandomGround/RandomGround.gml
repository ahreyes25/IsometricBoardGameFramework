var grassWeight = 60; // must total 100
var dirtWeight  = 30;
var waterWeigth = 10;

var rand = random_range(0, 100);

// Return grass
if (rand > 0 && rand <= grassWeight) {
	return ground.grass;
}
// Return dirt
else if (rand > grassWeight && rand <= grassWeight + dirtWeight) {
	return ground.dirt;
}
// Return water
else if (rand > grassWeight + dirtWeight && rand <= 100) {
	return ground.water;
}