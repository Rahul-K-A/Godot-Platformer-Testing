extends AnimatedSprite

#ANIMATION FUNCTIONALITY

func _on_Bunny_AnimateSprite(Motion,IsHurt):
	if Motion.y<0:
		play("Jump")
		return
	if IsHurt==true:
		play("Hurt")
	if Motion.x<0:
		flip_h=true
		play("Walk")
	elif Motion.x>0:
		flip_h=false
		play("Walk")
	else:
		play("Idle")
