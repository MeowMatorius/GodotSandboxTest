extends Area2D


var damage_amount = 40
func _on_body_entered(_body: Node2D) -> void:
	HealthManager.take_damage(damage_amount)
