extends Area2D

var health_bottle_amount = 30

func _on_body_entered(_body: Node2D) -> void:
	HealthManager.give_heal(health_bottle_amount)
	queue_free()
