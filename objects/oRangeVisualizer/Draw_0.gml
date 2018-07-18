if (parent.showingMovementRange) {
	var gridCoords = WorldToGrid(x, y);
	ShowRange(gridCoords[0], gridCoords[1], parent.movementRange, "movement");
}
else if (parent.showingAttackRange) {
	var gridCoords = WorldToGrid(x, y);
	ShowRange(gridCoords[0], gridCoords[1], parent.attackRange, "attack");
}