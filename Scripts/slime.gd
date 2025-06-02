extends CharacterBody2D

@onready var animation: AnimationPlayer = get_node("AnimationPlayer")
@onready var sprite: Sprite2D = get_node("Sprite2D")
var player_ref: Node2D = null
@export var speed: int = 60

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
	if velocity != Vector2.ZERO:
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
