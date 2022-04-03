extends Node
export (PackedScene) var Asteroide
var Puntuacio


func _ready():
	randomize()

func nou_joc():
	Puntuacio = 0 
	$Jugador.inici($PosicioInici.position)
	$IniciTimer.start() 
	$Interficie.mostrar_misatge('Ready!')
	$Interficie.update_puntuacio(Puntuacio)


func Game_Over():
	$PuntuacioTimer.stop()
	$AsteroidesTimer.stop()
	$Interficie.game_over()


func _on_IniciTimer_timeout(): 
	$AsteroidesTimer.start()
	$PuntuacioTimer.start() 


func _on_PuntuacioTimer_timeout(): 
	Puntuacio += 1 
	$Interficie.update_puntuacio(Puntuacio)


func _on_AsteroidesTimer_timeout():
	$Path2D/PathFollow2D.set_offset(randi())
	
	var A = Asteroide.instance()
	add_child(A)
	
	var d = $Path2D/PathFollow2D.rotation + PI /2 
	
	A.position = $Path2D/PathFollow2D.position
	
	d += rand_range(-PI /4, PI /4)
	A.rotation = d 
	A.set_linear_velocity(Vector2(rand_range(A.velocitat_min, A.velocitat_max), 0).rotated(d))
