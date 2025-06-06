extends CharacterBody2D
class_name Character

var _state_machine
var is_attacking: bool = false
var is_dead: bool = false

@export_category("Variaveis")
@export var _move_speed: float = 64.0

@export var _aceleracao: float = 0.4
@export var _friccao: float = 0.8 

@export_category("Objetos")
@export var attack_timer: Timer = null
@export var _animation_tree: AnimationTree = null

func _ready() -> void:
	_animation_tree.active = true
	_state_machine = _animation_tree["parameters/playback"]
	
	
func _physics_process(_delta: float) -> void:
	if is_dead:
		return 
		
	move()
	attack()
	animate()
	move_and_slide()

func move():
	var _direction: Vector2 = Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	)
	
	if _direction != Vector2.ZERO:
		_animation_tree["parameters/idle/blend_position"] = _direction
		_animation_tree["parameters/run/blend_position"] = _direction
		_animation_tree["parameters/attack/blend_position"] = _direction
		
		velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _aceleracao)
		velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _aceleracao)
		return
	
	velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _friccao)
	velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _friccao)

func attack():
	if Input.is_action_just_pressed("attack") and is_attacking == false:
		set_physics_process(false)
		attack_timer.start()
		is_attacking = true
 
func animate():
	if is_attacking == true:
		_state_machine.travel("attack")
		return
	if velocity.length() > 5:
		_state_machine.travel("run")
		return
	
	_state_machine.travel("idle")

func _on_attack_timer_timeout() -> void:
	is_attacking = false
	set_physics_process(true)


func _on_attack_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		body.atualizar_vida()

func die():
	is_dead = true
	_state_machine.travel("dead")
	# Tela de morte e botão renascer para ser feita
	# espera 1 segundo para reiniciar o jogo novamente
	await get_tree().create_timer(1.0).timeout
	get_tree().reload_current_scene()
