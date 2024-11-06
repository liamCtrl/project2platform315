extends RigidBody2D

func _process(delta: float) -> void:
	$coinAnimatedSprite2D.play("coin_idle")
	
func _on_chest_area_2d_body_entered(body: Node2D) -> void:
	var game_controller = get_tree().root.get_node("platformer")
	if game_controller:
		game_controller.chest_unlock()
