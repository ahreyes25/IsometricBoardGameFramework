// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Create Camera
cam = camera_create();

viewmat = matrix_build_lookat(x, y, -100, x, y, 0, 0, 1, 0);
projmat = matrix_build_projection_ortho(640, 480, 1.0, 32000.0);

camera_set_view_mat(cam, viewmat);
camera_set_proj_mat(cam, projmat);

view_camera[0] = cam;

zoom = false;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Starting Position
xTo = x;
yTo = y;