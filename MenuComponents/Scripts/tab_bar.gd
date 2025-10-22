extends TabBar

@export var start_from_custom_start_tab: bool = false
@export var custom_start_tab: int = 0
@export var checkbox: CheckBox
@export var option_button: OptionButton


func _ready() -> void:
	hide_non_active_tabs()
	get_child(custom_start_tab).show()
	PauseMenu.on_pause_exit.connect(change_current_tab_to_custom)


func _on_tab_clicked(tab: int) -> void:
	current_tab = tab
	change_current_tab()


func _on_check_box_button_up() -> void:
	test()


func test():
	if start_from_custom_start_tab: check_for_custom_tab_off()
	else: check_for_custom_tab_on()


func check_for_custom_tab_off():
	start_from_custom_start_tab = false
	option_button.disabled = true


func check_for_custom_tab_on():
	start_from_custom_start_tab = true
	option_button.disabled = false
	custom_start_tab = option_button.get_selected_id()


func _on_option_button_item_selected(index: int) -> void:
	custom_start_tab = index


func change_current_tab_to_custom():
	if start_from_custom_start_tab:
		current_tab = custom_start_tab
		change_current_tab()


func change_current_tab():
	hide_non_active_tabs()
	get_child(current_tab).show()


func hide_non_active_tabs():
	for child in get_children(false):
		child.hide()
