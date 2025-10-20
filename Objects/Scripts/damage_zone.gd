extends Area2D

@onready var health = HealthManager

func _on_body_entered(body: Node2D) -> void:
	health._damage()
