extends RigidBody2D

export(int) var velocitat_min 
export(int) var velocitat_max
var tipus_asteroide = ['gran'] 


func _ready():
	$AnimatedSprite.animation = tipus_asteroide['gran']


func _on_Visibilitat_screen_exited():
	queue_free()
