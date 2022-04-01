extends Area2D

export (int) var Velocitat
var Moviment = Vector2()
var limit 
signal xoc 

func _ready():
	hide()
	limit = get_viewport_rect().size
 

func _process(delta):
	Moviment = Vector2()
	
	if Input.is_action_pressed("ui_right"): 
		Moviment.x += 1 
	if Input.is_action_pressed("ui_left"):
		Moviment.x -= 1 
	if Input.is_action_pressed("ui_down"):
		Moviment.y += 1 
	if Input.is_action_pressed("ui_up"):
		Moviment.y -= 1 

	if Moviment.length() > 0: 
		Moviment = Moviment.normalized() * Velocitat
		
	position += Moviment * delta 
	position.x = clamp(position.x, 0, limit.x)
	position.y = clamp(position.y, 0, limit.y) 


func _on_Jugador_body_entered():
	hide()
	emit_signal('xoc')
	$CollisionShape2D.disabled = true 

func inici(pos):
	position = pos 
	show()
	$CollisionShape2D.disabled = false;
