extends Area2D

@export var health_bar: ProgressBar

@export var exp_amount: int = 10

func _on_body_entered(body: CharacterBody2D) -> void:
	body.on_attack.connect(jopa2)
	

func jopa2():
	HealthManager.take_damage_test(health_bar, 40)
	if health_bar.value <= 0:
		StatsManager.add_exp(exp_amount)
		get_parent().queue_free()


func _on_body_exited(body: Node2D) -> void:
	body.on_attack.disconnect(jopa2)
