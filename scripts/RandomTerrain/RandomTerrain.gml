/// @description Decide which terrain object to place at each space on the board
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

var buildingWeight	= 40;
var treeWeight		= 40;
var mountainWeight	= 20;
var rand			= random_range(0, 100);

if (rand > 0 && rand <= buildingWeight) {
	return terrain.buildings;
}
else if (rand > buildingWeight && rand <= buildingWeight + treeWeight) {
	return terrain.trees;
}
else if (rand > buildingWeight + treeWeight && rand <= 100) {
	return terrain.mountain;
}