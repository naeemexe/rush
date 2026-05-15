extends PathFollow2D

const SPEED = 100

func _process(delta):
	progress += SPEED * delta
