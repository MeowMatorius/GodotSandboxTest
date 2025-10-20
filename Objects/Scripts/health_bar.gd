extends ProgressBar

var damage_amount = 10
func _ready() -> void:
	HealthManager.connect("on_take_damage", jopa)
	
func jopa():
	print("jopa")

func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("attack"):
		#HealthManager.take_damage(damage_amount)
		
	if HealthManager.health_bar.value <= 0:
		HealthManager.death()
