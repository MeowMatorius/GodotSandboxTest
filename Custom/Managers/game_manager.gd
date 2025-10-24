extends Node

var current_location: String = "Sandbox"
signal _on_location_change


func _ready() -> void:
	PauseMenu.exit_pause_menu()
	

func player_reset(hard_reset: bool):
	if hard_reset:
		InventoryManager.reset_collectibles()
		HealthManager.reset_health()
		StatsManager.reset_player_stats()
	else:
		HealthManager.reset_health()


func change_scene(location):
	match location:
		"Sandbox":
			get_tree().change_scene_to_file("res://Levels/level_1.tscn")
		"Snow":
			get_tree().change_scene_to_file("res://Levels/level_2.tscn")
	_on_location_change.emit()
	PauseMenu.exit_pause_menu()
