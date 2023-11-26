extends Node

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	MusicaJuego.play_musica(MusicaJuego.get_lista_musicas().menu_principal)
	
func _on_BotonSalir_pressed() -> void:
	get_tree().quit()
