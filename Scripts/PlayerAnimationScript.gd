extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Bunny_AnimateSprite(Motion):
	if Motion.y<0:
		play("Jump")
		return
	if Motion.x<0:
		flip_h=true
		play("Walk")
	elif Motion.x>0:
		flip_h=false
		play("Walk")
	else:
		play("Idle")
