extends TextureProgressBar

@export var player = CharacterBody2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	max_value = player.maxHp
	value = player.hp 
