extends StaticBody2D

@onready var interactable: Area2D = $interactable

func _ready() -> void:
	interactable.interact = _on_interact

# Кастомное действие при Interact действии
func _on_interact():
		# можно ли повторять взаимодействие
		interactable.is_interactable = false
		print("Chest Opened")
