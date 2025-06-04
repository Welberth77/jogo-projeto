
extends TextureButton

var item_data := null
var dragged_item = null

func set_item(data):
	item_data = data
	if data:
		texture_normal = data.icon
	else:
		texture_normal = null

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if item_data:
			dragged_item = item_data
			set_item(null)
	elif event is InputEventMouseButton and not event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if dragged_item:
			var temp = item_data
			set_item(dragged_item)
			dragged_item = temp
