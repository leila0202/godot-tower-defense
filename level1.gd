extends Node2D

var tower_scene: PackedScene
var enemy_scene: PackedScene

var vp_size = DisplayServer.screen_get_size()
@onready var unit_select = $CanvasLayer/UnitSelect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

const CELL_SZ = 100
func _draw():
	var start_y = Vector2(0,CELL_SZ)
	var end_y = Vector2(vp_size.x,CELL_SZ)
	var start_x = Vector2(CELL_SZ,0)
	var end_x = Vector2(CELL_SZ, vp_size.y)
	for n in 5:
			draw_line(start_y,end_y, Color.WHITE, 1.0)
			draw_line(start_x, end_x, Color.WHITE, 1.0)
			start_y.y += CELL_SZ
			end_y.y += CELL_SZ
			start_x.x += CELL_SZ
			end_x.x += CELL_SZ

var tower
var space_state

func spawn_unit(pos, type):
	match type:
		"Archer":
			tower_scene = load("res://Units/archer.tscn")
		"Mage":
			tower_scene = load("res://Units/mage.tscn")
	tower = tower_scene.instantiate()
	tower.position = pos
	var point = PhysicsPointQueryParameters2D.new()
	point.set_collide_with_areas(true)
	point.position = tower.position
	if(!space_state.intersect_point(point)):
		add_child(tower)

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if !event.is_pressed() && event.button_index == MOUSE_BUTTON_LEFT:
			var pos = floor(event.position/CELL_SZ)*CELL_SZ + (Vector2.ONE * CELL_SZ/2)
			var selected_unit = unit_select.selected_unit
			if selected_unit:
				spawn_unit(pos, selected_unit)
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
