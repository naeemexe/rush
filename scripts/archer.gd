extends Node2D

var enemies = []
var target = null
var damage = 40

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		var slime = area.get_parent()
		enemies.append(slime)
		update_target()
		print("Slime Detected")

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		var slime = area.get_parent()
		enemies.erase(slime)
		update_target()
		
func update_target():
	var alive_enemies = []
	for enemy in enemies:
		if is_instance_valid(enemy):
			alive_enemies.append(enemy)
	
	enemies = alive_enemies
	
	if enemies.size() > 0:
		target = enemies[0]
	else:
		target = null

func _on_attack_timer_timeout() -> void:
	if is_instance_valid(target):
		target.take_damage(damage)
		print("Attacking")
	else:
		update_target()
