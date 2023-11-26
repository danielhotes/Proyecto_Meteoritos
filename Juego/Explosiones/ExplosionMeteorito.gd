class_name ExplosionMeteorito
extends Node2D

## Métodos
func _ready() -> void:
	$AnimationPlayer.play(elegir_explosion_aleatoria())

## Métodos Custom
func elegir_explosion_aleatoria() -> String:
	randomize()
	var num_amin:int = $AnimationPlayer.get_animation_list().size() - 1
	var indice_anim_aleatoria:int = randi() % num_amin + 1
	var lista_animacion:Array = $AnimationPlayer.get_animation_list()
	
	return lista_animacion[indice_anim_aleatoria]

## Señales Internas
func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	queue_free()
