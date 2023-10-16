class_name Meteorito
extends RigidBody2D

## Atributos Export
export var vel_lineal_base:Vector2 = Vector2(200.0, 200.0)
export var vel_ang_base:float = 3.0
export var hitpoints_base:float = 10.0

## Atributos
var hitpoints:float

## Atributos Onready
onready var impactos_sfx:AudioStreamPlayer2D = $ImpactoSFX
onready var animacion:AnimationPlayer = $Animaciones

## Métodos
func _ready() -> void:
	angular_velocity = vel_ang_base

## Constructor
func crear(pos:Vector2, dir:Vector2, tamanio:float) -> void:
	position = pos
	# Calcular Masa, tamaño de Sprite y de Colisionador
	mass *= tamanio
	$Sprite.scale = Vector2.ONE * tamanio
	# radio = diametro / 2
	var radio:int = int($Sprite.texture.get_size().x / 2.3 * tamanio)
	var forma_colision:CircleShape2D = CircleShape2D.new()
	forma_colision.radius = radio
	$CollisionShape2D.shape = forma_colision
	# Calcular velocidades
	linear_velocity = vel_lineal_base * dir / tamanio
	angular_velocity = vel_ang_base / tamanio
	# Calcular hitpoints
	hitpoints = hitpoints_base * tamanio
	# Solo debug
	print("hitpoints: ", hitpoints)

## Métodos Custom
func recibir_danio(danio:float) -> void:
	hitpoints -= danio
	if hitpoints <= 0.0:
		destruir()
	impactos_sfx.play()
	animacion.play("recibir_danio")

func destruir() -> void:
	$CollisionShape2D.set_deferred("disabled", true)
	Eventos.emit_signal("meteorito_destruido", global_position)
	queue_free()
