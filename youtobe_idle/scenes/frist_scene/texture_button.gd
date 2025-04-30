extends TextureButton

func _ready() -> void:
	pressed.connect(_on_pressed)
	
func _shrink()->void:
	var tween:Tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0.95, 0.95), 0.1)

func _on_pressed()->void:
	_shrink()
