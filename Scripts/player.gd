extends CharacterBody2D


const SPEED = 120.0
const JUMP_VELOCITY = -300.0
const DOUBLE_JUMP_VELOCITY = -100.0
var count_jump = 1

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Добавляем гравитацию
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Управление Прыжком
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		count_jump = 1
		
	if Input.is_action_just_pressed("jump") and not is_on_floor() and count_jump == 1:
		count_jump = 0
		velocity.y = JUMP_VELOCITY - DOUBLE_JUMP_VELOCITY

	# Получение кнопок движения и управление ускорением/замедлением
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


# Поворот спрайта
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Анимации игрока
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
