extends Button
@export var value_amount = 10

func _on_give_coins_button_button_up() -> void:
	InventoryManager.add_collectible("coin", value_amount, 0)
