var worldCoords = GridToWorld(oGameController.boardController.currentBoardX, oGameController.boardController.currentBoardY);
draw_sprite_ext(sCursor, 0, worldCoords[0], worldCoords[1], 1, 1, 0, c_white, 0.5);