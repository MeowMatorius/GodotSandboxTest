extends CanvasLayer

@onready var pause_menu: PauseMenu = PauseMenu
@onready var player_ui: PlayerUI = PlayerUI
@onready var game_manager: GameManager = GameManager
@onready var inventory_manager: InventoryManager = InventoryManager
@onready var stats_manager: StatsManager = StatsManager
@onready var health_manager: HealthManager = HealthManager


# PlayerUI labels
@onready var exp_label: Label = find_child("Expirience")
@onready var lvl_label: Label = find_child("Level")
@onready var exp_needed_label: Label = find_child("ExpNedeed")

func _ready() -> void:
	stats_manager.connect("on_add_xp", update_labels)
	stats_manager.connect("on_level_up", update_labels)


func update_labels():
	exp_label.text = "EXP: " + str(stats_manager.exp_count)
	exp_needed_label.text = "lvl UP on: " + str(int(stats_manager.exp_needed))
	lvl_label.text = "Level: " + str(stats_manager.playerlevel)
