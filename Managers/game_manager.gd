extends Node

func player_reset(bool):
	if true:
		HealthManager.health_bar.value = 100
		InventoryManager.coins_amount = 0
		StatsManager.lvl_up_points = 0
		StatsManager.exp_amount = 0
		StatsManager.player_level = 1
		PlayerUI.update_labels()
		PauseMenu.update_labels()
	else:
		pass
