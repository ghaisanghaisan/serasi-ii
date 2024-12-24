extends CharacterBody2D

@export var speed = 500
@export var gravity = 0

func horizontal_movement():
	# if keys are pressed it will return 1 for ui_right, -1 for ui_left, and 0 for neither
	var horizontal_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	# horizontal velocity which moves player left or right based on input
	velocity.x = horizontal_input * speed
	
func player_animations():
		#on left (add is_action_just_released so you continue running after jumping)
		if Input.is_action_pressed("ui_left") || Input.is_action_just_released("ui_jump"):
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("run")

		#on right (add is_action_just_released so you continue running after jumping)
		if Input.is_action_pressed("ui_right") || Input.is_action_just_released("ui_jump"):
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("run")
		
		 #on idle if nothing is being pressed
		if !Input.is_anything_pressed():
			$AnimatedSprite2D.play("idle")
			
func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	
	
	horizontal_movement()
	move_and_slide()
	
	player_animations();
	
