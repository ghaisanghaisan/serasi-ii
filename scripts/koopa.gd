extends Enemy 


var in_shell = false
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
const KOOPA_SHELL_COLLISION_SHAPE_POSITION = Vector2(0,5)
const KOOPA_FULL_COLLISION_SHAPE = preload("res://resources/Collision Shapes/koopa_full_collision_shape.tres")
const KOOPA_SHELL_COLLISION_SHAPE = preload("res://resources/Collision Shapes/koopa_shell_collision_shape.tres")

func _ready():
	collision_shape_2d.shape = KOOPA_FULL_COLLISION_SHAPE

func die():
	if !in_shell:
		super.die()
	
	collision_shape_2d.set_deferred("shape",  KOOPA_SHELL_COLLISION_SHAPE)
	collision_shape_2d.set_deferred("position",  KOOPA_SHELL_COLLISION_SHAPE_POSITION)	
	in_shell = true
	
	
	
	
	
