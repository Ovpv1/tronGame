# Pontos a serem feitos
# 1. Adicionar linha dos dois jogadores
# 2. Configurar para os dois jogadores iniciarem em movimento: O azul começa para cima. O vermelho, para baixo.
# 3. A física da colisão ao bater na linha do inimigo
# Outras coisas a gente pode discutir depois tbm.

extends Node2D

@onready var meutimer: Timer = $Timer
@onready var azul: CharacterBody2D = $azul
@onready var vermelho: CharacterBody2D = $vermelho
@onready var velocidadeBonecos: float
var velMax: float = 550.0 #PODE ALTERAR PRA CALIBRAR

var segundos_decorridos: int = 0

func _ready() -> void:
	meutimer.wait_time = 1.0
	meutimer.one_shot = false
	
	if not meutimer.timeout.is_connected(_on_timer_timeout):
		meutimer.timeout.connect(_on_timer_timeout)
	meutimer.start()


func _on_timer_timeout() -> void:
	velocidadeBonecos = azul.velocidade
	segundos_decorridos += 1
	# Aumenta a velocidade do jogador a cada segundo
	if(segundos_decorridos > 30):
		if(velocidadeBonecos >= velMax):
			azul.velocidade = velMax
			vermelho.velocidade = velMax
		else:
			azul.velocidade += 25
			vermelho.velocidade += 25
			
	print(azul.velocidade)
