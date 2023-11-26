tool
extends ParallaxBackground

## Atributos Export
export var color_fondo:Color = Color.black

## Métodos
func _ready() -> void:
	$ColorRect.color = color_fondo

func _process(delta: float) -> void:
	if Engine.editor_hint:
		$ColorRect.color = color_fondo
