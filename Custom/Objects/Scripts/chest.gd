extends StaticBody2D

@onready var interactable: Area2D = $interactable
@onready var sprite_2d: Sprite2D = $Sprite2D
@export var keys_needed: int = 1
@export var xp_amount: int = 50
@export var coins_amount: int = 100


func _ready() -> void:
	interactable.interact = _on_interact


func _on_interact():
	if InventoryManager.keys_amount >= keys_needed and interactable.is_interactable: 
		sprite_2d.frame = 1 
		interactable.is_interactable = false
		
		InventoryManager.spend_collectible("key", keys_needed)
		InventoryManager.add_collectible("coin", coins_amount)
		StatsManager.add_exp(xp_amount)
