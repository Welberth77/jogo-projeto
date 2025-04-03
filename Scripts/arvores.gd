extends Node2D

@onready var player = get_node("/Mundo/player")  # Ajuste o caminho correto do Player

func _ready() -> void:
	pass

func _process(delta):
	if player:
		if player.position.y > position.y:
			z_index = 1  # Player atrás da árvore
		else:
			z_index = 2  # Player na frente da árvore
