extends CharacterBody2D

enum State {IDLE, RUNNING, JUMPING, DASHING, ATTACKING}
var current_state: State = State.IDLE

@onready var player_animations: AnimatedSprite2D = $AnimatedSprite2D

@onready var dash_cooldown_timer: Timer = $StateComponents/DashCooldownTimer
@onready var attack_cooldown_timer: Timer = $StateComponents/AttackCooldownTimer
@onready var dash_cooldown_bar: TextureProgressBar = $StateComponents/DashCooldownBar


signal on_attack
signal on_dash

var direction: float
@export var player_speed: float = 170.0
@export var start_movement_speed: float = 0.5
@export var stop_movement_speed: float = 0.1

@export_category("Dash and Attack")
@export var dash_speed: float = 400.0
@export var dash_duration: float = 0.3
@export var dash_cooldown: float = 1
@export var combat_speed: float = 10.0
@export var attack_cooldown: float = 0.2

@export_category("Jump and Gravity")
var gravity: float
var jumps_count: int = 0
var is_gliding: bool = false
@export var jump_velocity: float = -300.0
@export var double_jump_velocity: float = -200.0
@export var max_jumps_count: int = 2


func _ready() -> void:
	gravity = ProjectSettings.get_setting("physics/2d/default_gravity") 
	
	attack_cooldown_timer.timeout.connect(_on_dash_cooldown_timer_timeout)
	attack_cooldown_timer.timeout.connect(_on_attack_cooldown_timer_timeout)
	
	dash_cooldown_bar.hide()
	dash_cooldown_bar.max_value = dash_cooldown


func _physics_process(delta: float) -> void:

	if !dash_cooldown_timer.is_stopped():
		dash_cooldown_bar.value = dash_cooldown_timer.time_left
	else: dash_cooldown_bar.hide()
	
	
	handle_horizontal_movement(delta)
	apply_gravity(delta) # На все статусы применяется гравитация (Если velocity.y не перезаписывается)
	
	
	match current_state:
		State.IDLE, State.RUNNING:
			handle_run_and_idle_state()
			handle_jumping()
			handle_dash()
			handle_attack()
		State.JUMPING:
			handle_jumping()
			handle_run_and_idle_state()
			handle_dash()
			handle_attack()
		State.DASHING:
			pass
		State.ATTACKING:
			handle_attack()
	
	sprite_turn() # Поворот спрайта
	move_and_slide() # Встроенная функция коллизии


func handle_horizontal_movement(_delta: float) -> void:
	if current_state == State.DASHING or current_state == State.ATTACKING:
		return
	
	direction = Input.get_axis("move_left", "move_right")
	if direction != 0:
		velocity.x = lerp(velocity.x, direction * player_speed, start_movement_speed)
	else:
		velocity.x = move_toward(velocity.x, 0, player_speed * stop_movement_speed)


func apply_gravity(delta: float) -> void:
	if not is_on_floor():
		if current_state != State.DASHING and !is_gliding:
			velocity.y += gravity * delta
		else: # Особые условия гравитации
			velocity.y = gravity * 2 * delta


func handle_run_and_idle_state() -> void:
	if direction != 0:
		player_animations.play("run")
		current_state = State.RUNNING
	else:
		player_animations.play("idle")
		current_state = State.IDLE


func handle_jumping() -> void:
	if is_on_floor():
		jumps_count = 0
	
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			jumps_count += 1
			velocity.y = jump_velocity
			current_state = State.JUMPING
			player_animations.play("jump")
		elif jumps_count < max_jumps_count:
			jumps_count += 1
			velocity.y = double_jump_velocity
			current_state = State.JUMPING
			player_animations.play("jump")
		else: 
			velocity.y = 0
			is_gliding = true
	
	if Input.is_action_just_released("jump") or is_on_floor():
		is_gliding = false

	if not is_on_floor() and current_state != State.DASHING and current_state != State.ATTACKING:
		player_animations.play("jump")


func handle_dash() -> void:
	if Input.is_action_just_pressed("dash") and current_state != State.DASHING and dash_cooldown_timer.is_stopped():
		current_state = State.DASHING
		player_animations.play("dash")
		on_dash.emit()
		
		velocity.x = lerp(velocity.x, direction * dash_speed, start_movement_speed)
		velocity.y = 0

		await get_tree().create_timer(dash_duration).timeout
		current_state = State.IDLE

		dash_cooldown_timer.start(dash_cooldown)
		dash_cooldown_bar.show()

func _on_dash_cooldown_timer_timeout() -> void:
	pass


func handle_attack() -> void:
	if Input.is_action_just_pressed("attack") and current_state != State.ATTACKING and attack_cooldown_timer.is_stopped():
			
		current_state = State.ATTACKING
		player_animations.play("attack")
		on_attack.emit()
		
		velocity.x = lerp(velocity.x, direction * combat_speed, start_movement_speed)
		velocity.y = 0
		
		await player_animations.animation_finished
		current_state = State.IDLE
		attack_cooldown_timer.start(attack_cooldown)

func _on_attack_cooldown_timer_timeout() -> void:
	pass # Можно прописать доп логику по окончанию таймера


func sprite_turn() -> void:
	if direction > 0:
		player_animations.flip_h = false
	elif direction < 0:
		player_animations.flip_h = true
