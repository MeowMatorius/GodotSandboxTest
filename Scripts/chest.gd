extends StaticBody2D

@onready var interactable: Area2D = $interactable
@onready var sprite_2d: Sprite2D = $Sprite2D 

func _ready() -> void:
	interactable.interact = _on_interact

# Кастомное действие при Interact действии
func _on_interact():
	if sprite_2d.frame == 0:
		# Изменения спрайта после Interact (ex: Сундук)
		sprite_2d.frame = 1 
		
		# можно ли Interact снова
		interactable.is_interactable = false
		
		print("Interaction promted")
