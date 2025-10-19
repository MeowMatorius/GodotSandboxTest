extends StaticBody2D

@onready var interactable: Area2D = $interactable
@onready var sprite_2d: Sprite2D = $Sprite2D 

func _ready() -> void:
	interactable.interact = _on_interact

# Кастомное действие при Interact действии
func _on_interact():
		# можно ли повторять взаимодействие
		interactable.is_interactable = true
		print("Interaction promted")
