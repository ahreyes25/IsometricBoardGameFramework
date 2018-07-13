var buildingWeight	= 40; // must total 100
var treeWeight		= 40;
var mountainWeight	= 20;

var rand = random_range(0, 100);

// Return buidling
if (rand > 0 && rand <= buildingWeight) {
	return terrain.buildings;
}
// Return tree
else if (rand > buildingWeight && rand <= buildingWeight + treeWeight) {
	return terrain.trees;
}
// Return mountain
else if (rand > buildingWeight + treeWeight && rand <= 100) {
	return terrain.mountain;
}