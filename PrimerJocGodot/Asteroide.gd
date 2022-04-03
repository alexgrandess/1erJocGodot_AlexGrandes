extends RigidBody2D

export (int) var velocitat_min 
export (int) var velocitat_max
var tipus_asteroide = ['gran'] 


func _ready(): 
	$AnimatedSprite.animation = tipus_asteroide[randi() % tipus_asteroide.size()]

	if $AnimatedSprite.animation == 'gran': 
		$CollisionShape2D.scale.x = 1.5 
		$CollisionShape2D.scale.y = 1.5

func _on_Visibilitat_screen_exited():
	queue_free()
