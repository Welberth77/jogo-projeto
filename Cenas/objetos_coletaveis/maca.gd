extends Area2D

var player_ref: Character = null

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body is Character:
		queue_free()
		# Adiciona o item ao iventário
