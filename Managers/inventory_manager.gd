extends Node

var coins_amount: int = 0
var keys_amount: int = 0


# Увеличение счетчиков
func add_collectible(collectible_type:String, amount:int = 1, xp_given:int = 0):
	StatsManager.add_exp(xp_given)
	match collectible_type:
		"coin": coins_amount += amount
		"key":  keys_amount  += amount
	PlayerUI.update_labels()


func spend_collectible(collectible_type:String, amount:int = 1):
	match collectible_type: 
		"coin": coins_amount -= amount
		"key":  keys_amount  -= amount
	PlayerUI.update_labels()

func reset_collectibles():
	coins_amount = 0
	keys_amount = 0
