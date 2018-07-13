if (parent.showMovementRange) {
	var gridCoords = WorldToGrid(x, y);
	ShowRange(gridCoords[0], gridCoords[1], parent.movementRange, c_blue);
}
else if (parent.showAttackRange) {
	var gridCoords = WorldToGrid(x, y);
	ShowRange(gridCoords[0], gridCoords[1], parent.attackRange, c_red);
}