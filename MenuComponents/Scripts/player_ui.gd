extends CanvasLayer

# Поиск подписей из PlayerUI 
@export_category("EXP Labels")
@export var exp_label: Label
@export var lvl_label: Label
@export var exp_progress_bar: ProgressBar

@export_category("Values Labels")
@export var coins_label: Label
@export var keys_label: Label


func _ready() -> void:
	update_exp_bar()
	update_labels()
	StatsManager.connect("on_add_xp", update_labels)
	StatsManager.connect("on_level_up", update_labels)
	StatsManager.on_level_up.connect(update_exp_bar)


func update_exp_bar():
	exp_progress_bar.min_value = StatsManager.exp_amount
	exp_progress_bar.max_value = StatsManager.exp_needed


func update_labels():
	exp_label.text = str(StatsManager.exp_amount)
	exp_progress_bar.value = StatsManager.exp_amount
	exp_progress_bar.max_value = StatsManager.exp_needed
	lvl_label.text = str(StatsManager.player_level)
	coins_label.text = str(InventoryManager.coins_amount)
	keys_label.text = str(InventoryManager.keys_amount)
