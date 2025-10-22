extends StaticBody2D

@onready var interactable: Area2D = $interactable
@onready var sprite_2d: Sprite2D = $Sprite2D
@export var keys_amount_needed: int = 1


func _ready() -> void:
	interactable.interact = _on_interact


func _on_interact():
	if InventoryManager.keys_amount >= keys_amount_needed: 
		sprite_2d.frame = 1 
		interactable.is_interactable = false
		InventoryManager.spend_collectible("key", keys_amount_needed)
