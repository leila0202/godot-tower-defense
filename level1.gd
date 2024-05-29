extends Node2D

@export var unit_scene: PackedScene

var vp_size = DisplayServer.screen_get_size()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

const CELL_HEIGHT = 100
func _draw():
	var start_y = Vector2(0,CELL_HEIGHT)
	var end_y = Vector2(vp_size.x,CELL_HEIGHT)
	var start_x = Vector2(CELL_HEIGHT,0)
	var end_x = Vector2(CELL_HEIGHT, vp_size.y)
	for n in 5:
			draw_line(start_y,end_y, Color.WHITE, 1.0)
			draw_line(start_x, end_x, Color.WHITE, 1.0)
			start_y.y += CELL_HEIGHT
			end_y.y += CELL_HEIGHT
			start_x.x += CELL_HEIGHT
			end_x.x += CELL_HEIGHT

var unit
var space_state
func _input(event):
	if event is InputEventMouseButton:
		if !event.is_pressed() && event.button_index == MOUSE_BUTTON_LEFT:
			unit = unit_scene.instantiate()
			
			unit.position = floor(event.position/CELL_HEIGHT)*CELL_HEIGHT + (Vector2.ONE * CELL_HEIGHT/2)
			var point = PhysicsPointQueryParameters2D.new()
			point.set_collide_with_areas(true)
			point.position = unit.position
			if(!space_state.intersect_point(point)):
				add_child(unit)
			
	elif event is InputEventMouseMotion:
		pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta: float):
	space_state = get_world_2d().direct_space_state

func _hovered():
	print("miau")
	

func _on_child_entered_tree(node):
	
	print(str(node.get_instance_id()) + " was added")
