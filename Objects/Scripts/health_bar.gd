extends ProgressBar

var damage_amount: int = 10


func _ready() -> void:
	# Прослушивание сигнала о получении урона от менеджера здоровья
	# Если сигнал получен вызывается функция jopa
	HealthManager.connect("on_take_damage", jopa)

# Функция которая отрабатывает при получении сигнала
func jopa():
	print("jopa")

func _process(_delta: float) -> void:
	#if Input.is_action_just_pressed("attack"):
		#HealthManager.take_damage(damage_amount)
		
	if HealthManager.health_bar.value <= 0:
		HealthManager.death()
