extends Button

func _on_reload_button_button_up() -> void:
	PauseMenu.exit_pause_menu()
	GameManager.player_reset(true)
	get_tree().reload_current_scene() 
