depth = -y;

// Get current board position
var unitGridCoords = WorldToGrid(x, y);
currentBoardU  = unitGridCoords[0];
currentBoardV  = unitGridCoords[1];

// Player Turn
if (oGameController.turnController.currentPlayerTurn.id == id) {
	switch (state) {
		#region // Idle State
		case unitState.idle:
			hasMoved			 = false;
			hasAttacked			 = false;
			showingMovementRange = false;
			showingAttackRange   = false;
		
			if (keyboard_check_pressed(ord("J"))) {
				state = unitState.selectingMovement;	
			}
		
			if (keyboard_check_pressed(ord("K"))) {
				state = unitState.selectingAttackTarget;	
			}
		break;
		#endregion
	
		#region // Selecting Movement State
		case unitState.selectingMovement:
			showingMovementRange = true;
			showingAttackRange   = false;
		
			// Click on Space To Move To It
			if (mouse_check_button_pressed(mb_left)) {
				var mouseGridCoords = WorldToGrid(mouse_x, mouse_y);
			
				// Check if space clicked is in range
				if (BoardDistance(mouseGridCoords[0], mouseGridCoords[1], currentBoardU, currentBoardV) <= movementRange) {
					// Make sure a unit isnt already occupying that space
					if (!IsUnit(mouseGridCoords[0], mouseGridCoords[1])) {
						moveToTargetU	= mouseGridCoords[0];
						moveToTargetV	= mouseGridCoords[1];
						startBoardU		= currentBoardU;
						startBoardV		= currentBoardV;
						state			= unitState.movingToTarget;	
					}
				}
			}
		
			// Go Back To Previous State
			if (keyboard_check_pressed(ord("K"))) {
				state = unitState.idle;
			}	
		
			// Update Player State Info On Board
			UpdateBoardPlayerStates();
		break;
		#endregion
	
		#region // Moving To Target State
		case unitState.movingToTarget:
			showingMovementRange = false;
			showingAttackRange   = false;
		
		
			// If unit hasnt moved to the u position yet
			if (!movedToU) {
				var targetCoords = GridToWorld(moveToTargetU, startBoardV);
				var dirVector	 = point_direction(x, y, targetCoords[0], targetCoords[1]);
				var lenVector	 = point_distance(x, y, targetCoords[0], targetCoords[1]);
				var moveVector	 = [lengthdir_x(lenVector, dirVector), lengthdir_y(lenVector, dirVector)];
				var normVector	 = [moveVector[0] / lenVector, moveVector[1] / lenVector];
		
				// Move x by the x component of the normalized movement vector
				if (x + movementSpeed < targetCoords[0] || x - movementSpeed > targetCoords[0]) {
					x += normVector[0] * movementSpeed;
				}
				// Snap to position
				else {
					x = targetCoords[0];	
				}
			
				// Move y by the y component of the normalized movement vector
				if (y + movementSpeed < targetCoords[1] || y - movementSpeed > targetCoords[1]) {
					y += normVector[1] * movementSpeed;
				}
				// Snap to position
				else {
					y = targetCoords[1];	
				}
		
				// If we have reached the u position of the target point, now move in the v direction
				if (x == targetCoords[0] && y == targetCoords[1]) {
					movedToU = true;
				}
			}
		
			// if unit hasnt moved to the v position yet
			else if (!movedToV) {
				var targetCoords = GridToWorld(moveToTargetU, moveToTargetV);
				var dirVector	 = point_direction(x, y, targetCoords[0], targetCoords[1]);
				var lenVector	 = point_distance(x, y, targetCoords[0], targetCoords[1]);
				var moveVector	 = [lengthdir_x(lenVector, dirVector), lengthdir_y(lenVector, dirVector)];
				var normVector	 = [moveVector[0] / lenVector, moveVector[1] / lenVector];
		
				// Move x by the x component of the normalized movement vector
				if (x + movementSpeed < targetCoords[0] || x - movementSpeed > targetCoords[0]) {
					x += normVector[0] * movementSpeed;
				}
				// Snap to position
				else {
					x = targetCoords[0];	
				}
			
				// Move y by the y component of the normalized movement vector
				if (y + movementSpeed < targetCoords[1] || y - movementSpeed > targetCoords[1]) {
					y += normVector[1] * movementSpeed;
				}
				// Snap to position
				else {
					y = targetCoords[1];	
				}
		
				// If we have reached the v position of the target point,
				if (x == targetCoords[0] && y == targetCoords[1]) {
					movedToV = true;
				}
			}
		
			// Finished moving
			if (movedToU && movedToV) {
				movedToU = false;
				movedToV = false;
				hasMoved = true;
			
				// update grid values
				UpdateBoardPlayerPosition();
			
				// Continue to next state
				state = unitState.decide;
			}
		break;
		#endregion
	
		#region // Deciding To Attack or End State
		case unitState.decide:
			showingMovementRange = false;
			showingAttackRange   = false;
		
			// Move into selecting attack target state
			if (keyboard_check_pressed(ord("J"))) {
				state = unitState.selectingAttackTarget;	
			}
		
			// Move into waiting state
			if (keyboard_check_pressed(ord("K"))) {
				hasAttacked = true;
				state = unitState.waiting;	
			}
		
			// Update Player State Info On Board
			UpdateBoardPlayerStates();
		break;
		#endregion
	
		#region // Select Attack Target State
		case unitState.selectingAttackTarget:
			showingMovementRange = false;
			showingAttackRange   = true;
		
			// Go Back To Previous State
			if (keyboard_check_pressed(ord("K"))) {
				state = unitState.decide;
			}
		
			// Update Player State Info On Board
			UpdateBoardPlayerStates();
		break;
		#endregion
	
		#region // Melee Combat State
		case unitState.meleeCombat:
			showingMovementRange = false;
			showingAttackRange   = false;
			
			// Update Player State Info On Board
			UpdateBoardPlayerStates();
		break;
		#endregion
	
		#region // Ranged Combat State
		case unitState.rangedCombat:
			showingMovementRange = false;
			showingAttackRange   = false;
			
			// Update Player State Info On Board
			UpdateBoardPlayerStates();
		break;
		#endregion
	}
}	
// Not Player Turn
else {
	state = unitState.waiting;
	
	#region // Waiting State
	if (state == unitState.waiting) {
		showingAttackRange   = false;
		showingMovementRange = false;
		
		// Update Player State Info On Board
		UpdateBoardPlayerStates();
	}
	#endregion
}