if (oGameController.turnController.currentPlayerTurn.id == id) {
	var targetCoords	= GridToWorld(moveToTargetX, moveToTargetY);
	var currentCoords	= GridToWorld(currentBoardX, currentBoardY);
	var dirVector		= point_direction(currentCoords[0], currentCoords[1], targetCoords[0], targetCoords[1]);
	var lenVector		= point_distance(currentCoords[0], currentCoords[1], targetCoords[0], targetCoords[1]);
	var moveVector		= [lengthdir_x(lenVector, dirVector), lengthdir_y(lenVector, dirVector)];
	var normVector		= [moveVector[0] / lenVector, moveVector[1] / lenVector];
	
	draw_text_transformed(10, 30, "dir: " + string(dirVector), 1, 1, 0);
	draw_text_transformed(10, 40, "len: " + string(lenVector), 1, 1, 0);
	draw_text_transformed(10, 60, "moveX: " + string(moveVector[0]), 1, 1, 0);
	draw_text_transformed(10, 70, "moveY: " + string(moveVector[1]), 1, 1, 0);
	draw_text_transformed(10, 90, "normX: " + string(normVector[0]), 1, 1, 0);
	draw_text_transformed(10, 100, "normY: " + string(normVector[1]), 1, 1, 0);
}

switch (state) {
	// Waiting
	case 0:
	break;
	
	// Selecting Movement
	case 1:
		draw_text_transformed(10, 460, "Movement Phase", 1, 1, 0);
	break;
	
	// Moving To Target
	case 2:
		draw_text_transformed(10, 460, "Movement Phase", 1, 1, 0);
	break;
	
	// Selecting Attack Target
	case 3:
		draw_text_transformed(10, 460, "Attack Phase", 1, 1, 0);
	break;
	
	// Melee Combat
	case 4:
		draw_text_transformed(10, 460, "Attack Phase", 1, 1, 0);
	break;
	
	// Ranged Combat
	case 5:
		draw_text_transformed(10, 460, "Attack Phase", 1, 1, 0);
	break;
	
	// Inspecting unit
	case 6:
		draw_text_transformed(10, 460, "Inspecting", 1, 1, 0);
	break;
}