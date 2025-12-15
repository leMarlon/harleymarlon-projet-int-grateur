extends CharacterBody2D

func _ready():
	_basic_movement()

func _basic_movement():
		$AnimatedSprite2D.play("idle")
		
