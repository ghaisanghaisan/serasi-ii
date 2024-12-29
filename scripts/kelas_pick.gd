extends OptionButton

var popup;

func _ready() -> void:
	popup = get_popup()
	for kelas in SerasiForm.Kelas:
		add_item("  " + String(kelas))

	popup.add_theme_font_size_override("font_size", 36)
