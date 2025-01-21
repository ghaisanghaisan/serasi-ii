extends AnimatedSprite2D


class_name PlayerAnimatedSprite


func play_p(anim: String):
	var animation_prefix = Globals.Avatar.keys()[Globals.avatar].to_snake_case()
	play("%s_%s" % [animation_prefix, anim])

func trigger_animation(velocity: Vector2, direction: int, player_mode: Player.PlayerMode, is_crouch: bool):
	
	var animation_prefix = Globals.Avatar.keys()[Globals.avatar].to_snake_case()

	if not get_parent().is_on_floor():
		play("%s_jump" % animation_prefix)
	# handle slide
	elif sign(velocity.x) != sign(direction) && velocity.x != 0 && direction != 0:
		play("%s_slide" % animation_prefix)
		scale.x = direction if scale.x == 1 || scale.x == -1 else direction * 0.55
	# handle flipping
	else:
		if (sign(scale.x) == 1 && sign(velocity.x) == -1) || (sign(scale.x) == -1 && sign(velocity.x) == 1):
			scale.x *= -1
		elif sign(scale.x) == -1 && sign(velocity.x) == 1:
			scale.x *= -1

		# run and idle
		if velocity.x != 0:
			play("%s_run" % animation_prefix)
		elif is_crouch:
			play("%s_duck" % animation_prefix)
		else:
			play("%s_idle" % animation_prefix)
