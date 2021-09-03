extends KinematicBody2D
#MAIN PLAYER FUNCTIONALITY SCRIPT 

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


var IsHurt=false


signal AnimateSprite

func _ready():
	$BGM.play()
	

func _physics_process(delta):
	PlayBGM()
	ApplyGravity()
	ProcessJump()
	ProcessInput()
	AnimateSprite()
	move_and_slide(Motion,UP)
		
		
func ProcessInput():
	if Input.is_action_pressed("MoveLeft") and not Input.is_action_pressed("MoveRight"):
		Motion.x=-SPEED
	elif Input.is_action_pressed("MoveRight") and not Input.is_action_pressed("MoveLeft"):
		Motion.x=SPEED
	else:
		Motion.x=0
	

func ApplyGravity():
	
	#The and Motion.y>0 is to check for feedback set by Hurt() in the previous frame .
	# If Motion.y<0 it means negative force i.e upward force is applied
	# Remember that y coords are inverted to "standard" coords in Godot
	if is_on_floor() and Motion.y>0:
		Motion.y=0
		IsHurt=false
	elif is_on_ceiling():
	#Reset motion to 1 so that we dont float when we hit a ceiling
		Motion.y=1
	else:
		Motion.y+=GRAVITY
		
		
func AnimateSprite():
	emit_signal("AnimateSprite",Motion,IsHurt)

func Hurt():
	position.y-=50
	IsHurt=true
	if not $HurtAudio.playing:
		$HurtAudio.play()
	yield(get_tree(),"idle_frame")
	Motion.y=-JUMP_VELOCITY	
	
	
		
	
func ProcessJump():
	if Input.is_action_pressed("Jump") and is_on_floor():
		Motion.y-=JUMP_VELOCITY
		if not $JumpAudio.playing:
			$JumpAudio.play()
	
	
func PlayBGM():
	if not $BGM.playing:
		$BGM.play()
	

