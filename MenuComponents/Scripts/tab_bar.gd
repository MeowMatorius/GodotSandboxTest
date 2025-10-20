extends TabBar

var currentTab

func _ready() -> void:
	hide_tabs()
	get_child(0).show()

func _on_tab_clicked(tab: int) -> void:
	currentTab = tab
	hide_tabs()
	get_child(currentTab).show()

func hide_tabs():
	for child in get_children(false):
		child.hide()
