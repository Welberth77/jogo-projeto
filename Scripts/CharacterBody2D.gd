extends CharacterBody2D

var _state_machine

@export_category("Variaveis")
@export var _move_speed: float = 64.0
# Auxiliam na aceleração e na parada gradativa do personagem
@export var _aceleracao: float = 0.2
@export var _friccao: float = 0.2

@export_category("objetos")
@export var _animation_tree: AnimationTree = null

func _ready() -> void:
	_state_machine = _animation_tree["parameters/playback"]

# Essa função é verificada a cada frame
func _physics_process(_delta: float) -> void:
	_move()
	_animate()
	move_and_slide()

func _move() -> void:
# Movimentação do personagem
	var _direction: Vector2 = Vector2(
		# Movimentação no eixo x
		Input.get_axis("move_left", "move_right"),
		# Movimentação no eixo y
		Input.get_axis("move_up", "move_down")
		)
	
	if _direction != Vector2.ZERO:
		# Pegando a direção do personagem na animação
		_animation_tree["parameters/idle/blend_position"] = _direction
		_animation_tree["parameters/walk/blend_position"] = _direction
		
		# Aceleração gradativa no eixo x e y
		velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _aceleracao)
		velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _aceleracao)
		return
	
	# Desaceleração de forma gradativa no eixo x e y
	velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _friccao)
	velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _friccao)

func _animate() -> void:
	# Se a velocidade for maior do que 1, sig que ele est andando
	if velocity.length() > 2:
		_state_machine.travel("walk")
		return
	
	# Personagem está parado
	_state_machine.travel("idle")
