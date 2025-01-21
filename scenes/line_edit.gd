extends TextEdit


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("focus_entered", self.focushehe)


func focushehe():
	virtual_keyboard_enabled = false
