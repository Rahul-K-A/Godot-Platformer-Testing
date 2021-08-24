extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var Motion=Vector2(0,0)
const SPEED=500
const GRAVITY=300
const UP=Vector2(0,-1)
const JUMP_VELOCITY=3000
# Called when the node enters the scene tree L  first time.
func _physics_process(delta):
	ApplyGravity()
	if Input.is_action_just_pressed("Jump"):
		Motion.y-=JUMP_VELOCITY
		print(Motion)
	if Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		Motion.x=-SPEED
	elif Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		Motion.x=SPEED
	else:
		Motion.x=0
	move_and_slide(Motion,UP)
		


func ApplyGravity():
	if is_on_floor():
		Motion.y=0
	else:
		Motion.y+=GRAVITY

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
