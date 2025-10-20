extends Node

@onready var health_manager: HealthManager = HealthManager
@onready var game_manager: GameManager = GameManager

signal on_add_xp
signal on_level_up
var currentStat: String

# Опыт
var exp_count: int = 0 # Счетчик опыта
var exp_needed: int = 100 # Количество опыта до повышения уровня
var exp_multiplier: float = 1.5 # После повышения уровня требования повышаются

# Повышение уровня
var playerlevel: int = 1  # Уровень персонажа
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
	on_add_xp.emit()
	exp_count += exp_emount
	if exp_count >= exp_needed:
		lvl_up()


# Получение нового уровня и повышение требований
func lvl_up():
		on_level_up.emit()
		playerlevel += 1
		pointsAmount += pointsForLvl
		exp_needed = exp_needed * exp_multiplier


func upd_lvl_points():
	if pointsAmount != 0:
		pointsAmount -= 1
