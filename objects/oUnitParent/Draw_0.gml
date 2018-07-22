// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Set sprites dependig on which team the player is on
if (team == oGameController.turnController.blackTeam) {
	var sprIdle = sPlayer1Idle;
	var sprRun  = sPlayer1Run;
}
else if (team == oGameController.turnController.whiteTeam) {
	var sprIdle = sPlayer2Idle;
	var sprRun  = sPlayer2Run;
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// If debugging, draw the player semi transparent

if (oGameController.debugging) {
	DrawDebugInfo();
	DebugGridValues();
	draw_sprite_ext(sprIdle, image_index, x, y, image_xscale, image_yscale, 0, c_white, 0.5);
}
// Not debugging
else {
	switch (state) {
		#region // Waiting State
		case unitState.waiting:
			if (!hasMoved || !hasAttacked) {
				draw_sprite_ext(sprIdle, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
			}
			else {
				draw_sprite_ext(sprIdle, 0, x, y, image_xscale, image_yscale, 0, c_gray, 1);
			}
		break;
		#endregion
		
		#region // Idle State
		case unitState.idle:
			draw_text_transformed(x + 10, y - 20, "\"J\" To Move", 0.75, 0.75, 0);
			draw_text_transformed(x + 10, y - 10, "\"K\" To Attack", 0.75, 0.75, 0);
			draw_sprite_ext(sprIdle, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
		break;
		#endregion
		
		#region // Select Movement State
		case unitState.selectingMovement:
			draw_text_transformed(x + 10, y - 20, "\"K\" To Go Back", 0.75, 0.75, 0);
			draw_sprite_ext(sprIdle, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
		break;
		#endregion
		
		#region // Moving To Target State
		case unitState.movingToTarget:
			if (x > xprevious) {
				image_xscale = 1;	
			}
			else {
				image_xscale = -1;
			}
			draw_sprite_ext(sprRun, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
		break;
		#endregion
		
		#region // Deciding State
		case unitState.decide:
			draw_text_transformed(x + 10, y - 20, "\"J\" To Attack", 0.75, 0.75, 0);
			draw_text_transformed(x + 10, y - 10, "\"K\" To Wait", 0.75, 0.75, 0);
			draw_sprite_ext(sprIdle, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
		break;
		#endregion
		
		#region // Selection Attack Target State
		case unitState.selectingAttackTarget:
			draw_text_transformed(x + 10, y - 20, "\"K\" To Go Back", 0.75, 0.75, 0);
			draw_sprite_ext(sprIdle, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
		break
		#endregion
		
		#region // Combat State
		case unitState.combat:
			draw_sprite_ext(sprIdle, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
		break;
		#endregion
		
		#region // End Turn State
		case unitState.endTurn:
			draw_sprite_ext(sprIdle, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
		break;
		#endregion
	}
}

draw_text_transformed(x - 10, y - 40, currentLife, 1, 1, 0);