extends Node

var coins_amount: int = 0:
	set(value):
		coins_amount = value
		PlayerUI.coins_label.text = str(coins_amount) 

var keys_amount: int = 0:
	set(value):
		keys_amount = value
		PlayerUI.keys_label.text = str(keys_amount) 


# Увеличение счетчиков
func add_collectible(collectible_type:String, amount:int = 1, xp_given:int = 0):
	StatsManager.add_exp(xp_given)
	match collectible_type:
		"coin": coins_amount += amount
		"key":  keys_amount  += amount


func spend_collectible(collectible_type:String, amount:int = 1):
	match collectible_type: 
		"coin": coins_amount -= amount
		"key":  keys_amount  -= amount


func reset_collectibles():
	coins_amount = 0
	keys_amount = 0
