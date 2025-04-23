extends Control

@onready var label: Label = $Label
@onready var button: Button = $Button

var idleons: int = 10

func _ready() -> void:
	update_idleons(0)
	button.pressed.connect(_on_button_pressed)


func _on_button_pressed()-> void:
	update_idleons(5)
	
	
func update_idleons(value: int)-> void:
	idleons += value
	(get_node("Label") as Label).text = "Idleons:%s" %idleons 
