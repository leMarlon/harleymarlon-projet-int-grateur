extends StaticBody2D



func _ready():
	$AnimatedSprite2D.play("closed")


func _on_player_legendswordobtained() -> void:
	$AnimatedSprite2D.play("opened")
