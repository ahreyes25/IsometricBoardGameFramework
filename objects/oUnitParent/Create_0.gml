maxLife			= 100;
currentLife		= maxLife;
movementRange	= 3;
attackRange		= 2;
movementSpeed	= 3;

enum unitState {
	waiting					= 0, // waiting for turn
	selectingMovement		= 1, // selecting movement
	movingToTarget			= 2, // moving to target
	selectingAttackTarget	= 3, // selecting who to attack
	meleeCombat				= 4, // attacking up close
	rangedCombat			= 5, // attacking from range
	inspectingOtherUnit		= 6, // inspecting other unit
}

showMovementRange = false;
showAttackRange   = false;

rangeVisualizer = instance_create_layer(x, y, "World", oRangeVisualizer);
rangeVisualizer.parent = id;

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