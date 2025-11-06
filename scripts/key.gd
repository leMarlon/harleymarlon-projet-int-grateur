extends StaticBody2D

signal chest_opened

var keytaken = false
var in_chest_zone = false



func _on_area_2d_body_entered(body: PhysicsBody2D):
	if keytaken == false:
		keytaken = true
		$AnimatedSprite2D.queue_free()


func _process(delta):
	if keytaken == true:
		if in_chest_zone == true:
			if Input.is_action_just_pressed("ui_accept"):
				print("A chest was opened !")
				emit_signal("chest_opened")
