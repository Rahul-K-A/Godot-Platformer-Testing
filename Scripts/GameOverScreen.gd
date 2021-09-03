extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		LoadLevel()
	elif Input.is_action_pressed("ui_cancel"):
		QuitGame()
		
#	pass


func _on_TextureButton_pressed():
	LoadLevel()
	


func QuitGame():
	get_tree().quit()

func LoadLevel():
	get_tree().change_scene("res://Scenes/TestingLevel.tscn")
	
	
