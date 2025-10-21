extends Node

var coins_amount: int = 0
var keys_amount: int = 0
var added_exp: int = 10

signal on_coin_collected
signal on_keys_collected


# Увеличение счетчика монет
func add_coins(added_coins: int):
	StatsManager.add_exp(added_exp)
	coins_amount += added_coins
	on_coin_collected.emit()

# Увеличение счетчика ключей
func add_keys(added_keys: int):
	keys_amount += added_keys
	on_keys_collected.emit()
