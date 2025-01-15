extends Label


signal write_done


var char_each_loop = 1
var accel = 3.5
var min_time = 0.03

var _full_text: String = ""
var _timer: float = 0.0



func write_on():
	_full_text = text  # Store the full text to display
	visible_characters = 0  # Start with no visible characters
	set_process(true)  # Enable processing to update text gradually

func write_skip():
	visible_characters = _full_text.length()

func _process(delta):
	if visible_characters < _full_text.length():
		_timer += delta
		if _timer >= min_time:
			visible_characters += floorf(char_each_loop)
			_timer = 0.0
			char_each_loop += accel * delta	
			
		min_time *= 0.999
		
			
		
	else:
		set_process(false)
		write_done.emit()  # Stop processing when done
