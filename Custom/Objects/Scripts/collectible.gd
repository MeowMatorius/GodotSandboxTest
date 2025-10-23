extends Area2D

@export var amount: int = 1
@export var xp_amount: int = 10
@export var collectible_type: String


func _on_body_entered(_body: Node2D) -> void:
	InventoryManager.add_collectible(collectible_type, amount, xp_amount)
	get_parent().queue_free()
