
extends Control

var inventory := []

func _ready():
	$Button.pressed.connect(_on_organizar_pressed)
	_update_ui()

func _on_organizar_pressed():
	inventory.sort_custom(_item_sorter)
	_update_ui()

func _item_sorter(a, b):
	if a == null: return 1
	if b == null: return -1
	return a.name < b.name

func _update_ui():
	var slots = $NinePatchRect/GridContainer.get_children()
	for i in range(slots.size()):
		if i < inventory.size():
			slots[i].set_item(inventory[i])
		else:
			slots[i].set_item(null)
