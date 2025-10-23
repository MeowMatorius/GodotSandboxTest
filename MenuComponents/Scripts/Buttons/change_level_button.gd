extends Button

@export_enum("Sanbox", "Snow") var location: String


func _ready() -> void:
	self.button_up.connect(change_level)


func change_level():
	GameManager.change_scene(location) 
