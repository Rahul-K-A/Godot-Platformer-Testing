extends Node2D

#THIS NODE TAKES CARE OF THE STATE OF THE GAME AND CHECKS FOR WIN AND LOSE CONDITIONS
#Boundary of the world
const WORLD_BOUNDS=3000

#Number of lives left:
var Lives=3

#Current scene
onready var CurrentScene=get_tree().get_current_scene()

#Number of coins collected
var Coins=0

#Number of coins to get a life up
var CoinLimit=10

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("GameState")
	print(CurrentScene.name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Bunny.position.y > WORLD_BOUNDS:
		EndGame()
	if Input.is_action_pressed("ui_cancel"):
		for i in get_children():
			i.queue_free()
		get_tree().quit()

#Hurt player and reduce a life
func Hurt():
	$Bunny.Hurt()
	Lives-=1
	if Lives<=0:
		EndGame()
		

		
func EndGame():
	get_tree().change_scene("res://Scenes/GameOverScreen.tscn")
	
func UpdateCoin():
	Coins+=1
	var LimitReached:bool=(Coins%CoinLimit)==0
	if LimitReached:
		Lives+=1
		Coins-=10
	UpdateGUI()
		

func UpdateGUI():
	get_tree().call_group("GUI","UpdateCoins",Coins)
	get_tree().call_group("GUI","UpdateLives",Lives)
		
	
		

