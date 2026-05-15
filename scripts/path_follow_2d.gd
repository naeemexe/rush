extends PathFollow2D

const SPEED = 100

func _process(delta):
	progress += SPEED * delta
	
	if progress_ratio >= 1.0:
		queue_free()
