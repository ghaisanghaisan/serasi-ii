extends Sprite2D


@export var SPEED = 40
@export var OSC_SPEED:float = PI/2
@export var OFFSET:float = 0
var t = OFFSET
var posy = 100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	posy = position.y
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	t += OSC_SPEED * delta
	position.x += SPEED * delta
	position.y = posy + 10 * sin(t)
	
	

	if position.x >= 1500:
		position.x = -200
