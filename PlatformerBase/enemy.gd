extends CharacterBody2D

var bullet_scene = preload("res://bullet.tscn")
@export var bullet_offset = Vector2(0,0)
@onready var hit: AudioStreamPlayer = $"../enemy/hit"

func _process(delta: float) -> void:
	$enemyAnimatedSprite2D.play("idle")

func _on_player_detector_body_entered(body):
	if body.name == "Player":
		queue_free()

func _on_timer_timeout():
	var bullet_instance = bullet_scene.instantiate()
	var shoot_position = Vector2(0,0)
	bullet_instance.start(shoot_position)
	add_child(bullet_instance)
	$Timer.start()
