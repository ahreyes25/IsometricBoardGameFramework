var worldCoords = GridToWorld(oGameController.boardController.currentBoardX, oGameController.boardController.currentBoardY);
draw_sprite(sUnitCursor, 0, worldCoords[0], worldCoords[1]);