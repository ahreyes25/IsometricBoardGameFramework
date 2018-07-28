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
			hasMoved		  = false;
			hasAttacked		  = false;
			showMovementRange = false;
			showAttackRange   = false;
		
			if (keyboard_check_pressed(ord("J"))) {										// check if key j is pressed		
				state = unitState.selectingMovement;									// transition into selectinMovement state
			}
			
			if (keyboard_check_pressed(ord("K"))) {										// check if key j is pressed	
				state = unitState.selectingAttackTarget;								// transition into selectingAttackTarget state
			}
			
			UpdateBoardPlayerStates();													// Update player state data on the board
		break;
		#endregion
	
		#region // Selecting Movement State
		case unitState.selectingMovement:
			showMovementRange = true;
			showAttackRange   = false;
		
			if (mouse_check_button_pressed(mb_left)) {									// Check for mouse left clicked
				var mouseGridCoords = WorldToGrid(mouse_x, mouse_y);					// Get BoardPosition u,v from mouse x,y
			
				if (BoardDistance(mouseGridCoords[0], mouseGridCoords[1], currentBoardU, currentBoardV)	<= movementRange) {		
																						// Check to see that where we clicked is within our 
																						// movement range distance.
					
					if (!HasUnit(mouseGridCoords[0], mouseGridCoords[1])) {				// Make sure a unit isnt already occupying that space
						moveToTargetU	= mouseGridCoords[0];							// Set target u position
						moveToTargetV	= mouseGridCoords[1];							// Set target v position
						startBoardU		= currentBoardU;								// Store current u position as the starting u position
						startBoardV		= currentBoardV;								// Store current v position as the starting v position
						state			= unitState.movingToTarget;						// Set state to movingToTarget state now that we have a target
					}
				}
			}
		
			if (keyboard_check_pressed(ord("K"))) {										// If key K is pressed while we are in this state
				state = unitState.idle;													// Go Back To Previous State: Idle
			}	
			
			UpdateBoardPlayerStates();													// Update player state data on the board
		break;
		#endregion
	
		#region // Moving To Target State
		case unitState.movingToTarget:
			showMovementRange = false;
			showAttackRange   = false;
																											
			if (!movedToU) {																				// If unit hasnt moved to the u position yet
				var targetCoords = GridToWorld(moveToTargetU, startBoardV);									// Get Target Coords x,y positions
				var dirVector	 = point_direction(x, y, targetCoords[0], targetCoords[1]);					// Set the direction Vector
				var lenVector	 = point_distance(x, y, targetCoords[0], targetCoords[1]);					// Set the distance vector
				var moveVector	 = [lengthdir_x(lenVector, dirVector), lengthdir_y(lenVector, dirVector)];	// Get move vector from direction and distance vector
				var normVector	 = [moveVector[0] / lenVector, moveVector[1] / lenVector];					// Normalize Vector
		
				if (x + movementSpeed < targetCoords[0] || x - movementSpeed > targetCoords[0]) {			// If our x is not at our target coords x position
					x += normVector[0] * movementSpeed;														// Move x by the x component of the normalized movement vector
				}
				else {																						// If our x position is at target coords x
					x = targetCoords[0];																	// Then snap to position
				}
			
				if (y + movementSpeed < targetCoords[1] || y - movementSpeed > targetCoords[1]) {			// If our y is not at our target coords y position
					y += normVector[1] * movementSpeed;														// Move y by the y component of the normalized movement vector
				}
				else {																						// If our y position is at target coords y
					y = targetCoords[1];																	// Then snap to position
				}
		
				if (x == targetCoords[0] && y == targetCoords[1]) {											// If we have reached the u position of the target point
					movedToU = true;																		// Set movedToU to true so we can start moving to the target v position
				}
			}
		
			else if (!movedToV) {																			// if unit hasnt moved to the v position yet
				var targetCoords = GridToWorld(moveToTargetU, moveToTargetV);								// Get Target Coords x,y positions
				var dirVector	 = point_direction(x, y, targetCoords[0], targetCoords[1]);					// Set the direction Vector	
				var lenVector	 = point_distance(x, y, targetCoords[0], targetCoords[1]);					// Set the distance vector
				var moveVector	 = [lengthdir_x(lenVector, dirVector), lengthdir_y(lenVector, dirVector)];  // Get moe vector from diretion and distance vector
				var normVector	 = [moveVector[0] / lenVector, moveVector[1] / lenVector];					// Normalize vector
		
				if (x + movementSpeed < targetCoords[0] || x - movementSpeed > targetCoords[0]) {			// If our x is not at our target coords x position
					x += normVector[0] * movementSpeed;														// Move x by the x component of the normalized movement vector
				}
				else {																						// If our x position is at target coords x
					x = targetCoords[0];																	// Then snap to position
				}
			
				if (y + movementSpeed < targetCoords[1] || y - movementSpeed > targetCoords[1]) {			// If our y is not at our target coords y position
					y += normVector[1] * movementSpeed;														// Move y by the y component of the normalized movement vector
				}
				else {																						// If our y position is at target coords y
					y = targetCoords[1];																	// Then snap to position
				}
		
				if (x == targetCoords[0] && y == targetCoords[1]) {											// If we have reached the v position of the target point
					movedToV = true;																		// Set movedToU to true
				}
			}
		
			if (movedToU && movedToV) {			// Finished moving
				movedToU = false;				// Reset boolean flags
				movedToV = false;				// Reset boolean flags
				hasMoved = true;				// Set hasMoved to true so we can
												// deactivate the player later
			
				UpdateBoardPlayerPosition();	// Update board position data on grid
				CleanupBoardStates();			// Cleanup board states that may have 
												// been altered as the player moved
			
				state = unitState.decide;		// Continue to next state
			}
		break;
		#endregion
	
		#region // Deciding To Attack or End State
		case unitState.decide:
			showMovementRange = false;
			showAttackRange   = false;
		
			if (keyboard_check_pressed(ord("J"))) {			// If key j is pressed
				state = unitState.selectingAttackTarget;	// Move into selecting attack target state
			}
		
			if (keyboard_check_pressed(ord("K"))) {			// If key k is pressed
				hasAttacked = true;							// Set has attacked so we can deactivate unit
				hasMoved    = true;							// Set has moved so we can deactivate unit
				state		= unitState.waiting;			// Move into waiting state
			}
			
			UpdateBoardPlayerStates();						// Update player state data on the board
		break;
		#endregion
	
		#region // Select Attack Target State
		case unitState.selectingAttackTarget:
			showMovementRange = false;
			showAttackRange   = true;
		
			if (keyboard_check_pressed(ord("K"))) {													// Check if key k was pressed
				state = unitState.decide;															// Go Back To Previous State
			}
			
			if (mouse_check_button_pressed(mb_left)) {												// Check if mouse left was clicked
				var enemyGridCoords = WorldToGrid(mouse_x, mouse_y);								// store mouse position u,v
				
				if (HasUnit(enemyGridCoords[0], enemyGridCoords[1])) {								// check if there is a unit there
					
					if (BoardDistance(currentBoardU, currentBoardV, enemyGridCoords[0], enemyGridCoords[1]) <= attackRange) {	
																									// check unit is in range
																										
						attackTarget = GetUnitAtPosition(enemyGridCoords[0], enemyGridCoords[1]);	// store that unit as the attack target
							
						if (attackTarget != noone) {												// if we have an attack target
							state = unitState.combat;												// move into combat state
						}
					}
				}
			}
			
			UpdateBoardPlayerStates();																// Update player state data on the board
		break;
		#endregion
	
		#region // Combat State
		case unitState.combat:
			showMovementRange	= false;
			showAttackRange		= false;
			
			attackTarget.currentLife -= attackDamage;	// deal damage to attack target
			
			hasAttacked			= true;					// set has attacked to deactivate unit
			hasMoved			= true;					// set has moved to deactivate unit
			attackTarget		= noone;				// clear out attack target
			
			state				= unitState.waiting;	// transition into waiting state
		break;
		#endregion
		
		// Insert your own states here
		// #region
			// Code that you want to execute when
			// this state is the active state.
		// #endregion
	}
}	
// Not Player Turn
else {
	state = unitState.waiting;
	
	#region // Waiting State
	if (state == unitState.waiting) {
		UpdateBoardPlayerStates();
	}
	#endregion
}

// Destroy
if (currentLife <= 0) {
	with (rangeVisualizer) {
		instance_destroy();	
	}
	ds_list_delete(team, ds_list_find_index(team, id));
	instance_destroy();
}