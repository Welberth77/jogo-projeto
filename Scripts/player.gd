extends CharacterBody2D

@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var collision: CollisionShape2D = get_node("AttackArea/CollisionShape2D")

@export var speed: int = 200
var maxHp = 100
@export var hp = 100

var can_die: bool = false
var can_attack: bool = false
var last_direction: String = "down"

func _physics_process(_delta: float) -> void:
	if can_die:
		velocity = Vector2.ZERO
		move_and_slide()
	move()
	attack()
	animate()
	verify_direction()

func move() -> void:
	var direction_vector := Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()

	if direction_vector != Vector2.ZERO:
		if abs(direction_vector.x) > abs(direction_vector.y):
			last_direction = "right" if direction_vector.x > 0 else "left"
		else:
			last_direction = "down" if direction_vector.y > 0 else "up"
		velocity = direction_vector * speed
	else:
		velocity = Vector2.ZERO

	move_and_slide()

func attack() -> void:
	if Input.is_action_just_pressed("ui_select") and not can_attack and not can_die:
		can_attack = true

func animate() -> void:
	if can_die:
		var dead_dir := ""
		if last_direction == "up":
			dead_dir = "dead_left"
		elif last_direction == "down":
			dead_dir = "dead_right"
		elif last_direction == "left":
			dead_dir = "dead_left"
		elif last_direction == "right":
			dead_dir = "dead_right"
		animation.play(dead_dir)
	elif can_attack:
		animation.play("attack_" + last_direction)
	elif velocity != Vector2.ZERO:
		animation.play("run_" + last_direction)
	else:
		animation.play("idle_" + last_direction)

# Modifique o verify_direction() para ajustar melhor a área de ataque
func verify_direction() -> void:
	match last_direction:
		"right":
			collision.position = Vector2(25, 0)
			collision.shape.extents = Vector2(20, 15)
		"left":
			collision.position = Vector2(-25, 0)
			collision.shape.extents = Vector2(20, 15)
		"up":
			collision.position = Vector2(0, -25)
			collision.shape.extents = Vector2(15, 20)
		"down":
			collision.position = Vector2(0, 25)
			collision.shape.extents = Vector2(15, 20)

func kill() -> void:
	if not can_die:
		can_die = true
		can_attack = false

func on_animation_finished(anim_name: StringName) -> void:
	if anim_name.begins_with("dead_"):
		var current_scene = get_tree().current_scene
		if current_scene:
			var scene_path = current_scene.scene_file_path
			var packed_scene = load(scene_path)
			get_tree().change_scene_to_packed(packed_scene)
	elif anim_name.begins_with("attack_"):
		can_attack = false
