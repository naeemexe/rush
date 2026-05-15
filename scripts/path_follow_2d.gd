extends PathFollow2D

const SPEED = 100

var max_health = 100
var health = 80

@onready var health_bar = $ProgressBar

func _ready():
	health_bar.max_value = max_health
	health_bar.value = health

func _process(delta):
	progress += SPEED * delta

	if progress_ratio >= 1.0:
		queue_free()

func take_damage(amount):
	health -= amount
	health = clamp(health, 0, max_health)

	health_bar.value = health

	if health <= 0:
		die()

func die():
	queue_free()
