extends Node

func _ready() -> void:
	PauseMenu.exit_pause_menu()

func player_reset(hard_reset: bool):
	if hard_reset:
		InventoryManager.reset_collectibles()
		HealthManager.reset_health()
		StatsManager.reset_player_stats()
		PlayerUI.update_labels()
		PauseMenu.update_labels()
	else:
		HealthManager.reset_health()
		PlayerUI.update_labels()
		PauseMenu.update_labels()


func change_scene(string):
	match string:
		'Forest':
			get_tree().change_scene_to_file("res://level_1.tscn")
		'Mountain':
			get_tree().change_scene_to_file("res://level_2.tscn")
	PauseMenu.exit_pause_menu()
