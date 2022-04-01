extends CanvasLayer

signal iniciar_joc 

func mostrar_misatge(text):
	$Misatge.text = text
	$Misatge.show()
	$MisatgeTimer.start()
	
func game_over(): 
	mostrar_misatge('Game Over')
	yield($MisatgeTimer, "timeout")
	$Boto.show()
	$Misatge.text = 'Space Ship'
	$Misatge.show()
	
func update_puntuacio(Punts):
	$Puntuacio.text = str(Punts)


func _on_MisatgeTimer_timeout():
	$Misatge.hide() 


func _on_Boto_pressed():
	$Boto.hide()
	emit_signal("iniciar_joc")
