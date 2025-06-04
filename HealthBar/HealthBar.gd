
extends Node2D

@export var max_health: int = 100
var current_health: int = max_health

func _ready():
	$ProgressBar.max_value = max_health
	$ProgressBar.value = current_health

func update_health(value: int):
	current_health = clamp(value, 0, max_health)
	$ProgressBar.value = current_health
