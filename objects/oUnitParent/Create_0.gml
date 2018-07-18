maxLife			= 100;
currentLife		= maxLife;
movementRange	= 3;
attackRange		= 2;
movementSpeed	= 3;
team			= noone;

enum unitState {
	waiting					= 1000, // waiting for turn
	idle					= 2000, // current turn, not doing anything yet
	selectingMovement		= 3000, // selecting movement
	movingToTarget			= 4000, // moving to target
	selectingAttackTarget	= 5000, // selecting who to attack
	meleeCombat				= 6000, // attacking up close
	rangedCombat			= 7000, // attacking from range
	showAttackRange			= 8000, // showing attack range, but not committing to anything
	showMovementRange		= 9000, // showing move range, but not committing to anything
}

showingMovementRange = false;
showingAttackRange   = false;

rangeVisualizer = instance_create_layer(x, y, "World", oRangeVisualizer);
rangeVisualizer.parent = id;

// Movement
startBoardX		= noone;
startBoardY		= noone;
currentBoardX	= noone;
currentBoardY	= noone;
moveToTargetX	= noone;
moveToTargetY	= noone;
movedToX		= false;
movedToY		= false;

active			= false;
state			= unitState.waiting;

unitInspecting	= noone;
attackTarget	= noone;

image_speed		= 0.5;