extends CharacterBody2D

@export var velocidade: float = 200.0

var direcao_atual: Vector2 = Vector2.ZERO

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("moverEsquerdaVermelho") and direcao_atual != Vector2.RIGHT:
		direcao_atual = Vector2.LEFT
		if($Sprite2D.rotation_degrees != 0):
			$Sprite2D.rotation_degrees = 0
	elif Input.is_action_just_pressed("moverDireitaVermelho") and direcao_atual != Vector2.LEFT:
		direcao_atual = Vector2.RIGHT
		if($Sprite2D.rotation_degrees != 0):
			$Sprite2D.rotation_degrees = 0
	elif Input.is_action_just_pressed("moverCimaVermelho") and direcao_atual != Vector2.DOWN:
		direcao_atual = Vector2.UP
		if($Sprite2D.rotation_degrees != 90):
			$Sprite2D.rotation_degrees = 90
	elif Input.is_action_just_pressed("moverBaixoVermelho") and direcao_atual != Vector2.UP:
		direcao_atual = Vector2.DOWN
		if($Sprite2D.rotation_degrees != 90):
			$Sprite2D.rotation_degrees = 90

	velocity = direcao_atual * velocidade
	move_and_slide()
