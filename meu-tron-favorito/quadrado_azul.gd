extends CharacterBody2D

@export var distancia_segmento: float = 4.0
var ultima_posicao_colisao: Vector2
@export var max_pontos: int = 0
@onready var rastroAzul: Line2D = $Line2D

@export var velocidade: float = 150.0
var direcao_atual: Vector2 = Vector2.UP

var estaVivo: bool = true

func _ready() -> void:
	rastroAzul.top_level = true
	ultima_posicao_colisao = global_position

func _physics_process(_delta: float) -> void:
	if not estaVivo:
		return
		
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
	
	rastroAzul.add_point(global_position)
	if global_position.distance_to(ultima_posicao_colisao) >= distancia_segmento:
		criar_segmento_colisao(ultima_posicao_colisao, global_position)
		ultima_posicao_colisao = global_position

	if Input.is_action_pressed("boostAzul"):
		velocity = direcao_atual * (velocidade + 100)
	else:
		velocity = direcao_atual * velocidade
	move_and_slide()
	
	if get_slide_collision_count() > 0:
		derrota()
		return



func criar_segmento_colisao(ponto_a: Vector2, ponto_b: Vector2) -> void:
	var area = Area2D.new()
	var collision = CollisionShape2D.new()
	var shape = SegmentShape2D.new()

	# Define a linha de colisão entre o ponto anterior e o atual
	shape.a = ponto_a
	shape.b = ponto_b
	collision.shape = shape
	area.add_child(collision)

	area.set_meta("dono", self)
	get_tree().current_scene.add_child(area)
	await get_tree().create_timer(0.15).timeout
	area.body_entered.connect(_on_rastro_colidiu.bind(area))

func _on_rastro_colidiu(body: Node2D, area: Area2D) -> void:
	if body.has_method("derrota"):
		var donoRastro = area.get_meta("dono")
		body.derrota(donoRastro)

func derrota(donoRastro: Node2D = null) -> void:
	if not estaVivo:
		return
	
	get_tree().paused = true
	estaVivo = false
	if donoRastro == null:
		print("\nAzul bateu na parede.")
	elif donoRastro == self:
		print("\nAzul se suicidou batendo no próprio rastro")
	else:
		print("\nAzul bateu no rastro do Vermelho")
		
	print("\nFIM DE JOGO\n")
	
	await get_tree().create_timer(5).timeout
	get_tree().paused = false
	get_tree().reload_current_scene()
