extends Timer
@onready var jogador: CharacterBody2D = $azul

var segundos_decorridos: int = 0

func _on_timer_timeout() -> void:
	segundos_decorridos += 1
	# Aumenta a velocidade do jogador a cada segundo
	if($azul.velocidade < 500):
		$azul.velocidade += 50
	elif($azul.velocidade > 500):
		$azul.velocidade = 500
		
	print(segundos_decorridos)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
