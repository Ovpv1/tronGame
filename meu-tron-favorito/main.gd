extends Node2D

@onready var timer: Timer = $Timer
@onready var azul: CharacterBody2D = $azul
@onready var vermelho: CharacterBody2D = $vermelho

#Para checar alteração de velocidade no console
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
	#print(segundos_decorridos,"s")
	#print("Velocidade: ",velocidadeBonecos)
