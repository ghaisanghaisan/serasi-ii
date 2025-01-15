extends Sprite2D


@export var SPEED = 40
@export var OSC_SPEED = PI/2
var t = 0
var posy = 100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	posy = position.y
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	t += PI/2 * delta
	position.x += SPEED * delta
	position.y = posy + 10 * sin(t)
	
	

	if position.x >= 1500:
		position.x = -200
