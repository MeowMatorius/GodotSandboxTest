extends Node

signal _on_lvl_up
var previous_exp_needed: int = 0

# Опыт
var exp_amount: int = 0: # Счетчик опыта
	set(value):
		exp_amount = value
		
		PauseMenu.exp_label.text = str(exp_amount)
		PlayerUI.exp_label.text = str(exp_amount)
		
		PlayerUI.exp_progress_bar.min_value = previous_exp_needed
		PlayerUI.exp_progress_bar.max_value = exp_needed
		PlayerUI.exp_progress_bar.value = exp_amount

var exp_needed: int = 100: # Количество опыта до повышения уровня
	set(value):
		exp_needed = value
		PauseMenu.exp_needed_label.text = str(exp_needed)
		

var exp_needed_mult: int = 2 # После повышения уровня требования повышаются

# Повышение уровня
var player_level: int = 1:  # Уровень персонажа
	set(value):
		player_level = value
		PauseMenu.level_label.text = str(player_level)
		PlayerUI.lvl_label.text = str(player_level)

var lvl_up_points: int = 0: # Доступные очки повышения характеристик
	set(value):
		lvl_up_points = value
		PauseMenu.stat_points_label.text = str(lvl_up_points)

var added_lvl_up_points: int = 5 # Сколько очков характеристик дают за уровень

# Характеристики
var endurance: int = 10: # Живучесть
	set(value):
		endurance = value
		PauseMenu.end_points_label.text = str(endurance)

var strenght: int = 10: # Сила
	set(value):
		strenght = value
		PauseMenu.str_points_label.text = str(strenght)

var agility: int = 10: # Ловкость
	set(value):
		agility = value
		PauseMenu.agl_points_label.text = str(agility)

var inteligence: int = 10: # Интеллект
	set(value):
		inteligence = value
		PauseMenu.int_points_label.text = str(inteligence)

var luck: int = 10: # Удача
	set(value):
		luck = value
		PauseMenu.lck_points_label.text = str(luck)


func _ready() -> void:
	_on_lvl_up.connect(update_progress_bar)


# Увеличение счетчика опыта и повышение уровня
func add_exp(added_exp: int):
	exp_amount += added_exp
	if exp_amount >= exp_needed:
		lvl_up()


# Получение нового уровня и повышение требований
func lvl_up():
		player_level += 1
		lvl_up_points += added_lvl_up_points
		
		previous_exp_needed = exp_needed
		exp_needed = exp_needed * exp_needed_mult
		
		_on_lvl_up.emit()


func update_progress_bar():
	PlayerUI.exp_progress_bar.min_value = previous_exp_needed
	PlayerUI.exp_progress_bar.max_value = exp_needed
	PlayerUI.exp_progress_bar.value = exp_amount


func spend_lvl_up_points():
	if lvl_up_points != 0:
		lvl_up_points -= 1


func reset_player_stats():
	player_level = 1
	lvl_up_points = 0
	
	exp_amount = 0
	previous_exp_needed = 0
	exp_needed = 100
	
	endurance = 10
	strenght = 10
	agility = 10
	inteligence = 10
	luck = 10
