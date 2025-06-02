extends CharacterBody2D

var player_ref: Node2D = null
@export var speed: int = 60

func _physics_process(_delta: float) -> void:
	if player_ref != null:
		var distance: Vector2 = player_ref.global_position - global_position
		var direction: Vector2 = distance.normalized()
		var distance_length: float = distance.length()
		if distance_length <= 5:
			self.velocity = Vector2.ZERO
		else:
			self.velocity = speed * direction
	else:
		self.velocity = Vector2.ZERO

	move_and_slide()
	
func on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_ref = body

func on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_ref = null
