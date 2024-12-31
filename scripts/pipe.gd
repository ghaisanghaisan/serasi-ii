@tool

extends StaticBody2D

class_name Pipe

const TOP_PIPE_HEIGHT = 16
var is_ready = 0

@export var height = 32:
	set(new_height):
		height = new_height
		if(Engine.is_editor_hint() || is_ready):
			_on_height_set()
			
@export var is_horizontal = false:
	set(new_horizontal):
		is_horizontal = new_horizontal
		if(Engine.is_editor_hint() || is_ready):
			_on_horizontal_set()

@export var is_traverseable = false
@export var to_scene = ""

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var pipe_body_sprite: Sprite2D = $PipeBodySprite

func _ready() -> void:
	is_ready = true
	_on_height_set()
	_on_horizontal_set()

func _on_horizontal_set():
	if is_horizontal:
		rotation_degrees = -90
	else:
		rotation_degrees = 0

func _on_height_set():
	var region_rect = Rect2(pipe_body_sprite.region_rect)
	region_rect.size = Vector2(32, height - TOP_PIPE_HEIGHT)
	
	pipe_body_sprite.region_rect = region_rect
	pipe_body_sprite.position = Vector2(0, height / 2)
	
	var shape = RectangleShape2D.new()
	shape.size = Vector2(32, height)
	collision_shape_2d.shape = shape
	collision_shape_2d.position = Vector2(0, height/2 - TOP_PIPE_HEIGHT/2)
	 
