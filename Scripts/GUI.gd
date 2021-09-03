extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("GUI")
	$Control/TextureRect/HBoxContainer/Lives.text="3"


func UpdateLives(RemainingLives):
	$Control/TextureRect/HBoxContainer/Lives.text=str(RemainingLives)

func UpdateCoins(CoinsCollected):
	$Control/TextureRect/HBoxContainer/Coins.text=str(CoinsCollected)
	
