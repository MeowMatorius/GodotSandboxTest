extends Node

func player_reset(hard_reset: bool):
	if hard_reset == true:
		HealthManager.health_bar.value = 100
		InventoryManager.coins_amount = 0
		StatsManager.lvl_up_points = 0
		StatsManager.exp_amount = 0
		StatsManager.player_level = 1
		PlayerUI.update_labels()
		PauseMenu.update_labels()
	else:
		pass

func change_scene(string):
	if string == 'Forest':
		PauseMenu.resume()
		get_tree().change_scene_to_file("res://level_1.tscn")
	if string == 'Mountain':
		PauseMenu.resume()
		get_tree().change_scene_to_file("res://level_2.tscn")
