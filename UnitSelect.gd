extends Control

@export var group: ButtonGroup
var selected_unit

# Called when the node enters the scene tree for the first time.
func _ready():
	for btn in group.get_buttons():
		btn.pressed.connect(on_btn_pressed.bind(btn))

func on_btn_pressed(btn: Button):
	selected_unit = btn.text
	print(btn.text)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
