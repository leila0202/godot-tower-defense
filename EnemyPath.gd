extends Path2D

var timer = 0
var spawnTime = 10
var enemy_scene
var max_enemies = 10
var enemies = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	enemy_scene = load("res://enemy_spawn.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if(timer > spawnTime && enemies <= max_enemies):
		print("new enemie " + str(enemies))
		var enemy = enemy_scene.instantiate()
		
		add_child(enemy)
		enemies +=1
		timer = 0
