/// @description Decide which terrain object to place at each space on the board
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

// Assigning weight values to specific tiles allows us to controll the distribution
// of certain terrain tiles in the world instead of always having a linear distribution

var buildingWeight	= 40;
var treeWeight		= 40;
var mountainWeight	= 20;
var sum				= buildingWeight + treeWeight + mountainWeight;
var rand			= random_range(0, sum);

if (rand > 0 && rand <= buildingWeight) {
	return terrain.buildings;
}
else if (rand > buildingWeight && rand <= buildingWeight + treeWeight) {
	return terrain.trees;
}
else if (rand > buildingWeight + treeWeight && rand <= sum) {
	return terrain.mountain;
}