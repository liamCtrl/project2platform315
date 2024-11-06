extends Area2D

@onready var mainmenu = load("res://menu.tscn") as PackedScene

@export var speed = -150
var direction = Vector2(1,0)

func start(pos):
	position = pos
	
func _process(delta):
	position += direction * speed * delta

func _on_bullet_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_body_entered(body: Node) -> void:
	if body.name == "Player":
		body.queue_free()
		get_tree().change_scene_to_packed(mainmenu)
