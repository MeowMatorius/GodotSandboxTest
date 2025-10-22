extends CanvasLayer

var is_paused: bool = false
var pause_slow_time: float = 0

signal on_pause
signal on_pause_exit

@onready var tab_bar: TabBar = $MenuContainer/TabBar

@export_category("Main Manu Button Values")
@export var coins_amount: int = 50
@export var exp_amount: int = 50
@export var damage_amount: int = 10
@export var heal_amount: int = 10

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
	PauseMenu.hide()
	StatsManager.on_add_xp.connect(update_labels)
	StatsManager.on_level_up.connect(update_labels)


func _process(_delta: float) -> void:
	# Кнопка Паузы
	if Input.is_action_just_pressed("menu"):
		toggle_pause_menu()


# Функция при нажатии кнопки паузы
func toggle_pause_menu():
	if is_paused: exit_pause_menu()
	else: enter_pause_menu()


# Выход из паузы
func exit_pause_menu():
	on_pause_exit.emit()
	hide()
	is_paused = false
	Engine.time_scale = 1
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	

# Вход в меню паузы
func enter_pause_menu():
	on_pause.emit()
	show()
	is_paused = true
	Engine.time_scale = pause_slow_time
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func update_labels():
	# Уровень и опыт
	level_label.text   		= str(StatsManager.player_level)
	exp_label.text     		= str(StatsManager.exp_amount)
	exp_needed_label.text  	= str(StatsManager.exp_needed)
	stat_points_label.text 	= str(StatsManager.lvl_up_points)
	
	# Характеристики
	end_points_label.text 	= str(StatsManager.endurance)
	str_points_label.text 	= str(StatsManager.strenght)
	agl_points_label.text 	= str(StatsManager.agility)
	int_points_label.text 	= str(StatsManager.inteligence)
	lck_points_label.text 	= str(StatsManager.luck)


func stat_manager_update():
	StatsManager.spend_lvl_up_points()
	update_labels()


#region Кнопки повышения характеристик

func _on_end_button_button_up() -> void:
	if StatsManager.lvl_up_points > 0:
		StatsManager.endurance += 1
		stat_manager_update()


func _on_str_button_button_up() -> void:
	if StatsManager.lvl_up_points > 0:
		StatsManager.strenght += 1
		stat_manager_update()


func _on_agl_button_button_up() -> void:
	if StatsManager.lvl_up_points > 0:
		StatsManager.agility += 1
		stat_manager_update()


func _on_int_button_button_up() -> void:
	if StatsManager.lvl_up_points > 0:
		StatsManager.inteligence += 1
		stat_manager_update()


func _on_lck_button_button_up() -> void:
	if StatsManager.lvl_up_points > 0:
		StatsManager.luck += 1
		stat_manager_update()
#endregion


#region Управление кнопками tab: MainMenu

func _on_resume_button_button_up() -> void:
	exit_pause_menu()


func _on_reload_button_button_up() -> void:
	exit_pause_menu()
	GameManager.player_reset(true)
	get_tree().reload_current_scene() 


func _on_exit_button_button_up() -> void:
	get_tree().quit()


func _on_give_coins_button_button_up() -> void:
	InventoryManager.add_coins(coins_amount)


func _on_give_exp_button_button_up() -> void:
	StatsManager.add_exp(exp_amount)


func _on_damage_player_button_button_up() -> void:
	HealthManager.take_damage(damage_amount)


func _on_heal_player_button_button_up() -> void:
	HealthManager.give_heal(heal_amount)
#endregion


#region Управление кнопками tab: World Map

func _on_forest_button_button_up() -> void:
	GameManager.change_scene('Forest')


func _on_mountain_button_button_up() -> void:
	GameManager.change_scene('Mountain')

#endregion
