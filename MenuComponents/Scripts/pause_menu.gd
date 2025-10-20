extends CanvasLayer

@onready var pause_menu = PauseMenu
@onready var game_manager = GameManager
@onready var stats_manager = StatsManager


var paused = false
var coin_amount = 50
var exp_amount = 50
var pauseTime = 0


func _ready() -> void:
	pause_menu.hide()


func _process(_delta: float) -> void:
	# Кнопка Паузы
	if Input.is_action_just_pressed("menu"):
		pauseMenu()
	
	# Кнопка Магазина
	if Input.is_action_just_pressed("shop"):
		pass


# Меню Паузы
func pauseMenu():
	if paused:
		resume()
	else:
		pause()

func resume():
	pause_menu.hide()
	Engine.time_scale = 1
	paused = false

func pause():
	pause_menu.show()
	Engine.time_scale = pauseTime
	paused = true


# Логика кнопок Main Menu
func _on_resume_button_up() -> void:
	resume()

func _on_exit_button_up() -> void:
	get_tree().quit()

func _on_give_coins_button_up() -> void:
	game_manager.add_coin(coin_amount)

func _on_give_exp_button_up() -> void:
	stats_manager.add_exp(exp_amount)

func _on_damage_player_button_up() -> void:
	pass # Replace with function body.
