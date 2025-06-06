extends Area2D
class_name DoorComponent

var player_ref: Character = null

@export_category("Variaveis")
@export var teleport_position: Vector2 
# 1612.0 1063.0

@export_category("Objects")
@export var animation: AnimationPlayer = null


func _on_body_entered(body: Node2D) -> void:
	if body is Character:
		player_ref = body
		animation.play("open")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "open":
		player_ref.global_position = teleport_position
		animation.play("close")
		
