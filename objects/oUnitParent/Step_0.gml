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
	// Idle State
	if (state == unitState.idle) {
		// Draw Options to show move or attack
		if (keyboard_check_pressed(vk_enter)) {
			state = unitState.selectingMovement;
		}
		UpdateBoardPlayerStates();
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// Selecting Movement State
	else if (state == unitState.selectingMovement) {
		Input();
		showingMovementRange = true;
		showingAttackRange   = false;
		
		Input();
		// Click on Space To Move To It
		if (mouseLeftPressed) {
			var mouseGridCoords = WorldToGrid(mouse_x, mouse_y);
			
			// Check if space clicked is in range
			if (BoardDistance(mouseGridCoords[0], mouseGridCoords[1], currentBoardX, currentBoardY) <= movementRange && 
				!IsTerrain(mouseGridCoords[0], mouseGridCoords[1]) && !IsUnit(mouseGridCoords[0], mouseGridCoords[1]) && 
				!SpecificGround(mouseGridCoords[0], mouseGridCoords[1], ground.water)) {
					moveToTargetX = mouseGridCoords[0];
					moveToTargetY = mouseGridCoords[1];
					startBoardX = currentBoardX;
					startBoardY = currentBoardY;
					state = unitState.movingToTarget;	
			}
		}
		UpdateBoardPlayerStates();
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// Moving To Target State
	else if (state == unitState.movingToTarget) {
		showingMovementRange = false;
		showingAttackRange   = false;
		
		// Move To X Position
		if (!movedToX) {
			var targetCoords = GridToWorld(moveToTargetX, startBoardY);
			var dirVector	 = point_direction(x, y, targetCoords[0], targetCoords[1]);
			var lenVector	 = point_distance(x, y, targetCoords[0], targetCoords[1]);
			var moveVector	 = [lengthdir_x(lenVector, dirVector), lengthdir_y(lenVector, dirVector)];
			var normVector	 = [moveVector[0] / lenVector, moveVector[1] / lenVector];
		
			if (x + movementSpeed < targetCoords[0] || x - movementSpeed > targetCoords[0]) {
				x += normVector[0] * movementSpeed;
			}
			else {
				x = targetCoords[0];	
			}
			
			if (y + movementSpeed < targetCoords[1] || y - movementSpeed > targetCoords[1]) {
				y += normVector[1] * movementSpeed;
			}
			else {
				y = targetCoords[1];	
			}
		
			if (x == targetCoords[0] && y == targetCoords[1]) {
				movedToX = true;
			}
		}
		
		// Move To Y Position
		else if (!movedToY) {
			var targetCoords = GridToWorld(moveToTargetX, moveToTargetY);
			var dirVector	 = point_direction(x, y, targetCoords[0], targetCoords[1]);
			var lenVector	 = point_distance(x, y, targetCoords[0], targetCoords[1]);
			var moveVector	 = [lengthdir_x(lenVector, dirVector), lengthdir_y(lenVector, dirVector)];
			var normVector	 = [moveVector[0] / lenVector, moveVector[1] / lenVector];
		
			if (x + movementSpeed < targetCoords[0] || x - movementSpeed > targetCoords[0]) {
				x += normVector[0] * movementSpeed;
			}
			else {
				x = targetCoords[0];	
			}
			
			if (y + movementSpeed < targetCoords[1] || y - movementSpeed > targetCoords[1]) {
				y += normVector[1] * movementSpeed;
			}
			else {
				y = targetCoords[1];	
			}
		
			if (x == targetCoords[0] && y == targetCoords[1]) {
				movedToY = true;
			}
		}
		
		// Finished moving
		if (movedToX && movedToY) {
			// update variables
			movedToX = false;
			movedToY = false;
			
			// update grid values
			UpdateBoardPlayerPosition();
			
			// Continue to next state
			state = unitState.selectingAttackTarget;
		}
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// Selecting Attack Target State
	else if (state == unitState.selectingAttackTarget) {
		showingMovementRange = false;
		showingAttackRange   = true;
		UpdateBoardPlayerStates();
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// Melee Combat State
	else if (state == unitState.meleeCombat) {
		showingMovementRange = false;
		showingAttackRange   = false;
		UpdateBoardPlayerStates();
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// Ranged Combat State
	else if (state == unitState.rangedCombat) {
		showingMovementRange = false;
		showingAttackRange   = false;
		UpdateBoardPlayerStates();
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// Show Attack Range State
	else if (state == unitState.showAttackRange) {
		showingMovementRange = false;
		showingAttackRange   = true;
		active				 = false;
		UpdateBoardPlayerStates();
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// Show Movement Range State
	else if (state == unitState.showMovementRange) {
		showingMovementRange = true;
		showingAttackRange   = false;
		active				 = false;
		UpdateBoardPlayerStates();
	}
}	
// Not player turn
else {
	active = false;	
	state  = unitState.waiting;
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// Waiting State
	if (state == unitState.waiting) {
		showingAttackRange   = false;
		showingMovementRange = false;
		UpdateBoardPlayerStates();
	}
}