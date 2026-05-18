@tool
@icon("res://addons/ItemFrame2D/icon_square.png")
extends Sprite2D
class_name ItemFrame2D

@export var item : Item;
@export var item_size : float = 1;
var item_sprite : Sprite2D;

func _ensure_sprite():
	if !item_sprite:
		item_sprite = Sprite2D.new();
		add_child(item_sprite)
		item_sprite.global_position = global_position;

func _process(delta: float) -> void:
	_ensure_sprite();
	if item:
		if item.sprite and item_sprite:
			item_sprite.texture = item.sprite;
			item_sprite.scale = Vector2(item_size, item_size);
	else:
		if item_sprite:
			item_sprite.texture = null;
