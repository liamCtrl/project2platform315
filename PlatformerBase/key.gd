extends Area2D

func _process(delta: float) -> void:
	$keyAnimatedSprite2D.play("idle")
func _on_body_entered(body):
	var game_controller = get_tree().root.get_node("platformer")
	if game_controller:
		game_controller.key_collected()
	queue_free()
