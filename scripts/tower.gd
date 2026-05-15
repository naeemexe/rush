extends Node2D

var max_health = 100
var health = 100

@onready var health_bar = $ProgressBar

func _ready() -> void:
	health_bar.max_value = max_health
	health_bar.value = health

func _process(delta: float) -> void:
	pass
	
func take_damage(amount):
	health -= amount
	health = clamp(health, 0, max_health)

	health_bar.value = health

	if health <= 0:
		get_tree().reload_current_scene()
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	take_damage(5)
