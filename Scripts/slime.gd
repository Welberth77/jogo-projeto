extends CharacterBody2D

@onready var animation: AnimationPlayer = get_node("AnimationPlayer")
@onready var sprite: Sprite2D = get_node("Sprite2D")
@export var speed: int = 60

var cardeDeSlime = preload("res://Cenas/objetos_coletaveis/carne_de_slime.tscn")

var player_ref: Node2D = null
var can_die: bool = false

func _physics_process(_delta: float) -> void:
	move()
	animate()
	verify_direction()
	
func move() -> void:
	if player_ref != null:
		var distance: Vector2 = player_ref.global_position - global_position
		var direction: Vector2 = distance.normalized()
		var distance_length: float = distance.length()
		if distance_length <= 5:
			# tirar dano do player
			player_ref.kill()
			self.velocity = Vector2.ZERO
		else:
			self.velocity = speed * direction
	else:
		self.velocity = Vector2.ZERO

	move_and_slide()

func animate() -> void:
	if can_die:
		animation.play("dead")
		set_physics_process(false)
	elif velocity != Vector2.ZERO:
		animation.play("walk")
	else:
		animation.play("idle")

func verify_direction() -> void:
	if velocity.x > 0:
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true
	

func on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_ref = body

func on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_ref = null


# Modifique a função kill para verificar melhor o ataque
func kill(area: Area2D) -> void:
	if area.is_in_group("player_attack"):
		# Adicione um debug para verificar
		print("Slime atingido por ataque do player")
		can_die = true


func on_animation_finished(anim_name: StringName) -> void:
	if anim_name == "dead":
		drop_carne()
		queue_free()

func drop_carne():
	# Cria uma instância da carne
	var carne = cardeDeSlime.instantiate()
	# Posiciona a carne onde o slime está/morreu
	carne.global_position = global_position
	# Adiciona a carne ao mesmo parent do slime ou diretamente ao cenário
	get_parent().add_child(carne)
