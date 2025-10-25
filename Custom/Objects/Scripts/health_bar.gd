extends ProgressBar

var damage_amount: int = 10


func _ready() -> void:
	# Прослушивание сигнала о получении урона от менеджера здоровья
	# Если сигнал получен вызывается функция jopa
	HealthManager.connect("on_take_damage", jopa)

# Функция которая отрабатывает при получении сигнала
func jopa():
	if HealthManager.health_bar.value <= 0:
		HealthManager.death()
