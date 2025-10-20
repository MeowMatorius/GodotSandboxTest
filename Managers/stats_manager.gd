extends Node

@onready var player_values = $/root/PlayerUI/PlayerStatus/ValuesContainer
@onready var exp_label: Label = player_values.find_child("Expirience")
@onready var lvl_label: Label = player_values.find_child("Level")
@onready var exp_needed_label: Label = player_values.find_child("ExpNedeed")

@onready var player_stats = $/root/PauseMenu/MenuContainer/TabBar/Tab2/HBoxContainer
@onready var lvl_stat: Label = player_stats.find_child("LevelLabel")
@onready var exp_stat: Label = player_stats.find_child("ExpLabel")
@onready var stat_points: Label = player_stats.find_child("StatPoints")


# Опыт
var exp_count: int = 0 # Счетчик опыта
var exp_needed: float = 100.0 # Количество опыта до повышения уровня
var exp_multiplier: float = 1.5 # После повышения уровня требования повышаются

# Повышение уровня
var Playerlevel: int = 1  # Уровень персонажа
var pointsForLvl: int = 5 # Очки характеристик за уровень
var pointsAmount: int = 0 # Текущие очки для распределения

# Характеристики
var endurance: int = 10 	# Живучесть
var strenght: int = 10		# Сила
var agility: int = 10		# Ловкость
var inteligence: int = 10	# Интеллект
var luck: int = 10			# Удача


# Увеличение счетчика опыта и повышение уровня
func add_exp(exp_emount):
	exp_count += exp_emount
	update_labels()
	if exp_count >= exp_needed:
		lvl_up()


# Получение нового уровня и повышение требований
func lvl_up():
		Playerlevel += 1
		pointsAmount += pointsForLvl
		exp_needed = exp_needed * exp_multiplier
		update_labels()

# Обновление надписей
func update_labels():
	exp_label.text = "EXP: " + str(exp_count)
	exp_needed_label.text = "lvl UP on: " + str(int(exp_needed))
	lvl_label.text = "Level: " + str(Playerlevel)
	lvl_stat.text = "Level: " + str(Playerlevel)
	exp_stat.text = "EXP: " + str(exp_count)
	stat_points.text = "Points: " + str(pointsAmount)
