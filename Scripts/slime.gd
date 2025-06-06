extends CharacterBody2D

class_name Slime

var player_ref = null
var is_dead: bool = false
var pode_atacar: bool = true

@export var speed = 40
@export var vida = 40
@export var dano = 10

@export_category("Objects")
@export var texture: Sprite2D = null
@export var animation: AnimationPlayer = null


func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_ref = body


func _on_detection_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_ref = null

func _physics_process(_delta: float) -> void:
	if is_dead:
		return
	animate()
	if player_ref != null:
		if player_ref.is_dead:
			velocity = Vector2.ZERO
			move_and_slide()
			return
			
		var direcao: Vector2 = global_position.direction_to(player_ref.global_position)
		var distancia: float = global_position.distance_to(player_ref.global_position)
		
		if distancia < 20:
			# Player perde vida
			# função para tirar a vida do player
			causar_dano(player_ref)
			
		velocity = direcao * speed
		move_and_slide()

func animate():
	if velocity.x > 0:
		texture.flip_h = false
	elif velocity.x < 0:
		texture.flip_h = true
		
	elif velocity != Vector2.ZERO:
		animation.play("walk_right")
		return
	
	animation.play("idle_down")

func atualizar_vida():
	is_dead = true
	animation.play("dead")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "dead":
		queue_free()


func causar_dano(player_ref):
	if pode_atacar and not player_ref.is_dead:
		pode_atacar = false  # evita dano contínuo sem intervalo
		player_ref.vida_player -= dano
		player_ref.atualizar_barra_vida()  # ✅ chamada para atualizar a barra visual

		# se a vida zerar, o player morre
		if player_ref.vida_player <= 0:
			player_ref.die()

		# espera 1 segundo para poder atacar novamente
		await get_tree().create_timer(1.0).timeout
		pode_atacar = true  # libera novo ataque
	
