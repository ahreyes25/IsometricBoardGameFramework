/// @description Turn off everyone else except the current player's showMovement and showAttack

for (var i = 0; i < ds_list_size(oGameController.turnController.whiteTeam); i++) {
	var wUnit = ds_list_find_value(oGameController.turnController.whiteTeam, i);
	if (wUnit != oGameController.turnController.currentPlayerTurn) {
		wUnit.showMovementRange = false;
		wUnit.showAttackRange   = false;
	}
}
	
for (var i = 0; i < ds_list_size(oGameController.turnController.blackTeam); i++) {
	var bUnit = ds_list_find_value(oGameController.turnController.blackTeam, i);
	if (bUnit != oGameController.turnController.currentPlayerTurn) {
		bUnit.showMovementRange = false;
		bUnit.showAttackRange   = false;
	}
}