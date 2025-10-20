extends Node

var coins_count = 0
@onready var coins_label: Label = $/root/PlayerUI/PlayerStatus/ValuesContainer/Coins

# Увеличение счетчика монет
func add_coin(coin_amount: int):
	coins_count += coin_amount
	coins_label.text = "Coins: " + str(coins_count)
