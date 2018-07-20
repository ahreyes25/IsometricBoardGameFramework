maxLife			= 100;
currentLife		= maxLife;
movementRange	= 3;
attackRange		= 2;
movementSpeed	= 3;
team			= noone;

#region // State Enum
enum unitState {
	waiting					= 1000,		// waiting for turn
	idle					= 2000,		// currently highlighted, not doing anything yet
	selectingMovement		= 3000,		// selecting movement
	movingToTarget			= 4000,		// moving to target
	decide					= 5000,		// decide to attack or sit still
	selectingAttackTarget	= 6000,		// selecting who to attack
	meleeCombat				= 7000,		// attacking up close
	rangedCombat			= 8000,		// attacking from range
	endTurn					= 9000,	// what to do before moving onto next team
}
#endregion

showingMovementRange = false;
showingAttackRange   = false;

// range visualizer is a separate object because we want the range to be draw at 
// a speciic depth, and if it is attached to our player then the depth value is 
// variable on its y value, creating weird effects. having it be separate gives us 
// a consistent depth so that the range spaces are drawn always under our terrain 
// and always over our ground
rangeVisualizer = instance_create_layer(x, y, "World", oRangeVisualizer);
rangeVisualizer.parent = id;

startBoardU		= noone;
startBoardV		= noone;
currentBoardU	= noone;
currentBoardV	= noone;
moveToTargetU	= noone;
moveToTargetV	= noone;
movedToU		= false;
movedToV		= false;

state			= unitState.waiting;

hasMoved		= false;
hasAttacked		= false;

image_speed		= 0.5;