extends Node

var coins_count = 0
var exp_count = 0
@onready var coins_label: Label = $/root/PlayerUi/PlayerStatus/ValuesContainer/Coins
@onready var exp_label: Label = $/root/PlayerUi/PlayerStatus/ValuesContainer/Expirience
@onready var health_bar: ProgressBar = $/root/PlayerUi/PlayerStatus/StatusContainer/HealthContainer/HealthBar

#func _ready() -> void:


func _process(delta: float) -> void:
	if health_bar.value <= 0:
		death()

# Увеличение счетчика монет
func add_coin(coin_amount: int):
	coins_count += coin_amount
	updateLabels()


# Увеличение счетчика опыта
func add_exp(exp_emount):
	exp_count += exp_emount
	updateLabels()


func updateLabels():
	coins_label.text = "Coins: " + str(coins_count)
	exp_label.text = "EXP: " + str(exp_count)

func death():
	health_bar.value = 100
	get_tree().reload_current_scene()
	
