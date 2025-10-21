extends Node

@onready var health_bar: ProgressBar = PlayerUI.find_child("HealthBar")

var damage = 10

signal on_take_damage
signal on_heal


func take_damage(damage_amount):
	on_take_damage.emit()
	health_bar.value -= damage_amount


func death():
	health_bar.value = 100
	PauseMenu.resume()
	get_tree().current_scene.queue_free()
	get_tree().call_deferred("reload_current_scene")
	
	
func give_heal(heal_amount):
	on_heal.emit()
	health_bar.value += heal_amount
