@tool
@icon("res://addons/ItemFrame2D/icon_square.png")
extends SmoothUI
class_name ItemFrame2D

@export var item : Item:
	set(val):
		item = val
		queue_redraw()

@export var item_size : float = 1:
	set(val):
		item_size = val
		queue_redraw()

func _process(delta: float) -> void:
	super(delta)
	if Engine.is_editor_hint():
		queue_redraw()

func _draw() -> void:
	if item and item.sprite:
		var size := item.sprite.get_size() * item_size
		draw_texture_rect(item.sprite, Rect2(-size / 2.0, size), false)
