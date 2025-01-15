extends Sprite2D

@export var _timer = 0
@onready var _init_y = position.y

func _process(delta: float) -> void:
	_timer += PI/2 * delta
	position.y = _init_y + 4 * sin(_timer)
