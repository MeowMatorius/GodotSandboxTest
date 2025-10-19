extends CharacterBody2D


const SPEED = 120.0
const boost = 2
const JUMP_VELOCITY = -300.0
const DOUBLE_JUMP_VELOCITY = -100.0
var count_jump = 1
var dash = false
var direction
var dash_is_processing = false

@onready var animated_sprite = $AnimatedSprite2D
@onready var timer: Timer = $Timer

func _physics_process(delta: float) -> void:
	# Добавляем гравитацию
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Управление Прыжком
	if Input.is_action_just_pressed("jump") and is_on_floor() and dash == false:
		velocity.y = JUMP_VELOCITY
		count_jump = 1
		
	if Input.is_action_just_pressed("jump") and not is_on_floor() and count_jump == 1 and dash == false:
		count_jump = 0
		velocity.y = JUMP_VELOCITY - DOUBLE_JUMP_VELOCITY
		

	# Получение кнопок движения и управление ускорением/замедлением
	direction = Input.get_axis("move_left", "move_right")
	#if Input.is_action_just_pressed("dash") and is_on_floor():
		#dash = true
			#
		##timer.start()
	#elif direction and dash == false:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		
	# Рывок
	#if Input.is_action_just_pressed("dash") and is_on_floor():
		#velocity.x = direction * SPEED * boost
		#dash = true
		#timer.start()
		

	move_and_slide()


		
# Поворот спрайта
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Анимации игрока
	if is_on_floor():
		if direction == 0 and dash == false:
			animated_sprite.play("idle")
			velocity.x = move_toward(velocity.x, 0, SPEED)
		elif Input.is_action_just_pressed("dash") and direction != 0:
			animated_sprite.play("dash")
			velocity.x = direction * SPEED * boost
			dash = true
		elif dash == false and direction:
			animated_sprite.play("run")
			velocity.x = direction * SPEED
	elif dash == false:
		animated_sprite.play("jump")


#func _on_timer_timeout() -> void:
	#dash = false


func _on_animated_sprite_2d_animation_finished() -> void:
	if (animated_sprite.animation == "dash"):
		dash = false
