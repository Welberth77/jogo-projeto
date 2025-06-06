extends ProgressBar

@export var player: Character

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	max_value = player.max_vida
	value = player.vida_player
