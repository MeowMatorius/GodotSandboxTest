extends Area2D

@export var damage_amount: int = 40


func _on_body_entered(_body: Node2D) -> void:
	HealthManager.take_damage(damage_amount)
