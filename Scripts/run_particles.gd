extends AnimatedSprite2D

func play_particles() -> void:
	play("idle")


func _on_animation_finished() -> void:
	queue_free()
