extends Node2D

#Is set when coin is first touched to avoid collecting the same coing twice
var Taken=false

func _on_CoinCollision_body_entered(body):
	if not Taken:
		Taken=true
		$CoinAnimationPlayer.play("CoinDisapp")
		$AudioStreamPlayer2D.play()
		get_tree().call_group("GameState","UpdateCoin")
	if not $CoinAnimationPlayer.is_playing():
		queue_free()
