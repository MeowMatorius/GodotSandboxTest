extends Node

@export var location_1: String = "Sandbox"
@export var location_2: String = "Snow"

func _ready() -> void:
	PauseMenu.exit_pause_menu()


func player_reset(hard_reset: bool):
	if hard_reset:
		InventoryManager.reset_collectibles()
		HealthManager.reset_health()
		StatsManager.reset_player_stats()
	else:
		HealthManager.reset_health()


func change_scene(string):
	match string:
		location_1:
			get_tree().change_scene_to_file("res://level_1.tscn")
		location_2:
			get_tree().change_scene_to_file("res://level_2.tscn")
	PauseMenu.exit_pause_menu()
