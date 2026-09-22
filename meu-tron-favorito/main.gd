# Pontos a serem feitos
# 1. Adicionar linha dos dois jogadores ----> concluído
# 2. A física da colisão ao bater na linha do inimigo
# 3. Empate caso jogadores colidam de frente
# 4. Derrota caso jogador colida com a lateral do outro
# Outras coisas a gente pode discutir depois tbm.

extends Node2D

@onready var timer: Timer = $Timer
@onready var azul: CharacterBody2D = $azul
@onready var vermelho: CharacterBody2D = $vermelho
@onready var velocidadeBonecos: float
var velMax: float = 600.0 #PODE ALTERAR PRA CALIBRAR, mas acho que está suficiente
var segundos_decorridos: int = 0


func _ready() -> void:
	print("------- TRON GAME ------")
	timer.start()
	$AudioStreamPlayer.play()


func _on_timer_timeout() -> void:
	velocidadeBonecos = azul.velocidade
	segundos_decorridos += 1
	# Aumenta a velocidade do jogador após os 30 segundos de jogo
	# NÃO ALTERAR ESSE VALOR
	if(segundos_decorridos > 30):
		if(velocidadeBonecos >= velMax):
			azul.velocidade = velMax
			vermelho.velocidade = velMax
		else:
			azul.velocidade += 25
			vermelho.velocidade += 25
	#So pra visualizar melhor as alteracoes no console
	print(segundos_decorridos,"s")
	print("Velocidade: ",velocidadeBonecos)
