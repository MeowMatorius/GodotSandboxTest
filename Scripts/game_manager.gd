extends Node

var coins_count = 0
var exp_count = 0
@onready var coins_label: Label = $/root/PlayerUi/PlayerStatus/ValuesContainer/Coins
@onready var exp_label: Label = $/root/PlayerUi/PlayerStatus/ValuesContainer/Expirience


# Увеличение счетчика монет
func add_coin():
	coins_count += 1
	updateLabels()


# Увеличение счетчика опыта
func add_exp(exp_emount):
	coins_count += exp_emount
	updateLabels()


func updateLabels():
	coins_label.text = "Coins: " + str(coins_count)
	exp_label.text = "EXP: " + str(exp_count)
