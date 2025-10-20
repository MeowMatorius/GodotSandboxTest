extends Node

@export var damage = 10
@onready var health_bar: ProgressBar = $/root/PlayerUI/PlayerStatus/StatusContainer/HealthContainer/HealthBar


func _damage():
	health_bar.value -= damage

func death():
	health_bar.value = 100
	get_tree().reload_current_scene()
