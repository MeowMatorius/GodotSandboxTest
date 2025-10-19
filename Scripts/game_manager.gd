extends Node

var score = 0
var paused = false

@onready var coins: Label = %PlayerUI/PlayerStatus/ValuesContainer/Coins
@onready var pause_menu: CanvasLayer = %PauseMenu

# Увеличение счетчика монет
func add_point():
	score += 1
	print(score)
	coins.text = "Coins: " + str(score)


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
		pause_menu.hide()
		Engine.time_scale = 1
		paused = false
	else:
		pause_menu.show()
		Engine.time_scale = 0
		paused = true
