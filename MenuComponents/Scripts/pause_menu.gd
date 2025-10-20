extends CanvasLayer

var paused: bool = false
var coin_amount: int = 50
var exp_amount: int = 50
var pauseTime: float = 0

# Надписи для опыта и уровня
@onready var level_label:  		Label = PauseMenu.find_child("LevelLabel")
@onready var exp_label:    		Label = PauseMenu.find_child("ExpLabel", true)
@onready var exp_needed_label:  Label = PauseMenu.find_child("ExpNeededLabel", true)
@onready var stat_points_label: Label = PauseMenu.find_child("StatPointsLabel", true)

# Надписи для характеристик
@onready var end_points_label: 	Label = PauseMenu.find_child("EndPointsLabel")
@onready var str_points_label: 	Label = PauseMenu.find_child("StrPointsLabel")
@onready var agl_points_label: 	Label = PauseMenu.find_child("AglPointsLabel")
@onready var int_points_label: 	Label = PauseMenu.find_child("IntPointsLabel")
@onready var lck_points_label: 	Label = PauseMenu.find_child("LckPointsLabel")


func _ready() -> void:
	hide()
	StatsManager.connect("on_add_xp", update_labels)
	StatsManager.connect("on_level_up", update_labels)


func _process(_delta: float) -> void:
	# Кнопка Паузы
	if Input.is_action_just_pressed("menu"):
		pauseMenu()


# Меню Паузы
func pauseMenu():
	if paused:
		resume()
	else:
		pause()

func resume():
	hide()
	Engine.time_scale = 1
	paused = false

func pause():
	show()
	Engine.time_scale = pauseTime
	paused = true


func update_labels():
	# Уровень и опыт
	level_label.text   		= str(StatsManager.playerlevel)
	exp_label.text     		= str(StatsManager.exp_count)
	exp_needed_label.text   = str(StatsManager.exp_needed)
	stat_points_label.text  = str(StatsManager.pointsAmount)
	
	# Характеристики
	end_points_label.text = str(StatsManager.endurance)
	str_points_label.text = str(StatsManager.strenght)
	agl_points_label.text = str(StatsManager.agility)
	int_points_label.text = str(StatsManager.inteligence)
	lck_points_label.text = str(StatsManager.luck)

func stat_manager_update():
	StatsManager.upd_lvl_points()
	update_labels()

# Логика кнопок Main Menu
func _on_resume_button_up() -> void:
	resume()

func _on_exit_button_up() -> void:
	get_tree().quit()

func _on_give_coins_button_up() -> void:
	InventoryManager.add_coin(coin_amount)

func _on_give_exp_button_up() -> void:
	StatsManager.add_exp(exp_amount)

func _on_damage_player_button_up() -> void:
	HealthManager._damage()


# Логика кнопок повышения характеристик
func _on_end_button_button_up() -> void:
	if StatsManager.pointsAmount > 0:
		StatsManager.endurance += 1
		stat_manager_update()

func _on_str_button_button_up() -> void:
	if StatsManager.pointsAmount > 0:
		StatsManager.strenght += 1
		stat_manager_update()

func _on_agl_button_button_up() -> void:
	if StatsManager.pointsAmount > 0:
		StatsManager.agility += 1
		stat_manager_update()

func _on_int_button_button_up() -> void:
	if StatsManager.pointsAmount > 0:
		StatsManager.inteligence += 1
		stat_manager_update()

func _on_lck_button_button_up() -> void:
	if StatsManager.pointsAmount > 0:
		StatsManager.luck += 1
		stat_manager_update()
