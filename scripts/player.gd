extends CharacterBody2D


class_name Player

enum PlayerMode {
	SMALL,
	BIG,
	SHOOTING,
	SERASI
}

signal points_scored(points: int)
signal on_submit_or_win 

const POINTS_LABEL_SCENE = preload("res://scenes/points_label.tscn")
const PIPE_ENTER_THRESHOLD = 10

@onready var animated_sprite_2d: PlayerAnimatedSprite = $AnimatedSprite2D as PlayerAnimatedSprite
@onready var area_collision_check: CollisionShape2D = $Area2D/AreaCollisionCheck
@onready var body_collision_check: CollisionShape2D = $BodyCollisionCheck


var is_dead = false
var can_move = true
var animating = false


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export_group("Motion")
@export var run_speed_damping = 1.1
@export var speed = 200.0
@export var jump_velocity = -350.0
@export_group("")

@export_group("Stomping Enemies")
@export var min_stomp_degree = 35
@export var max_stomp_degree = 145
@export var stomp_bump = -150
@export_group("")

var player_mode = PlayerMode.SERASI

func player_movement(delta: float):
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
		
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y *= 0.5
		
	var direction = Input.get_axis("left", "right")
	
	if direction:
		velocity.x = lerpf(velocity.x, speed * direction, run_speed_damping * delta)
	else: 
		velocity.x = move_toward(velocity.x, 0, speed * delta)
		
	animated_sprite_2d.trigger_animation(velocity, direction, player_mode)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if can_move:
		player_movement(delta)
	else:
		velocity.x = 0;
		
		if !animating:
			animated_sprite_2d.play("serasi_idle")

	var collision = get_last_slide_collision()
	
	if collision != null:
		handle_movement_collision(collision)
	
	move_and_slide()
	
func handle_movement_collision(collision: KinematicCollision2D):
	if collision.get_collider() is Block:
		var col_angle = rad_to_deg(collision.get_angle())
		if roundf(col_angle) == 180:
			collision.get_collider().bump()
			
	if collision.get_collider() is Pipe:
		if collision.get_collider().is_traverseable:
			var col_angle = rad_to_deg(collision.get_angle())
			if (roundf(col_angle) == 0 && Input.is_action_just_pressed("down") && absf(collision.get_collider().position.x - position.x) < PIPE_ENTER_THRESHOLD):
				handle_pipe_collision()
				
func handle_pipe_collision():
	var enter_tween = get_tree().create_tween()
	
	set_collision_layer_value(1, false)
	set_physics_process(false)
	
	enter_tween.set_ease(Tween.EASE_OUT)
	enter_tween.tween_property(self, "position", position + Vector2(0, 48), .75)
	enter_tween.tween_callback(func ():  get_tree().change_scene_to_file("res://scenes/main_menu.tscn"))
	
	 
			
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is Enemy:
		handle_enemy_collision(area)

func handle_enemy_collision(enemy: Enemy):
	if enemy == null || is_dead:
		return
		
	var angle_of_collision = rad_to_deg(position.angle_to_point(enemy.position))
	
	if min_stomp_degree <= angle_of_collision and angle_of_collision <= max_stomp_degree:
		enemy.die()
		on_enemy_stomped()
		spawn_points_label(enemy)
	else:
		die()
	
func spawn_points_label(enemy: Enemy):
	var points_label = POINTS_LABEL_SCENE.instantiate()
	points_label.position = enemy.position + Vector2(-20, -20)
	get_tree().root.add_child(points_label)
	
	points_scored.emit(100)

func on_enemy_stomped():
	velocity.y = stomp_bump
	
	
func die():
	is_dead = true
	animated_sprite_2d.play("die")
	set_collision_layer_value(1, false)
	set_physics_process(false)
	
	var death_tween = get_tree().create_tween()
	
	death_tween.tween_property(self, "position", position + Vector2(0, -48), .75).set_ease(Tween.EASE_OUT)
	death_tween.chain().tween_property(self, "position", position + Vector2(0, 64), .25)
	death_tween.tween_callback(func (): get_tree().reload_current_scene())
	
func win():
	can_move = false;
	animated_sprite_2d.play("serasi_run")
	animating = true;
	
	var win_tween = get_tree().create_tween()
	win_tween.tween_property(self, "position", position + Vector2(64, 0), 1)
	win_tween.tween_callback(func (): animated_sprite_2d.play("win"); SerasiForm.submit(); on_submit_or_win.emit())
	
	
func disable_movement():
	can_move = false

func enable_movement():
	can_move = true
