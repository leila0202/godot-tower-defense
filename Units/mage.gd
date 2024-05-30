extends Area2D

const MAXLIVE = 10
var lp
var dmg
var reach
var price
var lvl

func _init():
	lp = MAXLIVE
	dmg = 4
	reach = 3
	price = 5
	lvl = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		print("LP: " + str(lp) + " dmg: " + str(dmg))
	if Input.is_action_just_pressed("ui_cancel"): 
		lp -= 1




