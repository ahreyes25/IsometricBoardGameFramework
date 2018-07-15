depth = -y;

// Get current board position
var unitGridCoords = WorldToGrid(x, y);
currentBoardX  = unitGridCoords[0];
currentBoardY  = unitGridCoords[1];

// Currently player turn
if (oGameController.turnController.currentPlayerTurn.id == id) {
	active = true;
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// Player State Machine
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// Selecting Movement State
	if (state == unitState.selectingMovement) {
		Input();
		showMovementRange = true;
		showAttackRange   = false;
		
		Input();
		// Click on Space To Move To It
		if (mouseLeftPressed) {
			var mouseGridCoords = WorldToGrid(mouse_x, mouse_y);
			
			// Check if space clicked is in range
			if (BoardDistance(mouseGridCoords[0], mouseGridCoords[1], currentBoardX, currentBoardY) <= movementRange && 
				!IsTerrain(mouseGridCoords[0], mouseGridCoords[1]) && !IsUnit(mouseGridCoords[0], mouseGridCoords[1])) {
				moveToTargetX = mouseGridCoords[0];
				moveToTargetY = mouseGridCoords[1];
				state = unitState.movingToTarget;	
			}
		}
		// Skip moving phase
		else if (skipPhasePressed) {
			state = unitState.selectingAttackTarget;
		}
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// Moving To Target State
	else if (state == unitState.movingToTarget) {
		showMovementRange = false;
		showAttackRange   = false;
	
		var targetCoords	= GridToWorld(moveToTargetX, moveToTargetY);
		var currentCoords	= GridToWorld(currentBoardX, currentBoardY);
		var dirVector		= point_direction(currentCoords[0], currentCoords[1], targetCoords[0], targetCoords[1]);
		var lenVector		= point_distance(currentCoords[0], currentCoords[1], targetCoords[0], targetCoords[1]);
		var moveVector		= [lengthdir_x(lenVector, dirVector), lengthdir_y(lenVector, dirVector)];
		var normVector		= [moveVector[0] / lenVector, moveVector[1] / lenVector];
		
		if (x != targetCoords[0]) {
			x += normVector[0];
		}
		if (y != targetCoords[1]) {
			y += normVector[1];
		}
		
		if (x == targetCoords[0] && y == targetCoords[1]) {
			state = unitState.selectingAttackTarget;
		}
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// Selecting Attack Target State
	else if (state == unitState.selectingAttackTarget) {
		showMovementRange = false;
		showAttackRange   = true;
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// Melee Combat State
	else if (state == unitState.meleeCombat) {
		showMovementRange = false;
		showAttackRange   = false;
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// Ranged Combat State
	else if (state == unitState.rangedCombat) {
		showMovementRange = false;
		showAttackRange   = false;
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// Inspecting Other Unit State
	else if (state == unitState.inspectingOtherUnit) {
		showMovementRange = false;
		showAttackRange   = false;
	}
}	
// Not player turn
else {
	active = false;	
	state  = unitState.waiting;
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// Waiting State
	if (state == unitState.waiting) {
		showAttackRange   = false;
		showMovementRange = false;
	}
}