extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
var coins_amount: int = 1

func _on_body_entered(_body: Node2D) -> void:
	InventoryManager.add_coins(coins_amount)
	queue_free()
