extends Area2D

var health_bottle_amount = 30

func _on_body_entered(_body: Node2D) -> void:
	HealthManager.take_health_bottle(health_bottle_amount)
	print("jopa2")
