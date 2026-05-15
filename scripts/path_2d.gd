extends Path2D

var slime_scene = preload("res://scenes/slime.tscn")

func spawn_slime():
	var new_slime = slime_scene.instantiate()
	add_child(new_slime)
