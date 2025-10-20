extends Node

@export var damage = 10
@onready var health_bar: ProgressBar = $/root/PlayerUI/PlayerStatus/StatusContainer/HealthContainer/HealthBar

signal on_take_damage

func take_damage(damage_amount):
	on_take_damage.emit()
	health_bar.value -= damage_amount

func death():
	health_bar.value = 100
	get_tree().reload_current_scene()
	
func take_health_bottle(health_bottle_amount):
	health_bar.value += health_bottle_amount
