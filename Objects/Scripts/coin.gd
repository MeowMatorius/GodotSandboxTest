extends Area2D

@onready var inventory_manager = InventoryManager
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var coin_amount = 1

func _on_body_entered(_body: Node2D) -> void:
	inventory_manager.add_coin(coin_amount)
	animation_player.play("pickup")
