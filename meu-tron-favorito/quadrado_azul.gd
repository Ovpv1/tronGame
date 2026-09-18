extends CharacterBody2D

@export var velocidade: float = 250.0

var direcao_atual: Vector2 = Vector2.ZERO

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("moverEsquerdaAzul") and direcao_atual != Vector2.RIGHT:
		direcao_atual = Vector2.LEFT
		$".".rotation_degrees = 0
	elif Input.is_action_just_pressed("moverDireitaAzul") and direcao_atual != Vector2.LEFT:
		direcao_atual = Vector2.RIGHT
		$".".rotation_degrees = 0
	elif Input.is_action_just_pressed("moverCimaAzul") and direcao_atual != Vector2.DOWN:
		direcao_atual = Vector2.UP
		$".".rotation_degrees = 90
	elif Input.is_action_just_pressed("moverBaixoAzul") and direcao_atual != Vector2.UP:
		direcao_atual = Vector2.DOWN
		$".".rotation_degrees = 90

	velocity = direcao_atual * velocidade
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == self:
		return

	if body is CharacterBody2D:
		direcao_atual = Vector2.ZERO
