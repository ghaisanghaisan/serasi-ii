extends Area2D 

class_name Enemy

@export var horizontal_speed = 20
@export var vertical_speed = 100

@onready var ray_front: RayCast2D = $RayFront
@onready var ray_down: RayCast2D = $RayDown
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var direction = -1

func _process(delta: float) -> void:
	position.x += direction * horizontal_speed * delta
	
	if !ray_down.is_colliding():
		position.y += vertical_speed * delta
		
	if ray_front.is_colliding():
		direction *= -1
		scale.x *= -1
		position.x += direction * horizontal_speed * delta * 10
		ray_front.enabled = false
		print("colliding euy")
		
	await get_tree().create_timer(0.3)
	ray_front.enabled = true

func die():
	horizontal_speed = 0
	vertical_speed = 0
	animated_sprite_2d.play("die")
