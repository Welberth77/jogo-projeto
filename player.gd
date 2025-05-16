extends CharacterBody2D

# Importando animações
@onready var animation: AnimationPlayer = $AnimationPlayer
# Velocidade do personagem
@export var speed: int = 200

var last_direction: String = "idle_down"  # Direção inicial

# essa função é verificada a cada frame, 60x por segundo
func _physics_process(_delta: float) -> void:
	move()
	animate()
	
# Movimentação do player
func move() -> void:
	# Recebe um direction de um vetor de 2 dimensões (x,y)
	var direction_vector: Vector2 = Vector2(
		# Retorna a força em que o player esta pressionando o input
		# Essa força retorna um valor entre 0 e 1
		# left (-1), rigth (+1), idle(0), down(+1), up(-1)
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()
	
	# Salva a última direção pressionada
	if direction_vector != Vector2.ZERO:
		if abs(direction_vector.x) > abs(direction_vector.y):
			last_direction = "right" if direction_vector.x > 0 else "left"
		else:
			last_direction = "down" if direction_vector.y > 0 else "up"
			
	# Define a velocidade do corpo
	velocity = direction_vector * speed
	move_and_slide()

# Função para a animação
func animate() -> void:
	if velocity != Vector2.ZERO:
		# Se a velocidade for diferente de zero
		animation.play("run_" + last_direction)
	else:
		animation.play("idle_" + last_direction)
