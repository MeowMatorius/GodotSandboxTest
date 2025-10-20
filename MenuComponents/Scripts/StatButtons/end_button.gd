extends Button

@onready var stats_manager = StatsManager

@onready var current_stat = stats_manager.endurance
@onready var current_label = "End"

@onready var label: Label = get_parent().get_node(current_label + "Points")

func _ready() -> void:
	label.text = str(current_stat)

func _on_button_up() -> void:
	if stats_manager.pointsAmount != 0:
		current_stat += 1
		label.text = str(current_stat)
		stats_manager.pointsAmount -= 1
		stats_manager.update_labels()
