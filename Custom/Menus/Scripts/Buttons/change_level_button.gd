extends Button

@export_enum("Sandbox", "Snow") var button_location: String


func _ready() -> void:
	button_control()
	update_button_text()
	self.button_up.connect(change_level)
	GameManager._on_location_change.connect(button_control)
	GameManager._on_location_change.connect(update_button_text)


func change_level():
	if GameManager.current_location != button_location:
		GameManager.current_location = button_location
		button_control()
		GameManager.change_scene(button_location)


func button_control():
	if GameManager.current_location != button_location:
		self.disabled = false
	else: 
		self.disabled = true


func update_button_text():
	self.text = button_location
