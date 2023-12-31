class_name BarraSalud
extends ProgressBar

## Atributos Export
export var siempre_visible:bool = false
###### Implementar para el caso de que quede fija la barra de salud
#export var es_top_level:bool = false
######

## Atributos Onready
onready var tween_visibilidad:Tween = $TweenVisibilidad

## Métodos
func _ready() -> void:
	modulate = Color(1, 1, 1, siempre_visible)
#	##### Implementar para el caso de que quede fija la barra de salud
#	set_as_toplevel(es_top_level)
#	if es_top_level:
#		rect_global_position = owner.global_position + rect_position
#	#####

## Métodos Custom
func set_valores(hitpoints:float) -> void:
	max_value = hitpoints
	value = hitpoints

func controlar_barra(hitpoints_nave:float, mostrar:bool) -> void:
	value = hitpoints_nave
	
	if not tween_visibilidad.is_active() and modulate.a != int(mostrar):
		tween_visibilidad.interpolate_property(
			self,
			"modulate",
			Color(1, 1, 1, not mostrar),
			Color(1, 1, 1, mostrar),
			1.0,
			Tween.TRANS_LINEAR,
			Tween.EASE_IN_OUT
		)
		tween_visibilidad.start()

func set_hitpoints_actual(hitpoints:float) -> void:
	value = hitpoints

## Señales Internas
func _on_TweenVisibilidad_tween_all_completed() -> void:
	if modulate.a == 1.0:
		controlar_barra(value, false)
