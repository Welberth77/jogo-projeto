extends Node2D


func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	# Define o z_index baseado na posição Y
	z_index = int(position.y)
