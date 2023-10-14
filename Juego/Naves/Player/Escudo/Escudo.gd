class_name Escudo
extends Area2D

export var energia:float = 8.0
export var radio_desgaste:float = -1.6

var esta_activado:bool = false setget, get_esta_activado

## Setters y Getters
func get_esta_activado() -> bool:
	return esta_activado

## Métodos
func _ready() -> void:
	set_process(false)
	controlar_colisionador(true)

func _process(delta: float) -> void:
	energia += radio_desgaste * delta
	if energia <= 0.0:
		desactivar()

## Métodos Custom
func controlar_colisionador(esta_desactivado:bool) -> void:
	$CollisionShape2D.set_deferred("disabled", esta_desactivado)

func activar() -> void:
	if energia > 0.0:
		esta_activado = true
		controlar_colisionador(false)
		$AnimationPlayer.play("activandose")

func desactivar():
	set_process(false)
	esta_activado = false
	controlar_colisionador(true)
	$AnimationPlayer.play_backwards("activandose")

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "activandose" and esta_activado:
		$AnimationPlayer.play("activado")
		set_process(true)

func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
