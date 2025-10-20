extends CharacterBody2D

@export var SPEED: float = 120.0
@export var boost: float = 2.0
@export var JUMP_VELOCITY: float = -300.0
@export var DOUBLE_JUMP_VELOCITY: float = -100.0
@export var count_jump: int = 1
var dash: bool = false
var jump: bool = false
var dash_is_processing: bool = false

var direction

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer
@onready var health_bar: ProgressBar = $/root/PlayerUi/PlayerStatus/StatusContainer/HealthContainer/HealthBar


func _physics_process(delta: float) -> void:
	# Добавляем гравитацию
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Управление Прыжком
	if Input.is_action_just_pressed("jump") and is_on_floor() and dash == false:
		velocity.y = JUMP_VELOCITY
		count_jump = 1
		jump = true
		
	if Input.is_action_just_pressed("jump") and not is_on_floor() and count_jump == 1 and dash == false:
		count_jump = 0
		velocity.y = JUMP_VELOCITY - DOUBLE_JUMP_VELOCITY
		jump = true
		

	#if Input.is_action_just_pressed("attack") and is_on_floor() and dash == false:
		#
		
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
	if dash == false:
		if direction > 0:
			animated_sprite.flip_h = false
		elif direction < 0:
			animated_sprite.flip_h = true
	
	# Анимации игрока
	if is_on_floor():
		if direction == 0 and dash == false:
			animated_sprite.play("idle2")
			velocity.x = move_toward(velocity.x, 0, SPEED)
		elif Input.is_action_just_pressed("dash") and direction != 0:
			animated_sprite.play("dash3")
			velocity.x = direction * SPEED * boost
			dash = true
		elif dash == false and direction:
			animated_sprite.play("run2")
			velocity.x = direction * SPEED
		
	elif dash == false and jump == true and direction:
		animated_sprite.play("jump2")
		velocity.x = direction * SPEED


#func _on_timer_timeout() -> void:
	#dash = false


func _on_animated_sprite_2d_animation_finished() -> void:
	if (animated_sprite.animation == "dash3"):
		dash = false
		
	if (animated_sprite.animation == "jump2"):
		jump = false
		
