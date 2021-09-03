extends Area2D

func _on_Spikes_Top_body_entered(body):
	#print("Entered")
	get_tree().call_group("GameState","Hurt")
	
		
