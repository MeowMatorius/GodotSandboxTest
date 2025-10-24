extends CanvasLayer

var is_paused: bool = false
@export var pause_time_value: float = 0

signal on_pause
signal on_pause_exit

@export var value_amount: int = 10

@export_category("LVL and EXP Labels")
@export var level_label: Label
@export var exp_label: Label
@export var exp_needed_label: Label

@export_category("Stat Points Labels")
@export var stat_points_label: Label
@export var end_points_label: Label
@export var str_points_label: Label
@export var agl_points_label: Label
@export var int_points_label: Label
@export var lck_points_label: Label


func _ready() -> void:
	exit_pause_menu()


func _process(_delta: float) -> void:
	# Кнопка Паузы
	if Input.is_action_just_pressed("menu"):
		is_paused = !is_paused
		if is_paused: enter_pause_menu()
		else: exit_pause_menu()


# Вход в меню паузы
func enter_pause_menu():
	on_pause.emit()
	is_paused = true
	PauseMenu.show()
	PlayerUI.hide()
	Engine.time_scale = pause_time_value
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


# Выход из паузы
func exit_pause_menu():
	on_pause_exit.emit()
	is_paused = false
	PauseMenu.hide()
	PlayerUI.show()
	Engine.time_scale = 1
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
