extends Node

signal on_add_xp
signal on_level_up

# Опыт
var exp_amount: int = 0 # Счетчик опыта
var exp_needed: int = 100 # Количество опыта до повышения уровня
var exp_needed_mult: int = 2 # После повышения уровня требования повышаются

# Повышение уровня
var player_level: int = 1  # Уровень персонажа
var lvl_up_points: int = 0 # Доступные очки повышения характеристик
var added_lvl_up_points: int = 5 # Сколько очков характеристик дают за уровень

# Характеристики
var endurance: int = 10 	# Живучесть
var strenght: int = 10		# Сила
var agility: int = 10		# Ловкость
var inteligence: int = 10	# Интеллект
var luck: int = 10			# Удача


# Увеличение счетчика опыта и повышение уровня
func add_exp(added_exp: int):
	exp_amount += added_exp
	if exp_amount >= exp_needed:
		lvl_up()
	else: pass
	on_add_xp.emit()


# Получение нового уровня и повышение требований
func lvl_up():
		on_level_up.emit()
		player_level += 1
		lvl_up_points += added_lvl_up_points
		exp_needed = exp_needed * exp_needed_mult


func spend_lvl_up_points():
	if lvl_up_points != 0:
		lvl_up_points -= 1


func reset_player_stats():
	player_level = 1
	lvl_up_points = 0
	exp_amount = 0
	exp_needed = 100
	
	endurance = 10
	strenght = 10
	agility = 10
	inteligence = 10
	luck = 10
