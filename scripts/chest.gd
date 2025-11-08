extends StaticBody2D

func _ready():
	$AnimatedSprite2D.play("closed")

func _on_key_chest_opened() -> void:
	
	$AnimatedSprite2D.play("opened")
