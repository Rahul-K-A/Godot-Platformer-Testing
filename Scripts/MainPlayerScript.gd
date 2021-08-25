extends KinematicBody2D

#Vector to keep track of direction of motion
var Motion=Vector2(0,0)
#Movement Speed
const SPEED=1000
#Gravity in the game
const GRAVITY=150
#UP Vector stops the character from sliding around when colliding witha nother body
const UP=Vector2(0,-1)
#Self explanatory
const JUMP_VELOCITY=3000

signal AnimateSprite
	
func _physics_process(delta):
	ApplyGravity()
	ProcessInput()
	AnimateSprite()
	move_and_slide(Motion,UP)
		
		
func ProcessInput():
	if Input.is_action_pressed("Jump") and is_on_floor():
		Motion.y-=JUMP_VELOCITY
		print(Motion)
	if Input.is_action_pressed("MoveLeft") and not Input.is_action_pressed("MoveRight"):
		Motion.x=-SPEED
	elif Input.is_action_pressed("MoveRight") and not Input.is_action_pressed("MoveLeft"):
		Motion.x=SPEED
	else:
		Motion.x=0
	

func ApplyGravity():
	
	if is_on_floor():
		Motion.y=0
	else:
		Motion.y+=GRAVITY
		
		
func AnimateSprite():
	emit_signal("AnimateSprite",Motion)
	
