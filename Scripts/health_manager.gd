extends Node

@export var damage = 10
@onready var health_bar: ProgressBar = $/root/PlayerUi/PlayerStatus/StatusContainer/HealthContainer/HealthBar



func _damage():
	health_bar.value -= damage
