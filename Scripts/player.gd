extends CharacterBody2D

# Importando animações
@onready var animation: AnimationPlayer = $AnimationPlayer

# Velocidade do personagem
@export var speed: int = 200

var last_direction: String = "down"  # Direção inicial

# essa função é verificada a cada frame, 60x por segundo
func _physics_process(_delta: float) -> void:
	move()
	animate()
	
# Movimentação do player
func move() -> void:
	var direction_vector: Vector2 = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()
	
	if direction_vector != Vector2.ZERO:
		if abs(direction_vector.x) > abs(direction_vector.y):
			last_direction = "right" if direction_vector.x > 0 else "left"
		else:
			last_direction = "down" if direction_vector.y > 0 else "up"
			
	velocity = direction_vector * speed
	move_and_slide()

# Função para a animação
func animate() -> void:
	if velocity != Vector2.ZERO:
		animation.play("run_" + last_direction)
	else:
		animation.play("idle_" + last_direction)
		
