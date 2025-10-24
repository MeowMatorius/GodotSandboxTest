extends Button

@export var exp_value_amount: int = 0

@export_category("Collectibles")
@export_enum("none", "coin", "key") var collectible_type: String = "none"
@export var collectible_value_amount: int = 0

@export_category("Effects")
@export_enum("none", "heal", "damage") var effect_type: String = "none"
@export var effect_value_amount: int = 0


func _ready() -> void:
	self.button_up.connect(cheat_button_logic)


func cheat_button_logic() -> void:
	if collectible_type != "none":	
		InventoryManager.add_collectible(
				collectible_type, collectible_value_amount, 0)
	
	if effect_type != "none":	
		match effect_type:
			"damage": HealthManager.take_damage(effect_value_amount)
			"heal": HealthManager.give_heal(effect_value_amount)
	
	if exp_value_amount != 0:
		StatsManager.add_exp(exp_value_amount)
