maxLife			= 100;
currentLife		= maxLife;
movementRange	= 3;
attackRange		= 2;

enum unitState {
	waiting					= 0, // waiting for turn
	idle					= 1, // is turn, not doing anything yet
	showingMovementRange	= 2, // showing movement range
	showingAttackRange		= 3, // showing attack range
	movingToTarget			= 4, // moving to target
	meleeCombat				= 5, // attacking up close
	rangedCombat			= 6, // attacking from range
}

showMovementRange = false;
showAttackRange   = false;

rangeVisualizer = instance_create_layer(x, y, "World", oRangeVisualizer);
rangeVisualizer.parent = id;

currentBoardX	= noone;
currentBoardY	= noone;

active			= false;

unitInspecting	= noone;

image_speed = 0.5;