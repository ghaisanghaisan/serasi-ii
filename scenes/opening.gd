extends Control

var look = 0
var is_writing = false

@onready var welcome = $Welcome
@onready var logo = $Logo
@onready var desc1 = $Desc1
@onready var desc2 = $Desc2
@onready var quote = $Quote
@onready var snk = $Snk
@onready var slides: Array[Node] = [welcome, logo, desc1, desc2, quote, snk]

@onready var scene_transition_animation: AnimationPlayer = $SceneTransitionAnimation/AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	for n in slides:
		var lbl = n.get_child(0)
		if lbl is Label:
			lbl.connect("write_done", _on_write_done)
			
	
	
	welcome.scale = Vector2(0,0)
	scene_transition_animation.play("Fade_in")
	var tween = get_tree().create_tween()
	welcome.show()
	tween.tween_interval(0.3)
	tween.tween_property(welcome, "scale", Vector2(1,1), 0.4).set_ease(Tween.EASE_OUT)
	

func engage_write():
	if is_writing:
		is_writing = false
		slides[look].get_child(0).write_skip()
	else:
		is_writing = true
		slides[look].get_child(0).write_on()

	
func next_slide():
	if !is_writing:
		# hide the one we are currently looking at
		slides[look].hide()
		
		# look at the next slide
		look += 1
	
	if look == len(slides):
		GlobalAudio.play() 
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")		
	elif look == 1:
		logo.show()
		var tween = get_tree().create_tween()
		tween.tween_property(logo, "scale", Vector2(1.5, 1.5), 0.4).set_ease(Tween.EASE_OUT)
	else:
		slides[look].show()
		engage_write()
	
	
func _on_button_pressed() -> void:
	next_slide()
		
func _on_write_done():
	is_writing = false

	
