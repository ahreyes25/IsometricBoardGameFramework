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