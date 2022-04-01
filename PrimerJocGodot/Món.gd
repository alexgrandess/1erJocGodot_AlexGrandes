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

func game_over(): 
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
	$Cami/PosicioAsteroide.set_offset(randi())
	
	var A = Asteroide.instance()
	
	
	var d = $Cami/PosicioAsteroide.rotation + PI /2 
	
	A.position = $Cami/PosicioAsteroide.position
	
	d += rand_range(-PI /4, PI /4)
	A.rotation = d 
	A.set_linear_velocity(Vector2(rand_range(A.velocitat_min, A.velocitat_max), 0).rotated(d))
