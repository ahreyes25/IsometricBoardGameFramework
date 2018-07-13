// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Update Target and Position To Move To
var target = oGameController.turnController.currentPlayerTurn;
xTo = target.x;
yTo = target.y;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Move Camera Object
x += (xTo - x) * 0.1;
y += (yTo - y) * 0.1;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Update Camera View Matrix
viewmat = matrix_build_lookat(x, y, -100, x, y, 0, 0, 1, 0);
camera_set_view_mat(cam, viewmat);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Update Camera Projection Matrix
if (target.object_index == oUnitParent.object_index && zoom) {
	projmat = matrix_build_projection_ortho(320, 240, 1.0, 32000.0);
}
else {
	projmat = matrix_build_projection_ortho(640, 480, 1.0, 32000.0);
}
camera_set_proj_mat(cam, projmat);