extends Button

@export_enum(
	"endurance", 
	"strenght", 
	"agility",
	"inteligence",
	"luck"
) var current_stat: String


func _ready() -> void:
	self.button_up.connect(up_stat_button)


func up_stat_button() -> void:
	var current_value:int = StatsManager.get(current_stat)
	if StatsManager.lvl_up_points != 0:
		current_value += 1
		StatsManager.spend_lvl_up_points()
		StatsManager.set(current_stat, current_value)
