extends CharacterBody2D

# Importando animações
@onready var animation: AnimationPlayer = $AnimationPlayer

# Velocidade do personagem
@export var speed: int = 200

var can_die: bool = false

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
	if can_die:
		animation.play("dead_right")
		set_physics_process(false)
	elif velocity != Vector2.ZERO:
		animation.play("run_" + last_direction)
	else:
		animation.play("idle_" + last_direction)
		
func kill() -> void:
	can_die = true
	
func on_animation_finished(anim_name: StringName) -> void:
	if anim_name == "dead_rigth":
		var _reload: bool = get_tree().reload_current_scene()
	
