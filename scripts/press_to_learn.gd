extends Area2D

var is_idle = true
 
func _ready():
	_basic_movement()

func _basic_movement():
	if is_idle:
		$AnimatedSprite2D.play("idle")
		
		
func learntoplay():
	pass
