switch (state) {
	#region // Idle State
	case unitState.idle:
		draw_text_transformed(10, 460, "Select Action", 1, 1, 0);
	break;
	#endregion
	
	#region // Selecting Movement State
	case unitState.selectingMovement:
		draw_text_transformed(10, 460, "Select Movement", 1, 1, 0);
	break;
	#endregion
	
	#region // Moving To Target State
	case unitState.movingToTarget:
		draw_text_transformed(10, 460, "Moving", 1, 1, 0);
	break;
	#endregion
	
	#region // Deciding State
	case unitState.decide:
		draw_text_transformed(10, 460, "Select Action", 1, 1, 0);
	break;
	#endregion
	
	#region // Selecting Attack Target State
	case unitState.selectingAttackTarget:
		draw_text_transformed(10, 460, "Select Attack Target", 1, 1, 0);
	break;
	#endregion
	
	#region // Melee Combat State
	case unitState.meleeCombat:
		draw_text_transformed(10, 460, "Attacking", 1, 1, 0);
	break;
	#endregion
	
	#region // Ranged Combat State
	case unitState.rangedCombat:
		draw_text_transformed(10, 460, "Attacking", 1, 1, 0);
	break;
	#endregion
	
	#region // End Turn State
	case unitState.endTurn:
		draw_text_transformed(10, 460, "End Turn", 1, 1, 0);
	break;
	#endregion
}